using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var ID = Convert.ToString(Session["AID"]);
        if (!IsPostBack)
        {
            if (ID != null)
            {
                BindCategories();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    private void BindCategories()
    {
        var dc = new DataClassesDataContext();
        var data = from ob in dc.tblCategories
                   select new
                   {
                       ob.CategoryId,
                       ob.Name,
                       ob.IsActive,
                       ob.CreatedOn,
                       ob.Desc,
                       CategorytypeName = (from ob1 in dc.tblCategories where ob1.CategoryId == ob.ParentCategoryId select ob1).Take(1).SingleOrDefault().Name,

                   };
        rptcategory.DataSource = data;
        rptcategory.DataBind();
        tblPermission obj = (from oba in dc.tblAdmins join obp in dc.tblPermissions on oba.AdminId equals obp.AdminId where oba.AdminId == Convert.ToInt32(Session["AID"]) select obp).Take(1).SingleOrDefault();
        if (obj.IsInsert == true)
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
        var cate = from ob in dc.tblCategories where ob.ParentCategoryId == null && ob.IsActive == true select ob;
        ddCategoriesName.DataTextField = "Name";
        ddCategoriesName.DataValueField = "CategoryId";
        ddCategoriesName.DataSource = cate;
        ddCategoriesName.DataBind();
        ListItem itm = new ListItem("Select Categories", "");
        itm.Selected = true;
        ddCategoriesName.Items.Add(itm);
        foreach (RepeaterItem item in rptcategory.Items)
        {
            HiddenField HId = (HiddenField)item.FindControl("HId");
            Label lblactive = (Label)item.FindControl("lblactive");
            tblCategory cate1 = (from obe in dc.tblCategories where obe.CategoryId == Convert.ToInt32(HId.Value) select obe).Take(1).SingleOrDefault();
            if (cate1.IsActive == true)
            {
                lblactive.Text = "check";
            }
            else
            {
                lblactive.Text = "clear";
            }

        }

    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var Id = ddCategoriesName.SelectedValue;
        var taa = (from oba in dc.tblCategories where oba.Name == txtCategoryName.Value select oba).ToList().Count();
        if (taa > 0)
        {
            //cvemail.ErrorMessage = "Email Already Exist!!!";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "CategoryVerification()", true);
        }
        else
        {
            tblCategory obj = new tblCategory();
            if (Id == "")
            {
                obj.Name = txtCategoryName.Value;
                obj.IsActive = true;
                obj.CreatedOn = DateTime.Now;
                obj.Desc = txtdesc.Value;
                obj.ParentCategoryId = null;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "alert('Access Denied')", true);
            }
            else
            {
                obj.Name = txtCategoryName.Value;
                obj.IsActive = true;
                obj.CreatedOn = DateTime.Now;
                obj.Desc = txtdesc.Value;
                obj.ParentCategoryId = Convert.ToInt32(Id);
            }
            
            dc.tblCategories.InsertOnSubmit(obj);
            dc.SubmitChanges();

        }
        txtCategoryName.Value = "";
        txtdesc.Value = "";
        BindCategories();
    }



    protected void rptcategory_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var ID = Convert.ToInt32(e.CommandArgument);
        var dc = new DataClassesDataContext();
        tblCategory obj = dc.tblCategories.SingleOrDefault(ob => ob.CategoryId == ID);
        if (e.CommandName == "active")
        {
            if (obj.IsActive == true)
            {
                obj.IsActive = false;
            }
            else
            {
                obj.IsActive = true;
            }
            dc.SubmitChanges();
            BindCategories();
        }
    }
}