<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProductsTrash.aspx.cs" Inherits="ShopPickbazar.Admin.ProductsTrash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <asp:Label runat="server" Text="" ID="labeltest"></asp:Label>
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex align-items-center justify-content-between">
                    <h6 class=" font-weight-bold text-primary">Tất cả sản phẩm</h6>
                    <a href="CreateProduct.aspx" class="btn btn-primary">Thêm sản phẩm</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0"
                            id="products">
                            <headertemplate>
                            <thead>
                                <tr>
                                    <th>sản phẩm</th>
                                    <th>Danh mục</th>
                                    <th>Giá tiền</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="dataProductsTrash" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="vertical-align: middle;">
                                                <asp:Image runat="server" ID="featuredImg" Height="40" Width="40" ImageUrl='<%#"../Content/Images/Products/" + Eval("FeaturedImage").ToString()%>' />
                                                <span>
                                                    <%# Eval("ProductName") %>
                                                </span>
                                            </td>
                                            <td style="vertical-align: middle; text-align: center">
                                                <span>
                                                    <%# Eval("cateName") %>
                                                </span>
                                            </td>
                                            <td style="vertical-align: middle; text-align: center">
                                                <span>
                                                    <%# string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c0}", Convert.ToDecimal(Eval("price"))) %>
                                                </span>
                                            </td>
                                            <td style="vertical-align: middle;" class="d-flex items-center justify-content-center">

                                                <asp:HyperLink runat="server" CssClass="Buttons btn btn-danger mr-2" NavigateUrl='<%#"?delete=" + Eval("Id").ToString() %>' data-message="Bạn có muốn Xóa vĩnh viễn sản phẩm này không? Điều này sẽ ảnh hưởng tới những đơn hàng có sản phẩm này!">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19.4 22.169" fill="currentColor" width="16">
                                                        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.4">
                                                            <path data-name="Rectangle 2" d="M8.238.7h2.923a2 2 0 012 2v.769h0-6.923 0V2.7a2 2 0 012-2z"></path>
                                                            <path data-name="Line 1" d="M.7 3.469h18"></path>
                                                            <path data-name="Path 77" d="M14.649 21.469h-9.9a1.385 1.385 0 01-1.38-1.279L2.085 3.469h15.231L16.029 20.19a1.385 1.385 0 01-1.38 1.279z"></path>
                                                            <path data-name="Line 2" d="M7.623 6.238V18.7"></path>
                                                            <path data-name="Line 3" d="M11.777 6.238V18.7"></path>
                                                        </g></svg>
                                                </asp:HyperLink>
                                                <asp:HyperLink runat="server" CssClass="Buttons btn btn-success" NavigateUrl='<%#"?recover=" + Eval("Id").ToString() %>' data-message="Bạn có muốn khôi phục lại sản phẩm này không?">
                                                        <span>Khôi phục</span>
                                                </asp:HyperLink>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        const Buttons = document.querySelectorAll('.Buttons');
        Buttons.forEach(button => {
            button.addEventListener('click', (e) => {
                e.preventDefault();
                const href = button.getAttribute('href')
                const message = button.getAttribute('data-message')
                const confirmation = confirm(message)
                if (confirmation) window.location.href = `ProductsTrash.aspx${href}`
            })
        })
    </script>
</asp:Content>
