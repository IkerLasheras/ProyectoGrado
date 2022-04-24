using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto
{
    public class Class1
    {
        public static void LeerFile(IDataRecord record)
        {
            Debug.WriteLine(String.Format("{0}, {1}", record[0], record[1]));
        }

        public static SqlDataReader ObtenerdataReader(SqlConnection conexion, string queryString)
        {
            SqlDataReader dataReader = null;


            try
            {
                SqlCommand comando = new SqlCommand(queryString, conexion);

                dataReader = comando.ExecuteReader();

            }
            catch (Exception e)
            {
                Debug.WriteLine("Error");
            }

            return dataReader;
        }

        public static void CerarDataReder(SqlDataReader dataReader)
        {
            dataReader.Close();
        }

        public static SqlConnection GenerarConexion(String cadenaConexion)
        {
            SqlConnection conexion = null;
            try
            {
                conexion = new SqlConnection(cadenaConexion);
                conexion.Open();

            }
            catch (Exception ex) { }


            return conexion;
        }

        public static void CerrarConexion(SqlConnection conexion)
        {
            conexion.Close();
        }

        public static Exception LeerDataTable(string cadenaConexion, string consulta)
        {
            Exception ex1 = null;
            try
            {
                SqlConnection conexion = GenerarConexion(cadenaConexion);
                DataTable dataReader = new DataTable();
                SqlDataAdapter dataAdapter = new 

                while (dataReader.Read())
                {
                    LeerFile((IDataRecord)dataReader);
                }

                CerarDataReder(dataReader);
                CerrarConexion(conexion);
            }
            catch (Exception ex2)
            {
                return ex2;
            }
            return ex1;
        }

        public static SqlCommand GenerarComando(String cadenaBusqueda, SqlConnection conexion)
        {
            SqlCommand comando = new SqlCommand(cadenaBusqueda, conexion);
            return comando;
        }


        public static SqlParameter ObtenerParametro(string stringParametro, SqlDbType tipoParametro, ParameterDirection direccion, bool valorNulo, Object valor)
        {
            SqlParameter parametro = new SqlParameter(stringParametro, tipoParametro);
            parametro.IsNullable = valorNulo;
            parametro.Direction = direccion;
            parametro.Value = valor;
            return parametro;
        }
        public static int ObtenerId(string cadenaConexion)
        {
            int id = 0;
            try
            {
                String consulta = "select max(idCliente) from dam.dbo.clientes";
                SqlConnection conexion = GenerarConexion(cadenaConexion);
                SqlDataReader dataReader = ObtenerdataReader(conexion, consulta);

                while (dataReader.Read())
                {
                    IDataRecord record = (IDataRecord)dataReader;
                    id = (int)record[0];
                }

                CerarDataReder(dataReader);
                CerrarConexion(conexion);
            }
            catch (Exception ex2)
            {

            }
            return id;
        }

        public static SqlCommand AbrirConexionComando(SqlCommand comando)
        {
            comando.Connection.Open();
            return comando;
        }

        public static int EjecutarQuery(SqlCommand comando)
        {
            int numeroFilas = 0;

            try
            {
                numeroFilas = comando.ExecuteNonQuery();
            }
            catch (Exception e)
            {

            }
            return numeroFilas;
        }

        public static Exception LanzarComandoSQLNonQuery(string consulta, string cadenaConexion, List<SqlParameter> listaParametros)
        {
            try
            {
                SqlConnection conexion = GenerarConexion(cadenaConexion);
                SqlCommand comando = GenerarComando(consulta, conexion);
                AbrirConexionComando(comando);
                AniadirparametroComandos(comando, listaParametros);
                EjecutarQuery(comando);

                CerrarConexion(conexion);

            }
            catch (Exception e)
            {
                return e;
            }
            return null;


        }

        public static void AniadirparametroComandos(SqlCommand comando, List<SqlParameter> listaParametros)
        {
            for (int i = 0; i < listaParametros.Count; i++)
            {
                comando.Parameters.Add(listaParametros[i]);
            }
        }
    }
}
