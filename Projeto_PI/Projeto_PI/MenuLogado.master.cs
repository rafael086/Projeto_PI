using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projeto_PI
{
    public partial class MenuLogado : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            aSair.ServerClick += ASair_ServerClick;
        }
 
        private void ASair_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);          
        }
    }
}