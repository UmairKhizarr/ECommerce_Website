<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Rubik+Marker+Hatch&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">         
  
     <div class="form-box">
        <div class='button-box'>
            <div id='btn'></div>
            <%--<asp:Button  runat="server" ID="btnlogin" CssClass="toggle-btn" OnClick="btnlogin_Click" Text="Log In"/>--%>
            <button type='button' class='toggle-btn' runat="server" onserverclick="Unnamed_ServerClick">Log In</button>
            <%--<asp:Button runat="server" OnClick="Unnamed_Click" Text="Register" CssClass="toggle-btn"/>--%>
            <button type='button' onclick='register()' class='toggle-btn'>Register</button>
        </div>
    </div>
   
    <div id='register' class='input-group-register'>
        <input type='text' class='input-field' placeholder='Name' required="required" />
        <input type='email' class='input-field' placeholder='Email Id' required="required" />
        <input type='password' class='input-field' placeholder='Enter Password' required="required" />
        <input type='password' class='input-field' placeholder='Confirm Password' required="required" />
        <input type='checkbox' class='check-box' /><span>I agree to the terms and conditions</span>
        <button type='submit' class='submit-btn'>Register</button>
    </div>
      

    <script src="js/script.js"></script>
</asp:Content>

