using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClimaWS.Webclima.UserControls.Site
{
    public partial class Home : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if(Session["UserName"] == null)
                    Response.Redirect("~/Formularios/Site/Login.aspx");

                mtdLoadClimas();
            }
        }
        public void mtdLoadClimas()
        {
            DataTable dtClimas = new DataTable();
            string strMsgErr = string.Empty;
            WSClima.WSClimaSoapClient wsClima = new WSClima.WSClimaSoapClient("WSClimaSoap");
            try
            {
                dtClimas = wsClima.dtConsultaClima();
                gvClimas.DataSource = dtClimas;
                gvClimas.DataBind();
            }
            catch(Exception ex)
            {
                strMsgErr = ex.Message;
            }
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Clima/Climas.aspx", false);
        }

        protected void gvClimas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Eliminar")
            {
                try
                {
                    int RowGrid = Convert.ToInt16(e.CommandArgument);
                    GridViewRow row = gvClimas.Rows[RowGrid];
                    Session["ClimaDel"] = row.Cells[0].Text;
                    //Mensaje("¿Desea eliminar el registro del Clima?");
                }
                catch (Exception ex)
                {
                    dvMessage.Visible = true;
                    lblMessage.Text = "Error! error: " + ex.Message;
                }

            }
            if (e.CommandName.ToString() == "Select")
            {
                try
                {
                    int RowGrid = Convert.ToInt16(e.CommandArgument);
                    GridViewRow row = gvClimas.Rows[RowGrid];
                    Session["ClimaMod"] = row.Cells[0].Text;
                    Response.Redirect("~/Formularios/Clima/Climas.aspx", false);
                }
                catch (Exception ex)
                {
                    dvMessage.Visible = true;
                    lblMessage.Text = "Error! error: " + ex.Message;
                }

            }
        }
       
    }
}