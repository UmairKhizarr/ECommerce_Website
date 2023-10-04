<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="listBrands.aspx.cs" Inherits="listBrands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView runat="server" ID="GVB" OnRowCommand="GVB_RowCommand" OnRowDeleting="GVB_RowDeleting" OnRowEditing="GVB_RowEditing" AutoGenerateColumns="false" CssClass=" table table-bordered">
        <Columns>
            <asp:BoundField DataField="brandID" HeaderText="Brand ID"/>
            <asp:BoundField DataField="brandName" HeaderText="Brand Name"/>
            <asp:TemplateField HeaderText="Action">
               <ItemTemplate>
                   <asp:LinkButton runat="server" ID="edit" Text="edit" CommandName="edit" CommandArgument='<%# Eval("brandID") %>' CssClass="btn btn-secondary"></asp:LinkButton>
                   <asp:LinkButton runat="server" ID="delete" Text="delete" CommandName="delete" CommandArgument='<%# Eval("brandID") %>' OnClientClick="return confirm(Are You sure you wanna want to delete???)" CssClass="btn btn-danger"></asp:LinkButton>
               </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

