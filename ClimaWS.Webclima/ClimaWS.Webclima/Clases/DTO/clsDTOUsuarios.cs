using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClimaWS.Webclima.Clases.DTO
{
    public class clsDTOUsuarios
    {
        private int _IdUsuario;
        private string _Usuario;
        private string _Password;
        private int _IdRol;
        private DateTime _FechaCreacion;
        private bool _Estado;
        private bool _Login;

        public int intIdUsuario
        {
            get { return _IdUsuario; }
            set { _IdUsuario = value; }
        }
        
        public string strUsuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        public string strPassword
        {
            get { return _Password; }
            set { _Password = value; }
        }
        public int intIdRol
        {
            get { return _IdRol; }
            set { _IdRol = value; }
        }

        public DateTime dtFechaRegistro
        {
            get { return _FechaCreacion; }
            set { _FechaCreacion = value; }
        }
        public bool boEstado
        {
            get { return _Estado; }
            set { _Estado = value;}
        }
        public bool boLogin
        {
            get { return _Login; }
            set { _Login = value; }
        }
        #region Constructors
        public clsDTOUsuarios()
        {
        }

        public clsDTOUsuarios(int intIdUsuario, string strUsuario, string strPassword, int intIdRol, DateTime dtFechaCreacion,
            bool boEstado, bool boLogin)
        {
            this.intIdUsuario = intIdUsuario;
            this.strUsuario = strUsuario;
            this.strPassword = strPassword;
            this.dtFechaRegistro = dtFechaRegistro;
            this.boEstado = boEstado;
            this.boLogin = boLogin;
        }
        #endregion
    }
}