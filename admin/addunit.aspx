<%@ Page Title="Admin" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="addunit.aspx.cs" Inherits="admin_addunit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid" style="background-color: black;">
        <div class="row">
            <%-- Left side --%>
            <div class="col-md-12" style="background-color: white;">
                <div class="contact">
                    <div id="contact" class="contact">

                        <div class="col-12">
                            <div class="php-email-form">

                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Add Unit</h2>
                                    </div>
                                </div>

                                <div class="col-md-12 form-group">
                                    <label>Unit Name</label>
                                    <asp:TextBox ID="txtunitname" CssClass="form-control" placeholder="Unit Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUnit" runat="server" ControlToValidate="txtunitname"
                                        ErrorMessage="Enter the Unit Name." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="bnaddunit" runat="server" CssClass="btn btn-primary" Text="Add Unit" OnClick="bnaddunit_Click" />
                                    <asp:Button ID="btnunitupdatte" runat="server" CssClass="btn btn-primary" Text="Update Unit" OnClick="btnunitupdatte_Click" Visible="False" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%-- Right side --%>
            <div class="col-md-12 mt-3">
                <div class="contact">

                    <div class="row">

                        <div class="col-12" style="background-color: white;">
                            <div class="php-email-form">
                                <asp:HiddenField ID="hfid" runat="server" />
                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Unit Details</h2>
                                    </div>
                                </div>
                                <%-- details --%>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="dgv" class="table table-bordered" runat="server" OnPageIndexChanging="dgv_PageIndexChanging" OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="u_id" PageSize="5">
                                            <columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("u_id") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Product Name">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblproductname" runat="server" Text='<%#Eval("unit_name") %>'></asp:Label>
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

