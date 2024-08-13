using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class spo2GrafikSonuclari : System.Web.UI.Page
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
                            komut.CommandText = "SELECT spo2, pulse, date FROM spo2_table ORDER BY date DESC";
                        }
                        else if (secilenDeger == "hafta1")
                        {
                            komut.CommandText = "SELECT spo2, pulse, date FROM spo2_table WHERE date >= DATE_SUB(NOW(), INTERVAL 1 WEEK) ORDER BY date DESC";
                        }
                        else if (secilenDeger == "hafta2")
                        {
                            komut.CommandText = "SELECT spo2, pulse, date FROM spo2_table WHERE date >= DATE_SUB(NOW(), INTERVAL 2 WEEK DESC) ORDER BY date DESC";
                        }
                        else if (secilenDeger == "hafta3")
                        {
                            komut.CommandText = "SELECT spo2, pulse, date FROM spo2_table WHERE date >= DATE_SUB(NOW(), INTERVAL 3 WEEK DESC) ORDER BY date DESC";
                        }
                        else if (secilenDeger == "ay1")
                        {
                            komut.CommandText = "SELECT spo2, pulse, date FROM spo2_table WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH DESC) ORDER BY date DESC";
                        }

                        using (MySqlDataReader reader = komut.ExecuteReader())
                        {
                            List<object> chartData = new List<object>();
                            while (reader.Read())
                            {
                                double spo2Deger = Convert.ToDouble(reader["spo2"]);
                                double pulseDeger = Convert.ToDouble(reader["pulse"]);
                                string tarihDeger = reader["date"].ToString();

                                chartData.Add(new
                                {
                                    yEkseniSpo2 = spo2Deger,
                                    yEkseniPulse = pulseDeger,
                                    xEkseni = tarihDeger
                                });
                            }

                            var jsonSerializer = new JavaScriptSerializer();
                            string jsonData = jsonSerializer.Serialize(chartData);

                            ClientScript.RegisterStartupScript(this.GetType(), "chartData", "var chartData = " + jsonData + ";", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            datalariYukle();
        }
    }
}