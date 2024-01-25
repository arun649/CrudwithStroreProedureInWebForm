<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookInventry.aspx.cs" Inherits="BookStoreEvent.BookInventry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Book Inventry</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <style>
     body {
         background-color: #f8f9fa;
         padding: 20px;
     }

     .form-container {
         max-width: 600px;
         margin: auto;
         background-color: #ffffff;
         padding: 20px;
         border: 1px solid #dee2e6;
         border-radius: 5px;
         box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
     }

         .form-container h3 {
             color: #007bff;
         }

         .form-container label {
             font-weight: bold;
         }

         .form-container input[type="text"],
         .form-container input[type="date"] {
             width: 100%;
             padding: 8px;
             margin-bottom: 15px;
             box-sizing: border-box;
         }

         .form-container input[type="button"] {
             background-color: #007bff;
             color: #ffffff;
             padding: 10px 20px;
             border: none;
             border-radius: 5px;
             cursor: pointer;
         }
 </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h3>Book Inventory Record</h3>
            <div class="form-group">
                <label for="title">Book Title:</label>
                <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="title"
                    ErrorMessage="Please enter the Book Title." Display="Dynamic" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="author">Author Name:</label>
                <asp:TextBox ID="author" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ControlToValidate="author"
                    ErrorMessage="Please enter the Author Name." Display="Dynamic" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="date">Publish Date:</label>
                <asp:TextBox ID="date" runat="server" type="date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="date"
                    ErrorMessage="Please enter the Publish Date." Display="Dynamic" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <asp:TextBox ID="price" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="price"
                    ErrorMessage="Please enter the Price." Display="Dynamic" CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revPrice" runat="server" ControlToValidate="price"
                    ErrorMessage="Invalid Price. Please enter a numeric value." Display="Dynamic"
                    ValidationExpression="^\d*\.?\d*$" CssClass="text-danger" />
            </div>
            <asp:Button ID="Submit" Text="Save" runat="server" CssClass="btn btn-primary" OnClick="Submit_Click" />
            <div class="form-group mt-3 text-end">
                <a href="BookInventryRecord.aspx" class="btn btn-success">Back</a>
            </div>
        </div>

    </form>
</body>
</html>
