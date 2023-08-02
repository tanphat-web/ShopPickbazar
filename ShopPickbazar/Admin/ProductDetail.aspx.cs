using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar.Admin
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetProductDetail();
        }
         void GetProductDetail()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
            {
               int id = Convert.ToInt32(Request.QueryString["id"]);
                var productDetail = db.PRODUCTS
                    .Where(x=> x.Id == id)
                    .ToList()
                    .Select(x=> new
                    {
                        x.Id,
                        x.FeaturedImage,
                        x.ProductName,
                        x.Price,
                        x.Discount,
                        x.Quantity,
                        x.DESCRIPTION,
                        categoryName = x.CATEGORy.category_name,
                        gallery = x.Images.Split(',').ToList(),
                    });
                repeaterProductDetail.DataSource = productDetail;
                repeaterProductDetail.DataBind();
            }
        }
    }
}