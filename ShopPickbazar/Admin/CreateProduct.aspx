<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" Inherits="ShopPickbazar.Admin.CreateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-lg-12">
            <div id="default">
                <div class="card mb-4">
                    <div class="card-header">Thêm sản phẩm</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="">Hình ảnh nổi bật</label>
                                <asp:FileUpload runat="server" ID="featuredImage" CssClass="form-control" AllowMultiple="false"/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="">Hình ảnh chi tiết</label>
                                <asp:FileUpload runat="server" ID="gellaryFileUpload" CssClass="form-control" AllowMultiple="true"/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="">Tên sản phẩm</label>
                                <asp:TextBox runat="server" ID="txtProductName" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="">Số lượng</label>
                                <asp:TextBox runat="server" ID="txtProductQuantity" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="">Danh mục</label>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ListCategory">
                                    <asp:ListItem Value="1"  Text="Vui lòng chọn danh mục"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <label for="">Giá (VND)</label>
                                <asp:TextBox runat="server" ID="txtProductPrice" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <label for="">Giá bán</label>
                                <asp:TextBox runat="server" ID="txtProductSalePrice" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col-12 mb-3">
                                <label for="">Mô tả sản phẩm</label>
                                <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" CssClass="form-control" Rows="3"></asp:TextBox>
                            </div>  
                            <div class="col-12">
                                <asp:Button runat="server" Text="Thêm" CssClass="btn btn-success" ID="Button1" OnClick="ButtonCreateProduct"  />
                                <a href="/admin/" class="btn btn-danger ">Hủy bỏ</a>    
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
  
</asp:Content>
