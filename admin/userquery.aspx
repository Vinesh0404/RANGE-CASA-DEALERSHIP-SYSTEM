<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="userquery.aspx.cs" Inherits="admin_userquery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top:100px; margin-bottom:200px;">
        <div class="form-group">
            <div class="text-center">
                <h2 style="font-weight: bold;" >User Query</h2>
            </div>
        </div>
        <%-- details --%>
        <div class="row" >
            <div class="col-lg-12" style="background-color:white;">
                <asp:GridView ID="dgv" class="table table-bordered" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblproductname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblsaleprice" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Subject">
                            <ItemTemplate>
                                <asp:Label ID="lblcategory" runat="server" Text='<%#Eval("subject") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Message">
                            <ItemTemplate>
                                <asp:Label ID="lbldescription" runat="server" Text='<%#Eval("message") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

