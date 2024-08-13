<%@ Page Title="" Language="C#" MasterPageFile="~/temel.Master" AutoEventWireup="true" CodeBehind="doktorGonderilenNotlar.aspx.cs" Inherits="elektronik_saglik_platformu_web_doktor.doktorGonderilenNotlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
         width: 100%
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
         background-color: #48CB8E;
         text-align: center; /* Hücre içeriğini ortala */
         padding: 10px;
     }
     .table-row {
         background-color: #48CB8E; /* AlternatingItemTemplate ve HeaderTemplate için arka plan rengi */
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
     .of{

     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    GÖNDERİLEN NOTLAR
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
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
    </asp:Repeater> 
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
