<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ShopPickbazar.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mb-5 lg:mb-0">

        <section class="h-screen max-w-screen relative z-40 lg:block hidden ">
            <img src="./Content/Images/grocery.png" alt="" class=" w-full h-full absolute top-0 left-0">
            <div
                class="absolute inset-0 mt-8 flex w-full flex-col items-center justify-center p-5 text-center md:px-20 lg:space-y-10">
                <h1 class="text-2xl font-bold tracking-tight text-heading lg:text-4xl xl:text-5xl">Groceries
                        Delivered in 90 Minute</h1>
                <p class="text-sm text-heading lg:text-base xl:text-lg">
                    Get your healthy foods &amp; snacks
                        delivered at your doorsteps all day everyday
                </p>
                <div class="w-full max-w-3xl">
                    <div class="search w-full flex items-center ">
                        <input type="text" class=" focus:border-green-800 w-3/4 px-4 h-14 outline-green-700  "
                            style="border-top-left-radius: 8px; border-bottom-left-radius: 8px;"
                            placeholder="Search your products from here ">
                        <button
                            class="w-1/4 bg-[var(--color-accent)] hover:bg-[var(--color-accent-hover)] transition text-white h-14  text-base flex items-center justify-center gap-1"
                            style="border-top-right-radius: 8px; border-bottom-right-radius: 8px;">
                            <i class='bx bx-search align-middle'></i>
                            <span>Search</span>
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <section class=" w-full px-4 lg:px-8 mx-auto lg:py-7  pb-6 pt-[65px] bg-white border-t border-b">
            <div class="carousel ">
                <div class="carousel-item mr-4  w-full lg:w-1/3 sm:w-2/3 ">
                    <a href="/" class="w-full max-h-[300px] overflow-hidden h-auto">
                        <img class="w-full h-auto"
                            src="https://pickbazar-react.vercel.app/_next/image?url=https%3A%2F%2Fpickbazarlaravel.s3.ap-southeast-1.amazonaws.com%2F905%2Foffer-2.png&w=640&q=75"
                            alt="">
                    </a>
                </div>
                <div class="carousel-item mr-4  w-full lg:w-1/3 sm:w-2/3 ">
                    <a href="/" class="w-full max-h-[300px] overflow-hidden h-auto">
                        <img class="w-full h-auto"
                            src="https://pickbazar-react.vercel.app/_next/image?url=https%3A%2F%2Fpickbazarlaravel.s3.ap-southeast-1.amazonaws.com%2F905%2Foffer-2.png&w=640&q=75"
                            alt="">
                    </a>
                </div>
                <div class="carousel-item mr-4  w-full lg:w-1/3 sm:w-2/3 ">
                    <a href="/" class="w-full max-h-[300px] overflow-hidden h-auto">
                        <img class="w-full h-auto"
                            src="https://pickbazar-react.vercel.app/_next/image?url=https%3A%2F%2Fpickbazarlaravel.s3.ap-southeast-1.amazonaws.com%2F904%2Foffer-3.png&w=640&q=75"
                            alt="">
                    </a>
                </div>
                <div class="carousel-item mr-4  w-full lg:w-1/3 sm:w-2/3 ">
                    <a href="/" class="w-full max-h-[300px] overflow-hidden h-auto">
                        <img class="w-full h-auto"
                            src="https://pickbazar-react.vercel.app/_next/image?url=https%3A%2F%2Fpickbazarlaravel.s3.ap-southeast-1.amazonaws.com%2F905%2Foffer-2.png&w=640&q=75"
                            alt="">
                    </a>
                </div>
            </div>
        </section>

        <section class="w-full block  lg:flex">

            <div style="height: calc(100vh - 68px);"
                class=" category hidden bg-white lg:sticky lg:top-16 xl:block xl:w-72 undefined">
                <ul class="px-4 py-6" id="Categories">
                    <asp:Repeater ID="myRepeater" runat="server">
                        <ItemTemplate>
                            <li class="py-3">
                                <asp:HyperLink runat="server" CssClass="category_item flex items-center gap-3 hover:text-[var(--color-accent)] transition-colors" NavigateUrl='<%#"Index.aspx?category=" + Eval("id").ToString() %>'>
                                    <%# Eval("category_icon") %>
                                    <span><%# Eval("category_name") %></span>
                                </asp:HyperLink>
                            </li>
                        </ItemTemplate>

                    </asp:Repeater>
                </ul>

            </div>
            <div id="btn-filter"
                class="sticky top-14 z-10 flex h-14 items-center justify-between border-t border-b border-border-200 bg-white py-3 px-5 md:top-16 md:h-16 lg:top-22 lg:px-7 xl:hidden ">
                <button type="button"
                    class="flex gap-2 h-8 items-center rounded border border-border-200 bg-gray-100 bg-opacity-90 py-1 px-3 text-sm font-semibold text-heading transition-colors duration-200 hover:border-[var(--color-accent-hover)] hover:bg-[var(--color-accent)] hover:text-white focus:border-[var(--color-accent-hover)] focus:bg-[var(--color-accent)] focus:text-light focus:outline-0 md:h-10 md:py-1.5 md:px-4 md:text-base">
                    <svg
                        width="18" height="14" class="ltr:mr-2 rtl:ml-2" viewBox="0 0 18 14">
                        <path
                            d="M942.581,1295.564H925.419c-.231,0-.419-.336-.419-.75s.187-.75.419-.75h17.163c.231,0,.419.336.419.75S942.813,1295.564,942.581,1295.564Z"
                            transform="translate(-925 -1292.064)" fill="currentColor">
                        </path>
                        <path
                            d="M942.581,1951.5H925.419c-.231,0-.419-.336-.419-.75s.187-.75.419-.75h17.163c.231,0,.419.336.419.75S942.813,1951.5,942.581,1951.5Z"
                            transform="translate(-925 -1939.001)" fill="currentColor">
                        </path>
                        <path d="M1163.713,1122.489a2.5,2.5,0,1,0,1.768.732A2.483,2.483,0,0,0,1163.713,1122.489Z"
                            transform="translate(-1158.213 -1122.489)" fill="currentColor">
                        </path>
                        <path d="M2344.886,1779.157a2.5,2.5,0,1,0,.731,1.768A2.488,2.488,0,0,0,2344.886,1779.157Z"
                            transform="translate(-2330.617 -1769.425)" fill="currentColor">
                        </path>
                    </svg>Filter</button>

            </div>
            <div class="w-full  px-4 pt-6 pb-8 lg:p-8">
                <div class="grid grid-cols-[repeat(auto-fill,minmax(250px,1fr))] gap-3">

                    <asp:Repeater runat="server" ID="Products">
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
                                    <%--<asp:Button runat="server" ID="AddToCartButton" Text="Thêm vào giỏ hàng" OnClick='<%# "addToCart(" + Eval("Id") + "); return false;" %>' CssClass="add-to-cart group flex h-7 w-full items-center justify-center rounded bg-gray-100 text-xs  transition-colors hover:border-green-700 hover:bg-[var(--color-accent)] hover:text-white focus:border-green-700 focus:bg-[var(--color-accent)] focus:text-white focus:outline-0 md:h-9 md:text-sm"/>--%>
                                   
                                </header>
                            </article>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <div style="display:flex;align-items:center; justify-content:center; flex-direction:column;">
                    <asp:Image runat="server" ID="noProductFound" ImageUrl="./Content/Images/no-result.b574bcc9.svg" />
                </div>
                <!-- <div class="loadMore py-6 mx-auto flex items-center justify-center">
                        <button
                            class="text-white bg-[var(--color-accent)] rounded-lg px-5 py-3 hover:bg-[var(--color-accent-hover)]">Load
                            More</button>
                    </div> -->
            </div>
        </section>

    </main>
    <nav id="menu-filter"
        class=" fixed top-0 left-0 w-screen h-screen z-[90] duration-300 opacity-0 pointer-events-none ">
        <div
            class="absolute bg-white h-full w-screen max-w-md shadow-xl z-50  -translate-x-full transition-transform duration-300 menu-wrapper">
            <div class="py-5 px-5 flex items-center justify-between border-b">
                <a href="/" class="inline-block max-w-[150px]">
                    <img src="./Content/Images/PickBazar.png" alt=""></a>
                <button title="Close" type="button"
                    class=" btnClose flex h-7 w-7 items-center justify-center align-middle rounded-full bg-gray-200  transition-all duration-200 hover:bg-[var(--color-accent)] hover:text-white focus:bg-[var(--color-accent)] focus:text-white focus:outline-0">
                    <svg
                        class="h-2.5 w-2.5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                        fill="currentColor">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd">
                        </path>
                    </svg></button>
            </div>
            <ul class="px-6 py-4 font-semibold w-full ">
                <asp:Repeater ID="categoriesMb" runat="server">
                    <ItemTemplate>
                        <li class="py-3">

                            <asp:HyperLink runat="server" CssClass="category_item flex items-center gap-3 hover:text-[var(--color-accent)] transition-colors" NavigateUrl='<%#"Index.aspx?category=" + Eval("id").ToString() %>'>
                                    <%# Eval("category_icon") %>
                                    <span><%# Eval("category_name") %></span>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>

                </asp:Repeater>
            </ul>
        </div>
        <div class=" fixed w-full h-screen top-0 left-0 z-40 overlay" style="background-color: rgba(0, 0, 0, 0.7);">
        </div>
    </nav>
    
    <script>
        document.querySelector('header.site-header').classList.remove('bg-white')
    </script>
    <style>
        #Categories svg, #menu-filter ul li svg {
            width: 1rem;
        }

        .category_item.active {
            color: var(--color-accent);
        }
    </style>
    <script>
        const categories = document.querySelectorAll(".category_item")
        categories.forEach(item => {
            if (item.href === location.href) {
                item.className = "category_item active flex items-center gap-3 hover:text-[var(--color-accent)] transition-colors";
            }

        })
    </script>
</asp:Content>
