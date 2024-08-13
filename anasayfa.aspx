<%@ Page Title="" Language="C#" MasterPageFile="~/temel.Master" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="elektronik_saglik_platformu_web_doktor.anasayfa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style24 {
            display: flex;
            flex-direction: column;
        }

        /* üst kısım grid*/
        .auto-style25 {
            display: grid;
            grid-template-columns: max-content max-content;
            grid-template-areas: "auto-style26 auto-style27";
            grid-gap: 100px;
            margin-left: 30px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .resim {
            width: 150px;
            height: 150px;
            margin-right: 20px;
        }

        /* PRbpm */
        .auto-style26 {
            grid-area: auto-style26;
            display: flex;
            flex-direction: row;
            margin-top: 33px;
        }

        /* vücut ısısı*/
        .auto-style27 {
            grid-area: auto-style27;
            display: flex;
            flex-direction: row;
            margin-top: 38px;
        }

        /* PRbpm yazı */
        .auto-style28 {
            margin: 0;
            font-weight: bold;
            font-size: 35px;
            font-family: sans-serif;
        }

        /* prbpmsonVeri */
        .auto-style29 {
            display: flex;
            justify-content: flex-end;
            font-weight: bold;
            font-size: 50px;
            margin: 0;
            font-family: sans-serif;
        }


        .auto-style30 {
            font-size: 25px;
            margin: 0;
            font-weight: bold;
            text-align: right;
            font-family: sans-serif;
        }

        /* vücutIsisiSonveri */
        .auto-style31 {
            margin: 0;
            font-size: 50px;
            font-weight: bold;
            font-family: sans-serif;
        }

        /* santigrat */
        .auto-style32 {
            font-size: 25px;
            font-weight: bold;
            margin: auto auto 6px auto;
            font-family: sans-serif;
        }


        .auto-style34 {
            display: grid;
            grid-template-rows: max-content max-content max-content;
            grid-template-areas: "auto-style35 auto-style36 auto-style37";
            grid-template-rows: max-content;
            margin: 20px 10px 10px 40px;
            grid-gap: 30px;
        }

        /* spo2 */
        .auto-style35 {
            grid-area: auto-style35;
            width: 100px;
            height: 100px;
        }

        .auto-style36 {
            grid-area: auto-style36;
            width: 100px;
            height: 100px;
        }

        .auto-style37 {
            grid-area: auto-style37;
            width: 100px;
            height: 100px;
        }

        .auto-style38 {
            /* margin-left: 27px;
            margin-top: 16px;*/
            display: flex;
            width: 100px;
            height: 100px;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }


        .auto-style40 {
            margin: 0;
            font-size: 30px;
            font-weight: bold;
            font-family: sans-serif;
            margin-top: -256px;
        }

        .auto-style41 {
            margin: 0;
            font-size: 20px;
            font-weight: bold;
            font-family: sans-serif;
            margin-left: 53px;
        }

        .auto-style42 {
            display: grid;
            /*grid-template-rows: max-content max-content;*/
            margin-left: 40px;
            margin-top: 10px;
            margin-bottom: 10px;
            grid-gap: 50px;
            grid-template-areas: "auto-style43 auto-style44";
        }

        .auto-style43 {
            grid-area: auto-style43;
        }

        .auto-style44 {
            grid-area: auto-style44;
            margin-right: 20px;
        }

        .auto-style45 {
            display: flex;
            flex-direction: row;
            width: 400px;
            background-color: #B4B4B8;
            border-style: outset;
            border-color: #B4B4B8;
            border-width: 3px;
        }

        .auto-style46 {
            display: flex;
            flex-direction: row;
        }

        .auto-style47 {
            display: flex;
            align-content: space-between;
            flex-direction: column;
            justify-content: space-around;
            font-size: 23px;
            font-weight: bold;
            font-family: sans-serif;
        }

        .separator {
            width: 99%;
            margin: 0;
            border-top: 1px dashed gray;
        }

        .spo2 {
            font-size: 40px;
            font-weight: bold;
            font-family: sans-serif;
            margin-left: 47px;
        }

        .sys {
            font-size: 40px;
            font-weight: bold;
            font-family: sans-serif;
            margin-left: 47px;
        }

        .dia {
            font-size: 40px;
            font-weight: bold;
            font-family: sans-serif;
            margin-left: 53px;
        }

        .solunum {
            font-size: 40px;
            font-weight: bold;
            font-family: sans-serif;
            margin-left: 52px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    HASTA SONUÇLARI
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%-- değerlerin olduğu kısım --%>
    <div class="auto-style24">
        <%-- üst kısım --%>
        <div class="auto-style25">
            <%-- PRbpm --%>
            <div class="auto-style26">
                <img src="fotograflar/ekg.png" class="resim" style="margin-right: 10px" />
                <%-- yukarıdan boşluk verildi --%>
                <div style="margin-top: 6px">
                    <p class="auto-style28">PRbpm</p>
                    <p class="auto-style29">
                        <asp:Repeater ID="prbpm_son_veri" runat="server">
                            <ItemTemplate>
                                <asp:Label ID="prbpmSonVeri" runat="server"  Text='<%# Eval("pulse") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:Repeater>
                    </p>
                    <p class="auto-style30">/Min</p>
                </div>
            </div>
            <%-- vücut ısısı --%>
            <div class="auto-style27">
                <%-- vücut ısısı --%>
                <div>
                    <img src="fotograflar/thermometer.png" class="resim" margin-right: 10px" />
                </div>
                <div style="margin-top: 6px; margin-right: 25px">
                    <p class="auto-style28">Vücut Isısı</p>
                    <p class="auto-style31">
                        <asp:Repeater ID="vucut_isisi_son_veri" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="vucutIsisiSonVeri" runat="server"  Text='<%# Eval("fever") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:Repeater>
                    </p>
                    <p class="auto-style32">°C</p>
                </div>
            </div>
        </div>
        <hr class="separator">
        <%-- orta kısım --%>
        <div class="auto-style34" style="height: 160px">
            <%-- spo2 --%>
            <div class="auto-style35">
                <img src="fotograflar/dry-clean.png" class="resim" position: absolute" />
                <%-- yazılar --%>
                <div class="auto-style38">
                    <p class="auto-style40" style="padding-left: 49px; margin-top: -256px">SPO2</p>
                    <p class="spo2">
                       <asp:Repeater ID="spo2_son_veri" runat="server">
                       <ItemTemplate>
                           <asp:Label ID="spo2SonVeri" runat="server"  Text='<%# Eval("spo2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                    </p>
                    <p class="auto-style41">%</p>
                </div>
            </div>
            <%-- sys --%>
            <div class="auto-style36">
                <img src="fotograflar/dry-clean.png" class="resim" position: absolute" />
                <div class="auto-style38">
                    <p class="auto-style40" style = "margin-top: -256px; padding-left: 49px">SYS</p>
                    <p class="sys">
                       <asp:Repeater ID="sys_son_veri" runat="server">
                       <ItemTemplate>
                           <asp:Label ID="sysSonVeri" runat="server"  Text='<%# Eval("sys") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                    </p>
                    <p class="auto-style41">mmHg</p>
                </div>
            </div>
            <%-- dia --%>
            <div class="auto-style37">
                <img src="fotograflar/dry-clean.png" class="resim" position: absolute" />
                <div class="auto-style38">
                    <p class="auto-style40" style = "padding-left: 54px">DIA</p>
                    <p class="dia">
                       <asp:Repeater ID="dia_son_veri" runat="server">
                       <ItemTemplate>
                           <asp:Label ID="diaSonVeri" runat="server"  Text='<%# Eval("dia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                    </p>
                    <p class="auto-style41">mmHg</p>
                </div>
            </div>
        </div>
        <hr class="separator">
        <%-- alt kısım --%>
        <div class="auto-style42">
            <%-- solunum --%>
            <div class="auto-style43">
                <img src="fotograflar/dry-clean.png" class="resim" position: absolute style="margin-right: 20px" />
                <div class="auto-style38">
                    <p class="auto-style40" style="font-size: 20px; margin-left: 48px">SOLUNUM</p>
                    <p class="solunum">
                       <asp:Repeater ID="solunum_son_veri" runat="server">
                       <ItemTemplate>
                           <asp:Label ID="solunumSonVeri" runat="server"  Text='<%# Eval("res_value") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                    </p>
                    <p class="auto-style41">Rpm</p>
                </div>
            </div>
            <%-- ekg --%>
            <div class="auto-style44">
                <a href="ekgSonuclari.aspx" class="auto-style18">
                    <div class="auto-style45">
                        <img src="fotograflar/monitor.png" class="resim" style="margin-right: 20px; padding-left: 10px" />
                        <p class="auto-style47">EKG GÖRÜNTÜLE</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <a href="gecmisDegerler.aspx" class="auto-style18">
    <%-- buton özelliğinin eklenebilmesi için eklenmiştir --%>
        <div class="auto-style19" style="margin-bottom: 0">
            <p class="auto-style17">
                GEÇMİŞ DEĞERLERİ GÖRÜNTÜLE    
            <i class="fa-solid fa-chart-simple" style="color: #FFFFFF"></i>
            </p>
        </div>
    </a>
</asp:Content>