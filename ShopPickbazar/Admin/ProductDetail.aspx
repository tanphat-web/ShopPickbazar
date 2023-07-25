<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="ShopPickbazar.Admin.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div id="default">
                <div class="card mb-4">
                    <div class="card-header">Chi tiết sản phẩm</div>
                    <div class="card-body">
                        <div class="row">
                            <asp:Repeater runat="server" ID="repeaterProductDetail">
                                <ItemTemplate>
                                    <div class="col-md-6 mb-3">
                                        <p>Hình ảnh nổi bật</p>
                                        <asp:Image runat="server" ID="featuredImg" Height="80" Width="80" ImageUrl='<%#"../Content/Images/Products/" + Eval("FeaturedImage").ToString()%>' />
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <p>Hình ảnh chi tiết</p>
                                        <div class="d-flex items-center" style="gap: 10px">
                                            <asp:Repeater ID="repeaterGallery" runat="server" DataSource='<%# Eval("gallery") %>'>
                                                <ItemTemplate>
                                                    <div class="image-container">
                                                        <img src='<%#"../Content/Images/Products/" + Container.DataItem %>' alt='<%# Container.DataItem %>' height="80" width="80" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="">Tên sản phẩm</label>
                                        <input name="" type="text" disabled id="" class="form-control" value="<%# Eval("productname") %>">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="">Số lượng</label>
                                        <input name="" type="number" disabled id="" class="form-control" value="<%#Eval("quantity") %>">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="">Danh mục</label>
                                        <input name="" type="text" disabled id="" class="form-control" value="<%# Eval("categoryName") %>">
                                    </div>
                                    <div class="col-md-3 col-sm-6 mb-3">
                                        <label for="">Giá (VND)</label>
                                        <input name="" type="text" disabled id="" class="form-control" value=" <%# string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c0}", Convert.ToDecimal(Eval("Price"))) %>">
                                    </div>
                                    <div class="col-md-3 col-sm-6 mb-3">
                                        <label for="">Giá bán (VND)</label>
                                        <input name="" type="text" disabled id="" class="form-control" value=" <%# string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c0}", Convert.ToDecimal(Eval("discount"))) %>">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="">Mô tả sản phẩm</label>

                                        <textarea name="" readonly rows="3" cols="20" id="" class="form-control"><%# Eval("Description")%></textarea>
                                    </div>
                                    <div class="col-12">
                                        <a href="/admin/Products.aspx" class="btn btn-secondary ">Thoát</a>
                                        <asp:HyperLink runat="server" NavigateUrl='<%# "UpdateProduct.aspx?id=" + Eval("id") %>' CssClass="btn btn-primary">Cập nhật</asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
