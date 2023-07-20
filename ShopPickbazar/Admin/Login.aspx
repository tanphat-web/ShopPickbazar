<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShopPickbazar.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>SB Admin 2 - Login</title>
    <link href="vendor/fontawesome-free/css/all.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Custom fonts for this template-->
    <link href="css/sb-admin-2.css" rel="stylesheet" />
</head>
<body class="bg-gradient-primary">
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form  runat="server" id="formLogin">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control form-control-user"
                                                placeholder="example: tanphat@email.com" aria-describedby="emailHelp" >
                                            </asp:TextBox>
                                            
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control form-control-user"
                                                placeholder="Nhập vào mật khẩu của bạn!" TextMode="Password">
                                            </asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" ID="lblMessage" CssClass="text-danger " Text=""></asp:Label>
                                        </div>
                                        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary btn-user btn-block" Text="Đăng nhập" />
                                        
                                    </form>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Quên mật khẩu?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Tạo tài khoản!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <script>

        const email = document.getElementById("txtEmail");
        const password = document.getElementById("txtPassword");
        const message = document.getElementById("lblMessage");
        email.addEventListener("focus", messageText)
        password.addEventListener("focus", messageText)
       
        function messageText() {
            message.textContent =""
        }
    </script>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
