﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
    public partial class EditDashboardUser : System.Web.UI.Page
    {
       
        public int CompanyId = 0; 
        public string AccessRight = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.Master.FindControl("HeaderDiv").Visible = false;
            UserDetails user = (UserDetails)Session["LoggedUser"];
            if (user == null)
                Response.Redirect("Login.aspx");
            CompanyId = user.CompanyId;
            int dashboardID=int.Parse(Request.QueryString["id"]);
            Dashboard currentDashboard = new Dashboard();
            List<Dashboard> dashboardlist = new List<Dashboard>();
            dashboardlist = user.UserDashboards.ToList();
            currentDashboard = dashboardlist.Find(dash => dash.DashboardId == dashboardID);
            AccessRight = currentDashboard.UserAccessRight.AccessRightName;
        }
    }
}