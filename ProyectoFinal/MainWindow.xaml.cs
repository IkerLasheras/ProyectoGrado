using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Proyecto;

namespace ProyectoFinal
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 
   
 
    
    public partial class MainWindow : Window
    {

        private static string connectionString = ConfigurationManager.ConnectionStrings["conexionClientes"].ConnectionString;

        public MainWindow()
        {
            InitializeComponent();
            
        }

        public SqlConnection EstablecerConexion(string connectionString, SqlCommand command)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            command.Connection.Open();

            return connection;
        }
        public void CerrarConnection(SqlConnection connection)
        {
            connection.Close();
        }
        public SqlCommand CraerComando (SqlConnection connection, string script)
        {
            return new SqlCommand(script, connection);
        }
        public SqlDataAdapter SqlDataAdapter(SqlCommand command)
        {
            return new SqlDataAdapter(command);
        }

        public DataTable CrearDataTable(SqlDataAdapter da)
        {
            DataTable dt = new DataTable();
            return dt;
        }

        public void rellenarDataTable(DataTable dt, SqlDataAdapter da)
        {
            da.Fill(dt);  
        }

    }
}
