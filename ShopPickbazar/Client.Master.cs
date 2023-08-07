using ShopPickbazar.Controls;
using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
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
            LogIn(username, password);
        }
        protected void BtnForgot_Click(object sender, EventArgs e)
        {
            string email = txtEmailForgot.Text;
            string password = txtPasswordForgot.Text;
            
            var query = db.USERS.FirstOrDefault(x => x.Email == email);
            if(query != null)
            {
                query.Password = password;
            }
            db.SaveChanges();
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
                ButtonProfile.Visible = true;
                lAuth.Visible = false;
                BtnLogin.Visible = false;
                ButtonCheckout.Visible = true;
                literalprofile.Visible=true;
                literalLogin.Visible = false;
            }
            else
            {
                ButtonProfile.Visible = false;
                lAuth.Visible = true;
                BtnLogin.Visible = true;
                ButtonCheckout.Visible = false;
                literalprofile.Visible = false;
                literalLogin.Visible = true;
            }
        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string Email = txtEmailRegister.Text;
            int phone = int.Parse(txtPhoneRegister.Text);
            //string date = txtDateTimeRegister.Text;
            string userName = txtUsernameRegister.Text;
            string password = txtPasswordRegister.Text;
            var query = db.USERS.FirstOrDefault(x=> x.Email != Email && x.PhoneNumber != phone);
            USER user = new USER
            {
                UserName = userName,
                Password = password,
                Email = Email,
                FullName = fullName,
                Position = "user",
            };
            db.USERS.Add(user);
            LogIn(userName,password);
            db.SaveChanges();
            Response.Redirect(HttpContext.Current.Request.Url.ToString());
        }

        protected void ButtonCheckOutClick(object sender, EventArgs e)
        {
                Response.Redirect("Checkout.aspx");
        }
        void LogIn(string username, string password)
        {

            var user = db.USERS.FirstOrDefault(u => u.UserName == username && u.Password == password);
            if (user != null)
            {
                // Đăng nhập thành công, tạo và lưu cookie

                HttpCookie loginCookie = new HttpCookie("LoginCookie");
                loginCookie["UserId"] = user.Id.ToString();
                loginCookie["UserName"] = user.UserName.ToString();
                loginCookie.Expires = DateTime.Now.AddDays(2);
                Response.Cookies.Add(loginCookie);
                Response.Redirect("/");
            }
        }

    }
}