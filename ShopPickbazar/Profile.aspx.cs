using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["LoginCookie"] == null)
                {
                    Response.Redirect("/");
                }
                else
                {
                    GetInfoUser();
                }
            }
                
        }
        void GetInfoUser()
        {
            int id = GetUserIdFromCookie();
            using(pickbazarEntities db =  new pickbazarEntities())
            {
                var profile = db.USERS.FirstOrDefault(x => x.Id == id);
                var avt = "https://pickbazarlaravel.s3.ap-southeast-1.amazonaws.com/1691/conversions/peakpx-thumbnail.jpg";
                if (profile != null)
                {
                    fullName.Text = profile.FullName;
                    email.Text = profile.Email;
                    phone.Text = profile.PhoneNumber.ToString();
                    address.Text = profile.Address;
                    avatar.ImageUrl = profile.Avatar != null ? "Content/Images/Avatar/" + profile.Avatar : avt;
                }
            }
        }

        protected void ButtonUpdateProfile_Click(object sender, EventArgs e)
        {
            int id = GetUserIdFromCookie();
            using (pickbazarEntities db = new pickbazarEntities())
            {
                string imagesPath = Server.MapPath("~/Content/Images/Avatar");
                var query = db.USERS.FirstOrDefault(y => y.Id == id);
                if (query != null)
                {
                    query.FullName = fullName.Text;
                    query.Email = email.Text;
                    query.Address = address.Text;
                    // Chỉ cập nhật số điện thoại nếu người dùng đã nhập dữ liệu
                    if (int.TryParse(phone.Text, out int phoneNumber))
                    {
                        query.PhoneNumber = phoneNumber;
                    }

                    if (avatarFile.HasFile)
                    {
                        string avatarFileName = Path.GetFileName(avatarFile.FileName);
                        string avatarImageFullPath = Path.Combine(imagesPath, avatarFileName);
                        if (!File.Exists(avatarImageFullPath))
                        {
                            // Lưu tệp hình ảnh vào thư mục UploadedImages
                            avatarFile.SaveAs(avatarImageFullPath);
                        }
                        query.Avatar = avatarFileName;
                    }
                    db.SaveChanges();
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