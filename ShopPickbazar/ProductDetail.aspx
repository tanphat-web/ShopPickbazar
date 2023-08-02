<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="ShopPickbazar.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="min-h-screen bg-white mt-5">
            <article class="rounded-lg bg-white ">
                <asp:Label runat="server" ID="test" Text=""></asp:Label>
                <div class="flex flex-col border-b border-border-200 border-opacity-70 md:flex-row">
                    <div class="p-6 pt-10 md:w-1/2 lg:p-14 xl:p-16">
                        <div class="flex items-center justify-between mb-8 lg:mb-10 ">
                            <a href="/" title="Quay về trang chủ"
                                class="inline-flex items-center justify-center gap-3 font-semibold text-accent transition-colors hover:text-[var(--color-accent-hover]focus:text-[var(--color-accent-hover]focus:outline-0">
                                <svg
                                    class="h-5 w-5 ltr:mr-2 rtl:ml-2" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.7"
                                        d="M7 16l-4-4m0 0l4-4m-4 4h18">
                                    </path>
                                </svg>Back</a>
                        </div>
                        <div class="">
                            <div class="product-gallery">
                                <asp:Repeater runat="server" ID="ProductGallery">
                                    <ItemTemplate>
                                        <div class="w-full bg-white flex justify-center">
                                            <img width="400" height="400"
                                                src='<%#"./Content/Images/Products/" + Container.DataItem %>'
                                                alt="">
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="sub-product-gallery ">
                                <asp:Repeater runat="server" ID="subProductGallery">
                                    <ItemTemplate>
                                        <div class="cursor-pointer rounded-md border inline-block overflow-hidden  p-2 mr-4">
                                            <img width="80" height="80"
                                                src='<%#"./Content/Images/Products/" + Container.DataItem %>'
                                                alt="">
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>

                    <div class="flex flex-col items-start p-5 pt-10 md:w-1/2 lg:p-14 xl:p-16">
                        <div class="w-full">
                            <div class="flex items-start justify-between w-full space-x-8 rtl:space-x-reverse">
                                <h1 class="text-lg font-semibold tracking-tight text-heading md:text-xl xl:text-2xl">
                                    <asp:Label runat="server" ID="txtTitle"></asp:Label>
                                </h1>
                            </div>
                            <div class="mt-3 text-sm leading-7 text-body md:mt-4">
                                <asp:Label runat="server" ID="txtDescription"></asp:Label>
                            </div>
                            <div
                                class="flex items-center my-5 md:my-10">
                                <asp:Label runat="server" ID="txtPrice" CssClass="text-2xl font-semibold no-underline text-accent md:text-3xl"></asp:Label>
                            </div>
                            <div class="flex flex-col items-center mt-6 md:mt-6 lg:flex-row gap-3">
                                <div class="mb-3 w-full lg:mb-0 lg:max-w-[400px]">
                                    <div>
                                        <asp:Button ID="buttonAddToCart" OnClientClick="return preventReload();" runat="server" cssClass="add-to-cart cursor-pointer flex w-full items-center justify-center rounded bg-accent py-4 px-5 text-sm  text-white transition-colors duration-300 hover:bg-[var(--color-accent-hover)] focus:bg-[var(--color-accent-hover)] focus:outline-0 lg:text-base" Text="Thêm vào giỏ"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                            class="mt-4 flex w-full flex-row items-start border-t border-border-200 border-opacity-60 pt-4 md:mt-6 md:pt-6 gap-3">
                            <span
                                class="py-1 text-sm font-semibold capitalize text-heading ltr:mr-6 rtl:ml-6">Danh mục</span>
                            <div class="flex flex-row flex-wrap gap-3">
                                <asp:HyperLink runat="server" ID="txtCategory" CssClass="mb-2 whitespace-nowrap rounded border border-border-200 bg-transparent py-1 px-2.5 text-sm lowercase tracking-wider text-heading transition-colors  hover:text-[var(--color-accent)] focus:bg-opacity-100 focus:outline-0 ltr:mr-2 rtl:ml-2"></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
                <div name="RelatedProducts"
                    class="px-5 py-4 border-b border-border-200 border-opacity-70 lg:px-16 lg:py-14">
                    <h2 class="mb-4 text-lg font-semibold tracking-tight text-heading md:mb-6">Sản phẩm liên quan</h2>
                    <div class="grid grid-cols-[repeat(auto-fill,minmax(250px,1fr))] gap-3">
                        <asp:Repeater runat="server" ID="repeaterRelatedProducts">
                            <ItemTemplate>
                                <article
                                    class="product-card cart-type-neon h-full transform overflow-hidden rounded border border-border-200 bg-white shadow-sm transition-all duration-200 hover:-translate-y-0.5 hover:shadow">
                                    <asp:HyperLink runat="server" NavigateUrl='<%#"ProductDetail.aspx?id="  + Eval("Id")%>'>
                                    <div
                                        class="relative pt-[56.25%] overflow-hidden flex h-48 w-auto cursor-pointer items-center justify-center sm:h-64">
                                        <img src="https://pickbazar-react.vercel.app/_next/image?url=https%3A%2F%2Fpickbazarlaravel.s3.ap-southeast-1.amazonaws.com%2F1%2FApples.jpg&w=1920&q=75"
                                            alt="Apples"
                                            class="absolute  top-0 left-0 w-full max-w-full h-full object-cover">
                                        <asp:Image runat="server" ImageUrl='<%#"./Content/Images/Products/"  + Eval("FeaturedImage")%>' AlternateText='<%# Eval("ProductName")%>'   CssClass="absolute  top-0 left-0 w-full max-w-full h-full object-cover" />
                                        
                                    </div>
                                    </asp:HyperLink>
                                    <header class="p-3 md:p-6">
                                        <asp:HyperLink runat="server" NavigateUrl='<%#"ProductDetail.aspx?id="  + Eval("Id")%>'>

                                        <div class="mb-2 flex items-center gap-2">
                                            <span
                                                class="text-sm font-semibold text-heading md:text-base">
                                                <%# string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c0}", Convert.ToDecimal(Eval("Price"))) %>
                                            </span>
                                        </div>
                                        <h3 class="mb-4 truncate text-xs  md:text-sm"><%#Eval("ProductName") %>
                                        </h3>
                                        </asp:HyperLink>
                                        <button data-name="<%#Eval("ProductName")%>" data-image="<%#Eval("FeaturedImage")%>" data-price="<%#Eval("Price")%>" data-id="<%#Eval("Id")%>" type="button"
                                            class="add-to-cart group flex h-7 w-full items-center justify-center rounded bg-gray-100 text-xs  transition-colors hover:border-green-700 hover:bg-[var(--color-accent)] hover:text-white focus:border-green-700 focus:bg-[var(--color-accent)] focus:text-white focus:outline-0 md:h-9 md:text-sm">
                                            Thêm vào giỏ
                                        </button>
                                    </header>
                                </article>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </article>

        </div>
    </main>
    <script src="./Content/Plugin/flickity.pkgd.min.js"></script>
    <script type="text/javascript">
        function preventReload() {
            // Thực hiện xử lý tại đây (nếu cần)

            // Trả về false để ngăn chặn reload trang
            return false;
        }
    </script>
    <script>
        const productGallery = document.querySelector('.product-gallery');
        const subProductGallery = document.querySelector('.sub-product-gallery');
        const flkty = new Flickity(productGallery, {
            // options
            cellAlign: 'left',
            contain: true,
            pageDots: false,
            prevNextButtons: false,
            autoplay: 1500
        });
        const flktyNav = new Flickity(subProductGallery, {
            asNavFor: productGallery,
            contain: true,
            pageDots: false,
            prevNextButtons: false,
        });
    </script>
</asp:Content>
