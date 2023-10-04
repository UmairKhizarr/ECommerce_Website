<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addCategory.aspx.cs" Inherits="addCategory" %>

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
                <label runat="server" for="txtaddCat" class="form-label">Add Category</label>
                <asp:TextBox runat="server" ID="txtaddCat" CssClass="form-control"></asp:TextBox>

                <asp:Button runat="server" Text="Add" CssClass="btn btn-primary mt-2" OnClick="Unnamed_Click"/>
            </div>
            <div class="col-md-4"></div>

        </div>
</asp:Content>

