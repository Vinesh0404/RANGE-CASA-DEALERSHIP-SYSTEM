<%@ Page Title="Add Category" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="addcategory.aspx.cs" Inherits="admin_addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid" >
        <div class="row">
            <%-- Left side --%>
            <div class="col-md-10" style="margin-left:100px; ">
                <div class="contact"

                    <div class="row">

                        <div class="col-12">
                            <div class="php-email-form">

                                <div class="form-group">
                                    <div class="section-title">
                                        <h2 style="font-weight: bold;">Add Category</h2>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-12 form-group">
                                        <label>Category</label>
                                        <asp:TextBox ID="txtcategory" CssClass="form-control" placeholder="Category Name" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="rfvCateg" runat="server" ControlToValidate="txtcategory"
                                            ErrorMessage="Enter the Category Name." Display="Dynamic" ForeColor="Red">
 </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="btnaddcategory" runat="server" CssClass="btn btn-primary" Text="Add Category" OnClick="btnaddcategory_Click" />
                                    <asp:Button ID="btncategoryupdate" runat="server" CssClass="btn btn-primary" Text="Update Category" Visible="False" OnClick="btncategoryupdate_Click" />
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

            <%-- Right side --%>
            <div class="col-md-10 mt-3" style="margin-left:100px " >
                <div class="contact">

                    <div class="row">

                        <div class="col-12" >
                            <div class="php-email-form">
                                <asp:HiddenField ID="hfid" runat="server" />
                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Category Details</h2>
                                    </div>
                                </div>
                                <%-- details --%>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="dgv" class="table table-bordered" runat="server" OnPageIndexChanging="dgv_PageIndexChanging" OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="c_id" PageSize="5">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("c_id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Category Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblproductname" runat="server" Text='<%#Eval("category_name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <i class="fa fa-edit"></i>
                                                        <asp:LinkButton ID="Edit" runat="server" Text="Edit" CommandName="Update" ToolTip="Update" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <i class="fa fa-trash"></i>
                                                        <asp:LinkButton ID="Delete" runat="server" Text="Delete" OnClick="dgv_RowDeleting"
                                                            CommandName="Delete" ToolTip="Delete" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
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

