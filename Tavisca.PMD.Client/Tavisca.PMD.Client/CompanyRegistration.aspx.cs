using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
    public partial class CompanyRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

    
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
           UserDetails NewUser = new UserDetails();
           Company newcompany = new Company();
           newcompany.Name = CompanyName.Text;
           newcompany.Account = txtCompanyAccount.Text;
           newcompany.Url = txtCompanyURL.Text;
           UserRegistrationClient client = new UserRegistrationClient();
           NewUser.CompanyId = client.CompanyRegistration(newcompany);
           NewUser.FirstName = FirstName.Text;
           NewUser.LastName= LastName.Text;
           NewUser.UserEmail = Email.Text;
           NewUser.EncryptedPassword = Password.Text;
           NewUser.IsOwner = true;
           bool success = client.UserRegistration(NewUser);
           if(success)
               ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('You and your Company are registered');", true);
           else
               ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('error');", true);
            Response.Redirect("Login.aspx");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}