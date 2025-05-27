using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evidencia_vozidiel
{
    internal class Database
    {
        private static string connString = "server=localhost;database=evidencija_vozila;uid=root;pwd=;";

        public static MySqlConnection DbConnection()
        {
            return new MySqlConnection(connString);
        }
    }
}
