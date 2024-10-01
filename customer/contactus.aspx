<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="customer_contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="contact" class="contact">
        <div class="container">

            <div class="section-title">
                <h2 div class="row border pt-5 bg-primary " style="color:aliceblue">Contact Us</h2>
            </div>

            <div class="row">

                <div class="col-lg-12" data-aos="fade-up" data-aos-delay="300">
                    <div class="php-email-form">
                        <div class="form-row">
                            <div class="col-lg-6 form-group">
                                <asp:TextBox ID="txtuname" CssClass="form-control" placeholder="Name" runat="server" required></asp:TextBox>
                            </div>
                            <div class="col-lg-6 form-group">
                                <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="Email" runat="server" required></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtsubject" CssClass="form-control" placeholder="Subject" runat="server" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtmessage" CssClass="form-control" runat="server" placeholder="Message" TextMode="MultiLine" required></asp:TextBox>
                        </div>

                        <div class="text-center roundedsm">
                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary " Text="SUBMIT" OnClick="btnsubmit_Click" />
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>
</asp:Content>

