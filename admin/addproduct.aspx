<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="addproduct.aspx.cs" Inherits="admin_addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Add Product</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <%-- Left side --%>
            <div class="col-md-12">
                <div class="contact">

                    <div class="row">

                        <div class="col-12">
                            <div class="php-email-form">
                                <asp:HiddenField ID="hfid" runat="server" />
                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Add Product</h2>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Product Name</label>
                                    <asp:TextBox ID="txtproductname" CssClass="form-control" placeholder="Product Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvProduct" runat="server" ControlToValidate="txtproductname"
                                        ErrorMessage="Enter the Product Name." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Select Unit Type</label>
                                    <asp:DropDownList ID="ddlunittype" CssClass="form-control" runat="server">
                                        <asp:ListItem>select</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>

                                <div class="form-group">
                                    <label>Sale Price</label>
                                    <asp:TextBox ID="txtsaleprice" CssClass="form-control" placeholder="Sale Price" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSale" runat="server" ControlToValidate="txtsaleprice"
                                        ErrorMessage="Enter the Sale Price." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label>Select Category</label>
                                    <asp:DropDownList ID="ddlcategory" CssClass="form-control" runat="server">
                                        <asp:ListItem>select</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <asp:TextBox ID="txtdescription" CssClass="form-control" placeholder="Description" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDescrip" runat="server" ControlToValidate="txtdescription"
                                        ErrorMessage="Enter the Description." Display="Dynamic" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label>Product Image</label>
                                    <asp:fileupload runat="server" ID="productimg"></asp:fileupload>
                                </div>

                                <div class="text-center">
                                    <asp:Button ID="btnaddproduct" runat="server" CssClass="btn btn-primary" Text="Add Product" OnClick="btnaddproduct_Click" />

                                    <asp:Button ID="btnupadteproduct" runat="server" CssClass="btn btn-primary" Text="Update Product" Visible="False" OnClick="btnupadteproduct_Click" />

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

                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Product Details</h2>
                                    </div>
                                </div>
                                <%-- details --%>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="dgv" class="table table-bordered" runat="server" OnPageIndexChanging="dgv_PageIndexChanging" OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="p_id" PageSize="5">
                                            <columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("p_id") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Product Name">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblproductname" runat="server" Text='<%#Eval("product_name") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Unit Type">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblunittype" runat="server" Text='<%#Eval("unit_name") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Unit Type ID" Visible="false">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblunitid" runat="server" Text='<%#Eval("unit_type") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Category ID" Visible="false">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblcatagoryid" runat="server" Text='<%#Eval("category") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sale price">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblsaleprice" runat="server" Text='<%#Eval("sale_price") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Category">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblcategory" runat="server" Text='<%#Eval("category_name") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description">
                                                    <itemtemplate>
                                                        <asp:Label ID="lbldescription" runat="server" Text='<%#Eval("description") %>'></asp:Label>
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

