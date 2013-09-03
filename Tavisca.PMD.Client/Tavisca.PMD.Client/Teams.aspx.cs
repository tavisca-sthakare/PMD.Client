using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
    public partial class Teams : System.Web.UI.Page
    {
        public string companyID =null;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserDetails user = (UserDetails)Session["LoggedUser"];
            if (user == null)
                Response.Redirect("Login.aspx");
            companyID = Request.QueryString["companyID"];
        }

        protected void CreateTeamButton_Click(object sender, EventArgs e)
        {

        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {

        }
    }
}