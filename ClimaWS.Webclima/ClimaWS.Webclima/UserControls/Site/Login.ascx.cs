using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClimaWS.Webclima.Clases.DTO;
using ClimaWS.Webclima.Clases.BLL;
namespace ClimaWS.Webclima.UserControls.Site
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            clsDTOUsuarios objUsers = new clsDTOUsuarios();
            clsBLLlogin process = new clsBLLlogin();

            objUsers.strUsuario = txtUsername.Text;
            objUsers.strPassword = txtPassword.Text;

            Boolean flag = false;
            string strMsgErr = string.Empty;
            flag = process.mtdVerificaLogin(ref strMsgErr, ref objUsers);

            if (strMsgErr != string.Empty)
            {
                dvMessage.Visible = true;
                lblMessage.Text = strMsgErr;
            }
            else
            {
                Session["UserName"] = objUsers.strUsuario;
                Response.Redirect("~/Formularios/Site/Home.aspx", false);
            }
                
        }
    }
}