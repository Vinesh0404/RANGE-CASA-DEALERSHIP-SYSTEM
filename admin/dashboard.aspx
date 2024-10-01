<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Admin DashBoard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        /* width */
        ::-webkit-scrollbar {
            width: 12px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 2px #dcdcdc;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #dcdcdc;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #dcdcdc;
            }
    </style>
    <div style="background-color:rgb(244, 187, 68);">
    <div class="text-center">
        <span class="font-bold text-xl" style="color:black;">All Orders</span>
    </div>
    <div class="h-[34rem] overflow-y-scroll" style="width: 60%; margin: auto; background-color:rgb(244, 187, 68);">
        <asp:DataList runat="server" ID="allOrderDataList" style="width: 100%;">
            <ItemTemplate>
                <div class="mt-2">
                    <div
                        class="p-2 flex rounded-md max-w-6xl mx-auto border border-gray-500 shadow-md" style="background-color:white;">
                        <div class="w-44 mt-1 mx-3 rounded-lg border border-gray-500" ">
                            <img
                                class="p-2"
                                src="./productimg/<%# Eval("image_url") %>"
                                alt="img not found" />
                        </div>
                        <div class="w-full">
                            <div>
                                <span class="font-semibold text-lg">Product Name : </span>
                                <span class="text-lg"><%# Eval("product_name") %></span>
                            </div>
                            <div>
                                <span class="font-semibold text-lg">Quantity : </span>
                                <span class="text-lg"><%# Eval("quantity") %></span>
                            </div>
                            <div>
                                <span class="font-semibold text-lg">Total Price :</span>
                                <span class="text-lg">Rs. <%# Eval("total_price") %></span>
                                <span class="px-3 font-semibold">|</span>
                                <span class="font-semibold text-lg">Gst Amount :</span>
                                <span class="text-lg">Rs. <%# Eval("GST_amount") %></span>
                            </div>
                            <div>
                                <span class="font-semibold text-lg">Final Amount :</span>
                                <span class="text-lg">Rs. <%# Eval("final_amount") %></span>
                                <span class="px-3 font-semibold">|</span>
                                <span class="font-semibold text-lg">Order Date : </span>
                                <span class="text-lg"><%# Eval("order_date") %></span>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
        </div>
</asp:Content>

