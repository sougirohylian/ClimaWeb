using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClimaWS.Webclima.Clases.DTO
{
    public class clsDTOClima
    {
        private int _IdClima;
        private string _grados;
        private int _IdCiudad;
        private int _IdEstado;
        private DateTime _FechaCreacion;
        private string _UsuarioCreacion;
        public int intIdClima
        {
            get { return _IdClima; }
            set { _IdClima = value; }
        }

        public string strgrados
        {
            get { return _grados; }
            set { _grados = value; }
        }
        public int intIdCiudad
        {
            get { return _IdCiudad; }
            set { _IdCiudad = value; }
        }
        public int intIdEstado
        {
            get { return _IdEstado; }
            set { _IdEstado = value; }
        }

        public DateTime dtFechaRegistro
        {
            get { return _FechaCreacion; }
            set { _FechaCreacion = value; }
        }
        public string strUsuarioCreacion
        {
            get { return _UsuarioCreacion; }
            set { _UsuarioCreacion = value; }
        }
        #region Constructors
        public clsDTOClima()
        {
        }

        public clsDTOClima(int intIdClima, string strgrados, int intIdCiudad, int intIdEstado, DateTime dtFechaCreacion,
            string strUsuarioCreacion)
        {
            this.intIdClima = intIdClima;
            this.strgrados = strgrados;
            this.intIdCiudad = intIdCiudad;
            this.intIdEstado = intIdEstado;
            this.dtFechaRegistro = dtFechaRegistro;
            this.strUsuarioCreacion = strUsuarioCreacion;
            
        }
        #endregion
    }
}