<%@ Page Title="" Language="C#" MasterPageFile="~/temel.Master" AutoEventWireup="true" CodeBehind="ekgSonuclari.aspx.cs" Inherits="elektronik_saglik_platformu_web_doktor.ekgSonuclari" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridViewOzellikleri {
            width: 100%;
            text-align: center;
            font-size: 20px;
            overflow-x: auto;
            border: 1px solid #d6d6d6;
        }

        .gridViewOzellikleri tr:nth-child(odd) {
            background-color: #E0F6EC;
        }

        .gridViewOzellikleri tr:nth-child(even) {
            background-color: #F2F2F2; 
        }

        .container {
            width: 730px;
            height: 600px;
            background-color: white;
            margin: 0 auto; 
            padding: 20px;
            box-sizing: border-box;
            overflow-y: scroll;
        }

        .ekgButton {
            border-radius: 16px;
            border-width: 3px;
            background-color: #48CB8E;
            color: white;
            padding: 8px 16px;
            cursor: pointer;
            width: 150px;
            box-sizing: border-box;
            border-style: outset;
            border-color: #48CB8E
        }

        .hyperlink-style {
            color: black;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    EKG SONUÇLARI
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="margin-top: 30px;" class="container">
        <asp:ListView ID="ListView1" runat="server">

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                                   NavigateUrl='<%# "ekgDetay.aspx?id=" + Eval("id") %>' 
                                   CssClass="hyperlink-style">
                        <%# Eval("ekg_text") %>
                    </asp:HyperLink>
                    </td>
                    <td>
                        <%# Eval("timestamp") %>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>

                <table class="gridViewOzellikleri">
                    <thead>
                        <tr style="background-color: #48CB8E ">
                            <th style="color: white">EKG SONUÇLARI</th>
                            <th style="color: white">ÖLÇÜM TARİHİ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <a href="anasayfa.aspx" class="auto-style18">
<%-- buton özelliğinin eklenebilmesi için eklenmiştir --%>
    <div class="auto-style19" style="margin-bottom: 0">
        <p class="auto-style17">
            ANASAYFAYA DÖN   
        <i class="fa-solid fa-chart-simple" style="color: #FFFFFF"></i>
        </p>
    </div>
</a>
</asp:Content>
