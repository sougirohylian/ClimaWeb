using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using ClimaWS.clima.Utilities;
using ClimaWS.clima.BLL;
using ClimaWS.DataAccess;
using System.Data;

namespace ClimaWS.clima
{
    /// <summary>
    /// Descripción breve de WSClima
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WSClima : System.Web.Services.WebService
    {
        private Clima objClima = new Clima();
        private clsBLLclima process = new clsBLLclima();
        [WebMethod]
        public string InsertarClima(string grados, int ciudad, int estado, string user)
        {
            string strMsgError = string.Empty;
            objClima.grados = grados;
            objClima.IdCiudad = ciudad;
            objClima.IdEstado = estado;
            objClima.UsuarioCreacion = user;

            bool flag = process.mdtInsClima(ref strMsgError, objClima);

            return strMsgError;
        }
        [WebMethod]
        public string ActualizarClima(int IdClima,string grados, int ciudad, int estado)
        {
            string strMsgError = string.Empty;

            objClima.IdClima = IdClima;
            objClima.grados = grados;
            objClima.IdCiudad = ciudad;
            objClima.IdEstado = estado;
            

            bool flag = process.mdtUpsClima(ref strMsgError, objClima);

            return strMsgError;
        }
        [WebMethod]
        public string strConsultaClima()
        {
            string strMsgError = string.Empty;
            
            DataTable dtData = process.mdtSelConsultaClima(ref strMsgError);

            if(strMsgError == string.Empty)
            {
                if (dtData.Rows.Count > 0)
                {
                    foreach (DataRow row in dtData.Rows)
                    {
                        strMsgError += "IdClima: "+row["IdClima"].ToString()+" grados: "+row["grados"].ToString()+"<br>";
                    }
                }
            }

            return strMsgError;
        }
        [WebMethod]
        public DataTable dtConsultaClima()
        {
            string strMsgError = string.Empty;

            DataTable dtData = process.mdtSelConsultaClima(ref strMsgError);
            dtData.TableName = "lstClimas";
            return dtData;
        }
        [WebMethod]
        public string EliminarClima(int IdClima)
        {
            string strMsgError = string.Empty;

            objClima.IdClima = IdClima;
            

            bool flag = process.mdtDelClima(ref strMsgError, objClima);

            return strMsgError;
        }
    }
}
