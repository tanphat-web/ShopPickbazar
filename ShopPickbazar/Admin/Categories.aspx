<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ShopPickbazar.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <asp:Label runat="server" Text="" ID="labeltest"></asp:Label>
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex align-items-center justify-content-between">
                    <h6 class=" font-weight-bold text-primary">Tất cả sản phẩm</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0"
                            id="products">
                            <headertemplate>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên danh mục</th>
                                    <th>Icon</th>
                                    <th>Slug</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="dataCategories" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="vertical-align: middle;">
                                                <span>
                                                    <%# Eval("id") %>
                                                </span>
                                            </td>
                                            <td style="vertical-align: middle; text-align:center">
                                                <span>
                                                    <%# Eval("category_name") %>
                                                </span>
                                            </td>
                                             <td style="vertical-align: middle; text-align:center" >
                                                <div class="svg-size mx-auto">
                                                    <style>
                                                         .svg-size {
                                                             width:25px; height:25px; overflow:hidden;
                                                         }
                                                    </style>
                                                     <%# Eval("category_icon") %>
                                                </div>
                                            </td>
                                             <td style="vertical-align: middle; text-align:center">
                                                <div >
                                                     <%# Eval("category_slug") %>
                                                </div>
                                            </td>
                                           
                                            <td style="vertical-align: middle;" class="d-flex items-center justify-content-center">

                                                <asp:HyperLink runat="server" CssClass="btn btn-danger mr-2" NavigateUrl='<%#"?delete=" + Eval("Id").ToString() %>'>
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19.4 22.169" fill="currentColor" width="16">
                                                        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.4">
                                                            <path data-name="Rectangle 2" d="M8.238.7h2.923a2 2 0 012 2v.769h0-6.923 0V2.7a2 2 0 012-2z"></path>
                                                            <path data-name="Line 1" d="M.7 3.469h18"></path>
                                                            <path data-name="Path 77" d="M14.649 21.469h-9.9a1.385 1.385 0 01-1.38-1.279L2.085 3.469h15.231L16.029 20.19a1.385 1.385 0 01-1.38 1.279z"></path>
                                                            <path data-name="Line 2" d="M7.623 6.238V18.7"></path>
                                                            <path data-name="Line 3" d="M11.777 6.238V18.7"></path>
                                                        </g></svg>
                                                </asp:HyperLink>
                                                <button class="btn btn-success cursor-pointer" type="button">
                                                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20.547 20.299" fill="currentColor" width="16">
                                                        <g stroke="currentColor" stroke-width=".4">
                                                            <path data-name="Path 78" d="M18.659 12.688a.5.5 0 00-.5.5v4.423a1.5 1.5 0 01-1.494 1.494H2.691A1.5 1.5 0 011.2 17.609V4.629a1.5 1.5 0 011.494-1.494h4.419a.5.5 0 100-1H2.691A2.493 2.493 0 00.2 4.629v12.98A2.493 2.493 0 002.691 20.1h13.976a2.493 2.493 0 002.491-2.491v-4.423a.5.5 0 00-.5-.5zm0 0"></path>
                                                            <path data-name="Path 79" d="M18.96.856a2.241 2.241 0 00-3.17 0L6.899 9.739a.5.5 0 00-.128.219l-1.169 4.219a.5.5 0 00.613.613l4.219-1.169a.5.5 0 00.219-.128l8.886-8.887a2.244 2.244 0 000-3.17zm-10.971 9.21l7.273-7.273 2.346 2.346-7.273 7.273zm-.469.94l1.879 1.875-2.592.718zm11.32-7.1l-.528.528-2.346-2.345.528-.528a1.245 1.245 0 011.761 0l.585.584a1.247 1.247 0 010 1.761zm0 0"></path>
                                                        </g></svg>
                                                </button>
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
</asp:Content>
