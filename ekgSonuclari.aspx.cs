using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class ekgSonuclari : System.Web.UI.Page
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
                        komut.CommandText = "SELECT id, ekg_text, timestamp FROM ekg_data_final ORDER BY timestamp DESC";
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(komut))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            ListView1.DataSource = dt;
                            ListView1.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Hata: " + ex.Message);
                }
            }
        }
        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblTimestamp = (Label)e.Item.FindControl("Label1");
                if (lblTimestamp != null)
                {
                    DateTime timestamp;
                    if (DateTime.TryParse(lblTimestamp.Text, out timestamp))
                    {
                        lblTimestamp.Text = timestamp.ToString("dd/MM/yyyy HH:mm"); 
                    }
                }
            }
        }
    }
}
