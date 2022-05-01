using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
using System.Windows.Shapes;
using Proyecto;

namespace ProyectoFinal
{
    /// <summary>
    /// Lógica de interacción para Window1.xaml
    /// </summary>
    public partial class WinInsertarEmpleados : Window
    {

        public static T ConvertDBNull<T>(object value, Func<object, T> conversionFunction)
        {
            return conversionFunction(value == DBNull.Value ? null : value);
        }
        public void BuscarIdMax()
        {
            int id = 0;


            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["proyecto"].ConnectionString;
                string script = "SELECT Max(idEmpleado) FROM dbo.Empleados";
                SqlConnection connection = BD.CrearConexion(connectionString);
                SqlCommand command = BD.CrearComando(connection, script);

                SqlDataAdapter da = BD.CrearDataAdapter(command);
                DataTable dt = BD.CrearDataTable(da);

                BD.AbrirConexion(connection, command);

                da.Fill(dt);
                id  = (Convert.ToInt32(dt.Rows[0]));
                if (id != System.DbNull.Value)
                {
                    id = id.ToString();
                }


            }
            catch (NullReferenceException)
            {
                id = 0;
            }
            txtID.Text = id.ToString();
            
        }
        public WinInsertarEmpleados()
        {
            InitializeComponent();
            BuscarIdMax();

        }

        private void btnSiguiente_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnAnterior_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
