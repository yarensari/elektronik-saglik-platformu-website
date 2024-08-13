using System;
/// YAREN SARI
/// BAĞLANTI
/// bu classın oluşturulma sebebi değişen ip adresinin oluşturduğu iş yükünü azaltmaktır. 
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace elektronik_saglik_platformu_web_doktor
{
    public class MySQLConnection
    {
        string mySQLBaglanti = "Server=192.168.1.35;Database=koah;Uid=root;Pwd=yaren123;CharSet=utf8;";
        ///  BAĞLANTI İSMİNİN ALINMASI
        public string getMySQLBaglanti()
        {
            return mySQLBaglanti;
        }
    }
}