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
                string address = data.address;
                string note = data.note;
                bool method = false;
                if(data.methodPayment == "1") method = true;
                else method = false;
                int orderId = SaveOrder(totalPrice,userId, address, note, method);
                SaveOrderDetail(orderId, data.cart);
            }
            catch (Exception ex)
            {
                Response.Write("Error processing data: " + ex.Message);
            }
        }

        private int SaveOrder(int totalPrice, int userId, string address, string note, bool methodPayment)
        {
            ORDER order = new ORDER
            {
                UserId = userId,
                OrderDate = DateTime.Now,
                Status = "Đang xử lý",
                TotalPrice = totalPrice,
                Address = address,
                Note = note,
                Payment = methodPayment
            };
            using (pickbazarEntities db = new pickbazarEntities())
            {
                db.ORDERS.Add(order);
                db.SaveChanges();
            }
            return order.Id;
        }

        private void SaveOrderDetail(int orderId, dynamic cartData)
        {
            using (pickbazarEntities db = new pickbazarEntities())
            {
                foreach (var item in cartData)
                {
                    int productId = (int)item.id;
                    int quantity = (int)item.quantity;

                    // Kiểm tra số lượng sản phẩm > 0 và còn hàng trong kho mới thực hiện thêm vào đơn hàng
                    if (quantity > 0)
                    {
                        PRODUCT product = db.PRODUCTS.FirstOrDefault(p => p.Id == productId);
                        if (product != null && product.Quantity >= quantity)
                        {
                            // Thêm thông tin chi tiết đơn hàng vào bảng ORDERDETAILS
                            ORDERDETAIL orderDetail = new ORDERDETAIL
                            {
                                OrderId = orderId,
                                ProductId = productId,
                                Quantity = quantity,
                            };
                            db.ORDERDETAILS.Add(orderDetail);

                            // Trừ số lượng sản phẩm từ bảng PRODUCTS
                            product.Quantity -= quantity;
                        }
                    }
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

