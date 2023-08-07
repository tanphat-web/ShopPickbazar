<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ButtonProfile.ascx.cs" Inherits="ShopPickbazar.Controls.ButtonProfile" %>
<li class="profile relative">
    <button type="button" class="w-9 h-9 rounded-full overflow-hidden border">
        <asp:Image runat="server" ID="avt" cssClass="w-full h-full"/>
    </button>
    <ul class="profile-menu absolute top-full right-0 bg-white w-[200px] block transition duration-300 opacity-0 pointer-events-none">
        <li>
            <a href="Profile.aspx" class="pl-4 py-3 block transition font-semibold text-sm hover:text-[var(--color-accent)]">Thông tin</a>
        </li>
        <li>
            <a href="Orders.aspx" class="pl-4 py-3 block transition font-semibold text-sm hover:text-[var(--color-accent)]">Đơn hàng của tôi</a>
        </li>
        <li>
            <a href="ChangePassword.aspx" class="pl-4 py-3 block transition font-semibold text-sm hover:text-[var(--color-accent)]">Thay đổi mật khẩu</a>
        </li>
        <li>
            <a href="?action=logout" class="pl-4 py-3 block transition font-semibold text-sm hover:text-[var(--color-accent)]">Đăng xuất</a>
        </li>
    </ul>
</li>
