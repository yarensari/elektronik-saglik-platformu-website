using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class temel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MySQLConnection baglan = new MySQLConnection();
            string baglantiIsmi = baglan.getMySQLBaglanti();
            MySqlConnection baglanti = new MySqlConnection(baglantiIsmi);
            //MySqlConnection baglanti = new MySqlConnection("Server=192.168.43.54;Database=testdatabase;Uid=yarensari;Pwd=sari1234;CharSet=utf8;");
            // hasta adı
            MySqlDataAdapter ad = new MySqlDataAdapter("SELECT name FROM info WHERE id=1", baglanti); // ,baglanti sayesinde baglanti.open'a gerek kalmadı

            DataTable dt_ad = new DataTable();
            ad.Fill(dt_ad);

            hasta_adi.DataSource = dt_ad;
            hasta_adi.DataBind();

            // hasta soyadı
            MySqlDataAdapter soyad = new MySqlDataAdapter("SELECT surname FROM info WHERE id=1", baglanti);

            DataTable dt_soyad = new DataTable();
            soyad.Fill(dt_soyad);

            hasta_soyadi.DataSource = dt_soyad;
            hasta_soyadi.DataBind();

            // hasta yaşı
            MySqlDataAdapter yas = new MySqlDataAdapter("SELECT age FROM info WHERE id=1", baglanti);

            DataTable dt_yas = new DataTable();
            yas.Fill(dt_yas);

            hasta_yasi.DataSource = dt_yas;
            hasta_yasi.DataBind();

            // hasta boy
            MySqlDataAdapter boy = new MySqlDataAdapter("SELECT height FROM info WHERE id=1", baglanti);

            DataTable dt_boy = new DataTable();
            boy.Fill(dt_boy);

            hasta_boyu.DataSource = dt_boy;
            hasta_boyu.DataBind();

            // hasta kilo
            MySqlDataAdapter kilo = new MySqlDataAdapter("SELECT weight FROM info WHERE id=1", baglanti);

            DataTable dt_kilo = new DataTable();
            kilo.Fill(dt_kilo);

            hasta_kilosu.DataSource = dt_kilo;
            hasta_kilosu.DataBind();

            // hasta bmi
            MySqlDataAdapter bmi = new MySqlDataAdapter("SELECT bmi FROM info WHERE id=1", baglanti);

            DataTable dt_bmi = new DataTable();
            bmi.Fill(dt_bmi);

            hasta_bmi.DataSource = dt_bmi;
            hasta_bmi.DataBind();
        }

        protected void doktorNotGönder_Click1(object sender, EventArgs e)
        {
            MySQLConnection baglan = new MySQLConnection();
            string baglantiIsmi = baglan.getMySQLBaglanti();
            using (MySqlConnection baglanti = new MySqlConnection(baglantiIsmi))
            {
                try
                {
                    baglanti.Open();
                    if (baglanti.State == System.Data.ConnectionState.Open)
                    {
                        if (doktorNot.Text.Length != 0)
                        {
                            string query = "INSERT INTO messages (message) VALUES (@msj)";
                            using (MySqlCommand cmd = new MySqlCommand(query, baglanti))
                            {
                                cmd.Parameters.AddWithValue("@msj", doktorNot.Text);
                                //cmd.Parameters.AddWithValue("@tarih", DateTime.Now);

                                int rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    successMessageDiv.InnerText = "Mesajınız iletildi.";
                                    errorMessageDiv.InnerText = "";
                                }
                                else
                                {
                                    errorMessageDiv.InnerText = "Bağlantı açılmadı.";
                                    successMessageDiv.InnerText = "";
                                }
                            }
                        }
                        else
                        {
                            errorMessageDiv.InnerText = "Boş mesaj gönderilemez.";
                            successMessageDiv.InnerText = "";
                        }
                    }

                }
                catch (Exception ex)
                {
                    errorMessageDiv.InnerText = "Hata: " + ex.Message;
                }
            }
        }
    }
}