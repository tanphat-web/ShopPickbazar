<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ShopPickbazar.ChangePassword" %>

<%@ Register Src="~/Controls/MenuProfile.ascx" TagPrefix="uc1" TagName="MenuProfile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mb-5 lg:mb-0">
        <div
            class=" mx-auto flex w-full max-w-1920 flex-col items-start bg-gray-100 px-5 py-20 lg:flex-row xl:px-8 2xl:px-14 gap-5">
            <uc1:MenuProfile runat="server" ID="MenuProfile" />
            <div class="p-5 md:p-8 bg-white shadow rounded w-full">
                <h1 class="mb-5 text-lg font-semibold text-heading sm:mb-8 sm:text-xl">Thay đổi mật khẩu</h1>
                <div class="mb-5">
                    <div class="mb-2 flex items-center justify-between">
                        <label for="oldPassword"
                            class="text-sm font-semibold text-body">
                            Mật khẩu hiện tại</label>
                    </div>
                    <asp:TextBox runat="server" ID="currentPassword" placeholder="Nhập mật khẩu cũ" TextMode="Password"
                        CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12" />
                </div>
                <div class="mb-5">
                    <div class="mb-2 flex items-center justify-between">
                        <label for="oldPassword"
                            class="text-sm font-semibold text-body">
                            Mật khẩu mới</label>
                    </div>
                    <asp:TextBox runat="server" ID="newPassword" placeholder="Nhập mật khẩu mới" TextMode="Password"
                        CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12" />
                </div>
                <div class="mb-5">
                    <div class="mb-2 flex items-center justify-between">
                        <label for="oldPassword"
                            class="text-sm font-semibold text-body">
                            Nhập lại mật khẩu</label>
                    </div>
                    <asp:TextBox runat="server" ID="confirmPassword" placeholder="Xác nhận mật khẩu" TextMode="Password"
                        CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12" />
                </div>
                <asp:Button runat="server" ID="ButtonForgotPassword" Text="Thay đổi" OnClick="ButtonForgotPassword_Click" CssClass="inline-flex items-center justify-center shrink-0 font-semibold leading-none rounded outline-none transition duration-300 ease-in-out focus:outline-0 focus:shadow focus:ring-1 focus:ring-[var(--color-accent-hover)] bg-accent text-white border border-transparent hover:bg-[var(--color-accent-hover)] px-5 py-0 h-12 ltr:ml-auto rtl:mr-auto" />
            </div>
        </div>

    </main>

</asp:Content>
