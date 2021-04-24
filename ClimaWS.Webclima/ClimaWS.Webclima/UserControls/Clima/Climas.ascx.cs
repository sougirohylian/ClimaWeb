using ClimaWS.Webclima.Clases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClimaWS.Webclima.UserControls.Clima
{
    public partial class Climas : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserName"] == null)
                    Response.Redirect("~/Formularios/Site/Login.aspx");
                mtdLoadDDLCiudad();
                mtdLoadDDLEstado();
                if(Session["ClimaMod"] != null)
                {
                    txtIdClima.Text = Session["ClimaMod"].ToString();
                    dvIdClima.Visible = true;
                    btnActualizar.Visible = true;
                    btnRegistrar.Visible = false;
                }
            }
        }
        public void mtdLoadDDLCiudad()
        {
            ddlCiudad.Items.Clear();
            ddlCiudad.Items.Insert(0, new ListItem("--Seleccione--", "0"));
            ddlCiudad.Items.Insert(1, new ListItem("Cali", "1"));
        }
        public void mtdLoadDDLEstado()
        {
            ddlestado.Items.Clear();
            ddlestado.Items.Insert(0, new ListItem("--Seleccione--", "0"));
            ddlestado.Items.Insert(1, new ListItem("Despejado", "1"));
            ddlestado.Items.Insert(2, new ListItem("Nublado", "2"));
            ddlestado.Items.Insert(3, new ListItem("Soleado", "3"));
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string strMsgErr = string.Empty;
            WSClima.WSClimaSoapClient wsClima = new WSClima.WSClimaSoapClient("WSClimaSoap");
            clsDTOClima objClima  = new clsDTOClima();
            objClima.intIdCiudad = ddlCiudad.SelectedIndex;
            objClima.intIdEstado = ddlestado.SelectedIndex;
            objClima.strgrados = txtGrados.Text;
            objClima.strUsuarioCreacion = Session["UserName"].ToString();
            strMsgErr = wsClima.InsertarClima(objClima.strgrados, objClima.intIdCiudad, objClima.intIdEstado, objClima.strUsuarioCreacion);

            if(strMsgErr.Contains("Exito"))
            {
                dvMessageExt.Visible = true;
                lblMessageExt.Text = strMsgErr;
            }
            else
            {
                dvMessageErr.Visible = true;
                lblMessage.Text = strMsgErr;
            }
            
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string strMsgErr = string.Empty;
            WSClima.WSClimaSoapClient wsClima = new WSClima.WSClimaSoapClient("WSClimaSoap");
            clsDTOClima objClima = new clsDTOClima();
            objClima.intIdClima = Convert.ToInt32( txtIdClima.Text);
            objClima.intIdCiudad = ddlCiudad.SelectedIndex;
            objClima.intIdEstado = ddlestado.SelectedIndex;
            objClima.strgrados = txtGrados.Text;
            objClima.strUsuarioCreacion = Session["UserName"].ToString();
            strMsgErr = wsClima.ActualizarClima(objClima.intIdClima,objClima.strgrados, objClima.intIdCiudad, objClima.intIdEstado);

            if (strMsgErr.Contains("Exito"))
            {
                dvMessageExt.Visible = true;
                lblMessageExt.Text = strMsgErr;
            }
            else
            {
                dvMessageErr.Visible = true;
                lblMessage.Text = strMsgErr;
            }
        }
    }
}