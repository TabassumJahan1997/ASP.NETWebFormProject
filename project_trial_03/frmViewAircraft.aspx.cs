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
    public partial class frmViewAircraft : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                int id = int.Parse((row.FindControl("Label1") as Label).Text);
                txtId.Text = id.ToString();
                string slno = (row.FindControl("Label2") as Label).Text;
                txtSlNo.Text = slno;
                string category = (row.FindControl("Label3") as Label).Text;
                txtCategory.Text = category;
                string condition = (row.FindControl("Label4") as Label).Text;
                txtCondition.Text = condition;
                string manufacturer = (row.FindControl("Label5") as Label).Text;
                txtManufacturer.Text = manufacturer;
                string productionDate = (row.FindControl("Label6") as Label).Text;
                txtProductionDate.Text = productionDate;
                decimal unitPrice = decimal.Parse((row.FindControl("Label7") as Label).Text);
                txtUnitPrice.Text = unitPrice.ToString();
                Image picture = row.FindControl("Image1") as Image;
                Image3 = picture;
            }
        }
    }
}