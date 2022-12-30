using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using project_trial_03.DAL;

namespace project_trial_03
{
    public partial class frmCreateUserAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(Connection.GetConnectionString());
            string userId = Page.User.Identity.Name;
            string customerName = txtUserName.Text;
            int gender = int.Parse(ddlGender.SelectedValue);
            int country = int.Parse(ddlCountry.SelectedValue);
            string contact = txtContactNo.Text;
            string email = txtEmail.Text;
            int age = int.Parse(txtAge.Text);
            string password = txtPassword.Text;

            
            SqlCommand command = new SqlCommand(@"INSERT INTO tbl_Customers VALUES(@uid,@cn,@g,@ct,@con,@em,@age,@psd)",connection);
            command.Parameters.AddWithValue("@uid",userId);
            command.Parameters.AddWithValue("@cn",customerName);
            command.Parameters.AddWithValue("@g",gender);
            command.Parameters.AddWithValue("@ct",country);
            command.Parameters.AddWithValue("@con",contact);
            command.Parameters.AddWithValue("@em",email);
            command.Parameters.AddWithValue("@age",age);
            command.Parameters.AddWithValue("@psd",password);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //args.IsValid = (args.Value.Length == 11);
            if (args.Value.Length == 11)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid=false;
            }
        }
    }
}