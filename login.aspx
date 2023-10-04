<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Rubik+Marker+Hatch&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id='login-form' class='login-page'>
        <div class="form-box">
            <div class='button-box'>
                <div id='btn'></div>
                <button type='button' onclick='login()' class='toggle-btn'>Log In</button>
                <button type="button" runat="server" onserverclick="Unnamed_ServerClick">Register</button>       
            </div>
            
            <div id='login' class='input-group-login'>
                <asp:TextBox runat="server" ID="txtUemail" TextMode="SingleLine" CssClass="input-field" required="required" Placeholder="Email Id"></asp:TextBox>
                <asp:TextBox runat="server" ID="txtUpass" TextMode="Password" CssClass="input-field" Placeholder="Enter Password"></asp:TextBox>
                <input type='checkbox' class='check-box' /><span>Remember Password</span>
                <asp:Label runat="server" ID="lblloginerror" CssClass="mb-3"></asp:Label>
                <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="submit-btn" OnClick="btnLogin_Click" />
            </div>
               
        </div>
    </div>
    <script src="js/script.js"></script>
</asp:Content>

