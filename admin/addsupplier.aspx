<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="addsupplier.aspx.cs" Inherits="admin_addsupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="row">
            <%-- Left side --%>
            <div class="col-md-12">
                <div id="contact" class="contact">

                    <div class="col-12">
                        <div class="php-email-form">
                            <div class="form-group">
                                <div class="text-center">
                                    <h2 style="font-weight: bold;">Add Supplier</h2>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 form-group">
                                    <asp:HiddenField ID="hfid" runat="server" />
                                    <label>Supplier Name</label>
                                    <asp:TextBox ID="txtsuppliername" CssClass="form-control" placeholder="Supplier Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSupply" runat="server" ControlToValidate="txtsuppliername"
                                        ErrorMessage="Enter the Supplier Name." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail"
                                        ErrorMessage="Email is required." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtemail"
                                        ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-12 form-group">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtaddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtaddress"
                                        ErrorMessage="Address is required." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group">
                                    <label>Pin Code</label>
                                    <asp:TextBox ID="txtpincode" CssClass="form-control" placeholder="Pin Code" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPincode" runat="server" ControlToValidate="txtpincode"
                                        ErrorMessage="Pin Code is required." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group">
                                    <label>Mobile Number</label>
                                    <asp:TextBox ID="txtmobilenumber" CssClass="form-control" placeholder="Mobile Number" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtmobilenumber"
                                        ErrorMessage="Mobile Number is required." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="text-center">
                                <asp:Button ID="btnaddsupplier" runat="server" CssClass="btn btn-primary" Text="Add Supplier" OnClick="btnaddsupplier_Click" />

                                <asp:Button ID="btnupdatesupplier" runat="server" CssClass="btn btn-primary" Text="Update Supplier" Visible="False" OnClick="btnupdatesupplier_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Right side --%>
            <div class="col-md-12">
                <div class="contact">

                    <div class="row">

                        <div class="col-12">
                            <div class="php-email-form">

                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Supplier Details</h2>
                                    </div>
                                </div>
                                <%-- details --%>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="dgv" class="table table-bordered" runat="server" OnPageIndexChanging="dgv_PageIndexChanging" OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="s_id" PageSize="5">
                                            <columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("s_id") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Supplier Name">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblemail" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Address">
                                                    <itemtemplate>
                                                        <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Pin Code">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblpincode" runat="server" Text='<%#Eval("pin_code") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mobile No">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblmobileno" runat="server" Text='<%#Eval("mobile_no") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Edit">
                                                    <itemtemplate>
                                                        <i class="fa fa-edit"></i>
                                                        <asp:LinkButton ID="Edit" runat="server" Text="Edit" CommandName="Update" ToolTip="Update" />
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <itemtemplate>
                                                        <i class="fa fa-trash"></i>
                                                        <asp:LinkButton ID="Delete" runat="server" Text="Delete" OnClick="dgv_RowDeleting"
                                                            CommandName="Delete" ToolTip="Delete" />
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                            </columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>

