<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShopPickbazar.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/CSS/output.css" rel="stylesheet" />
    <link href="./Content/CSS/styles.css" rel="stylesheet" />
</head>
<body class="bg-white">
    <form id="form1" runat="server">
        <div class="w-screen h-screen flex items-center justify-between">
            <div class="max-w-lg w-full bg-white rounded-xl py-8 px-4 mx-auto relative z-50 ">
                <div class="flex items-center">
                    <a href="/" class=" mx-auto max-w-[120px] inline-block">
                        <img src="./Content/Images/PickBazar.png" alt="" class="">
                    </a>
                </div>
                <p class="p-5 text-center ">Đăng nhập bằng email và mật khẩu của bạn</p>
                <div class="form-group">
                    <label for="Email">
                        <span class="block mb-1">Tài khoản:</span>
                    </label>
                    <asp:TextBox runat="server" ID="txtName" placeholder="Nhập vào tài khoản của bạn!" CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12"></asp:TextBox>
                </div>
                <div class="pt-4 form-group">
                    <label for="Password" class="flex items-center justify-between mb-1">
                        <span class="block ">Mật khẩu:</span>
                        <a href=""
                            class="text-sm text-[var(--color-accent)] hover:text-[var(--color-accent-hover)]-hover underline">Quên mật khẩu</a>
                    </label>
                    <div class="relative" id="pw">
                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Nhập vào mật khẩu của bạn!" CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12"></asp:TextBox>
                        <div id="show-password"
                            class="absolute top-1/2 -translate-y-1/2 right-[10px] cursor-pointer block">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" class="h-6 w-6">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z">
                                </path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z">
                                </path>
                            </svg>
                        </div>
                        <div id="hide-password"
                            class="absolute top-1/2 -translate-y-1/2 right-[10px] cursor-pointer hidden">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" class="h-6 w-6">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21">
                                </path>
                            </svg>
                        </div>
                    </div>
                </div>
                <div class="form-group pt-4">
                    <asp:Button runat="server" ID="btnLogin" CssClass="cursor-pointer w-full bg-[var(--color-accent)] text-white p-2 rounded-lg hover:bg-[var(--color-accent-hover)]" Text="Đăng nhập"  />

                </div>
                <div class="form-group pt-4 flex items-center gap-[3px] justify-center">
                    <p class="text-center text-sm sm:text-base">Bạn chưa có tài khoản?</p>
                    <a href="Register.aspx"
                        class="text-[var(--color-accent)] hover:text-[var(--color-accent-hover)]-hover">Đăng ký</a>
                </div>
            </div>
            
        </div>

    </form>
    <script src="./Content/Javascript/main.js"></script>
</body>
</html>
