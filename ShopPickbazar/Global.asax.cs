using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace ShopPickbazar
{
    public class Global : System.Web.HttpApplication
    {
        public static string ConnectionString() => ConfigurationManager.ConnectionStrings["Shop"].ConnectionString;
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        private void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("ClientHomePage", "", "~/Index.aspx");

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            
            Session["LoggedInUser"] = null;
            Session["category"] = null;

        }
    }
}