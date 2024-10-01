<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="view_cart.aspx.cs" Inherits="customer_view_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" style="width: 100%; margin: auto;">
        <div class="col-md-12">
            <asp:DataList ID="DataList1" CssClass="table" runat="server" CellPadding="1" CellSpacing="1"
                DataKeyField="Product_ID"
                OnItemCommand="DataList1_ItemCommand">

                <HeaderTemplate>
                    <table class="w-100">

                        <tr>
                            <th><span>Image</span></th>
                            <th><span>Product Name</span></th>
                            <th><span>Description</span></th>

                            <th><span>Price</span></th>
                            <th><span>GST</span></th>

                            <th><span>Quantity</span></th>
                            <th><span>Remove</span></th>

                        </tr>
                </HeaderTemplate>

                <ItemTemplate>

                    <tr>
                        <td>
                            <img class="img-fluid" style="height: 10rem;" src="../<%# Eval("Image")%>" />
                        </td>
                        <td><span><%# Eval("Product_Name")%></span></td>
                        <td><span><%# Eval("Description")%></span></td>
                        <td><span><%# Eval("Product_Price", "₹{0}")%></span></td>
                        <td><span><%# Eval("GST", "₹{0}")%></span></td>
                        <td><span><span><%# Eval("Product_Quantity")%></span></td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" class="" runat="server" CommandArgument='<%# Eval("Product_ID")%>' CommandName="remove_cart">Remove To Cart</asp:LinkButton></td>
                    </tr>


                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
        </div>


        <div class="col-md-12">

            <div class="card-body">
                <div class="mt-3">
                    <asp:Button ID="btnorder" Visible="false" Style="background-color:  #00BFFF;" CssClass="btn btn-block btn-success" runat="server" Text="Order" OnClick="btnorder_Click" />
                </div>
            </div>

        </div>


    </div>
</asp:Content>

