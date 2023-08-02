using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace ShopPickbazar.Admin
{
    public partial class Order : System.Web.UI.Page
    {
        pickbazarEntities db = new pickbazarEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadOrders();
        }
        void LoadOrders()
        {
            var query = from order in db.ORDERS
                        select new
                        {
                            order.Id,
                            order.UserId,
                            order.Status,
                            order.OrderDate,
                            order.TotalPrice,
                            cssClass = order.Status == "Đang xử lý" ? "badge badge-pill badge-primary" : order.Status == "Đang giao hàng"? "badge badge-pill badge-warning": order.Status == "Hoàn thành"? "badge badge-pill badge-success": "badge badge-pill badge-danger",
                            customer = order.USER.FullName != null ? order.USER.FullName : order.USER.UserName,
                            address = order.USER.Address
                        };
            repeatOrders.DataSource = query.ToList();
            repeatOrders.DataBind();
        }
    }
}