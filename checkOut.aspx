<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel.master" AutoEventWireup="true" CodeFile="checkOut.aspx.cs" Inherits="checkOut1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-5 mx-5 mt-5">
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
                       <span>Total Price </span><asp:Label runat="server" ID="totalPri"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>

    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4 mt-3">
            <label for="txtFName" class="form-label">First Name</label>
            <asp:TextBox runat="server" ID="txtFName" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFName" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>

            <label for="txtLName" class="form-label">Last Name</label>
            <asp:TextBox runat="server" ID="txtLName" CssClass="form-control"></asp:TextBox>

            <label for="txtemail" class="form-label">Email Address</label>
            <asp:TextBox runat="server" ID="txtemail" CssClass="form-control"></asp:TextBox>

            <label for="txtmobile" class="form-label">Mobile No</label>
            <asp:TextBox runat="server" ID="txtmobile" CssClass="form-control"></asp:TextBox>

            <label for="SAddress" class="form-label">Shipping Address</label>
            <asp:TextBox runat="server" ID="SAddress" CssClass="form-control mb-2"></asp:TextBox>

            <asp:LinkButton runat="server" Text="Confirm Order" ID="btnConfirmOrder" CssClass="btn btn-primary" OnClick="btnConfirmOrder_Click"></asp:LinkButton>
        </div>
        <asp:Label runat="server" ID="lblConfirmOrder"></asp:Label>
    </div>
</asp:Content>

