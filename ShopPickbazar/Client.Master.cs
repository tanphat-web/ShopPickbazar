using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace ShopPickbazar
{
    public partial class Client : System.Web.UI.MasterPage
    {
        pickbazarEntities db = new pickbazarEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLoggedIn();
            Logout();

             if(Request.Params["action"] != null)
            {
                Response.Redirect("index.aspx");
            }
           
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string username = txtAccount.Text;
            string password = txtPassword.Text;
            var user = db.USERS.FirstOrDefault(u=> u.UserName == username && u.Password == password); 
            if(user != null)
            {
                // Đăng nhập thành công, tạo và lưu cookie

                HttpCookie loginCookie = new HttpCookie("LoginCookie");
                loginCookie["UserId"] = user.Id.ToString();
                loginCookie["UserName"] = user.UserName.ToString();
                loginCookie.Expires = DateTime.Now.AddMinutes(30);
                Response.Cookies.Add(loginCookie);
                Response.Redirect("/");
            }
        }
        void Logout()
        {
            string queryStringValue = Request.QueryString["action"];
            if(!string.IsNullOrEmpty(queryStringValue) )
            {
                if(queryStringValue == "logout")
                {
                    //kiem tra cookie
                    if (Request.Cookies["LoginCookie"] != null)
                    {
                        HttpCookie loginCookie = Request.Cookies["LoginCookie"];
                        // Xóa cookie đã lưu
                        loginCookie.Expires = DateTime.Now.AddYears(-1);
                        Response.Cookies.Add(loginCookie);
                    }
                    Response.Redirect("/");
                }
            }
        }
        void CheckLoggedIn()
        {
            if(Request.Cookies["LoginCookie"] != null)
            {
                lProfile.Visible = true;
                lAuth.Visible = false;
            }else
            {
                lProfile.Visible = false;
                lAuth.Visible = true;
            }
        }

       
        protected void ButtonCheckOutClick(object sender, EventArgs e)
        {
            if (Request.Cookies["LoginCookie"] != null)
            {
                Response.Redirect("Checkout.aspx");
                
            }else
            {
                Response.Redirect("Login.aspx");
            }
        }
        
    }
}