using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            GetCategories();
            GetProductByCategoryId();
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
       
    }
}