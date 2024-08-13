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
    public partial class anasayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MySQLConnection baglan = new MySQLConnection();
            string baglantiIsmi = baglan.getMySQLBaglanti();

            MySqlConnection baglanti = new MySqlConnection(baglantiIsmi);

            //prbpm
            MySqlDataAdapter prbpm = new MySqlDataAdapter("SELECT pulse FROM spo2_table ORDER BY date DESC LIMIT 1", baglanti); // ,baglanti sayesinde baglanti.open'a gerek kalmadı

            DataTable dt_prbpm = new DataTable();
            prbpm.Fill(dt_prbpm);

            prbpm_son_veri.DataSource = dt_prbpm;
            prbpm_son_veri.DataBind();

            // fever
            MySqlDataAdapter fever = new MySqlDataAdapter("SELECT fever FROM date_table ORDER BY datetime_column DESC LIMIT 1", baglanti); // ,baglanti sayesinde baglanti.open'a gerek kalmadı

            DataTable dt_fever = new DataTable();
            fever.Fill(dt_fever);

            vucut_isisi_son_veri.DataSource = dt_fever;
            vucut_isisi_son_veri.DataBind();

            // spo2
            MySqlDataAdapter spo2 = new MySqlDataAdapter("SELECT spo2 FROM spo2_table ORDER BY date DESC LIMIT 1", baglanti); // ,baglanti sayesinde baglanti.open'a gerek kalmadı

            DataTable dt_spo2 = new DataTable();
            spo2.Fill(dt_spo2);

            spo2_son_veri.DataSource = dt_spo2;
            spo2_son_veri.DataBind();

            // sys
            MySqlDataAdapter sys = new MySqlDataAdapter("SELECT sys FROM bp_table ORDER BY date DESC LIMIT 1", baglanti); // ,baglanti sayesinde baglanti.open'a gerek kalmadı

            DataTable dt_sys = new DataTable();
            sys.Fill(dt_sys);

            sys_son_veri.DataSource = dt_sys;
            sys_son_veri.DataBind();

            // dia
            MySqlDataAdapter dia = new MySqlDataAdapter("SELECT dia FROM bp_table ORDER BY date DESC LIMIT 1", baglanti); // ,baglanti sayesinde baglanti.open'a gerek kalmadı

            DataTable dt_dia = new DataTable();
            dia.Fill(dt_dia);

            dia_son_veri.DataSource = dt_dia;
            dia_son_veri.DataBind();

            // solunum
            MySqlDataAdapter solunum = new MySqlDataAdapter("SELECT res_value FROM res_data_final ORDER BY date DESC LIMIT 1", baglanti); // ,baglanti sayesinde baglanti.open'a gerek kalmadı

            DataTable dt_res = new DataTable();
            solunum.Fill(dt_res);

            solunum_son_veri.DataSource = dt_res;
            solunum_son_veri.DataBind();

        }
    }
}