using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class gonderilenNotlar : System.Web.UI.Page
    {
        MySqlConnection baglanti;
        MySqlCommand komut;
        protected void Page_Load(object sender, EventArgs e)
        {
            MySQLConnection baglan = new MySQLConnection();
            string baglantiIsmi = baglan.getMySQLBaglanti();
            baglanti = new MySqlConnection(baglantiIsmi);
            baglanti.Open();
            if (!Page.IsPostBack)
            {
                BilgileriGetir();
            }
        }

        void BilgileriGetir()
        {
            String sorgu;
            sorgu = "SELECT * FROM messages ORDER BY date DESC";
            MySqlDataReader verilerioku;
            komut = new MySqlCommand(sorgu, baglanti);
            verilerioku = komut.ExecuteReader();
            Repeater1.DataSource = verilerioku;
            Repeater1.DataBind();
            verilerioku.Close();
            verilerioku = null;
        }

        void Page_UnLoad()
        {
            baglanti.Close();
            baglanti = null;
        }


        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "kayitsil")
            {
                string sorgu;
                Label Label1 = (Label)(e.Item.FindControl("Label1"));
                sorgu = "DELETE FROM messages WHERE mesaj = @mesaj";
                komut = new MySqlCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@mesaj", Label1.Text);
                komut.ExecuteNonQuery();
                BilgileriGetir();
            }
        }
    }
}