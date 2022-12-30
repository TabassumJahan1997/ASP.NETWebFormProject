using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_trial_03
{
    public partial class frmManageAircrafts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            //FileUpload fileUpload = DetailsView1.FindControl("fileUploadPicture") as FileUpload;
            //if (fileUpload.HasFile)
            //{
            //    string fileName = Guid.NewGuid() + "_" + Path.GetExtension(fileUpload.FileName);
            //    fileUpload.PostedFile.SaveAs(Server.MapPath("~/AircraftImages/")+fileName);
            //    e.Values["picUrl"] = fileName;
            //}

        }

        protected void GridView5_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //FileUpload fileUpload = GridView5.Rows[e.RowIndex].FindControl("fileUploadEditPicture") as FileUpload;
            //if (fileUpload != null)
            //{
            //    if (fileUpload.PostedFile.ContentLength > 0)
            //    {
            //        string fileName = Guid.NewGuid() + "_" + Path.GetExtension(fileUpload.FileName);
            //        fileUpload.PostedFile.SaveAs(Server.MapPath("~/AircraftImages/")+fileName);
            //        e.NewValues["picUrl"] = fileName;
            //    }
            //}

            
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload fileUpload = (FileUpload)ListView1.InsertItem.FindControl("fuInsertAircraftPicture");
            if (fileUpload.HasFile)
            {
                string fileName = Guid.NewGuid() + "_" + Path.GetExtension(fileUpload.FileName);
                fileUpload.PostedFile.SaveAs(Server.MapPath("~/AircraftImages/")+fileName);
                e.Values["picUrl"] = fileName;
            }
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            FileUpload fileUpload = (FileUpload)ListView1.EditItem.FindControl("fuEditAircraftPicture");
            if (fileUpload.HasFile)
            {
                string fileName = Guid.NewGuid() + "_" + Path.GetExtension(fileUpload.FileName);
                fileUpload.PostedFile.SaveAs(Server.MapPath("~/AircraftImages/") + fileName);
                e.NewValues["picUrl"] = fileName;
                
            }
        }
    }
}