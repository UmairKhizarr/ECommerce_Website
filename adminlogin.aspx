<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/AdminLoginStyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="form-container">
                <h1 class="text-muted">Admin Login</h1>
                <div class="">
                    <label for="exampleInputEmail1">Email address</label>
                    <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="input-field" />
                </div>
                <div class="">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="input-field" ID="txtPassword" />
                </div>
                <asp:Label runat="server" ID="lblTxt"></asp:Label>
                <br />
                <asp:Button runat="server" ID="btnAdminLogin" Text="Login" CssClass="btn btn-secondary" OnClick="btnAdminLogin_Click" />
            </div>
        </div>
    </form>
</body>
</html>
