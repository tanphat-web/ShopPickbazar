using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopPickbazar.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GetRecentOrders();
            GetNewUsers();
            GetProductsPopular();
        }
        void GetRecentOrders()
        {
            using(pickbazarEntities db = new pickbazarEntities())
            {
                var query = from order in db.ORDERS
                            select new
                            {
                                order.Id,
                                order.UserId,
                                order.Status,
                                order.OrderDate,
                                order.TotalPrice,
                                cssClass = order.Status == "Đang xử lý" ? "badge badge-pill badge-primary" : order.Status == "Đang giao hàng" ? "badge badge-pill badge-warning" : order.Status == "Hoàn thành" ? "badge badge-pill badge-success" : "badge badge-pill badge-danger",
                            };
                var limitQuery = query.Take(15);
                recentOrders.DataSource = limitQuery.ToList();
                recentOrders.DataBind();
            }
        }
        void GetNewUsers()
        {
            using(pickbazarEntities db = new pickbazarEntities())
            {
                var query = from user in db.USERS
                            select new
                            {
                                user.Id,
                                user.FullName,
                                user.Email,
                                user.Position,
                                cssClass = user.Position == "Super admin" ? "badge badge-pill badge-secondary" : user.Position == "Người dùng" ? "badge badge-pill badge-warning" : user.Position == "Admin" ? "badge badge-pill badge-success" : "badge badge-pill badge-danger",

                            };
                var limitQuery = query.Take(15);
                RpUsers.DataSource = limitQuery.ToList();
                RpUsers.DataBind();
            }
            
        }
        void GetProductsPopular()
        {
            using(pickbazarEntities db = new pickbazarEntities())
            {
                var query = from product in db.PRODUCTS
                            select new
                            {
                                product.Id,
                                product.FeaturedImage,
                                product.ProductName,
                                product.CATEGORy.category_name,
                                product.Price,
                                product.Quantity,

                            };
                var limitQuery = query.Take(15);
                ProductsPopular.DataSource = limitQuery.ToList();
                ProductsPopular.DataBind();
            }
        }
    }
}