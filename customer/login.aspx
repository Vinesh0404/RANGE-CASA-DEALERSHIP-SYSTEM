<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="customer_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <section id="contact" class="contact">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 offset-lg-3" data-aos="fade-up" data-aos-delay="300">
                        <div class="php-email-form " style="background-color: #00BFFF aliceblue;">
                            <div class="section-title ">
                                <h2>User Login</h2>
                            </div>
                            <div class="form-group">
                                <label>Email ID</label>
                                <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="Enter Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail"
                                    ErrorMessage="Email is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtemail"
                                    ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">
                                </asp:RegularExpressionValidator>

                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <asp:TextBox ID="txtpass" type="password" CssClass="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpass"
                                    ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                                


                            </div>

                            <div class="text-center">
                                <div class="row">
                                    <div class="col-lg-6 offset-lg-3">
                                        <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-warning btn-block" Text="Login" Font-Bold="True" Font-Size="Large" OnClick="btnlogin_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>
    </div>
</asp:Content>

