<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="View_product.aspx.cs" Inherits="customer_View_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">


            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card mb-3 shadow" style="border-radius: 0.5rem;">
                            <div class="card-body">
                                <div class="card-body">
                                    <div class="card-img">
                                        <img class="img-fluid" style="height: 20rem; width: 100%;" src="../admin/productimg/<%# Eval("image_url") %>" alt="">
                                    </div>
                                </div>

                                <div class="row p-2">
                                    <span style="font-size: 18px; font-weight: bold"><%# Eval("product_name")%></span>

                                    <span class="ml-auto badge badge-primary" style="font-size: 18px; font-weight: bold; background-color:  #00BFFF;">₹<%# Eval("sale_price")%> </span>
                                </div>



                                <div class="">
                                    <span class="card-detail-badge"><%# Eval("description")%> </span>
                                </div>
                                <div class="card-body text-right">

                                    <asp:LinkButton ID="LinkButton1" Style="background-color:  #00BFFF;" class="btn btn-primary" CommandArgument='<%# Eval("p_id")%>' CommandName="add_cart" runat="server">Add to cart</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>




                </ItemTemplate>

            </asp:Repeater>
        </div>
    </div>
</asp:Content>

