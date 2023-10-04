<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addBrand.aspx.cs" Inherits="addBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #Content2{
            margin-top:40px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <label for="txtBrand" class="form-label">Brand</label>
                <asp:TextBox runat="server" ID="txtBrand" CssClass="form-control"></asp:TextBox>
                <label runat="server" id="lbltxt"></label><br />
                <asp:Button runat="server" ID="btnbrand" CssClass="btn btn-primary  mt-2 px-4" Text="Add" OnClick="btnbrand_Click"/>
            </div>
            <div class="col-md-4"></div>
        </div>
</asp:Content>

