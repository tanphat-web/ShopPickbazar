using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ShopPickbazar
{
    public class Global : System.Web.HttpApplication
    {
        public static string ConnectionString() => ConfigurationManager.ConnectionStrings["Shop"].ConnectionString;
        protected void Application_Start(object sender, EventArgs e)
        {

        }
        protected void Session_Start(object sender, EventArgs e)
        {
            
            Session["LoggedInUser"] = "example_user";
        }
    }
}