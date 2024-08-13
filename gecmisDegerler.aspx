<%@ Page Title="" Language="C#" MasterPageFile="~/temel.Master" AutoEventWireup="true" CodeBehind="gecmisDegerler.aspx.cs" Inherits="elektronik_saglik_platformu_web_doktor.gecmisDegerler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .sonuclarCard {
            display: flex;
            flex-direction: row;
            margin-top: 30px;
            background-color: #48CB8E;
            margin-left: 40px;
            height: 80px;
            border-radius: 8px;
            margin-right: 40px;
        }

        .resimGecmisDegerler {
            width: 50px;
            height: 50px;
            margin-top: 15px;
            margin-left: 20px;
        }

        .yazi {
            display: grid;
            align-items: center;
            font-size: 25px;
            margin-right: 10px;
            margin-left: 20px;
            font-weight: bold;
            color: white;
            font-family: sans-serif;
        }

        .sonuclarKonteyner {
            display: grid;
            align-items: center;
            margin-left: 70px;
            margin-right: 20px;
        }

        .sonuclar {
            background-color: #FFA83F;
            border-color: #FFA83F;
            border-style: outset;
            padding: 6px;
            border-radius: 8px;
        }

        .sonuclarYazi {
            text-decoration: none;
            font-weight: bold;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    GEÇMİŞ DEĞERLER
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="sonuclarCard" style="margin-top: 50px">
        <img src="fotograflar/thermometer_gecmis_degerler.png" class="resimGecmisDegerler"/>
        <p class="yazi" style="width: 283px">
            ATEŞ SONUÇLARI
        </p>
        <div class="sonuclarKonteyner">
            <div class="sonuclar">
                <a href="atesGrafikSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        GRAFİK SONUÇLARI    
                    </p>
                </a>
            </div>
            <div class="sonuclar">
                <a href="atesListeSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        LİSTE SONUÇLARI    
                    </p>
                </a>
            </div>
        </div>
    </div>
    <div class="sonuclarCard">
        <img src="fotograflar/blood-pressure.png" class="resimGecmisDegerler"/>
        <p class="yazi" style="width: 283px">
            TANSİYON SONUÇLARI
        </p>
        <div class="sonuclarKonteyner">
            <div class="sonuclar">
                <a href="tansiyonGrafikSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        GRAFİK SONUÇLARI    
                    </p>
                </a>
            </div>
            <div class="sonuclar">
                <a href="tansiyonListeSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        LİSTE SONUÇLARI    
                    </p>
                </a>
            </div>
        </div>
    </div>
    <div class="sonuclarCard">
        <img src="fotograflar/measurement.png" class="resimGecmisDegerler"/>
        <p class="yazi" style="width: 283px">
            SPO2 SONUÇLARI
        </p>
        <div class="sonuclarKonteyner">
            <div class="sonuclar">
                <a href="spo2GrafikSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        GRAFİK SONUÇLARI    
                    </p>
                </a>
            </div>
            <div class="sonuclar">
                <a href="spo2ListeSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        LİSTE SONUÇLARI    
                    </p>
                </a>
            </div>
        </div>
    </div>
    <div class="sonuclarCard">
        <img src="fotograflar/respiratory-system.png" class="resimGecmisDegerler"/>
        <p class="yazi" style="width: 283px">
            SOLUNUM SONUÇLARI
        </p>
        <div class="sonuclarKonteyner">
            <div class="sonuclar">
                <a href="solunumGrafikSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        GRAFİK SONUÇLARI    
                    </p>
                </a>
            </div>
            <div class="sonuclar">
                <a href="solunumListeSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        LİSTE SONUÇLARI    
                    </p>
                </a>
            </div>
        </div>
    </div>
    <div class="sonuclarCard">
        <img src="fotograflar/bar-chart.png" class="resimGecmisDegerler"/>
        <p class="yazi" style="width: 283px">
            BÜTÜN SONUÇLAR
        </p>
        <div class="sonuclarKonteyner">
            <div class="sonuclar">
                <a href="butunGrafikSonuclari.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        GRAFİK SONUÇLARI    
                    </p>
                </a>
            </div>
            <%--<div class="sonuclar">
                <a href="butunSonuclarListe.aspx" class="sonuclarYazi">
                    <p class="yazi" style="font-size: 15px">
                        LİSTE SONUÇLARI    
                    </p>
                </a>
            </div>--%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <a href="anasayfa.aspx" class="auto-style18">
    <%-- buton özelliğinin eklenebilmesi için eklenmiştir --%>
        <div class="auto-style19" style="margin-bottom: 0">
            <p class="auto-style17">
                ANASAYFAYA DÖN    
    <i class="fa-solid fa-house" style="color: #FFFFFF; margin-left: 122px"></i>
            </p>
        </div>
    </a>
</asp:Content>
