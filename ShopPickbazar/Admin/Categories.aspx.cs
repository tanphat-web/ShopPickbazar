using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCategories();

        }
        void GetCategories()
        {
            var query = from category in db.CATEGORIES select category;
            dataCategories.DataSource = query.ToList();
            dataCategories.DataBind();
        }
    }
}