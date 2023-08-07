<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuProfile.ascx.cs" Inherits="ShopPickbazar.Controls.MenuProfile" %>

<aside class="hidden shrink-0 ltr:mr-8 rtl:ml-8 lg:block lg:w-80">
                <div class="overflow-hidden rounded border border-border-200 bg-white">
                    <ul class="py-7">
                        <li class="py-1"><a
                            class="menu-item block border-l-4 border-transparent py-2 px-10 font-semibold text-heading transition-colors hover:text-[var(--color-accent-hover)] text-[var(--color-accent-hover)] focus:text-[var(--color-accent)] "
                            href="Profile.aspx">Hồ sơ</a></li>
                        <li class="py-1"><a
                            class="menu-item block border-l-4 border-transparent py-2 px-10 font-semibold text-heading transition-colors hover:text-[var(--color-accent-hover)] focus:text-[var(--color-accent)]"
                            href="ChangePassword.aspx">Thay đổi mật khẩu</a></li>
                        <li class="py-1"><a
                            class="menu-item block border-l-4 border-transparent py-2 px-10 font-semibold text-heading transition-colors hover:text-[var(--color-accent-hover)] focus:text-[var(--color-accent)]"
                            href="Orders.aspx">Đơn hàng của tôi</a></li>
                    </ul>
                    <ul class="border-t border-border-200 bg-white py-4">
                        <li class="block py-2 px-11 ">
                            <a href="index.aspx?action=logout"
                                class="font-semibold text-heading transition-colors hover:text-[var(--color-accent-hover)] focus:text-[var(--color-accent)]">Đăng
                                    xuất</a>
                        </li>
                    </ul>
                </div>
            </aside>
<script>
        const categories = document.querySelectorAll(".menu-item")
        categories.forEach(item => {
            if (item.href === location.href) {
                item.className = "menu-item block border-l-4 border-transparent py-2 px-10 font-semibold text-heading transition-colors hover:text-[var(--color-accent-hover)] focus:text-[var(--color-accent)] !border-accent text-[var(--color-accent)]";
            }
        })
</script>

<style>
        #product-cart {
            opacity:0 !important;
            pointer-events:none !important;
        }
    </style>