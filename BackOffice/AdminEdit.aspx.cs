using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_AdminEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var ID = Convert.ToString(HttpContext.Current.Session["AID"]);
            if (ID == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                binddata();
            }
        }
    }

    private void binddata()
    {
        var Id = Request.QueryString["EID"];
        var dc = new DataClassesDataContext();
        tblAdmin ta = (from ob in dc.tblAdmins where ob.AdminId == Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
        txtefname.Value = ta.FName;
        txtemname.Value = ta.MName;
        txtelname.Value = ta.LName;
        txteemail.Value = ta.Email;
        txtecno.Value = ta.ContactNo;
        Image1.ImageUrl = "Admin_Images/" + ta.Image;
        tblPermission tp = (from ob1 in dc.tblPermissions where ob1.AdminId == Convert.ToInt32(Id) select ob1).Take(1).SingleOrDefault();
        chkInsert.Checked = Convert.ToBoolean(tp.IsInsert);
        chkUpdate.Checked = Convert.ToBoolean(tp.IsUpdate);
        chkDelete.Checked = Convert.ToBoolean(tp.IsDelete);

    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        var Id = Request.QueryString["EID"];
        var dc = new DataClassesDataContext();
        tblAdmin ta = (from ob in dc.tblAdmins where ob.AdminId == Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
        ta.FName = txtefname.Value;
        ta.MName = txtemname.Value;
        ta.LName = txtelname.Value;
        ta.Email = txteemail.Value;
        ta.ContactNo = txtecno.Value;
        tblPermission tp = (from ob1 in dc.tblPermissions where ob1.AdminId == Convert.ToInt32(Id) select ob1).Take(1).SingleOrDefault();
        tp.IsInsert = chkInsert.Checked;
        tp.IsUpdate = chkUpdate.Checked;
        tp.IsDelete = chkUpdate.Checked;
        dc.SubmitChanges();
        Response.Redirect("AdminDetails.aspx");
    }
}