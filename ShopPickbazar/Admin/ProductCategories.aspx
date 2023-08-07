<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProductCategories.aspx.cs" Inherits="ShopPickbazar.Admin.ProductCategories" %>
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

<%--                                                <asp:HyperLink runat="server" CssClass="btn btn-danger mr-2" NavigateUrl='<%#"?delete=" + Eval("Id").ToString() %>'>
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19.4 22.169" fill="currentColor" width="16">
                                                        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.4">
                                                            <path data-name="Rectangle 2" d="M8.238.7h2.923a2 2 0 012 2v.769h0-6.923 0V2.7a2 2 0 012-2z"></path>
                                                            <path data-name="Line 1" d="M.7 3.469h18"></path>
                                                            <path data-name="Path 77" d="M14.649 21.469h-9.9a1.385 1.385 0 01-1.38-1.279L2.085 3.469h15.231L16.029 20.19a1.385 1.385 0 01-1.38 1.279z"></path>
                                                            <path data-name="Line 2" d="M7.623 6.238V18.7"></path>
                                                            <path data-name="Line 3" d="M11.777 6.238V18.7"></path>
                                                        </g></svg>
                                                </asp:HyperLink>--%>
                                                <asp:HyperLink runat="server" CssClass="btn btn-primary mr-2" NavigateUrl='<%#"products.aspx?category=" + Eval("id").ToString() %>'>
                                                    <svg fill="#fff" width="16"   version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 442.04 442.04" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <path d="M221.02,341.304c-49.708,0-103.206-19.44-154.71-56.22C27.808,257.59,4.044,230.351,3.051,229.203 c-4.068-4.697-4.068-11.669,0-16.367c0.993-1.146,24.756-28.387,63.259-55.881c51.505-36.777,105.003-56.219,154.71-56.219 c49.708,0,103.207,19.441,154.71,56.219c38.502,27.494,62.266,54.734,63.259,55.881c4.068,4.697,4.068,11.669,0,16.367 c-0.993,1.146-24.756,28.387-63.259,55.881C324.227,321.863,270.729,341.304,221.02,341.304z M29.638,221.021 c9.61,9.799,27.747,27.03,51.694,44.071c32.83,23.361,83.714,51.212,139.688,51.212s106.859-27.851,139.688-51.212 c23.944-17.038,42.082-34.271,51.694-44.071c-9.609-9.799-27.747-27.03-51.694-44.071 c-32.829-23.362-83.714-51.212-139.688-51.212s-106.858,27.85-139.688,51.212C57.388,193.988,39.25,211.219,29.638,221.021z"></path> </g> <g> <path d="M221.02,298.521c-42.734,0-77.5-34.767-77.5-77.5c0-42.733,34.766-77.5,77.5-77.5c18.794,0,36.924,6.814,51.048,19.188 c5.193,4.549,5.715,12.446,1.166,17.639c-4.549,5.193-12.447,5.714-17.639,1.166c-9.564-8.379-21.844-12.993-34.576-12.993 c-28.949,0-52.5,23.552-52.5,52.5s23.551,52.5,52.5,52.5c28.95,0,52.5-23.552,52.5-52.5c0-6.903,5.597-12.5,12.5-12.5 s12.5,5.597,12.5,12.5C298.521,263.754,263.754,298.521,221.02,298.521z"></path> </g> <g> <path d="M221.02,246.021c-13.785,0-25-11.215-25-25s11.215-25,25-25c13.786,0,25,11.215,25,25S234.806,246.021,221.02,246.021z"></path> </g> </g> </g></svg>
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
</asp:Content>
