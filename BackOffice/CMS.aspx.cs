using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CMS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                var dc = new DataClassesDataContext();
                tblPermission ob = (from ob1 in dc.tblPermissions where ob1.AdminId == Convert.ToInt32(Session["AID"]) select ob1).Take(1).SingleOrDefault();
                if (ob.IsInsert == true)
                {
                    btnCmsAdd.Visible = true;
                    Panel1.Visible = true;

                }
                else
                {
                    btnCmsAdd.Visible = false;
                    Panel1.Visible = false;
                }
                    BindCMS();
            }
        }

    }
    private void BindCMS()
    {
        var dc = new DataClassesDataContext();
        var c = from ob in dc.tblCMSPages where ob.IsActive == true orderby ob.CmsPageId descending select ob;
        ddCMSPage.DataTextField = "Title";
        ddCMSPage.DataValueField = "CmsPageId";
        ddCMSPage.DataSource = c;
        ddCMSPage.DataBind();
        ListItem itm = new ListItem("Select CMS", "0");
        itm.Selected = true;
        ddCMSPage.Items.Add(itm);
        //tblCMSPage C2 = (from ob1 in dc.tblCMSPages where ob1.CmsPageId == Convert.ToInt32(ddCMSPage.SelectedValue) select ob1).Take(1).SingleOrDefault();
        //txtDec.Text = C2.Description;
    }

    protected void btnCmsAdd_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        tblCMSPage Cm = new tblCMSPage();
        Cm.Title = txtAddCms.Value;
        Cm.Description = txtDec.Text;
        Cm.IsActive = true;
        Cm.CreatedOn = DateTime.Now;
        Cm.CreatedBy = Convert.ToInt32(Session["AID"]);
        Cm.ModifiedBy = null;
        Cm.ModifiedOn = null;
        dc.tblCMSPages.InsertOnSubmit(Cm);
        dc.SubmitChanges();
        txtAddCms.Value = "";
        txtDec.Text = "";
        BindCMS();
    }
    protected void ddCMSPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddCMSPage.SelectedValue == "0")
        {
            Response.Redirect("CMS.aspx");
        }
        else
        {
            btnSaveCms.Visible = true;
            txtDec.Text = "";
            var dc = new DataClassesDataContext();
            tblCMSPage C3 = (from ob in dc.tblCMSPages where ob.CmsPageId == Convert.ToInt32(ddCMSPage.SelectedValue) select ob).Take(1).SingleOrDefault();
            //C3.Description = txtDec.Text;
            txtDec.Text = C3.Description;
        }
    }
    protected void btnSaveCms_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        tblCMSPage Cs = (from ob in dc.tblCMSPages where ob.CmsPageId == Convert.ToInt32(ddCMSPage.SelectedValue) select ob).Take(1).SingleOrDefault();
        Cs.Description = txtDec.Text;
        dc.SubmitChanges();
    }
}