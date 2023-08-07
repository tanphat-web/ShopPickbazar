using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie loginCookie = Request.Cookies["LoginCookie"];
            if (loginCookie == null) Response.Redirect("/");
        }
        protected void ButtonForgotPassword_Click(object sender, EventArgs e)
        {
            string newPass = newPassword.Text;
            string confirmPass = confirmPassword.Text;
            if (newPass == confirmPass)
            {
                int userId = GetUserIdFromCookie();
                USER user = db.USERS.FirstOrDefault(x => x.Id == userId);
                if (user != null)
                {
                    user.Password = newPass;
                }
                try
                {
                    db.SaveChanges();
                    Response.Write("Đổi mật khẩu thành công.");
                }
                catch (Exception)
                {
                    Response.Write("Đã xảy ra lỗi khi lưu mật khẩu.");
                   
                }
            }
            
         }
        private int GetUserIdFromCookie()
        {
            HttpCookie loginCookie = Request.Cookies["LoginCookie"];
            if (loginCookie != null)
            {
                int id = int.Parse(loginCookie["UserId"]);
                return id;
            }
            else
            {
                return 0;
            }
        }
    }
}