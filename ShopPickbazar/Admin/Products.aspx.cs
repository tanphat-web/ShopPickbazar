using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadProducts();
            DeleteProduct();

        }
        protected void LoadProducts()
        {

            var query = from product in db.PRODUCTS
                        select new
                        {
                                product.Id,
                                product.FeaturedImage,
                                product.ProductName,
                                price = product.Price,
                                qt = product.Quantity,
                                status = product.Quantity> 5 ? "Còn hàng" :(product.Quantity <=5 && product.Quantity > 0 ?"Sắp hết hàng" : "Hết hàng"),
                                cssClass = product.Quantity > 5 ? "badge badge-success"  : (product.Quantity <= 5 && product.Quantity > 0 ? "badge badge-danger" : "badge badge-secondary"),
                                product.Images,
                                cateName = product.CATEGORy.category_name,

                            };
            
                dataProducts.DataSource = query.ToList();
                dataProducts.DataBind();
        }
        protected void DeleteProduct()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["delete"]))
            {
                int id = Convert.ToInt32(Request.QueryString["delete"]);
                var deleteProduct = (from pd in db.PRODUCTS where pd.Id == id select pd).SingleOrDefault();
                if (deleteProduct != null)
                {
                    db.PRODUCTS.Remove(deleteProduct);
                    db.SaveChanges();
                    Response.Redirect("Products.aspx");
                }

            }
        }

       
    }
}