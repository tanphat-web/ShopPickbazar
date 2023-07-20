<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ShopPickbazar.Admin.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <!-- Content Row -->
    <div class="row">
        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Earnings (Monthly)
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                Earnings (Annual)
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                Tasks
                                           
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div class="progress-bar bg-info" role="progressbar"
                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                            aria-valuemax="100">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                Pending Requests
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Đơn hàng gần đây</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0"
                            id="recent-orders">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Thành tiền</th>
                                    <th>Ngày đặt hàng</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-success p-0 px-2 w-100 mx-auto align-middle">Thành công
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-warning p-0 px-2 w-100 mx-auto align-middle">Đang xử lý
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-secondary p-0 px-2 w-100 mx-auto align-middle">Đã hủy
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-success p-0 px-2 w-100 mx-auto align-middle">Thành công
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-warning p-0 px-2 w-100 mx-auto align-middle">Đang xử lý
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-secondary p-0 px-2 w-100 mx-auto align-middle">Đã hủy
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-success p-0 px-2 w-100 mx-auto align-middle">Thành công
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-warning p-0 px-2 w-100 mx-auto align-middle">Đang xử lý
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2123</td>
                                    <td>$55.10</td>
                                    <td>8 months ago</td>
                                    <td class="">
                                        <span
                                            class="btn btn-secondary p-0 px-2 w-100 mx-auto align-middle">Đã hủy
                                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Người dùng mới</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0"
                            id="recent-orders">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên người dùng</th>
                                    <th>Email</th>
                                    <th>Chức vụ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>11</td>
                                    <td>Lộ Phú Tấn Phát</td>
                                    <td>admin@example.com</td>
                                    <td class="">
                                        <span
                                            class="btn btn-secondary p-0 px-2 w-100 mx-auto align-middle">super admin
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>Lộ Phú Tấn Phát</td>
                                    <td>admin@example.com</td>
                                    <td class="">
                                        <span
                                            class="btn btn-danger p-0 px-2 w-100 mx-auto align-middle">Admin
                                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>Lộ Phú Tấn Phát</td>
                                    <td>admin@example.com</td>
                                    <td class="">
                                        <span
                                            class="btn btn-primary p-0 px-2 w-100 mx-auto align-middle">Khách hàng
                                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Sản phẩm phổ biến</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0"
                            id="recent-orders">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Danh mục</th>
                                    <th>Giá tiền</th>
                                    <th>Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>
                                        <img width="40" height="40"
                                            src="https://pickbazar-react-admin.vercel.app/_next/image?url=https%3A%2F%2Fpickbazarlaravel.s3.ap-southeast-1.amazonaws.com%2F882%2Fconversions%2FFurniture-thumbnail.jpg&w=48&q=75"
                                            alt="" style="overflow: hidden;">
                                        <span>Quả táo nhà Phát trồng
                                                        </span>
                                    </td>
                                    <td>Trái cây</td>
                                    <td>30.000 VND</td>
                                    <td>30</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
