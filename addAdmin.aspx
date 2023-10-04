<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addAdmin.aspx.cs" Inherits="addAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #Content2{
            margin-top:40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%--<form runat="server">--%>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <p>Welcome<%= Session["Name"] %></p>
                <div class="mb-3">
                    <label>Name</label>
                    <asp:TextBox runat="server" ID="Name" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email address</label>
                    <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="form-control"/>
                </div>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtPassword" />
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtCofirmPass" />
                </div>
                <%-- Validation Controls --%>
                <asp:CompareValidator runat="server" ControlToValidate="txtCofirmPass" ControlToCompare="txtPassword" SetFocusOnError="true" Text="*" ErrorMessage="Password didn't match." ForeColor="Red"></asp:CompareValidator>
                <asp:RegularExpressionValidator runat="server" SetFocusOnError="true" ControlToValidate="txtEmail" Text="*" ForeColor="Red" ErrorMessage="Invalid Email Address" ID="REVemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:ValidationSummary runat="server"/>
                 <div class="mb-3">
                    <label class="form-label" runat="server" id="lbltxt"></label>
                </div>                
                <asp:Button runat="server" ID="mAdminbtn" CssClass="btn btn-primary"  OnClick="mAdminbtn_Click" Text="Add Admin"/>  
                
            </div>
            <div class="col-md-4"></div>
        </div>       
    <%--</form>--%>
</asp:Content>

