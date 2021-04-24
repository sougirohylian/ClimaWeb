using ClimaWS.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ClimaWS.clima.DAL;
using System.Data;

namespace ClimaWS.clima.BLL
{
    public class clsBLLclima
    {
        /// <summary>
        /// Metodo para insertar el clima
        /// </summary>
        /// <param name="strErrMsg">Mensaje de error</param>
        /// <returns>Retorna si el proceso fue exitoso o no</returns>
        public bool mdtInsClima(ref string mensaje, Clima objClima)
        {
            bool booResult = false;
            clsDTOclima dbClima = new clsDTOclima();
            try
            {
                dbClima.mdtInsClima(ref mensaje, objClima);
                if (mensaje != string.Empty)
                    booResult = false;
                else
                {
                    booResult = true;
                    mensaje = "Exito! registro realizado satisfactoriamente";
                }
                
            }
            catch (Exception ex)
            {
                mensaje = "Error en la insercion: "+ex.Message;
            }
            return booResult;
        }
        /// <summary>
        /// Metodo para actualizar el clima
        /// </summary>
        /// <param name="strErrMsg">Mensaje de error</param>
        /// <returns>Retorna si el proceso fue exitoso o no</returns>
        public bool mdtUpsClima(ref string mensaje, Clima objClima)
        {
            bool booResult = false;
            clsDTOclima dbClima = new clsDTOclima();
            try
            {
                dbClima.mdtUpsClima(ref mensaje, objClima);
                if (mensaje != string.Empty)
                    booResult = false;
                else
                {
                    booResult = true;
                    mensaje = "Exito! registro actualizado satisfactoriamente";
                }

            }
            catch (Exception ex)
            {
                mensaje = "Error en la actualizacion: " + ex.Message;
            }
            return booResult;
        }
        /// <summary>
        /// Metodo para consukltar el clima
        /// </summary>
        /// <returns>Retorna los datos del clima</returns>
        public DataTable mdtSelConsultaClima(ref string mensaje)
        {
            clsDTOclima dbClima = new clsDTOclima();
            DataTable dtData = new DataTable();
            try
            {
                dtData = dbClima.mtdSelCOnsultaClima();

            }
            catch (Exception ex)
            {
                mensaje = "Error en la consulta: " + ex.Message;
            }
            return dtData;
        }
        /// <summary>
        /// Metodo para Eliminar el clima
        /// </summary>
        /// <param name="strErrMsg">Mensaje de error</param>
        /// <returns>Retorna si el proceso fue exitoso o no</returns>
        public bool mdtDelClima(ref string mensaje, Clima objClima)
        {
            bool booResult = false;
            clsDTOclima dbClima = new clsDTOclima();
            try
            {
                dbClima.mdtDelClima(ref mensaje, objClima);
                if (mensaje != string.Empty)
                    booResult = false;
                else
                {
                    booResult = true;
                    mensaje = "Exito! registro eliminado satisfactoriamente";
                }

            }
            catch (Exception ex)
            {
                mensaje = "Error en la eliminacion: " + ex.Message;
            }
            return booResult;
        }
    }
}