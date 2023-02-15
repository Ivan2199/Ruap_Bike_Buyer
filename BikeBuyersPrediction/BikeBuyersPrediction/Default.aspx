<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BikeBuyersPrediction.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bike Buyers Prediction</title>
<style>
        body {
          font-family: Arial;
          font-size: 16px;
          background-color: #f9f9f9; /* Postavljamo boju pozadine stranice */
        }
        h1 {
            text-align: center;
        }

        table {
          border-collapse: collapse;
          margin: 0 auto;
          width: 80%;
          table-layout: fixed;
          background-color: #fff;
          border: 1px solid #ddd;
          box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.2); /* Dodajemo senku */
          color: #333; /* Postavljamo boju teksta */
        }

        th,
        td {
          padding: 10px;
          border: 1px solid #ddd;
          word-wrap: break-word;
           text-align: center;
        }

        th {
          background-color: #4CAF50;
          color: #fff;
          text-align: left; /* Poravnavamo tekst u zaglavlju ulevo */
          font-weight: bold;
        }

        tr:nth-child(even) {
          background-color: #f2f2f2; /* Postavljamo pozadinu svakog drugog reda */
        }

        tr:hover {
          background-color: #ddd; /* Bojimo red preko koga se pređe mišem */
        }
        #lbPredict{
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }
        #lbPredict:hover{
            background-color: #3e8e41;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Enter neccesary data below</h1>
        </div>
        <table>
            <tr>
                <td>Id:</td>
                <td><asp:TextBox ID="txtId" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Marital Status:
                </td>
                <td>
                    <asp:RadioButtonList ID="rblMaritalStatus" runat="server">
                        <asp:ListItem>Married</asp:ListItem>
                        <asp:ListItem>Single</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <asp:RadioButtonList ID="rblGender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Income:</td>
                <td>
                    <asp:TextBox ID="txtIncome" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Children:</td>
                <td>
                    <asp:DropDownList ID="ddlChildren" runat="server">
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6+</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>Cars:</td>
                <td>
                    <asp:TextBox ID="txtCars" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Home Owner:</td>
                <td>
                    <asp:RadioButtonList ID="rblHomeOwner" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Commute Distance:</td>
                <td>
                    <asp:RadioButtonList ID="rblCommute" runat="server">
                        <asp:ListItem>0-1 Miles</asp:ListItem>
                        <asp:ListItem>1-2 Miles</asp:ListItem>
                        <asp:ListItem>2-5 Miles</asp:ListItem>
                        <asp:ListItem>5-10 Miles</asp:ListItem>
                        <asp:ListItem>10+ Miles</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Region:</td>
                <td>
                    <asp:RadioButtonList ID="rblRegion" runat="server">
                        <asp:ListItem>Europe</asp:ListItem>
                        <asp:ListItem>Pacific</asp:ListItem>
                        <asp:ListItem>North America</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Education:</td>
                <td>
                    <asp:RadioButtonList ID="rblEducation" runat="server">
                        <asp:ListItem>Partial High School</asp:ListItem>
                        <asp:ListItem>High School</asp:ListItem>
                        <asp:ListItem>Partial College</asp:ListItem>
                        <asp:ListItem>Bachelors</asp:ListItem>
                        <asp:ListItem>Graduate</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Occupation:</td>
                <td>
                    <asp:RadioButtonList ID="rblOccupation" runat="server">
                        <asp:ListItem>Skilled Manuel</asp:ListItem>
                        <asp:ListItem>Clerical</asp:ListItem>
                        <asp:ListItem>Managment</asp:ListItem>
                        <asp:ListItem>Professional</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Purchased Bike:</td>
                <td>
                    <asp:RadioButtonList ID="rblPurchased" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td><asp:LinkButton ID="lbPredict" runat="server" OnClick="lbPredict_Click">Predict</asp:LinkButton></td>
                <td> <asp:Label ID="lblResults" runat="server" Text="Predicted Value"></asp:Label>
                    </td>
            </tr>
        </table>
       
    </form>
</body>
</html>
