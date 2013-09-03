using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
	public partial class DashboardItemTeams : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
        {
            //this.Master.FindControl("HeaderDiv").Visible = false;
            UserDetails user = new UserDetails();
            user = (UserDetails)Session["LoggedUser"];
            if (user == null)
                Response.Redirect("Login.aspx");
		}
	}
}