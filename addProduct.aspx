<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addProduct.aspx.cs" Inherits="addProduct" %>

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
                        <label for="proName" class="form-label">Product Name</label>
                        <asp:TextBox runat="server" ID="proName" CssClass="form-control"></asp:TextBox>

                        <label for="ModelNo" class="form-label">Model No</label>
                        <asp:TextBox runat="server" ID="ModelNo" CssClass="form-control"></asp:TextBox>

                        <label for="proPrice" class="form-label">Product Price</label>
                        <asp:TextBox runat="server" ID="proPrice" CssClass="form-control"></asp:TextBox>

                        <label for="ddlCategory" class="form-label">Category</label>
                        <asp:DropDownList runat="server" ID="ddl" CssClass="form-select mb-3"></asp:DropDownList>

                        <label for="ddlBrand" class="form-label">Select Brand</label>
                        <asp:DropDownList runat="server" ID="ddlBrand" CssClass="form-select"></asp:DropDownList>

                        <label for="img" class="form-label"></label>
                        <asp:Image runat="server" ID="img" Width="80px" Height="60px" />

                        <asp:FileUpload runat="server" ID="fileUpload" />
                        <label runat="server" id="lblTxt"></label>

                        <asp:Button runat="server" ID="btnAddPro" Text="Add" CssClass="btn btn-primary px-5" OnClick="btnAddPro_Click" />
                    </div>
                    <div class="col-md-4"></div>
                </div>
</asp:Content>

