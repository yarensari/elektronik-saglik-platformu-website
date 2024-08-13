using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace elektronik_saglik_platformu_web_doktor
{
    public partial class solunumDetay : System.Web.UI.Page
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
            string id = Request.QueryString["id"];

            if (string.IsNullOrEmpty(id))
            {
                Response.Write("ID parametresi eksik veya geçersiz.");
                return;
            }
            MySQLConnection baglan = new MySQLConnection();
            string baglantiIsmi = baglan.getMySQLBaglanti();
            using (MySqlConnection conn = new MySqlConnection(baglantiIsmi))
            {

                try
                {
                    conn.Open();
                    string query = "SELECT res_image FROM res_data_final WHERE id = @id";
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@id", id);

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    byte[] blobData = (byte[])reader["res_image"];

                                    string base64String = Convert.ToBase64String(blobData, 0, blobData.Length);
                                    BlobImage.ImageUrl = "data:image/png;base64," + base64String;
                                }
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        Response.Write("iç hata: " + e.Message);
                    }

                }
                catch (Exception ex)
                {
                    // Hata işleme
                    Response.Write("Hata: " + ex.Message);
                }
            }
        }
    }
}