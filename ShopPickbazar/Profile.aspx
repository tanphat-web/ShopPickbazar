<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ShopPickbazar.Profile" %>

<%@ Register Src="~/Controls/MenuProfile.ascx" TagPrefix="uc1" TagName="MenuProfile"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mb-5 lg:mb-0">
        <div
            class=" mx-auto flex w-full max-w-1920 flex-col items-start bg-gray-100 px-5 py-20 lg:flex-row xl:px-8 2xl:px-14 gap-5">
            <uc1:MenuProfile runat="server" id="MenuProfile" />
            <div class="w-full overflow-hidden px-1 pb-1">
                <div class="mb-8">
                    <div class="mb-8 flex">
                        <div class="p-5 md:p-8 bg-white shadow rounded w-full">
                            <div class="mb-8">
                                <section class="upload relative">

                                    <asp:FileUpload runat="server" ID="avatarFile" CssClass="absolute top-0 left-0 w-full h-full cursor-pointer opacity-0" />
                                    <div role="presentation" tabindex="0"
                                        class="border-dashed border-2 border-border-base h-36 rounded flex flex-col justify-center items-center cursor-pointer focus:border-accent-400 focus:outline-none">
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                            width="41px" height="30px" viewBox="0 0 40.909 30"
                                            class="text-muted-light">
                                            <g transform="translate(0 -73.091)">
                                                <path data-name="Path 2125"
                                                    d="M39.129,89.827A8.064,8.064,0,0,0,34.58,86.94,5.446,5.446,0,0,0,30,78.546a5.207,5.207,0,0,0-3.537,1.321,10.921,10.921,0,0,0-10.1-6.776,10.511,10.511,0,0,0-7.713,3.2A10.508,10.508,0,0,0,5.454,84q0,.277.043.916A9.528,9.528,0,0,0,0,93.546a9.193,9.193,0,0,0,2.8,6.743,9.191,9.191,0,0,0,6.744,2.8H32.728a8.172,8.172,0,0,0,6.4-13.264Zm-12.06-.575a.656.656,0,0,1-.479.2H21.818v7.5a.691.691,0,0,1-.681.681H17.045a.691.691,0,0,1-.682-.681v-7.5H11.59a.655.655,0,0,1-.681-.681.8.8,0,0,1,.213-.512L18.6,80.783a.722.722,0,0,1,.98,0l7.5,7.5a.663.663,0,0,1,.191.49A.656.656,0,0,1,27.07,89.252Z"
                                                    transform="translate(0)" fill="#e6e6e6">
                                                </path>
                                            </g>
                                        </svg>
                                        <p class="mt-4 text-sm text-center text-body">
                                            <span
                                                class="font-semibold text-accent">Cập nhật hình ảnh </span><span
                                                    class="text-xs text-body">PNG, JPG</span>
                                        </p>
                                    </div>
                                    <aside class="flex flex-wrap mt-2">
                                        <div
                                            class="relative inline-flex flex-col mt-2 overflow-hidden border rounded border-border-100 ltr:mr-2 rtl:ml-2">
                                            <div
                                                class="flex items-center justify-center w-16 h-16 min-w-0 overflow-hidden">
                                                <asp:Image ID="avatar" runat="server" />

                                            </div>
                                        </div>
                                    </aside>
                                </section>
                            </div>
                            <div class="mb-6 flex flex-row">
                                <div class="flex-1">
                                    <label for="name"
                                        class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                        Tên
                                                đầy đủ</label>
                                    <asp:TextBox runat="server" ID="fullName" CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12" />
                                </div>

                            </div>
                            <div class="mb-6 flex flex-row">
                                <div class="flex-1">
                                    <label for="email"
                                        class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                        Email</label>
                                    <asp:TextBox runat="server" ID="email" TextMode="Email" CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12" />
                                </div>
                            </div>
                            <div class="mb-6 flex flex-row">
                                <div class="flex-1">
                                    <label for="email"
                                        class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                        Số
                                                điện thoại</label>
                                    <asp:TextBox runat="server" ID="phone" CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12" />
                                </div>
                            </div>
                            <div class="mb-6 flex flex-row">
                                <div class="flex-1">
                                    <label for="email"
                                        class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                        Địa
                                                chỉ</label>
                                    <asp:TextBox runat="server" ID="address" CssClass="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12" />
                                </div>
                            </div>
                            <div class="flex">
                                <asp:Button runat="server" ID="ButtonUpdateProfile" CssClass="inline-flex items-center justify-center shrink-0 font-semibold leading-none rounded outline-none transition duration-300 ease-in-out focus:outline-0 focus:shadow focus:ring-1 focus:ring-accent-700 bg-accent text-white border border-transparent hover:bg-accent-hover px-5 py-0 h-12 ltr:ml-auto rtl:mr-auto" Text="Cập nhật" OnClick="ButtonUpdateProfile_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>
    
</asp:Content>
