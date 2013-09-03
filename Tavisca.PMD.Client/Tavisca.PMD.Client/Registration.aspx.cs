using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserRegistrationClient ClientCompany = new UserRegistrationClient();
            Company[] Companynames = ClientCompany.RetriveCompanyNames();
            for (int i = 0; i < Companynames.Length; i++)
            {
                CompanyID.Items.Add(new ListItem(Companynames[i].Name,Companynames[i].CompanyID.ToString()));
            }
        }
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            UserDetails NewUser = new UserDetails();
            NewUser.CompanyId = Convert.ToInt32(CompanyID.SelectedValue);
            NewUser.FirstName = FirstName.Text;
            NewUser.LastName= LastName.Text;
            NewUser.UserEmail = Email.Text;
            NewUser.EncryptedPassword = Password.Text;
            NewUser.IsOwner = false;
            UserRegistrationClient client = new UserRegistrationClient();
            bool success = client.UserRegistration(NewUser);
            if(success)
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('You are registered');", true);
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