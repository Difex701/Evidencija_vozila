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
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            using (var conn = Database.DbConnection())
            {
                conn.Open();
                var cmd = new MySqlCommand("SELECT * FROM vozilo", conn);

                using (var reader  = cmd.ExecuteReader())
                {
                    listView1.Items.Clear();

                    while (reader.Read())
                    {

                        ListViewItem item = new ListViewItem(reader["VoziloID"].ToString());
                        item.SubItems.Add(reader["Registracija"].ToString());
                        item.SubItems.Add(reader["GodinaProizvodnje"].ToString());
                        item.SubItems.Add(reader["PredjenoKM"].ToString());
                        item.SubItems.Add(reader["ModelID"].ToString());
                        item.SubItems.Add(reader["BojaID"].ToString());
                        item.SubItems.Add(reader["GorivoID"].ToString());
                        item.SubItems.Add(reader["Cena"].ToString());

                        listView1.Items.Add(item);
                    }
                }
            }
        }
        private void LoadVozila(string voziloID)
        {
            using (var conn = Database.DbConnection())
            {
                conn.Open();
                var cmd = new MySqlCommand("SELECT v.VoziloID AS id, v.Registracija AS reg, v.GodinaProizvodnje AS godProizvodnje, " +
                                           "v.PredjenoKM AS km, v.Cena AS cena, " +
                                           "m.Naziv AS mNaziv, g.Naziv AS gNaziv, b.Naziv AS bNaziv " +
                                           "FROM vozilo v " +
                                           "JOIN model m ON v.ModelID = m.ModelID " +
                                           "JOIN gorivo g ON v.GorivoID = g.GorivoID " +
                                           "JOIN boja b ON v.BojaID = b.BojaID " +
                                           "WHERE v.VoziloID = @ID", conn);

                cmd.Parameters.AddWithValue("@ID", voziloID);

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        txtSifra.Text = reader["id"].ToString();
                        txtReg.Text = reader["reg"].ToString();
                        txtGodproiz.Text = reader["godProizvodnje"].ToString();
                        txtKm.Text = reader["km"].ToString();
                        txtCena.Text = reader["cena"].ToString();
                        comboModel.Items.Add(reader["mNaziv"].ToString());
                        comboBoja.Items.Add(reader["bNaziv"].ToString());
                        comboGorivo.Items.Add(reader["gNaziv"].ToString());
                    }
                }
            }

        }
        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listView1.SelectedItems.Count > 0)
            {
                string voziloID = listView1.SelectedItems[0].Text;
                LoadVozila(voziloID);
            }
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
