<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookInventryRecord.aspx.cs" Inherits="BookStoreEvent.BookInventryRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Inventory Record</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4 text-center">Book Inventory Record!</h2>
            <div class="row mb-4">
                <div class="col-3">
                     <a href="BookInventry.aspx" class="btn btn-success">Create</a>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary"
                        OnClick="btnSearch_Click" style="margin-left:112px;"/>
                </div>
                <div class="col-6">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                        placeholder="Search by Book Title or Author"></asp:TextBox>
                </div>
            </div>


        </div>
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <asp:GridView ID="gridview" runat="server" OnRowCommand="gridview_RowCommand" AutoGenerateColumns="false" CssClass="table table-bordered">
                        <Columns>
                            <asp:TemplateField HeaderText="InventryId">
                                <ItemTemplate>
                                    <%#Eval("Id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Book Title">
                                <ItemTemplate>
                                    <%#Eval("Title") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Author Name">
                                <ItemTemplate>
                                    <%#Eval("Author") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Publish Date">
                                <ItemTemplate>
                                    <%#Eval("PublishDate") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <%#Eval("Price") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Dele" CommandArgument='<%#Eval("Id") %>' CssClass="btn btn-danger btn-sm"></asp:Button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="edt" CommandArgument='<%#Eval("Id") %>' CssClass="btn btn-warning btn-sm"></asp:Button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
