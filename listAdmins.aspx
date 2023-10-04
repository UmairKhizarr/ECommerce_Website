<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="listAdmins.aspx.cs" Inherits="listAdmins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="mb-4 ml-2 ms-5">
            <asp:Button runat="server" ID="addAdmin" Text="Add New Admin" CssClass="btn btn-primary" OnClick="addAdmin_Click" />
        </div>
        <div class="col-md-11">
            <div class="mb-3">
                <asp:GridView runat="server" ID="GV" CssClass="table table-bordered" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowEditing="GV_RowEditing" OnRowDeleting="GV_RowDeleting">
                    <%--OnRowDeleting="GV_RowDeleting" OnRowEditing="GV_RowEditing"--%>
                    <Columns>
                        <asp:BoundField DataField="adminName" HeaderText="Admin Name" />
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblemail" Text='<%# Eval("adminEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--  <asp:BoundField  DataField="Email" HeaderText="Email"/>--%>
                        <asp:BoundField DataField="adminPassword" HeaderText="Password" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="editbtn" Text="Edit" CommandName="edit" CommandArgument='<%#Eval("adminId") %>' CssClass="btn btn-secondary"></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="delbtn" Text="Delete" CommandName="delete" CommandArgument='<%#Eval("adminId")%>' CssClass="btn btn-danger" OnClientClick="return confirm('Are You sure you wanna want to delete it??')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#ContentPlaceHolder1_GV').DataTable();
        });
    </script>
</asp:Content>

