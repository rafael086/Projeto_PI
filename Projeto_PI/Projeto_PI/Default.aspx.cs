using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Apoio;
namespace Projeto_PI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Page.VerificaAcesso();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}