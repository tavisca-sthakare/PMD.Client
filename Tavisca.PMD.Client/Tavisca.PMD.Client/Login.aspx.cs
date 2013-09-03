using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.IO;
using Tavisca.PMD.ClientProxy;
namespace Tavisca.PMD.Client
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();

            //this.Master.FindControl("LogOutDiv").Visible = false;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                UserDetails user = new UserDetails();
                string userEmail = UserName.Text;
                string password = Password.Text;
                UserLoginClient client = new UserLoginClient();
                user = client.Authentication(userEmail, password);
                if (user != null)
                {
                    Session["LoggedUser"] = user;
                    Response.Redirect("DashboardHome.aspx");
                }

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Login ID Or Password is incorrect');", true);
            }
        }
    }
}