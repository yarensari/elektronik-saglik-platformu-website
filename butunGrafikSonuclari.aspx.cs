using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Mysqlx.Expect.Open.Types;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class butunGrafikSonuclari : System.Web.UI.Page
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

                        string sorguAtesButunDegerler = "SELECT fever AS feverDeger, NULL AS sysDeger, NULL AS diaDeger, NULL AS spo2Deger, NULL AS pulseDeger, NULL AS resDeger, datetime_column AS date FROM date_table";
                        string sorguTansiyonButunDegerler = "SELECT NULL AS feverDeger, sys AS sysDeger, dia AS diaDeger, NULL AS spo2Deger, NULL AS pulseDeger, NULL AS resDeger, date AS date FROM bp_table";
                        string sorguSpo2ButunDegerler = "SELECT NULL AS feverDeger, NULL AS sysDeger, NULL AS diaDeger, spo2 AS spo2Deger, pulse AS pulseDeger, NULL AS resDeger, date AS date FROM spo2_table";
                        string sorguSolunumButunDegerler = "SELECT NULL AS feverDeger, NULL AS sysDeger, NULL AS diaDeger, NULL AS spo2Deger, NULL AS pulseDeger, res_value AS resDeger, date AS date FROM res_data_final";

                        string kosulHafta1 = "date >= DATE_SUB(NOW(), INTERVAL 1 WEEK)";
                        string kosulHafta2 = "date >= DATE_SUB(NOW(), INTERVAL 2 WEEK)";
                        string kosulHafta3 = "date >= DATE_SUB(NOW(), INTERVAL 3 WEEK)";
                        string kosulAy1 = "date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";

                        string secilenDeger = DropDownList1.SelectedValue;
                        if (secilenDeger == "butunDegerler")
                        {
                            komut.CommandText = sorguAtesButunDegerler
                                                + " UNION ALL "
                                                + sorguTansiyonButunDegerler
                                                + " UNION ALL "
                                                + sorguSpo2ButunDegerler
                                                + " UNION ALL "
                                                + sorguSolunumButunDegerler;
                        }
                        else if (secilenDeger == "hafta1")
                        {
                            komut.CommandText = sorguAtesButunDegerler + " WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 1 WEEK)"
                                                + " UNION ALL "
                                                + sorguTansiyonButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 1 WEEK)"
                                                + " UNION ALL "
                                                + sorguSpo2ButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 1 WEEK)"
                                                + " UNION ALL "
                                                + sorguSolunumButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 1 WEEK)";
                        }
                        else if (secilenDeger == "hafta2")
                        {
                            komut.CommandText = sorguAtesButunDegerler + " WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 2 WEEK)"
                                                + " UNION ALL "
                                                + sorguTansiyonButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 2 WEEK)"
                                                + " UNION ALL "
                                                + sorguSpo2ButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 2 WEEK)"
                                                + " UNION ALL "
                                                + sorguSolunumButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 2 WEEK)";
                        }
                        else if (secilenDeger == "hafta3")
                        {
                            komut.CommandText = sorguAtesButunDegerler + " WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 3 WEEK)"
                                                + " UNION ALL "
                                                + sorguTansiyonButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 3 WEEK)"
                                                + " UNION ALL "
                                                + sorguSpo2ButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 3 WEEK)"
                                                + " UNION ALL "
                                                + sorguSolunumButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 3 WEEK)";
                        }
                        else if (secilenDeger == "ay1")
                        {
                            komut.CommandText = sorguAtesButunDegerler + " WHERE datetime_column >= DATE_SUB(NOW(), INTERVAL 1 MONTH)"
                                                + " UNION ALL "
                                                + sorguTansiyonButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)"
                                                + " UNION ALL "
                                                + sorguSpo2ButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)"
                                                + " UNION ALL "
                                                + sorguSolunumButunDegerler + " WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
                        }

                        using (MySqlDataReader reader = komut.ExecuteReader())
                        {
                            List<object> chartData = new List<object>();
                            while (reader.Read())
                            {
                                double? feverDeger = reader["feverDeger"] != DBNull.Value ? Convert.ToDouble(reader["feverDeger"]) : (double?)null;
                                double? sysDeger = reader["sysDeger"] != DBNull.Value ? Convert.ToDouble(reader["sysDeger"]) : (double?)null;
                                double? diaDeger = reader["diaDeger"] != DBNull.Value ? Convert.ToDouble(reader["diaDeger"]) : (double?)null;
                                double? spo2Deger = reader["spo2Deger"] != DBNull.Value ? Convert.ToDouble(reader["spo2Deger"]) : (double?)null;
                                double? pulseDeger = reader["pulseDeger"] != DBNull.Value ? Convert.ToDouble(reader["pulseDeger"]) : (double?)null;
                                double? resDeger = reader["resDeger"] != DBNull.Value ? Convert.ToDouble(reader["resDeger"]) : (double?)null;
                                string tarihDeger = reader["date"].ToString();

                                chartData.Add(new
                                {
                                    yEkseniAtes = feverDeger,
                                    yEkseniSys = sysDeger,
                                    yEkseniDia = diaDeger,
                                    yEkseniSpo2 = spo2Deger,
                                    yEkseniNabiz = pulseDeger,
                                    yEkseniSolunum = resDeger,
                                    xEkseni = tarihDeger,
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
