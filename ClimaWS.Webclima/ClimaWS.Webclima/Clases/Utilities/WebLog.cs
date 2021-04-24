using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ClimaWS.Webclima.Clases.Utilities
{
    public class WebLog : System.Web.UI.Page
    {
        public void errorMessage(string message)
        {
            StreamWriter sWErrorMess = new StreamWriter(Server.MapPath("~/Log/WEBLog.txt"), true);

            try
            {
                sWErrorMess.WriteLine(message + " " + Convert.ToString(DateTime.Now));
                sWErrorMess.Flush();
                sWErrorMess.Close();
            }
            catch
            {
                sWErrorMess.Flush();
                sWErrorMess.Close();
            }
        }
    }
}