using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class solunumListeSonuclari : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                datalariYukle();
            }
        }

        private void datalariYukle()
        {
            MySQLConnection baglan = new MySQLConnection();
            string baglantiIsmi = baglan.getMySQLBaglanti();
            using (MySqlConnection baglanti = new MySqlConnection(baglantiIsmi))
            {
                try
                {
                    baglanti.Open();
                    using (MySqlCommand komut = new MySqlCommand())
                    {
                        komut.Connection = baglanti;
                        string secilenDeger = DropDownList1.SelectedValue;

                        if (secilenDeger == "butunDegerler")
                        {
                            komut.CommandText = "SELECT id, res_value, res_text, date FROM res_data_final ORDER BY date DESC";
                        }
                        else if (secilenDeger == "hafta1")
                        {
                            komut.CommandText = "SELECT id, res_value, res_text, date FROM res_data_final WHERE date >= DATE_SUB(NOW(), INTERVAL 1 WEEK) ORDER BY date DESC";
                        }
                        else if (secilenDeger == "hafta2")
                        {
                            komut.CommandText = "SELECT id, res_value, res_text, date FROM res_data_final WHERE date >= DATE_SUB(NOW(), INTERVAL 2 WEEK) ORDER BY date DESC";
                        }
                        else if (secilenDeger == "hafta3")
                        {
                            komut.CommandText = "SELECT id, res_value, res_text, date FROM res_data_final WHERE date >= DATE_SUB(NOW(), INTERVAL 3 WEEK) ORDER BY date DESC";
                        }
                        else if (secilenDeger == "ay1")
                        {
                            komut.CommandText = "SELECT id, res_value, res_text, date FROM res_data_final WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH) ORDER BY date DESC";
                        }

                        using (MySqlDataAdapter sda = new MySqlDataAdapter(komut))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            if (dt.Rows.Count == 0)
                            {
                                Response.Write("Belirtilen tarihlerde değer bulunmamaktadır.");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Hata: " + ex.Message);
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            datalariYukle();
        }
    }
}
