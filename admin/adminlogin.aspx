<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="admin_adminlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin | Login</title>
    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/icofont/icofont.min.css" rel="stylesheet" />
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="../assets/vendor/venobox/venobox.css" rel="stylesheet" />
    <link href="../assets/vendor/aos/aos.css" rel="stylesheet" />
    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet" />
</head>
<body style="background-color: white;">
    <form id="form1" runat="server">
        <div>
            <section id="contact" class="contact">
                <div class="container">

                    <div class="section-title">
                        <h2 style="color: black">Admin Login</h2>
                    </div>

                    <div class="row">

                        <div class="col-lg-6 offset-lg-3">
                            <div class="php-email-form" style="background-color: lightblue; box-shadow: 20px;">

                                <div class="form-group">
                                    <label>Email ID</label>
                                    <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail"
                                        ErrorMessage="Email is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtemail"
                                        ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtpass" TextMode="Password" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpass"
                                        ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="text-center">
                                    <div class="row">
                                        <div class="col-lg-6 offset-lg-3">
                                            <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-info btn-block" Text="Login" Font-Bold="True" Font-Size="Large" OnClick="btnlogin_Click" />
                                        </div>
                                    </div>
                                </div>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/customer/index.aspx" runat="server"><<< Home</asp:HyperLink>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </div>
    </form>

    <!-- Vendor JS Files -->
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="../assets/vendor/php-email-form/validate.js"></script>
    <script src="../assets/vendor/jquery-sticky/jquery.sticky.js"></script>
    <script src="../assets/vendor/venobox/venobox.min.js"></script>
    <script src="../assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="../assets/vendor/counterup/counterup.min.js"></script>
    <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../assets/vendor/aos/aos.js"></script>

    <!-- Template Main JS File -->
    <script src="../assets/js/main.js"></script>

</body>
</html>
