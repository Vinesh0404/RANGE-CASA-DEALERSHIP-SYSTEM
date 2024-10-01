<%@ Page Title="Add Warehouse" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="addwarehouse.aspx.cs" Inherits="admin_addwarehouse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="row">
            <%-- Left side --%>
            <div class="col-md-12">
                <div class="contact">
                    <div class="container">


                        <div class="col-12">
                            <div class="php-email-form">
                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Add New Warehouse</h2>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-12 form-group">
                                        <label>Warehouse Name</label>
                                        <asp:TextBox ID="txtwarehousename" CssClass="form-control" placeholder="Warehouse Name" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvwarehouse" runat="server" ControlToValidate="txtwarehousename"
                                            ErrorMessage="Warehouse name is required." Display="Dynamic" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="btnaddwarehouse" runat="server" CssClass="btn btn-primary" Text="Add Warehouse" OnClick="btnaddwarehouse_Click" />
                                    <asp:Button ID="btnupdatewarehouse" runat="server" CssClass="btn btn-primary" Text="Update Warehouse" Visible="False" />
                                </div>
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
                                <asp:HiddenField ID="hfid" runat="server" />
                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Unit Details</h2>
                                    </div>
                                </div>
                                <%-- details --%>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="dgv" class="table table-bordered" runat="server" OnPageIndexChanging="dgv_PageIndexChanging" OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="w_id" PageSize="5">
                                            <columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("w_id") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Product Name">
                                                    <itemtemplate>
                                                        <asp:Label ID="txtwarehouse" runat="server" Text='<%#Eval("warehouse_name") %>'></asp:Label>
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

