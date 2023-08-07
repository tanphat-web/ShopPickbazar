using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace ShopPickbazar
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void BtnSendMail_Click(object sender, EventArgs e)
        //{
        //    string toEmail = txtEmail.Text;
        //    string subject = txtSubject.Text;
        //    string body = txtDescription.Text;
        //    string fromEmail = "lophat59@gmail.com";
        //    string password = "Malik0809@";

        //    MailMessage message = new MailMessage(fromEmail, toEmail, subject, body)
        //    {
        //        IsBodyHtml = true
        //    };
        //    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
        //    {
        //        EnableSsl = true,
        //        UseDefaultCredentials = false,
        //        Credentials = new NetworkCredential(fromEmail, password)
        //    };
        //    try
        //    {
        //        // Gửi email
        //        smtpClient.Send(message);
        //        // Xử lý thành công
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.ToString());
        //    }
        //}
    }
}