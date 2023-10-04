<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel.master" AutoEventWireup="true" CodeFile="addToCart.aspx.cs" Inherits="addToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row m-4">
        <div class="col-md-2">
            <asp:Label runat="server" ID="lbltxt"></asp:Label>
        </div>
        <div class="col-md-10">
            <asp:DataList runat="server" ID="DL" OnItemCommand="DL_ItemCommand">
                <%--<asp:DataList runat="server" ID="DV">--%>
                <ItemTemplate>
                    <div class="row mt-5">
                        <div class="col-md-5">
                            <asp:ImageButton runat="server" ID="imgbtn" ImageUrl='<%# "img/" + Eval("productImage")%>' Width="350" Height="220" />
                        </div>
                        <div class="col-md-5 mt-3" style="margin-left:100px">
                            <div class="row mt-5">
                                <asp:Label runat="server" Text='<%# "Product Name " + Eval("productName") %>' CssClass="form-label"></asp:Label>
                            </div>
                            <div class="row">
                                <asp:Label runat="server" Text='<%# "Price " + Eval("productPrice") + "/-" %>' CssClass="form-label"></asp:Label>
                            </div>
                            <div class="row">
                                <asp:Label runat="server" Text='<%# "Model No." + Eval("productModel") %>' CssClass="form-label"></asp:Label>
                            </div>
                            <div class="row">
                                <asp:Label runat="server" txt="lblcart" CssClass="form-label">Added to Cart Successfully</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:LinkButton runat="server" ID="btnCheckOut" Text="Proceed To Checkout" CssClass=" btn btn-primary form-label mt-5" OnClick="btnCheckOut_Click"></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:DataList>                
        </div>
    </div>
</asp:Content>

