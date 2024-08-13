<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="butunGrafikSonuclari.aspx.cs" Inherits="elektronik_saglik_platformu_web_doktor.butunGrafikSonuclari" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .container {
            /*width: 730px;*/
            /*height: 600px;*/
           /* width: 50%;
            height: 300px;*/
            background-color: white;
            /*margin: 0 auto;*/ 
            /*padding: 20px;*/
            box-sizing: border-box;
            /*overflow-y: scroll;*/
        }

        .box {
            width: 50%; 
            float: left; 
            box-sizing: border-box;
            padding: 10px; 
            /*margin-top: 10px;*/
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

        #myChart {
            /*width: 100% !important;*/
            /*height: 100% !important;*/
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
                    label: 'VÜCUT ISISI',
                    data: chartData.map(data => data.yEkseniAtes), 
                    backgroundColor: 'rgb(255, 0, 0)',
                    borderColor: 'rgb(255, 0, 0)',
                    borderWidth: 1,
                }, {
                    label: 'SYS',
                    data: chartData.map(data => data.yEkseniSys), 
                    backgroundColor: 'rgb(128, 255, 0)',
                    borderColor: 'rgb(128, 255, 0)',
                    borderWidth: 1,
                    }, {
                    label: 'DIA',
                    data: chartData.map(data => data.yEkseniDia),
                    backgroundColor: 'rgb(0, 0, 255)',
                    borderColor: 'rgb(0, 0, 255)',
                    borderWidth: 1,
                    }, {
                    label: 'SPO2',
                    data: chartData.map(data => data.yEkseniSpo2),
                    backgroundColor: 'rgb(255, 128, 0)',
                    borderColor: 'rgb(255, 128, 0)',
                    borderWidth: 1,
                    }, {
                    label: 'NABIZ',
                    data: chartData.map(data => data.yEkseniNabiz),
                    backgroundColor: 'rgb(0, 255, 255)',
                    borderColor: 'rgb(0, 255, 255)',
                    borderWidth: 1,
                    }, {
                    label: 'SOLUNUM',
                    data: chartData.map(data => data.yEkseniSolunum),
                    backgroundColor: 'rgb(204, 0, 204)',
                    borderColor: 'rgb(204, 0, 204)',
                    borderWidth: 1,
                    }]
            },
        });
    };
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <canvas id="myChart"></canvas>
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
             <div class="clear"></div>
            </div>
        </div>
    </form>
</body>
</html>
