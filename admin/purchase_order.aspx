<%@ Page Title="Admin | Purchase Order" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="purchase_order.aspx.cs" Inherits="admin_purchase_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="contact" class="contact">
        <div class="row">
        <div class="col-md-4">
            <div class="php-email-form">
                <div class=" col-md-12 form-group">
                    <label>Select Supplier</label>
                    <asp:DropDownList ID="ddlsupplier" runat="server" CssClass="form-control">
                       
                    </asp:DropDownList>
                </div>

                <div class=" col-md-12 form-group">
                    <label>Select Product</label>
                    <asp:DropDownList ID="dllproduct" runat="server" CssClass="form-control" OnSelectedIndexChanged="dllproduct_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-12 form-group">
                    <label>Quantity</label>
                    <asp:TextBox ID="txtqty" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtqty_TextChanged"></asp:TextBox>
                </div>

                <div class="col-md-12 form-group">
                    <label>Rate</label>
                    <asp:TextBox ID="txtrate" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="col-md-12 form-group">
                    <label>Total</label>
                    <asp:TextBox ID="txttotal" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="text-center">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="Button1_Click" />
                </div>
            </div>
        </div>


        <div class="col-md-7 offset-md-1">
            <asp:DataList ID="DataList1" runat="server" RepeatLayout="Table" OnItemCommand="dlCustomers_ItemCommand">
                <HeaderTemplate>
                    <table class="table">
                        <tr>
                            <th>
                                <b>Product Id</b>
                            </th>
                            <th>
                                <b>Product Name</b>
                            </th>

                            <th>
                                <b>Price</b>
                            </th>

                            <th>
                                <b>Quantity</b>
                            </th>

                            <th>
                                <b>Total</b>
                            </th>
                            

                            <th>
                                <b>CGST</b>
                            </th>

                            <th>
                                <b>SGST</b>
                            </th>

                            <th>
                                <b>Final Amount</b>
                            </th>

                            <th>
                                <b>Option</b>
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>

                    <tr>
                        <td><%# Eval("Product_ID") %> </td>
                        <td><%# Eval("Product_Name") %> </td>
                        <td><%# Eval("Product_Price") %> </td>
                        <td><%# Eval("Product_Quantity") %> </td>
                        <td><%# Eval("Total_Price") %> </td>
                        <td><%# Eval("CGST") %> </td>
                        <td><%# Eval("SGST") %> </td>
                        <td><%# Eval("Final") %> </td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" class="add-cart cart-check" runat="server" CommandArgument='<%# Eval("Product_ID")%>' CommandName="cart">Remove To Cart</asp:LinkButton></td>


                    </tr>


                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>

            <asp:Button ID="btnplaceorder" CssClass="btn btn-success btn-block" Visible="false" runat="server" Text="Place Order" OnClick="btnplaceorder_Click" />
        </div>
        </div>
    </div>

</asp:Content>

