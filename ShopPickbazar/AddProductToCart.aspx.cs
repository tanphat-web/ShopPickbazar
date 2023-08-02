using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ShopPickbazar.Admin;
using ShopPickbazar.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;


namespace ShopPickbazar
{
    public partial class AddProductToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                // Đọc dữ liệu từ request
                string jsonData = GetRequestData();
                // Xử lý dữ liệu JSON
                ProcessJsonData(jsonData);
                Response.Write(jsonData);
            }else
            {
                Response.Write("loi~");
                Response.StatusCode = 405; // Trả về mã lỗi HTTP 405 Method Not Allowed nếu không phải phương thức POST
                Response.End();
            }
            
        }
        private string GetRequestData()
        {
            // Đọc dữ liệu JSON từ request
            using (Stream body = Request.InputStream)
            {
                using (StreamReader reader = new StreamReader(body, Request.ContentEncoding))
                {
                    return reader.ReadToEnd();
                }
            }
        }

        private void ProcessJsonData(string jsonData)
        {
            try
            {
                // chuyen json thanh object
                dynamic data =  JsonConvert.DeserializeObject(jsonData);
                int userId = GetUserIdFromCookie();
                int totalPrice = GetTotalPrice(data.cart);
                int orderId = SaveOrder(totalPrice,userId);
                SaveOrderDetail(orderId, data.cart);
            }
            catch (Exception ex)
            {
                Response.Write("Error processing data: " + ex.Message);
            }
        }

        private int SaveOrder(int totalPrice, int userId)
        {
            ORDER order = new ORDER
            {
                UserId = userId,
                OrderDate = DateTime.Now,
                Status = "Đang xử lý",
                TotalPrice = totalPrice,
            };

            using(pickbazarEntities db = new pickbazarEntities())
            {
                db.ORDERS.Add(order);
                db.SaveChanges();
            }
            return order.Id;
        }

        private void SaveOrderDetail(int orderId, dynamic cartData)
        {
            using(pickbazarEntities db =  new pickbazarEntities())
            {
                foreach(var item in cartData)
                {
                    int productId = (int)item.id;
                    int quantity = (int)item.quantity;
                    ORDERDETAIL orderDetail = new ORDERDETAIL
                    {
                        OrderId = orderId,
                        ProductId = productId,
                        Quantity = quantity,
                    };
                    db.ORDERDETAILS.Add(orderDetail);
                }
                db.SaveChanges();
               
            }
        }

        private int GetUserIdFromCookie()
        {
          HttpCookie loginCookie = Request.Cookies["LoginCookie"];
         if (loginCookie != null) { 
                    int id = int.Parse(loginCookie["UserId"]);
                    return id;
         }else
            {
                return 0;
            }
        }
        private int GetTotalPrice(dynamic cartData)
        {
            int totalPrice = 0;
            if(cartData != null)
            {
                foreach (dynamic item in cartData)
                {
                    int price = (int)item.price;
                    int quantity = (int)item.quantity; // Lấy số lượng
                    totalPrice += price * quantity;

                }
            }
            return totalPrice;
        }

    }
}

