using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ClimaWS.Webclima.Clases.DTO;
using ClimaWS.Webclima.Clases.DAL;
using System.Data;

namespace ClimaWS.Webclima.Clases.BLL
{
    public class clsBLLlogin
    {
        public Boolean mtdVerificaLogin(ref string strMsgErr, ref clsDTOUsuarios objUsers)
        {
            Boolean flag = false;
            DataTable dtInfo = new DataTable();
            clsDALlogin dbLogin = new clsDALlogin();
            try
            {
                dtInfo = dbLogin.mdtSelLogin(ref strMsgErr, objUsers);
                if (dtInfo.Rows.Count > 0)
                {
                    flag = true;
                    foreach (DataRow row in dtInfo.Rows)
                    {
                        objUsers.intIdUsuario = Convert.ToInt32(row["IdUsuario"].ToString());
                        objUsers.intIdRol = Convert.ToInt32(row["IdRol"].ToString());
                        objUsers.boEstado = Convert.ToBoolean(row["Estado"].ToString());
                        objUsers.boLogin = Convert.ToBoolean(row["Login"].ToString());
                    }

                }
            }catch(Exception ex)
            {
                strMsgErr = "Error: error en la consulta del login: " + ex.Message;
            }
            
            return flag;
        }
    }
}