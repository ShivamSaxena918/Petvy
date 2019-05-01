using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Permission : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    private void BindGrid()
    {
        var dc = new DataClassesDataContext();
        var data = from ob in dc.tblAdmins
                   join ob2 in dc.tblPermissions on ob.AdminId equals ob2.AdminId
                   select new
                   {
                       ob.FName,
                       ob.Image,
                       ob2.IsInsert,
                       ob2.IsUpdate,
                       ob2.IsDelete,
                       ob2.PermissionId
                   };
        rptpremission.DataSource = data;
        rptpremission.DataBind();
        foreach (RepeaterItem item in rptpremission.Items)
        {
            HiddenField HId = (HiddenField)item.FindControl("HId");
            Label lblinsert = (Label)item.FindControl("lblinsert");
            Label lblupdate = (Label)item.FindControl("lblupdate");
            Label lbldelete = (Label)item.FindControl("lbldelete");
            tblPermission obj = (from obe in dc.tblPermissions where obe.PermissionId == Convert.ToInt32(HId.Value) select obe).Take(1).SingleOrDefault();
            if (obj.IsInsert == true)
            {
                lblinsert.Text = "check";
            }
            else
            {
                lblinsert.Text = "clear";
            }
            if (obj.IsUpdate == true)
            {
                lblupdate.Text = "check";
            }
            else
            {
                lblupdate.Text = "clear";
            }
            if (obj.IsDelete == true)
            {
                lbldelete.Text = "check";
            }
            else
            {
                lbldelete.Text = "clear";
            }
        }
    }
    protected void rptpremission_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var ID = Convert.ToInt32(e.CommandArgument);
        var dc = new DataClassesDataContext();
        tblPermission obj = dc.tblPermissions.SingleOrDefault(ob => ob.PermissionId == ID);
        tblAdmin oba = (from ob in dc.tblAdmins where ob.AdminId == Convert.ToInt32(Session["AID"]) select ob).Take(1).SingleOrDefault();
        if (oba.IsSuper == true)
        {
            if (e.CommandName == "insert")
            {
                if (obj.IsInsert == true)
                {
                    obj.IsInsert = false;
                }
                else
                {
                    obj.IsInsert = true;
                }
            }
            else if (e.CommandName == "update")
            {
                if (obj.IsUpdate == true)
                {
                    obj.IsUpdate = false;
                }
                else
                {
                    obj.IsUpdate = true;
                }
            }
            else if (e.CommandName == "delete")
            {
                if (obj.IsDelete == true)
                {
                    obj.IsDelete = false;
                }
                else
                {
                    obj.IsDelete = true;
                }
            }
            dc.SubmitChanges();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "alert('You Are Not Super Admin')", true);
        }
            BindGrid();
        }
    }