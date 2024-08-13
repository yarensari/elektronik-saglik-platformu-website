<%@ Page Title="" Language="C#" MasterPageFile="~/temel.Master" AutoEventWireup="true" CodeBehind="solunumGrafikSonuclari.aspx.cs" Inherits="elektronik_saglik_platformu_web_doktor.solunumGrafikSonuclari" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .container {
        width: 730px;
        height: 600px;
        background-color: white;
        margin: 0 auto; 
        padding: 20px;
        box-sizing: border-box;
        overflow-y: scroll;
    }

    .box {
        width: 50%; 
        float: left; 
        box-sizing: border-box;
        padding: 10px; 
        margin-top: 10px;
        display: grid;
        place-items: center;
        background-color: #E0F6EC;
        border-radius: 16px;
    }

    .clear {
        clear: both;
    }

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

    .secim {
        width: 160px;
        height: 40px;
        border-radius: 16px;
        font-size: 14px;
        font-family: sans-serif;
        border-style: outset;
        border-color: #48CB8E;
        background: #48CB8E;
        border-width: 3px;
        color: white;
    }

    .geriDonContainer {
        background-color: red;
        width: 140px;
        text-align: center;
        line-height: 35px;
        border-radius: 16px;
        font-size: 14px;
        font-family: sans-serif;
        border-style: outset;
        border-color: #48CB8E;
        background: #48CB8E;
        border-width: 3px;
    }

    .geriDon {
        text-decoration: none;
        font-weight: bold;
        margin-right: 20px;
        color: white;

    }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        window.onload = function () {
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: chartData.map(data => data.xEkseni),
                    datasets: [{
                        label: 'Solunum',
                        data: chartData.map(data => data.yEkseni),
                        backgroundColor: 'rgb(72, 203, 142)',
                        borderColor: 'rgb(72, 203, 142)',
                        borderWidth: 1
                    }]
                },
            });
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    GRAFİK SONUÇLARI
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <div class="box">
             <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="secim">
                 <asp:ListItem Text="BÜTÜN DEĞERLER" Value="butunDegerler" />
                 <asp:ListItem Text="1 HAFTA" Value="hafta1" />
                 <asp:ListItem Text="2 HAFTA" Value="hafta2" />
                 <asp:ListItem Text="3 HAFTA" Value="hafta3" />
                 <asp:ListItem Text="1 AY" Value="ay1" />
            </asp:DropDownList>
        </div>
        <div class="box">
            <div class="geriDonContainer">
                <a href="gecmisDegerler.aspx" class="geriDon">GERİ DÖN</a>
                <i class="fa-solid fa-arrow-left" style="color: white"></i>
            </div>
        </div>
        <div>
            <canvas id="myChart" width="400" height="400"></canvas>
        </div>
        <div class="clear"></div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <a href="gecmisDegerler.aspx" class="auto-style18">
        <div class="auto-style19" style="margin-bottom: 0">
            <p class="auto-style17">
                GEÇMİŞ DEĞERLERE DÖN    
    <i class="fa-solid fa-house" style="color: #FFFFFF; margin-left: 122px"></i>
            </p>
        </div>
    </a>
</asp:Content>
