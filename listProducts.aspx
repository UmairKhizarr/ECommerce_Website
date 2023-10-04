<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="listProducts.aspx.cs" Inherits="listProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <asp:Button runat="server" ID="btnAddNewPro" Text="Add Product" OnClick="btnAddNewPro_Click"  CssClass="btn btn-primary mb-4"/>
           <asp:GridView runat="server" ID="GVP" AutoGenerateColumns="false" CssClass="table table-bordered"
                OnRowCommand="GVP_RowCommand" OnRowDeleting="GVP_RowDeleting" OnRowEditing="GVP_RowEditing">
                <Columns>
                    <asp:BoundField HeaderText="Product Name" DataField="productName" />
                    <asp:BoundField HeaderText="Price" DataField="productPrice" />
                    <asp:TemplateField HeaderText="Model No">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("productModel") %>'></asp:Label><br />
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Brand" DataField="brandName" />
                    <asp:BoundField HeaderText="Category" DataField="categoryName" />
                    <%--<asp:BoundField HeaderText="Image" DataField="productImage"/>--%>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image runat="server" ID="imgProduct" Width="80px" Height="70px" ImageUrl='<%# "img/" + Eval("productImage")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="btnEdit" Text="edit" CommandName="edit" CommandArgument='<%# Eval("productID") %>'
                                CssClass="btn btn-secondary"></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btndelete" Text="Delete" CommandName="delete" CommandArgument='<%# Eval("productID") %>'
                                CssClass="btn btn-danger" OnClientClick="return confirm('Are You sure you wanna delete?')"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
</asp:Content>

