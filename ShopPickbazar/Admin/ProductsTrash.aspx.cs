using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar.Admin
{
    public partial class ProductsTrash : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDeletedProducts();
            RecoverProduct();
            RemoveProduct();
        }
        void LoadDeletedProducts()
        {
            var query = from product in db.PRODUCTS
                        where product.Hide == true
                        select new
                        {
                            product.Id,
                            product.FeaturedImage,
                            product.ProductName,
                            product.Images,
                            product.Price,
                            cateName = product.CATEGORy.category_name,
                        };
            dataProductsTrash.DataSource = query.ToList();
            dataProductsTrash.DataBind();
        }
        void RecoverProduct()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["recover"]))
            {
                int id = Convert.ToInt32(Request.QueryString["recover"]);
                var recoverProduct = (from pd in db.PRODUCTS where pd.Id == id select pd).SingleOrDefault();
                if(recoverProduct != null )
                {
                    recoverProduct.Hide = false;
                   
                }
                db.SaveChanges();
                Response.Redirect("ProductsTrash.aspx");
            }
        }
        void RemoveProduct()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["delete"]))
            {
                int id = Convert.ToInt32(Request.QueryString["delete"]);
                var productInfo = (from pd in db.PRODUCTS
                                   where pd.Id == id
                                   select pd).SingleOrDefault();
                if (productInfo != null)
                {
                    var orderDetailsToRemove = db.ORDERDETAILS.Where(od => od.ProductId == id).ToList();

                    foreach (var orderDetail in orderDetailsToRemove)
                    {
                        db.ORDERDETAILS.Remove(orderDetail);
                    }
                    db.PRODUCTS.Remove(productInfo);
                    db.SaveChanges();
                    Response.Redirect("ProductsTrast.aspx");
                }
            }

        }
    }
}