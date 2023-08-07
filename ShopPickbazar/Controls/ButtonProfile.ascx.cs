using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar.Controls
{
    public partial class ButtonProfile : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie loginCookie = Request.Cookies["LoginCookie"];
            if (loginCookie != null)
            {
                int id = int.Parse(loginCookie["UserId"]);
                using(pickbazarEntities db = new pickbazarEntities())
                {
                    var query = db.USERS.FirstOrDefault(x=> x.Id == id);
                    if(query != null)
                    {
                        avt.ImageUrl = "~/Content/Images/Avatar/" + query.Avatar;
                    }
                }
            }
        }
    }
}