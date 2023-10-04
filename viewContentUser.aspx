<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel.master" AutoEventWireup="true" CodeFile="viewContentUser.aspx.cs" Inherits="viewContentUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <%--<link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet"/>--%> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <asp:DropDownList runat="server" ID="ddl" CssClass="form-control mb-5 mt-3" AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-2"></div>
        <%--  <div class="col-md-2">
            <asp:LinkButton runat="server" ID="btnViewCart" Text="View Cart" OnClick="btnViewCart_Click" CssClass="btn btn-primary mb-5 mt-3 pl-4 pr-4"></asp:LinkButton>
        </div>--%>
    </div>
    <div class="row">
        <div class="col-md-2 mx-4">
            <%--Show Brands in SideBar--%>
            <asp:GridView runat="server" AutoGenerateColumns="false" ID="GVB" OnRowCommand="GVB_RowCommand" CssClass="table table-bordered">
                <Columns>
                    <asp:TemplateField HeaderText="Brands">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="LB" Text='<%# Eval("brandName") %>' CssClass="nav-link" CommandName="brand" CommandArgument='<%# Eval("brandID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <%--Show Products--%>
        <div class="col-md-8">
            <%--<div class="row">--%>
                <%--<div class="col-md-4">--%>
                    <asp:DataList runat="server" ID="DL" RepeatColumns="3" OnItemCommand="DL_ItemCommand">
                        <ItemTemplate>
                            <div class="card mb-4 mx-2" style="width: 18rem;">
                                <asp:ImageButton runat="server" ID="imgbtn" ImageUrl='<%# "img/" + Eval("productImage")%>' Width="286" Height="180" CssClass="card-img-top" CommandName="moreDetails" CommandArgument='<%# Eval("productID") %>' />
                                <asp:Label runat="server" CssClass="text-center card-title" Text='<%# Eval("productName") %>'></asp:Label>
                                <asp:Label runat="server" CssClass="text-center card-text" Text='<%# "Rs." + Eval("productPrice") %>'></asp:Label>
                                <%--<button runat="server" class="btn btn-warning text-center" co><i class="far fa-shopping-cart"></i> Add To Cart</button>--%>
                               <%--<i class="far fa-shopping-cart"></i>--%>
                                <asp:LinkButton Text="Add to cart" CssClass="btn btn-warning text-center" runat="server" CommandName="addToCart" CommandArgument='<%# Eval("productID")%>' />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        <%--</div>--%>
    <%--</div>--%>
</asp:Content>

