using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetInfor();
        }
       void GetInfor()
        {
            using(pickbazarEntities db = new pickbazarEntities())
            {
                HttpCookie loginCookie = Request.Cookies["LoginCookie"];
                if (loginCookie != null)
                {
                    int id = int.Parse(loginCookie["UserId"]);
                    var query = db.USERS.FirstOrDefault(x => x.Id == id);
                    if(query != null)
                    {
                        txtName.Text = query.FullName != null ? query.FullName.ToString() : "";
                        txtEmail.Text = query.Email != null ? query.Email.ToString() : "";
                        txtPhone.Text = query.PhoneNumber != null ? query.PhoneNumber.ToString() : "";
                        txtAddress.Text = query.Address != null ? query.Address.ToString() : ""; 
                    }
                }
            }
        }
        
    }
}