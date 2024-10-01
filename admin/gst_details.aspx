<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="gst_details.aspx.cs" Inherits="admin_gst_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="row">
            <%-- Left side --%>
            <div class="col-md-4">
                <div id="contact" class="contact">

                    <div class="row">

                        <div class="col-12">
                            <div class="php-email-form">
                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">Add GST Details</h2>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-12 form-group">
                                        <asp:HiddenField ID="hfid" runat="server" />
                                        <label>GST Code</label>
                                        <asp:TextBox ID="txtgstcode" CssClass="form-control" placeholder="GST Code" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvgstcode" runat="server" ControlToValidate="txtgstcode"
                                            ErrorMessage="GSTCode is required." Display="Dynamic" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <label>CGST</label>
                                        <asp:TextBox ID="txtcgst" CssClass="form-control" placeholder="CGST" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvcgst" runat="server" ControlToValidate="txtcgst"
                                            ErrorMessage="CGST is required." Display="Dynamic" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <label>SGST</label>
                                        <asp:TextBox ID="txtsgst" CssClass="form-control" placeholder="SGST" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvsgst" runat="server" ControlToValidate="txtsgst"
                                            ErrorMessage="SGST is required." Display="Dynamic" ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                </div>
                                <div class="text-center">
                                    <asp:Button ID="btnaddgstdetails" runat="server" CssClass="btn btn-primary" Text="Add GST Details" OnClick="btnaddgstdetails_Click" />

                                    <asp:Button ID="btnupdategstdetails" runat="server" CssClass="btn btn-primary" Text="Update GST Details" Visible="False" OnClick="btnupdategstdetails_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%-- Right side --%>
            <div class="col-md-8">
                <div class="contact">

                    <div class="row">

                        <div class="col-12" data-aos="fade-up" data-aos-delay="300">
                            <div class="php-email-form">

                                <div class="form-group">
                                    <div class="text-center">
                                        <h2 style="font-weight: bold;">GST Details</h2>
                                    </div>
                                </div>
                                <%-- details --%>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="dgv" class="table table-bordered" runat="server" OnPageIndexChanging="dgv_PageIndexChanging" OnRowUpdating="dgv_RowUpdating" OnRowDeleting="dgv_RowDeleting" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="g_id" PageSize="5">
                                            <columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("g_id") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="GST Code">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblgstcode" runat="server" Text='<%#Eval("gst_code") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CGST">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblcgst" runat="server" Text='<%#Eval("cgst") %>'></asp:Label>
                                                    </itemtemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SGST">
                                                    <itemtemplate>
                                                        <asp:Label ID="lblsgst" runat="server" Text='<%#Eval("sgst") %>'></asp:Label>
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

