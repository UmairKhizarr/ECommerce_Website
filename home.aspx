<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row mt-5">
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <h1 style="text-align: center">Home Page Here....</h1>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-2">
            <asp:Button runat="server" ID="btnLogout" Text="Logout" CssClass="btn btn-outline-danger ml-10" OnClick="btnLogout_Click" />

            </div>
        </div>
    </div>
</asp:Content>

