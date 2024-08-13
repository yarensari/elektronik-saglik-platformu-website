using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class ekgDeneme : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //string id = Request.QueryString["id"];
            if (!IsPostBack)
            {
                DisplayBlobData();
            }
        }

            private void DisplayBlobData()
            {
                // QueryString'den id değerini alıyoruz
                string id = Request.QueryString["id"];

                if (string.IsNullOrEmpty(id))
                {
                    Response.Write("ID parametresi eksik veya geçersiz.");
                    return;
                }

            // Veritabanı bağlantısı oluşturuyoruz
            MySQLConnection baglan = new MySQLConnection();
            string baglantiIsmi = baglan.getMySQLBaglanti();

                using (MySqlConnection conn = new MySqlConnection(baglantiIsmi))
                {
                    try
                    {
                        conn.Open();
                        string query = "SELECT ekg_image FROM ekg_data_final WHERE id = @id";

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@id", id);

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    byte[] blobData = (byte[])reader["ekg_image"];
                                    string base64String = Convert.ToBase64String(blobData, 0, blobData.Length);
                                    BlobImage.ImageUrl = "data:image/png;base64," + base64String;
                            }
                                else
                                {
                                    Response.Write("ID ile eşleşen veri bulunamadı.");
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Veritabanı işleminde hata oluştu: " + ex.Message);
                    }
                }
            }
        }
    }
