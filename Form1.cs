using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace Evidencia_vozidiel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            LoadEvidencija_vozila();
        }

        private void LoadEvidencija_vozila()
        {
            listView1.Items.Clear();
            using (MySqlConnection conn = new MySqlConnection(conn))
            {
                string query = "SELECT VoziloID, Registracija FROM vozilo ORDER BY VoziloID";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                conn.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    listView1.Items.Add(new ListViewItem(reader.GetInt32(0), reader.GetString(1)));
                }    
                conn.Close();
            }
        }
        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void btnIzlaz_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAnaliza_Click(object sender, EventArgs e)
        {
            Analiza analiza = new Analiza();
            analiza.Show();
        }
    }
}
