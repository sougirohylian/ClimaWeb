using ClimaWS.Webclima.Clases.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClimaWS.Webclima.Clases.DTO;
using System.Data;

namespace ClimaWS.Webclima.Clases.DAL
{
    public class clsDALlogin
    {
        private cDataBase cDataBase = new cDataBase();
        private WebLog WSLog = new WebLog();

        public DataTable mdtSelLogin(ref string mensaje, clsDTOUsuarios objUsers)
        {
            DataTable dtData = new DataTable();
            // Se pasa la condicion a la consulta del procedimiento almacenado
            try
            {
                List<SqlParameter> parametros = new List<SqlParameter>()
                        {
                            new SqlParameter() { ParameterName = "@User", SqlDbType = SqlDbType.VarChar, Value =  objUsers.strUsuario },
                            new SqlParameter() { ParameterName = "@Pass", SqlDbType = SqlDbType.VarChar, Value = objUsers.strPassword},
                        };
                dtData = cDataBase.EjecutarSPParametrosReturnDatatable("[seguridad].[SelLogin]", parametros);

            }
            catch (Exception ex)
            {
                mensaje = "Error en la consulta: " + ex.Message;
            }
            return dtData;
        }
    }
}