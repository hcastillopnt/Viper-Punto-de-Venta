using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using MySql.Data.MySqlClient;


namespace Viper.WebAPI.Controllers
{
    public class BDController : ApiController
    {
        /// <summary>
        /// Variables para formar la cadena de conexion a MySQL, solo hay que reemplazar por tus datos
        /// </summary>
        String server = "localhost"; //Servidor
        String nombreDB = "viper_developments"; //Nombre de la base de datos
        String userDB = "root"; //Usuario con el que accesas a MySQL
        String passwordDB = "0925"; //Contraseña con la que accesas a MySQL



        /// <summary>
        /// El metodo Connect servira para establecer la conexion con la BD y retornará un dato de tipo String y
        /// lo que retorne nos servira para saber si se establecio la conexion con la BD.
        /// Retorna "1" si la conexion se abrio y retorna "0" si la conexion se cerró
        /// </summary>
        /// <returns></returns>
        public String Connect()
        {
            String connectionString = "Server=" + server + ";Database=" + nombreDB
                + "; Uid=" + userDB + ";Pwd=" + passwordDB + ";";

            MySqlConnection conn = new MySqlConnection(connectionString);

            if (conn.State.Equals(ConnectionState.Closed))
            {
                conn.Open();
                return "1";
            }
            else
            {
                conn.Close();
                return "0";
            }

        }

        /// <summary>
        /// En este metodo es donde comprobaremos si se realizo la conexion o no, al ingresar a 
        /// TuServidor/api/BD
        /// nos debe mostrar si la conexion se abrio o si se cerró
        /// </summary>
        /// <returns></returns>
        public IEnumerable<string> Get()
        {

            if (Connect().Equals("1"))
            {
                return new String[] { "Conexion OPEN" };
            }
            else
            {
                return new String[] { "Conexion CLOSE" };
            }
        }
    }
}