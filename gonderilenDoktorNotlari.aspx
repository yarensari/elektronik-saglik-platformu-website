<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gonderilenDoktorNotlari.aspx.cs" Inherits="elektronik_saglik_platformu_web_doktor.gonderilenDoktorNotlari" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .container {
            display: flex;
            flex-direction: row;
            width: 730px;
            height: 600px;
            background-color: white;
            margin: 0 auto; 
            padding: 20px;
            box-sizing: border-box;
            overflow-y: scroll;
        }

        #ContentPlaceHolder2_DataContainer {
            width: 100%;
        }

        .mesajlarCard {
            margin-top: 15px;
            background-color: #48CB8E;
            margin-left: 10px;
            border-radius: 8px;
            margin-right: 10px;
            padding-left: 8px;
            padding-top: 8px;
            height: 46px;
        }

        .date {
            background-color: #48CB8E;
            margin-left: 10px;
            border-radius: 8px;
            margin-right: 10px;
            padding-left: 8px;
            display: flex;
            justify-content: flex-end;
        }

        .mesajiDuzenle {
            background-color: #48CB8E;
            border-color: #48CB8E;
            border-style: outset;
            color: white;
            font-family: sans-serif;
            border-radius: 8px;
            float: right;
            margin-right: 10px;
            font-weight: bold;
            cursor: pointer;
            height: 26px;
            font-size: 15px;
            width: 85px;
        }

        .mesajiSil {
            background-color: #48CB8E;
            border-color: #48CB8E;
            border-style: outset;
            color: white;
            font-family: sans-serif;
            border-radius: 8px;
            float: right;
            margin-top: 5px;
            margin-right: 10px;
            font-weight: bold;
            cursor: pointer;
            height: 26px;
            font-size: 15px;
            width: 85px;
        }

        .mesajCard {
            background-color: #D8DCD6;
            text-align: center; /* Hücre içeriğini ortala */
            padding: 10px;
        }

        .table-row {
            background-color: #D8DCD6; /* AlternatingItemTemplate ve HeaderTemplate için arka plan rengi */
        }

        .sil-button {
            background-color: #FF5733;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 5px;
        }

        .sil-button:hover {
            background-color: #D84315;
        }

        .auto-style18 {
            text-decoration: none;
            font-weight: bold;
            color: black;
        }

        .auto-style18 div:hover {
            color: #FFFFFF;
        }

        .auto-style17 {
            margin: 0;
            padding: 4px;
            text-align: center;
            color: black;
            font-size: 16px;
            font-family: sans-serif;
            font-weight: bold;
        }

        .gonderilenler {
            text-align: center;
            font-size: bold;
            font-size: 26px;
            font-weight: bold;
            background-color: orange;
            text-align: center;
            padding: 8px;
            border-style: outset;
            border-size: 8px;
            border-radius: 8px;
            flex: none;
            display: flex;
            text-align: center;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }

        .anasayfa-container {
            background-color: #4CAF50; /* Kutu arka plan rengi */
            padding: 10px;
            border-radius: 8px;
            margin-top: 20px;
            text-align: center;
        }

        .anasayfa-container .auto-style18 {
            color: white;
        }

        .anasayfa-container .auto-style18 div:hover {
            color: #FFEB3B; /* Hover rengini sarı yaptım */
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="gonderilenler">
            GÖNDERİLEN NOTLAR
        </div>

        <div class="container">
            <asp:Repeater ID="Repeater1" runat="server" onitemcommand="Repeater1_ItemCommand">
                <HeaderTemplate>
                    <table border="1" width="700px" border-style="outset" align="center">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="table-row">
                        <td class="mesajCard">
                            <asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "message") %>'></asp:Label>
                        </td>
                        <td class="mesajCard">
                            <asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date") %>'></asp:Label>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton1" CommandName="kayitsil" runat="server" CssClass="sil-button">Sil</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="table-row">
                        <td class="mesajCard">
                            <asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "message") %>'></asp:Label>
                        </td>
                        <td class="mesajCard">
                            <asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date") %>'></asp:Label>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton2" CommandName="kayitsil" runat="server" CssClass="sil-button">Sil</asp:LinkButton>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <div class="anasayfa-container">
            <a href="anasayfa.aspx" class="auto-style18">
                <div class="auto-style52">
                    <p class="auto-style17">
                        ANASAYFAYA DÖN
                        <i class="fa-regular fa-envelope" style="color: #FFFFFF; margin-left: 122px"></i>
                    </p>
                </div>
            </a>
        </div>
    </form>
</body>
</html>
