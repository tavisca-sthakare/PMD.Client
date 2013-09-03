using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;


namespace Tavisca.PMD.Client
{
    public partial class DashboardDescription : System.Web.UI.Page
    {
        public int dashboardID = 0;
        public int UserID = 0;
        public UserDetails user = new UserDetails();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            dashboardID = int.Parse(Request.QueryString["id"]);
            user = (UserDetails)Session["LoggedUser"];
            if (user == null)
                Response.Redirect("Login.aspx");
            Dashboard currentDashboard = new Dashboard();
            List<Dashboard> dashboardlist = new List<Dashboard>();
            dashboardlist = user.UserDashboards.ToList();
            currentDashboard = dashboardlist.Find(dash => dash.DashboardId == dashboardID);
            LblDashboardName.Text = currentDashboard.DashboardName;
            lblStartDate.Text = currentDashboard.StartMonth + " / " + currentDashboard.StartYear;
            lblEndDate.Text = currentDashboard.EndMonth + " / " + currentDashboard.EndYear;
            //lblDescription.Text = "Pheonix is a a customer focused organization, we partner with our clients to automate post booking manual processes, provide strong back-office and customer service solutions for agency productivity, support rich customer profile management, offer flexible CMS / branding solutions for faster time to market & ensure that all the content is up-to-date";
            lblDescription.Text = currentDashboard.Description;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditDashboard.aspx?id=" + dashboardID);
        }
      
    }
}