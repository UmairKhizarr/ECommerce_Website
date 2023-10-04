<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="listCategories.aspx.cs" Inherits="listCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView runat="server" ID="GV" OnRowEditing="GV_RowEditing" OnRowCommand="GV_RowCommand" OnRowDeleting="GV_RowDeleting" AutoGenerateColumns="false" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="categoryID" HeaderText="Category ID"/>
            <asp:BoundField DataField="categoryName" HeaderText="Category Name"/>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="edit" CommandName="edit" CommandArgument='<%# Eval("categoryID")%>' CssClass="btn btn-secondary" Text="edit"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="delete" CommandName="delete" CommandArgument='<%# Eval("categoryID") %>' CssClass="btn btn-danger" Text="delete" OnClientClick="return confirm('Are You sure you wanna want to delete?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>