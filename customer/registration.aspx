<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="customer_registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">

            <div class="col-md-6 offset-md-3" data-aos="fade-up" data-aos-delay="300">

                <div class="section-title">
                    <h2>Registration</h2>
                </div>

                <div class="php-email-form">
                    <div class="form-group">
                        <label>Name : </label>
                        <asp:TextBox ID="txtname" CssClass="form-control" placeholder="First Name Middle Name Last Name" runat="server" required>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtname"
                            ErrorMessage="Name is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>


                    <div class="form-group">
                        <label>Address :</label>
                        <asp:TextBox ID="txtaddress" CssClass="form-control" placeholder=" Enter Address" runat="server" TextMode="MultiLine" Rows="3" required></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtaddress"
                            ErrorMessage="Address is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Gender :</label>
                        <asp:DropDownList ID="ddlgender" CssClass="form-control" runat="server" required>
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlgender"
                            ErrorMessage="Please select a gender." InitialValue="" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Email :</label>
                        <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="Enter Email" runat="server" required></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail"
                            ErrorMessage="Email is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtemail"
                            ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label>Mobile Number :</label>
                        <asp:TextBox ID="txtmobile" CssClass="form-control" placeholder="Enter Mobile Number" runat="server" required></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtmobile"
                            ErrorMessage="Mobile number is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Password :</label>
                        <asp:TextBox ID="txtpass" CssClass="form-control" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpass"
                            ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">
                        <label>Confirm Password :</label>
                        <asp:TextBox ID="txtcpass" CssClass="form-control" placeholder="Confirm Password" runat="server" TextMode="Password" required></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtcpass"
                            ErrorMessage="Confirm password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToValidate="txtcpass"
                            ControlToCompare="txtpass" ErrorMessage="Passwords do not match." Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    </div>

                    <div class="text-center">
                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-info" Text="Submit" OnClick="btnsubmit_Click" />
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

