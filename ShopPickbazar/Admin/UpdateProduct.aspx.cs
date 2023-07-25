using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ShopPickbazar.Admin
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();
        private int productId; // Khai báo biến để lưu productId
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // Đọc giá trị id từ request queryString
                if (int.TryParse(Request.QueryString["id"], out productId))
                {
                    // Lấy chi tiết sản phẩm từ cơ sở dữ liệu và hiển thị thông tin chi tiết để chỉnh sửa
                    LoadProductDetails();
                }
                else Response.Redirect("Products.aspx");
            }
        }

        private void LoadProductDetails()
        {
            var product = db.PRODUCTS.FirstOrDefault(x => x.Id == productId);
            if (product != null)
            {
                txtProductName.Text = product.ProductName;
                txtDescription.Text = product.DESCRIPTION;
                txtProductPrice.Text = product.Price.ToString();
                txtProductQuantity.Text = product.Quantity.ToString();
                txtProductSalePrice.Text = product.Discount.ToString();
                featuredImg.ImageUrl = "../Content/Images/Products/" + product.FeaturedImage;
                galleryImage.DataSource = product.Images.Split(',').ToList();
                galleryImage.DataBind();
            }

            else Response.Redirect("Products.aspx");
        }

        protected void ButtonUpdateProduct_Click(object sender, EventArgs e)
        {
            int pdId = int.Parse(Request.QueryString.Get("id"));
            var query = db.PRODUCTS.FirstOrDefault(x => x.Id == pdId);
            string imagesPath = Server.MapPath("~/Content/Images/Products");
            List<string> galleryPaths = new List<string>();
            if (query != null)
            {
               query.ProductName = txtProductName.Text;
               query.Price = Convert.ToInt32(txtProductPrice.Text);
               query.Discount = Convert.ToInt32(txtProductSalePrice.Text);
               query.DESCRIPTION = txtDescription.Text;
               query.Quantity = Convert.ToInt32(txtProductQuantity.Text);
                if(Image.HasFile)
                {
                    string featuredImageFileName = Path.GetFileName(Image.FileName);
                    string featuredImageFullPath = Path.Combine(imagesPath, featuredImageFileName);
                    if (!File.Exists(featuredImageFullPath))
                    {
                        // Lưu tệp hình ảnh vào thư mục UploadedImages
                        Image.SaveAs(featuredImageFullPath);
                    }
                    query.FeaturedImage = featuredImageFileName;
                }else if(galleryImg.HasFile)
                {
                        foreach (var file in galleryImg.PostedFiles)
                        {
                            // Lấy tên tệp hình ảnh
                            string fileName = Path.GetFileName(file.FileName);

                            // Tạo đường dẫn đầy đủ cho tệp hình ảnh
                            string imageFullPath = Path.Combine(imagesPath, fileName);
                            galleryPaths.Add(fileName);
                            if (!File.Exists(imageFullPath))
                            {
                                // Lưu tệp hình ảnh vào thư mục UploadedImages
                                file.SaveAs(imageFullPath);
                            }
                        }
                    query.Images = string.Join(",", galleryPaths);

                }

                db.SaveChanges();
                Response.Redirect("ProductDetail.aspx?id=" + pdId);
            }
                else Response.Redirect("Products.aspx");
        }
    }
}