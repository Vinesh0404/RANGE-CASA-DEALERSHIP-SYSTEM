<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.master" AutoEventWireup="true" CodeFile="payment_interface.aspx.cs" Inherits="customer_payment_interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
    <div class="w-full px-4 py-2">
        <ul class="flex">
            <%--<li class="text-green-400 hover:border-b-2 border-green-400"><a href="#">Cash Payment</a></li>--%>
            <li class="text-green-400 hover:border-b-2 border-green-400"><a href="#">Credit / Debit Card Payment</a></li>
        </ul>
    </div>
    <div class="max-w-full px-4 py-2">
        <div class="mt-2">
            <p class="text-lg font-bold text-gray-600 pb-2">Name On Card:</p>
            <asp:TextBox runat="server" ID="name_on_debit_card" placeholder="Enter Card Name" class="form-control" ValidationGroup="debit_details"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Please Enter Your Card Name" ControlToValidate="name_on_debit_card" ValidationGroup="debit_details" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="mt-2">
            <p class="text-lg font-bold text-gray-600 pb-2">Card Number:</p>
            <asp:TextBox runat="server" ID="card_number" type="number" MinLength="16" MaxLength="16" placeholder="xxxx xxxx 1234" class="form-control" ValidationGroup="debit_details"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your Card Number" ControlToValidate="card_number" ValidationGroup="debit_details" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator runat="server" ErrorMessage="Enter a valid 16-digit card number" ControlToValidate="card_number" ForeColor="Red" MaximumValue="16" MinimumValue="16" Display="Dynamic"></asp:RangeValidator>
            
        </div>
        
        <div class="mt-2">
            <p class="text-lg font-bold text-gray-600 pb-2">Expiry Month:</p>
            <asp:DropDownList ID="debit_expiry_month" class="form-control" runat="server">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="mt-2">
            <p class="text-lg font-bold text-gray-600 pb-2">Expiry Year:</p>
            <asp:DropDownList ID="debit_expiry_year" class="form-control" runat="server">
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
                <asp:ListItem>2026</asp:ListItem>
                <asp:ListItem>2027</asp:ListItem>
                <asp:ListItem>2028</asp:ListItem>
                <asp:ListItem>2029</asp:ListItem>
                <asp:ListItem>2030</asp:ListItem>
                <asp:ListItem>2031</asp:ListItem>
                <asp:ListItem>2032</asp:ListItem>
                <asp:ListItem>2033</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="mt-2">
            <p class="text-lg font-bold text-gray-600 pb-2">CVV:</p>
            <asp:TextBox runat="server" ID="cvv_number" type="password" MinLength="3" MaxLength="3" placeholder="123" class="form-control" ValidationGroup="debit_details"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your CVV number" ControlToValidate="cvv_number" ValidationGroup="debit_details" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="mt-2">
            <asp:Button runat="server" style="background-color: #00BFFF;" class="btn btn-primary" type="button" Text="Confirm Payment" ValidationGroup="debit_details" OnClick="ConfirmPayment_Click" />
        </div>
    </div>
</asp:Content>

