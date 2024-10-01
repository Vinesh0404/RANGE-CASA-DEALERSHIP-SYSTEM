<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="order_history.aspx.cs" Inherits="customer_order_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">

            <h2 style="font-weight: bold;" bg-color="primary">Order History</h2>

        </div>
        <%-- details --%>
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="dgv" class="table table-bordered" runat="server" OnPageIndexChanging="dgv_PageIndexChanging" OnRowUpdating="dgv_RowUpdating" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" PageSize="10">
                    <Columns>

                        <asp:TemplateField HeaderText="Details">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-md-3">
                                        <img class="img-fluid" style="height: 10rem; width: 100%; border-radius: 0.5rem;" src="../admin/productimg/<%# Eval("image_url") %>" alt="">
                                    </div>
                                    <div class="col-md-7">
                                        <asp:Label ID="lblid" Visible="false" runat="server" Text='<%#Eval("id") %>'></asp:Label>

                                        <h4>Product Name :
                                                        <asp:Label ID="lblname" CssClass="text-right" runat="server" Text='<%#Eval("product_name") %>'></asp:Label></h4>

                                        <h5>Quantity :
                                                <asp:Label ID="lblquantity" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                                        </h5>

                                        <h5>Total Price :
                                                <asp:Label ID="lblprice" runat="server" Text='<%#Eval("total_price","Rs. {0}") %>'></asp:Label>
                                            &nbsp&nbsp|&nbsp&nbsp
                                                        GST Amount :
                                                <asp:Label ID="lblgst" runat="server" Text='<%#Eval("GST_amount","Rs. {0}") %>'></asp:Label>
                                        </h5>


                                        <h6>
                                            <b>Final Amount :</b>
                                            <asp:Label ID="lblfamount" runat="server" Text='<%#Eval("final_amount","Rs. {0}") %>'></asp:Label>
                                            &nbsp&nbsp|&nbsp&nbsp
                                                        Order Date :
                                                <asp:Label ID="lbldate" runat="server" Text='<%#Eval("order_date") %>'></asp:Label>
                                        </h6>


                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Order Status">
                            <ItemTemplate>
                                <div class="col-md-2">
                                    <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <i class="fa fa-edit"></i>
                                <asp:LinkButton ID="Edit" CssClass="btn btn-info" runat="server" Text="Cancel Order" CommandName="Update" ToolTip="Update" Enabled='<%#Eval("Status").ToString()=="Order Placed"?true:false %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

