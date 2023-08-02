using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace ShopPickbazar
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetProductDetail();
            GetRelatedProducts();
        }

       
        void GetProductDetail()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                var productDetail = db.PRODUCTS.FirstOrDefault(x => x.Id == id);
                if (productDetail != null)
                {
                    txtTitle.Text = productDetail.ProductName.Trim();
                    txtDescription.Text = productDetail.DESCRIPTION.Trim();
                    txtPrice.Text = String.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"), "{0:c0}", Convert.ToDecimal(productDetail.Price));
                    txtCategory.Text = productDetail.CATEGORy.category_name.Trim();
                    txtCategory.NavigateUrl = "Index.aspx?category=" + productDetail.CATEGORy.id.ToString();
                    ProductGallery.DataSource = productDetail.Images.Split(',').ToList();
                    subProductGallery.DataSource = productDetail.Images.Split(',').ToList();
                    ProductGallery.DataBind();
                    subProductGallery.DataBind();
                    buttonAddToCart.Attributes.Add("data-image",productDetail.FeaturedImage.ToString());
                    buttonAddToCart.Attributes.Add("data-name", productDetail.ProductName.ToString());
                    buttonAddToCart.Attributes.Add("data-price",productDetail.Price.ToString());
                    buttonAddToCart.Attributes.Add("data-id", productDetail.Id.ToString());

                    Session["category"] = Convert.ToInt32(productDetail.CATEGORy.id);
                }
            }
            else {
                Response.Redirect("Index.aspx");
                Session["category"] = null;
            }
        }
        void GetRelatedProducts()
        {
            if (Session["category"] != null) {
                int categoryId = Convert.ToInt32(Session["category"]);
                int excludedProductId = Convert.ToInt32(Request.QueryString["id"]);

                // Truy vấn LINQ với 2 điều kiện
                var query = db.PRODUCTS
                    .Where(x => x.CategoryId == categoryId && x.Id != excludedProductId)
                    .ToList()
                    .Select(x => new
                    {
                        x.Id,
                        x.FeaturedImage,
                        x.Price,
                        x.ProductName
                    });
                repeaterRelatedProducts.DataSource = query  ;
                repeaterRelatedProducts.DataBind();
            }
        }
    }
}