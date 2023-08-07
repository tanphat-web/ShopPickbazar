    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ShopPickbazar.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link href="./Content/CSS/output.css" rel="stylesheet" />
    <link href="./Content/CSS/styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <main class=" bg-white w-full min-h-screen">
            <div class="max-w-7xl mx-auto md:py-8 py-5 px-4">
                <div class="w-full flex flex-wrap" style="gap: 1.75rem;">
                    <div class="wlg">
                        <div>
                            <a href="/" class="max-w-[150px] overflow-hidden inline-block">
                                <img src="./Content/Images/PickBazar.png" alt="logo" class="w-full">
                            </a>
                        </div>
                        <div  style="padding-top:30px;">
                            <h3 class="mb-3">Thông tin giao hàng</h3>
                            <asp:TextBox runat="server" ID="txtName" placeholder="Họ và tên" cssClass="w-full rounded-lg p-2 px-3 mb-3 border  bg-transparent text-sm "
                                style="outline-color: #cacaca;"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" cssClass="w-full rounded-lg p-2 px-3 mb-3 border  bg-transparent text-sm "
                                style="outline-color: #cacaca;"></asp:TextBox>
                             <asp:TextBox runat="server" ID="txtPhone" placeholder="Số điện thoại" cssClass="w-full rounded-lg p-2 px-3 mb-3 border  bg-transparent text-sm "
                                style="outline-color: #cacaca;"></asp:TextBox>
                             <asp:TextBox runat="server" ID="txtAddress" placeholder="Địa chỉ" cssClass="w-full rounded-lg p-2 px-3 mb-3 border  bg-transparent text-sm "
                                style="outline-color: #cacaca;"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" rows="5" style="outline-color: #cacaca;" placeholder="Ghi chú" cssClass="w-full border rounded-lg p-2 px-3 bg-transparent mb-3 text-sm"></asp:TextBox>
                        </div>
                        <div>
                            <h3 class="mb-3">Phương thức thanh toán</h3>
                            <div class="border rounded-lg">
                                <div class="border-b p-2">
                                    <input type="radio" id="a" class="checkPayment" value="1" name="checkout">
                                    <label class="text-sm" for="a">
                                        Thanh toán trực tuyến (VNPAY-QR, thẻ tín dụng, thẻ nội
                                    địa)</label>
                                </div>
                                <div class="p-2">
                                    <input type="radio" class="checkPayment" id="b" value="2" name="checkout" checked>
                                    <label class="text-sm" for="b">Thanh toán khi nhận hàng</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="w2-lg">
                        <div id="cart-list">
                           
                        </div>
                        <div  class="py-3 flex items-center justify-between border-b ">
                            <p class="text-base font-semibold">Phí vận chuyển</p>
                            <p class="text-sm ">Miễn phí</p>
                        </div>
                        <div class="py-3 flex items-center justify-between border-b ">
                            <p class="text-base font-semibold">Tổng cộng</p>
                            <p class="text-base font-semibold" id="total">300000</p>
                        </div>
                        <button  id="hoadon" type="button"
                            class="w-full mt-4 bg-[var(--color-accent)] hover:bg-[var(--color-accent-hover)] text-white py-2 rounded-lg">
                            Hoàn tất hóa đơn
                        </button>
                    </div>

                </div>
            </div>
        </main>
        <style>
            ::placeholder {
                color: black !important;
            }

            .wlg {
                width: 100%;
            }

            .w2-lg {
                width: 100%;
            }

            .wl {
                width: 100%;
            }

            @media (min-width: 1024px) {

                .wlg {
                    max-width: calc(58.333333% - 14px);
                }

                .w2-lg {
                    width: calc(41.666667% - 14px);
                }

                .wl {
                    width: calc(50% - 7.5px);
                }
            }
        </style>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // khởi tạo giỏ hàng ban đầu từ localStorage (nếu có).
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        let total = document.getElementById("total")
        let totalPrice = 0;
        // Lưu giỏ hàng vào local storage
        function saveCartToLocalStorage() {
            localStorage.setItem('cart', JSON.stringify(cart));
        }

        function removeItemCart(event) {
            const productId = parseInt(event.target.dataset.id);
            cart = cart.filter(item => item.id !== productId);
            saveCartToLocalStorage();
            renderCart();
        }
        function setupRemoveButtons() {

            const removeItemCartButtons = document.querySelectorAll(".buttonRemoveItemCart")
            removeItemCartButtons.forEach(button => {
                button.addEventListener("click", removeItemCart)
            })

        }
        function setupQuantityButtons() {
            const increaseButtons = document.querySelectorAll(".increase");
            const decreaseButtons = document.querySelectorAll(".decrease");
            increaseButtons.forEach(button => button.addEventListener('click', increaseQuantityProductInCart))
            decreaseButtons.forEach(button => button.addEventListener('click', decreaseQuantityProductInCart))
        }

        function increaseQuantityProductInCart(event) {
            const productId = parseInt(event.target.dataset.id)
            cart.find(item => {
                if (item.id === productId) item.quantity++
            })
            saveCartToLocalStorage();
            renderCart();
        }

        function decreaseQuantityProductInCart(event) {
            const productId = parseInt(event.target.dataset.id)
            cart.find(item => {
                if (item.id === productId) item.quantity--
            })

            // xóa khỏi giỏ hàng nếu số lương < 1

            cart = cart.filter(item => item.quantity > 0)

            saveCartToLocalStorage();
            renderCart();
        }
        function renderCart() {
            const cartListElement = document.getElementById('cart-list');
            // Xóa tất cả các phần tử cũ trong danh sách giỏ hàng
            while (cartListElement.firstChild) {
                cartListElement.removeChild(cartListElement.firstChild);
            }
                cart.forEach(item => {
                    const listItem = document.createElement("div");
                    listItem.className = "cart-list-item";
                    listItem.innerHTML = `<div class="flex items-center  border-b border-solid border-border-200 border-opacity-75  py-4 text-sm " style="opacity: 1; transform: none; transform-origin: 50% 50% 0px;">
                    <div class="flex-shrink-0">
                        <div class="flex overflow-hidden flex-col-reverse items-center w-8 h-24 bg-gray-100 text-heading rounded-full">
                            <button type="button" data-id="${item.id}" class="decrease cursor-pointer p-2 transition-colors duration-200 hover:bg-[var(--color-accent-hover)] focus:outline-0 hover:!bg-gray-100">
                                -
                            </button>
                            <div class="flex flex-1 items-center justify-center px-3 text-sm font-semibold !px-0 text-heading">
                                ${item.quantity}
                            </div>
                            <button type="button" data-id="${item.id}" class=" increase cursor-pointer p-2 transition-colors duration-200 hover:bg-[var(--color-accent-hover)] focus:outline-0 hover:!bg-gray-100" title="">
                                +
                            </button>
                        </div>
                    </div>
                    <div class="relative mx-4 flex h-10 w-10 shrink-0  items-center justify-center overflow-hidden bg-gray-100 sm:h-16 sm:w-16">
                        <img src="./Content/Images/Products/${item.image}" >
                    </div>
                    <div class="grow">
                        <h3 class="font-bold text-heading">${item.name} </h3>
                        <p class="my-2.5 font-semibold text-accent">${parseInt(item.price).toLocaleString("vi-VN", { style: "currency", currency: "VND" })}</p>
                        <span class="text-xs ">${item.quantity}
                        </span>
                    </div>
                    <span class="font-bold text-heading ltr:ml-auto rtl:mr-auto">${parseInt(item.price * item.quantity).toLocaleString("vi-VN", { style: "currency", currency: "VND" })}</span>
                    <button type="button" data-id="${item.id}" class="buttonRemoveItemCart flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-muted transition-all duration-200 hover:bg-gray-100 hover:text-red-600 focus:bg-gray-100 focus:text-red-600 focus:outline-0 ltr:ml-3 ltr:-mr-2 rtl:mr-3 rtl:-ml-2">
                        Xóa
                    </button>
                </div>`;
                    cartListElement.appendChild(listItem);
                    totalPrice += parseInt(item.quantity) * parseInt(item.price)
                })
            total.textContent = totalPrice.toLocaleString("vi-VN", {
                style: "currency",
                currency: "VND"
            });
            setupRemoveButtons();
            setupQuantityButtons();
            }
        renderCart();

        
    </script>
    <script>
        document.getElementById("hoadon").addEventListener('click', orderCompleted)

        async function orderCompleted() {
          
            try {
                const cartItems = JSON.parse(localStorage.getItem("cart"));
                const address = document.getElementById('txtAddress').value;
                const note = document.getElementById('txtNote').value;
                const methodPayment = document.querySelector('input[name="checkout"]:checked').value;
                const response = await fetch("/AddProductToCart.aspx", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded; charset=utf-8"
                    },
                    body: JSON.stringify({
                        cart: cartItems,
                        address,
                        note,
                        methodPayment
                    })
                }); 
                if (response.ok) {
                    // Xử lý phản hồi thành công ở đây
                    alert("Sản phẩm đã được thêm vào giỏ hàng thành công!");

                    localStorage.removeItem('cart');
                    setTimeout(location.href = "/", 100);
                } else {
                    // Xử lý lỗi ở đây
                    alert("Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng!");
                }
            } catch (err) {
                console.log(err);
            }
        }
    </script>
</body>
</html>
