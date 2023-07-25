<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="ShopPickbazar.Admin.UpdateProduct" %>

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
                           
                                    <div class="col-md-6 mb-3">
                                        <p>Hình ảnh nổi bật</p>
                                        <asp:FileUpload runat="server" ID="Image" CssClass="form-control" AllowMultiple="false" />
                                        <asp:Image runat="server" ID="featuredImg" Height="80" Width="80"/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <p>Hình ảnh chi tiết</p>
                                        <asp:FileUpload runat="server" ID="galleryImg" CssClass="form-control" AllowMultiple="true" />
                                        <div class="d-flex items-center" style="gap:10px">
                                            <asp:Repeater runat="server" ID="galleryImage" >
                                            <ItemTemplate>
                                                <div class="image-container">
                                                    <img src='<%#"../Content/Images/Products/" + Container.DataItem %>' alt="Alternate Text" width="80" height="80" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="">Tên sản phẩm</label>
                                        <asp:TextBox runat="server" ID="txtProductName"  CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="">Số lượng</label>
                                        <asp:TextBox runat="server" ID="txtProductQuantity" TextMode="Number"  min="0" CssClass="form-control"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="">Giá (VND)</label>
                                        <asp:TextBox runat="server" ID="txtProductPrice" TextMode="Number"  min="0" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="">Giá bán (VND)</label>
                                        <asp:TextBox runat="server" ID="txtProductSalePrice" TextMode="Number"  min="0" CssClass="form-control"></asp:TextBox>

                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="">Mô tả sản phẩm</label>
                                        <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" CssClass="form-control" Rows="3" cols="20" ></asp:TextBox>
                                    </div>
                              
                            <div class="col-12">
                                <a href="/admin/Products.aspx" class="btn btn-secondary ">Thoát</a>
                                <asp:Button runat="server" ID="ButtonUpdateProduct" Text="Cập nhật" CssClass="btn btn-primary" OnClick="ButtonUpdateProduct_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
