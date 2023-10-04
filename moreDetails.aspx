<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moreDetails.aspx.cs" Inherits="moreDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
    </form>
</body>
</html>
