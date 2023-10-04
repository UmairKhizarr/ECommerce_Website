<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label runat="server" ID="lbltxt"></asp:Label>
    <div class="row">
        <div class="col-md-6">
            <asp:DataList runat="server" ID="DV" OnItemCommand="DV_ItemCommand">
                <%--<asp:DataList runat="server" ID="DV">--%>
                <ItemTemplate>
                    <div class="row mt-5 mx-5">
                        <div class="col-md-8">
                            <asp:ImageButton runat="server" ID="imgbtn" ImageUrl='<%# "img/" + Eval("productImage")%>' Width="350" Height="220" />
                        </div>
                        <div class="col-md-4">
                            <div class="row mt-5">
                                <asp:Label runat="server" Text='<%# "Product Name " + Eval("productName") %>'></asp:Label>
                            </div>
                            <div class="row">
                                <asp:Label runat="server" Text='<%# "Rs." + Eval("productPrice") %>'></asp:Label>
                            </div>
                            <div class="row">
                                <asp:Label runat="server" Text='<%# "Product Model " + Eval("productModel") %>'></asp:Label>
                            </div>
                            <div class="row">
                                <asp:LinkButton runat="server" ID="delCart" Text="Delete Product" CssClass="btn btn-danger mt-3" CommandName="deleteCart" CommandArgument='<%# Eval("productID") %>'></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <%-- Product Summary Table SideBar --%>
        <div class="col-md-4 mx-5 align-items-center mt-5">
            <asp:Table runat="server" CssClass="text-md-center table">
                <asp:TableHeaderRow runat="server" CssClass="bg-dark text-white">
                    <asp:TableHeaderCell Text="Product Details" CssClass="thead-dark"></asp:TableHeaderCell>
                    <%--<asp:TableHeaderCell Text="Checkout button"></asp:TableHeaderCell>--%>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="ProductsNames"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="totalPri"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:LinkButton Text="Proceed to Checkout" ID="btnCheckOut" runat="server" CssClass="btn btn-warning" OnClick="btnCheckOut_Click"></asp:LinkButton>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>
</asp:Content>

