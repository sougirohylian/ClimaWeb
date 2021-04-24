using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClimaWS.clima.DAL
{
    public class cDataBase
    {
        private OleDbConnection oleDbCnn;
        private SqlConnection sqlCnn;
        
        public cDataBase()
        {
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");

            if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            {
                System.Configuration.ConnectionStringSettings connString = rootWebConfig.ConnectionStrings.ConnectionStrings["DBConnectionString"];
                oleDbCnn = new OleDbConnection(connString.ToString().ToString());

                System.Configuration.ConnectionStringSettings SqlconnStr = rootWebConfig.ConnectionStrings.ConnectionStrings["SQLConnectionString"];
                sqlCnn = new SqlConnection(SqlconnStr.ToString());
            }
        }
        public void conectar()
        {
            oleDbCnn.Open();
        }
        public void desconectar()
        {
            oleDbCnn.Close();
        }
        public DataTable ejecutarConsulta(String txtQuery)
        {
            DataTable dtInformation = new DataTable();
            OleDbDataAdapter oleDbDataAdapter = new OleDbDataAdapter(txtQuery, oleDbCnn);
            oleDbDataAdapter.SelectCommand.CommandType = CommandType.Text;
            oleDbDataAdapter.SelectCommand.CommandTimeout = 3600;
            oleDbDataAdapter.Fill(dtInformation);
            return dtInformation;
        }
        public void ejecutarSPParametros(String txtNombreSP, List<SqlParameter> Parametros)
        {
            SqlConnection cnn = sqlCnn;
            try
            {
                System.Data.DataSet ds = new System.Data.DataSet();
                DataTable dt = new DataTable();
                cnn.Open();
                SqlCommand sqlCmd = new SqlCommand(txtNombreSP, cnn);
                SqlDataAdapter sqlAdt = new SqlDataAdapter();
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddRange(Parametros.ToArray());
                sqlCmd.CommandTimeout = 3600;
                sqlAdt.SelectCommand = sqlCmd;
                sqlAdt.Fill(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
        }

        /// <summary>
        /// Ejecuta procedimiento almacenado que devuelve un valor integer. El procedimiento a llamar debe tener el parametro de salida @Resultado
        /// </summary>
        /// <param name="NombreSp">Nombre del procedimiento</param>
        /// <param name="Parametros">Lista de parametros</param>
        /// <returns>Int</returns>
        public int EjecutarSPParametrosReturnInteger(string NombreSp, List<SqlParameter> Parametros)
        {
            try
            {
                SqlConnection cnn = sqlCnn;
                cnn.Open();
                SqlCommand sqlCmd = new SqlCommand(NombreSp, cnn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddRange(Parametros.ToArray());
                sqlCmd.CommandTimeout = 3600;
                sqlCmd.ExecuteNonQuery();
                int resultado = (int)sqlCmd.Parameters["@Resultado"].Value;
                cnn.Close();
                return resultado;
            }
            catch (Exception ex)
            {
                sqlCnn.Close();
                throw ex;
            }
        }

    }
}