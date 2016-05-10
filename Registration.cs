using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Prime
{
    public partial class Registration : Form
    {
        public Registration()
        {
            InitializeComponent();
            CenterToScreen();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void Registration_Load(object sender, EventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlDataReader sdr;
            SqlCommand cmd;
            var connection =
                new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=DB;Integrated Security=True");
            if (textBox1.Text.Length == 0 || textBox2.Text.Length == 0 || textBox3.Text.Length == 0 ||
                textBox4.Text.Length == 0 || textBox5.Text.Length == 0 || textBox7.Text.Length == 0)
                MessageBox.Show("One of the fields is empty\nPlease fill in all fields");
            try
            {
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM Singers WHERE Stage_name='" + textBox5.Text + "'", connection);
                sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    MessageBox.Show(@"Singer with this stage name is already exist");
                }
                else
                {

                    connection.Close();
                    try
                    {
                        connection.Open();
                        cmd =
                            new SqlCommand(
                                "INSERT INTO Singers VALUES(@st_name,@real_name,@country,@site,@genres,@wiki)",
                                connection);

                        cmd.Parameters.Add("@st_name", textBox5.Text);
                        cmd.Parameters.Add("@real_name", textBox1.Text);
                        cmd.Parameters.Add("@country", textBox2.Text);
                        cmd.Parameters.Add("@site", textBox3.Text);
                        cmd.Parameters.Add("@genres", textBox4.Text);
                        cmd.Parameters.Add("@wiki", textBox7.Text);
                        cmd.ExecuteNonQuery();
                        MessageBox.Show(@"You successfully registered");
                        Close();

                    }
                    catch (Exception exp)
                    {

                        MessageBox.Show(exp.Message);
                    }
                }
            }
            catch (Exception exp)
            {
                MessageBox.Show(exp.Message);
            }
        }
    }
}