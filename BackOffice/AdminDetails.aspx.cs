using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDetails : System.Web.UI.Page
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
                bindrepeater();
            }
        }

    }

    private void bindrepeater()
    {
        var dc = new DataClassesDataContext();
        var ob = from ta in dc.tblAdmins
                 select new
                 {
                     ta.AdminId,
                     ta.FName,
                     ta.MName,
                     ta.LName,
                     ta.Email,
                     ta.ContactNo,
                     ta.Image,
                     ta.CreatedBy,
                     CreatedBy_Name = (from mn in dc.tblAdmins where mn.AdminId == ta.CreatedBy select mn).Take(1).SingleOrDefault().FName,
                     ta.IsActive
                 };
        admin_grid.DataSource = ob;
        admin_grid.DataBind();
        tblPermission obj = (from oba in dc.tblAdmins join obp in dc.tblPermissions on oba.AdminId equals obp.AdminId where oba.AdminId == Convert.ToInt32(Session["AID"]) select obp).Take(1).SingleOrDefault();
        if (obj.IsInsert == true)
        {
            lbinsert.Visible = true;
        }
        else
        {
            lbinsert.Visible = false;
        }

        foreach (RepeaterItem item in admin_grid.Items)
        {
            HiddenField HId = (HiddenField)item.FindControl("HId");
            Label lblactive = (Label)item.FindControl("lblactive");
            LinkButton lbedit = (LinkButton)item.FindControl("lbedit");
            LinkButton lbdelete = (LinkButton)item.FindControl("lbdelete");
            tblAdmin tbla = (from obe in dc.tblAdmins where obe.AdminId == Convert.ToInt32(HId.Value) select obe).Take(1).SingleOrDefault();
            if (tbla.IsActive == true)
            {
                lblactive.Text = "check";
            }
            else
            {
                lblactive.Text = "clear";
            }
            tblPermission obj1 = (from oba1 in dc.tblAdmins join obp1 in dc.tblPermissions on oba1.AdminId equals obp1.AdminId where oba1.AdminId == Convert.ToInt32(Session["AID"]) select obp1).Take(1).SingleOrDefault();
            if (obj.IsUpdate == true)
            {
                lbedit.Visible = true;
            }
            else
            {
                lbedit.Visible = false;
            }
            tblPermission obj2 = (from oba1 in dc.tblAdmins join obp1 in dc.tblPermissions on oba1.AdminId equals obp1.AdminId where oba1.AdminId == Convert.ToInt32(Session["AID"]) select obp1).Take(1).SingleOrDefault();
            if (obj2.IsDelete == true)
            {
                lbdelete.Visible = true;
            }
            else
            {
                lbdelete.Visible = false;
            }

        }
    }


    protected void Insert_Click(object sender, EventArgs e)
    {
        try
        {
            var ID = Convert.ToInt16(HttpContext.Current.Session["AID"]);
            var dc = new DataClassesDataContext();
            var taa = (from oba in dc.tblAdmins where oba.Email == txtemail.Value select oba).ToList().Count();
            if (taa > 0)
            {
                //cvemail.ErrorMessage = "Email Already Exist!!!";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "EmailVerification()", true);
            }
            else
            {



                tblAdmin ta = new tblAdmin();
                ta.FName = txtfName.Value;
                ta.MName = txtmname.Value;
                ta.LName = txtlname.Value;
                ta.Email = txtemail.Value;
                ta.Password = txtpass.Value;
                ta.ContactNo = txtcno.Value;
                if (fileupload.HasFile)
                {
                    ta.Image = fileupload.FileName;
                    fileupload.SaveAs(Server.MapPath("Admin_Images") + "/" + fileupload.FileName);
                }
                else
                {
                    ta.Image = "default.png";
                }
                ta.IsSuper = false;
                ta.IsActive = true;
                ta.CreatedBy = ID;
                ta.CreatedOn = DateTime.Now;
                dc.tblAdmins.InsertOnSubmit(ta);
                dc.SubmitChanges();
                var last = (from ob in dc.tblAdmins orderby ob.AdminId descending select ob).Take(1).SingleOrDefault().AdminId;
                tblPermission tp = new tblPermission();
                tp.AdminId = last;
                tp.IsDelete = false;
                tp.IsInsert = false;
                tp.IsUpdate = false;
                dc.tblPermissions.InsertOnSubmit(tp);
                dc.SubmitChanges();
                tblAction ac = new tblAction();
                ac.AdminId = Convert.ToInt32(Session["AID"]);
                ac.PageName = "AdminDetails.aspx";
                ac.Action = "Insert";
                ac.CreatedOn = DateTime.Now;
                ac.MacAddress = Service.GetMacAddress();
                dc.tblActions.InsertOnSubmit(ac);
                dc.SubmitChanges();



                bindrepeater();
            }
        }
        catch (Exception ex)
        {
            var dc = new DataClassesDataContext();
            tblError err = new tblError();
            err.PageName = "AdminDetail.aspx";
            err.MacAddress = Service.GetMacAddress();
            err.Description = ex.ToString();
            err.CreatedOn = DateTime.Now;
            err.AdminId = Convert.ToInt32(Session["AID"]);
            err.UserType = "Admin";
            dc.tblErrors.InsertOnSubmit(err);
            dc.SubmitChanges();
            Response.Redirect("Error.aspx");
        }
    }


    protected void admin_grid_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var dc = new DataClassesDataContext();
        int ID = Convert.ToInt32(e.CommandArgument);
        int activeID = Convert.ToInt32(Session["AID"]);
        tblAdmin ta = dc.tblAdmins.SingleOrDefault(ob => ob.AdminId == ID);
        tblAdmin tactive = dc.tblAdmins.SingleOrDefault(ob1 => ob1.AdminId == activeID);
        if (e.CommandName == "delete")
        {
            try
            {

                if (tactive.IsSuper == true)
                {
                    if (ta.IsActive == true)
                    {
                        ta.IsActive = false;
                    }
                    dc.SubmitChanges();
                }
                else
                {
                    if (ta.IsSuper == true)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "alert('Access Denied')", true);
                    }
                    else
                    {
                        if (ta.IsActive == true)
                        {
                            ta.IsActive = false;
                        }
                        dc.SubmitChanges();
                    }
                }
                tblAction ac = new tblAction();
                ac.AdminId = Convert.ToInt32(Session["AID"]);
                ac.PageName = "AdminDetails.aspx";
                ac.Action = "Delete";
                ac.CreatedOn = DateTime.Now;
                ac.MacAddress = Service.GetMacAddress();
                dc.tblActions.InsertOnSubmit(ac);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                tblError err = new tblError();
                err.PageName = "AdminDetail.aspx";
                err.MacAddress = Service.GetMacAddress();
                err.Description = ex.ToString();
                err.CreatedOn = DateTime.Now;
                err.AdminId = Convert.ToInt32(Session["AID"]);
                dc.tblErrors.InsertOnSubmit(err);
                dc.SubmitChanges();
                Response.Redirect("Error.aspx");
            }



        }
        else if (e.CommandName == "active")
        {
            if (ta.IsActive == false)
            {
                ta.IsActive = true;
            }
            dc.SubmitChanges();
        }

        else if (e.CommandName == "edit")
        {
            if (tactive.IsSuper == true)
            {
                Response.Redirect("AdminEdit.aspx?EID=" + ID);
            }
            else
            {
                if (ta.IsSuper == true)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "alert('Access Denied')", true);
                }
                else
                {
                    Response.Redirect("AdminEdit.aspx?EID=" + ID);
                }
            }


        }
        else if (e.CommandName == "view")
        {
            Response.Redirect("AdminView.aspx?VID=" + ID);
        }
        bindrepeater();
    }
}