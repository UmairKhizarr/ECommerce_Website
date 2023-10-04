<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel.master" AutoEventWireup="true" CodeFile="MoreDetails1.aspx.cs" Inherits="MoreDetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:DataList runat="server" ID="DL" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Image runat="server" ImageUrl='<%# "img/" +  Eval("productImage") %>' Width="200" Height="250" />
                        <asp:Label runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                        <asp:Label runat="server" Text='<%# Eval("productPrice") %>'></asp:Label>
                    </div>
                </div>

            </ItemTemplate>
        </asp:DataList>
        <div>
        </div>
</asp:Content>

