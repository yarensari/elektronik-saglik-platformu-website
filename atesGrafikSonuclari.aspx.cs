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
    public partial class atesGrafikSonuclari : System.Web.UI.Page
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
                            komut.CommandText = "SELECT fever, datetime_column FROM date_table ORDER BY datetime_column DESC";
                        }
                        else if (secilenDeger == "hafta1")
                        {
                            komut.CommandText = "SELECT fever, datetime_column FROM date_table WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 1 WEEK) ORDER BY datetime_column DESC";
                        }
                        else if (secilenDeger == "hafta2")
                        {
                            komut.CommandText = "SELECT fever, datetime_column FROM date_table WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 2 WEEK) ORDER BY datetime_column DESC";
                        }
                        else if (secilenDeger == "hafta3")
                        {
                            komut.CommandText = "SELECT fever, datetime_column FROM date_table WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 3 WEEK) ORDER BY datetime_column DESC";
                        }
                        else if (secilenDeger == "ay1")
                        {
                            komut.CommandText = "SELECT fever, datetime_column FROM date_table WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 1 MONTH) ORDER BY datetime_column DESC";
                        }

                            using (MySqlDataReader reader = komut.ExecuteReader())
                            {
                                List<object> chartData = new List<object>();
                                while (reader.Read())
                                {
                                    double atesDeger = Convert.ToDouble(reader["fever"]);
                                    string tarihDeger = reader["datetime_column"].ToString(); 

                                    chartData.Add(new
                                    {
                                        yEkseni = atesDeger, 
                                        xEkseni = tarihDeger
                                    });
                                }

                                var jsonSerializer = new JavaScriptSerializer();
                                string jsonData = jsonSerializer.Serialize(chartData);

                                ClientScript.RegisterStartupScript(this.GetType(), "chartData", "var chartData = " + jsonData + ";", true);
                            }
                    }
                } catch (Exception ex)
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