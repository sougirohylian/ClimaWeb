using ClimaWS.clima.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClimaWS.DataAccess;
namespace ClimaWS.clima.DAL
{
    public class clsDTOclima
    {
        private cDataBase cDataBase = new cDataBase();
        private WSLog WSLog = new WSLog();

        public void mdtInsClima(ref string mensaje, Clima objClima)
        {
            // Se pasa la condicion a la consulta del procedimiento almacenado
            try
            {
                List<SqlParameter> parametros = new List<SqlParameter>()
                        {
                            new SqlParameter() { ParameterName = "@grados", SqlDbType = SqlDbType.VarChar, Value =  objClima.grados },
                            new SqlParameter() { ParameterName = "@IdCiudad", SqlDbType = SqlDbType.Int, Value = objClima.IdCiudad},
                            new SqlParameter() { ParameterName = "@IdEstado", SqlDbType = SqlDbType.Int, Value = objClima.IdEstado},
                            new SqlParameter() { ParameterName = "@User", SqlDbType = SqlDbType.VarChar, Value = objClima.UsuarioCreacion}
                        };
                cDataBase.ejecutarSPParametros("[clima].[InsClima]", parametros);

            }
            catch (Exception ex)
            {
                mensaje = "Error en la consulta: " + ex.Message;
            }
        }
        public void mdtUpsClima(ref string mensaje, Clima objClima)
        {
            // Se pasa la condicion a la consulta del procedimiento almacenado
            try
            {
                List<SqlParameter> parametros = new List<SqlParameter>()
                        {
                            new SqlParameter() { ParameterName = "@grados", SqlDbType = SqlDbType.VarChar, Value =  objClima.grados },
                            new SqlParameter() { ParameterName = "@IdCiudad", SqlDbType = SqlDbType.Int, Value = objClima.IdCiudad},
                            new SqlParameter() { ParameterName = "@IdEstado", SqlDbType = SqlDbType.Int, Value = objClima.IdEstado},
                            new SqlParameter() { ParameterName = "@IdClima", SqlDbType = SqlDbType.Int, Value = objClima.IdClima}
                        };
                cDataBase.ejecutarSPParametros("[clima].[UpsClima]", parametros);

            }
            catch (Exception ex)
            {
                mensaje = "Error en la consulta: " + ex.Message;
            }
        }
        public DataTable mtdSelCOnsultaClima()
        {
            DataTable dtInformacion = new DataTable();
            String condicion = string.Empty;
            try
            {
               
                    cDataBase.conectar();
                    dtInformacion = cDataBase.ejecutarConsulta("exec [clima].[SelClima]");
                    cDataBase.desconectar();
                
            }
            catch (Exception ex)
            {
                cDataBase.desconectar();
                WSLog.errorMessage("ERROR : ConsultaClima >> " + ex.Message + ", " + ex.StackTrace);
                throw new Exception(ex.Message);
            }
            return dtInformacion;
        }
        public void mdtDelClima(ref string mensaje, Clima objClima)
        {
            // Se pasa la condicion a la consulta del procedimiento almacenado
            try
            {
                List<SqlParameter> parametros = new List<SqlParameter>()
                        {
                            new SqlParameter() { ParameterName = "@IdClima", SqlDbType = SqlDbType.Int, Value = objClima.IdClima}
                        };
                cDataBase.ejecutarSPParametros("[clima].[DelClima]", parametros);

            }
            catch (Exception ex)
            {
                mensaje = "Error en la eliminacion: " + ex.Message;
            }
        }
    }
}