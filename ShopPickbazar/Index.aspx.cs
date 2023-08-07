using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.SqlServer;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar
{
    public partial class Index : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
                GetProductByCategoryId();
                SearchProduct();
            }
        }
       private void GetCategories()
        {
            myRepeater.DataSource = db.CATEGORIES.ToList();
            categoriesMb.DataSource = db.CATEGORIES.ToList();
            categoriesMb.DataBind();
            myRepeater.DataBind();
        }
        private void GetProductByCategoryId()
        {
            int categoryId;
            if (!String.IsNullOrEmpty(Request.QueryString["category"]))
            {
                 categoryId = Convert.ToInt32(Request.QueryString["category"]);
               
            }else
            {
                var firstCategory = db.CATEGORIES.FirstOrDefault();
                 categoryId = firstCategory.id;
              
            }
            var query = from product in db.PRODUCTS
                        where product.CategoryId == categoryId
                        select new
                        {
                            product.Id,
                            product.ProductName,
                            product.Price,
                            product.FeaturedImage,
                            cssClass = product.Quantity > 0 ? "" : "cursor:not-allowed; pointer-events:none",
                            status = product.Quantity > 5 ? "Còn hàng" : (product.Quantity <= 5 && product.Quantity > 0 ? "Sắp hết hàng" : "Hết hàng"),
                            cssStyle = product.Quantity > 5 ? "background-color:rgb(0, 159, 127);" : (product.Quantity <= 5 && product.Quantity > 0 ? "background-color:#f97316;" : "background-color:#3f3f46;"),

                        };
            if(query.Count() > 0 )
            {
                Products.DataSource = query.ToList();
                Products.DataBind();
                noProductFound.Visible = false;
            }
            else
            {
                noProductFound.Visible = true;
            }
        }
        private void SearchProduct()
        {
            string searchTerm =Request.QueryString["search"];
            var product = from p in db.PRODUCTS select p;
            if (!string.IsNullOrEmpty(searchTerm))
            {
                product = product.Where(s => s.ProductName.ToLower().Contains(searchTerm));
                Products.DataSource = product.ToList();
                Products.DataBind();
            }
        }
        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();
            Response.Redirect("Index.aspx?search=" + searchTerm);
        }
    }
}