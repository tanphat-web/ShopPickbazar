using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar.Admin
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                using(pickbazarEntities db = new pickbazarEntities())
                {
                    var query = from item in db.CATEGORIES
                                select new
                                {
                                    Id = item.id,
                                    Name = item.category_name
                                };
                    ListCategory.DataSource = query.ToList();
                    ListCategory.DataTextField = "Name";
                    ListCategory.DataValueField = "Id";
                    ListCategory.DataBind();


                }
            }
        }

        protected void ButtonCreateProduct(object sender, EventArgs e)
        {
            string featuredImageFileName = Path.GetFileName(featuredImage.FileName);
            string imagesPath = Server.MapPath("~/Content/Images/Products");
            string featuredImageFullPath = Path.Combine(imagesPath, featuredImageFileName);
            string productName = txtProductName.Text.Trim();
            string productDescription = txtDescription.Text.Trim();
            int productQuantity = int.Parse(txtProductQuantity.Text);
            int categoryId = int.Parse(ListCategory.SelectedValue);
            int productPrice = int.Parse(txtProductPrice.Text);
            int productSalePrice = int.Parse(txtProductSalePrice.Text);
            List<string> galleryPaths = new List<string>();
            // Kiểm tra xem tệp hình ảnh đã tồn tại chưa
            if (!File.Exists(featuredImageFullPath))
            {
                // Lưu tệp hình ảnh vào thư mục UploadedImages
                featuredImage.SaveAs(featuredImageFullPath);
            }
            foreach(var file in gellaryFileUpload.PostedFiles)
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
            InsertProduct(productName, productDescription, productQuantity, categoryId, productPrice, productSalePrice, featuredImageFileName, galleryPaths);
        }

        private void InsertProduct(string productName, string productDescription, int productQuantity, int categoryId, int productPrice, int productSalePrice, string featuredImageFileName, List<string> galleryPaths)
        {
            using(pickbazarEntities db = new pickbazarEntities())
            {
                PRODUCT newProduct = new PRODUCT { 
                   ProductName = productName,
                   CategoryId = categoryId,
                   FeaturedImage =   featuredImageFileName,
                   Images = string.Join(",",galleryPaths),
                   DESCRIPTION = productDescription,
                   Price = productPrice,
                   Discount = productSalePrice,
                   Quantity = productQuantity,
                   
                };
                // Thêm sản phẩm mới vào bảng 'sanpham'
                db.PRODUCTS.Add(newProduct);
                db.SaveChanges();
            }
        }

        
    }
}