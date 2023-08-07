<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ShopPickbazar.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main style="padding:60px 0;">
        <div class="w-full bg-gray-100">
            <div class="mx-auto flex w-full max-w-7xl flex-col py-10 px-5 md:flex-row xl:py-14 xl:px-8 2xl:px-14 gap-6">
                <div class="order-2 w-full shrink-0 bg-white p-5 md:order-1 md:w-72 lg:w-96">
                    <div class="mb-8 flex w-full items-center justify-center overflow-hidden">
                        <img alt="Contact"
                            loading="lazy" width="299" height="232" decoding="async" data-nimg="1" class="h-auto w-full"
                            src="https://pickbazar-react.vercel.app/_next/static/media/contact-illustration.2f6adc05.svg"
                            style="color: transparent;">
                    </div>
                    <div class="mb-8 flex flex-col">
                        <span class="mb-3 font-semibold text-heading">Địa chỉ</span><span
                            class="text-sm text-body">44 Nguyễn Sỹ Sách, phường 15, Quận Tân Bình</span>
                    </div>
                    <div class="mb-8 flex flex-col">
                        <span class="mb-3 font-semibold text-heading">Số điện thoại</span><span
                            class="text-sm text-body">0339761703</span>
                    </div>
                    <div class="mb-5 flex flex-col">
                    </div>
                    <div class="mb-5 flex flex-col">
                        <div class="flex items-center justify-start"></div>
                    </div>
                </div>
                <div
                    class="order-1  w-full bg-white p-5 md:order-2 md:mb-0 md:p-8 ltr:md:ml-7 rtl:md:mr-7 ltr:lg:ml-9 rtl:lg:mr-9">
                    <h1 class="mb-7 font-body text-xl font-bold text-heading md:text-2xl">Hỏi đáp, Khiếu nại</h1>
                        <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                            <div>
                                <label for="name"
                                    class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                    Họ và Tên</label><asp:TextBox runat="server" 
                                        ID="txtName" 
                                        class="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12"
                                        autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"
                                        aria-invalid="false"/>
                            </div>
                            <div>
                                <label for="email"
                                    class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                    Email</label><asp:TextBox runat="server" 
                                        ID="txtEmail" TextMode="Email"
                                        class="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12"
                                        autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"
                                        aria-invalid="false"/>
                            </div>
                        </div>
                        <div class="my-6">
                            <label for="Chủ đề"
                                class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                Chủ đề</label><asp:TextBox runat="server"
                                    ID="txtSubject" 
                                    class="flex w-full appearance-none items-center px-4 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base rounded focus:border-accent h-12"
                                    autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"
                                    aria-invalid="true" />
                        </div>
                        <div class="my-6">
                            <label for="description"
                                class="mb-3 block text-sm font-semibold leading-none text-body-dark">
                                Description</label><asp:TextBox runat="server"
                                    ID="txtDescription" TextMode="MultiLine"
                                    class="flex w-full appearance-none items-center rounded px-4 py-3 text-sm text-heading transition duration-300 ease-in-out focus:outline-0 focus:ring-0 border border-border-base focus:border-accent"
                                    autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"
                                    rows="4"/>
                        </div>
                    <asp:Button runat="server" Text="Gửi" ID="BtnSendMail"   cssClass="cursor-pointer inline-flex items-center justify-center shrink-0 font-semibold leading-none rounded outline-none transition duration-300 ease-in-out focus:outline-0 focus:shadow focus:ring-1 focus:ring-[var(--color-accent-hover)] bg-accent text-white border border-transparent hover:bg-[var(--color-accent-hover)] px-5 py-0 h-12" />
                </div>
            </div>
        </div>
    </main>
    <style>
        #product-cart {
            opacity:0 !important;
            pointer-events:none !important;
        }
    </style>
</asp:Content>
