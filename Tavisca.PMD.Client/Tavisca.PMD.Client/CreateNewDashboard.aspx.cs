using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavisca.PMD.ClientProxy;

namespace Tavisca.PMD.Client
{
    public partial class CreateNewDashboard : System.Web.UI.Page
    {
        public int UserId;
        public void Page_Load(object sender, EventArgs e)
        {
            //startYear.Text = DateTime.Today.Year.ToString();
            //endYear.Text = (DateTime.Today.Year + 1).ToString();
            UserDetails user = new UserDetails();
            user = (UserDetails)Session["LoggedUser"];
            if (user == null)
                Response.Redirect("Login.aspx");
            UserLoginClient client = new UserLoginClient();
            UserId = user.UserId;
            

        }

        protected void endYear_TextChanged(object sender, EventArgs e)
        {


            string startmonth = startMonth.SelectedValue;
            string endmonth = endMonth.SelectedValue;
            string day = "1";

            string startY = startYear.Text;
            string endY = endYear.Text;

            string concatedStartDate = day + "-" + startmonth + "-" + startY;
            string concatedEndDate = day + "-" + endmonth + "-" + endY;
            //SDate.Text = concatedStartDate;
            //EDate.Text = concatedEndDate;

            SDate.Text = Convert.ToDateTime(concatedStartDate).ToShortDateString();
            EDate.Text = Convert.ToDateTime(concatedEndDate).ToShortDateString();
            //    DateTime s = Convert.ToDateTime(concatedStartDate).ToShortDateString();

            EDate.Text = Convert.ToDateTime(concatedEndDate).ToShortDateString();
            //  int weeks = ((Convert.ToDateTime(concatedStartDate)) - (Convert.ToDateTime(concatedEndDate))).TotalDays / 7;
            // int weeks = (SDate.Text - EDate.Text).TotalDays / 7;
            //  DateTime ssdate = concatedStartDate;
            //TimeSpan span = concatedEndDate - concatedStartDate;
            //newlabel.Text = (((((Convert.ToInt32(endY) - Convert.ToInt32(startY)) * 365) - 365) + (12 - Convert.ToInt32(startmonth) + Convert.ToInt32(endmonth)) * 30) / 7).ToString();
           
        }

        protected void Testbutton_Click(object sender, EventArgs e)
        {
            
        }
    }
}