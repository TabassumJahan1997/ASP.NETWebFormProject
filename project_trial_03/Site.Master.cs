using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_trial_03
{
    public partial class Site : System.Web.UI.MasterPage
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/frmLogIn.aspx");
        }

        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    lblTimer.Text = DateTime.Now.ToString("hh:mm:ss tt");
        //}
    }
}