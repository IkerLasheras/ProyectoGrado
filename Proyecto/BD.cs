using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto
{
    public class BD
    {
        public static SqlConnection CrearConexion(string connectionString)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            return connection;
        }

        public static void  AbrirConexion(SqlConnection connection, SqlCommand command)
        {
            command.Connection.Open();
        }
        public void CerrarConnection(SqlConnection connection)
        {
            connection.Close();
        }
        public static SqlCommand CrearComando(SqlConnection connection, string script)
        {
            return new SqlCommand(script, connection);
        }
        public static SqlDataAdapter CrearDataAdapter(SqlCommand command)
        {
            return new SqlDataAdapter(command);
        }

        public static DataTable CrearDataTable(SqlDataAdapter da)
        {
            DataTable dt = new DataTable();
            return dt;
        }

        public void ImprimirDatos()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["proyecto"].ConnectionString;
            string script = "SELECT * FROM dbo.platos";
            SqlConnection connection = CrearConexion(connectionString);
            SqlCommand command = CrearComando(connection, script);

            SqlDataAdapter da = CrearDataAdapter(command);
            DataTable dt = CrearDataTable(da);

            AbrirConexion(connection, command);

            da.Fill(dt);

            foreach (DataRow row in dt.Rows)
            {
                foreach (DataColumn column in dt.Columns)
                    Debug.Write("\t{0}", row[column].ToString());

                Console.WriteLine("\t" + row.RowState);
            }

        }
    }
}
