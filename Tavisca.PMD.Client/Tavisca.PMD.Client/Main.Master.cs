using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
    public partial class Main : System.Web.UI.MasterPage
    {
        //bool hasDashboard = false;
        public string pageName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            UserDetails user = new UserDetails();
            user = (UserDetails)Session["LoggedUser"];
            if (user != null)
            {
                Name.Text = user.FirstName + " " + user.LastName;
                Company.Text = user.CompanyId.ToString();
                
                pageName = this.MainContent.Page.GetType().FullName;
                
            }
        }
    }
}