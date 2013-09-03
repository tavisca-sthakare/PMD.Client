﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
    public partial class DashboardDetails : System.Web.UI.Page
    {
        public int dashboardID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserDetails user = new UserDetails();
            user = (UserDetails)Session["LoggedUser"];
            if (user == null)
                Response.Redirect("Login.aspx");
            dashboardID = int.Parse(Request.QueryString["id"]);
        }
    }
}