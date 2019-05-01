using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepeater();
        }
    }
    private void BindRepeater()
    {
        var dc = new DataClassesDataContext();
        var data = from ob in dc.tblPetTypes
                   select new
                   {
                       ob.TypeName,
                       ob.PetTypeId,
                       pettypeName = (from ob1 in dc.tblPetTypes where ob1.PetTypeId == ob.ParentTypeId select ob1).Take(1).SingleOrDefault().TypeName,

                   };
        rptpet.DataSource = data;
        rptpet.DataBind();
        tblPermission obj = (from oba in dc.tblAdmins join obp in dc.tblPermissions on oba.AdminId equals obp.AdminId where oba.AdminId == Convert.ToInt32(Session["AID"]) select obp).Take(1).SingleOrDefault();
        if (obj.IsInsert == true)
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
        var pet = from ob in dc.tblPetTypes where ob.ParentTypeId == null select ob;
        ddbreedtype.DataTextField = "TypeName";
        ddbreedtype.DataValueField = "PetTypeId";
        ddbreedtype.DataSource = pet;
        ddbreedtype.DataBind();
        ListItem itm = new ListItem("Select Pets", "");
        itm.Selected = true;
        ddbreedtype.Items.Add(itm);
    }


    protected void rptpet_ItemCommand(object source, RepeaterCommandEventArgs e)
    {


    }



    protected void btnadd_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var taa = (from oba in dc.tblPetTypes where oba.TypeName == txtpettype.Value select oba).ToList().Count();
        if (taa > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "PetNameVerification()", true);
        }
        else
        {
            var Id = ddbreedtype.SelectedValue;
            tblPetType obj = new tblPetType();
            if (Id == "")
            {
                obj.TypeName = txtpettype.Value;
                obj.ParentTypeId = null;
            }
            else
            {
                obj.TypeName = txtpettype.Value;
                obj.ParentTypeId = Convert.ToInt32(Id);
            }
            txtpettype.Value = "";
            dc.tblPetTypes.InsertOnSubmit(obj);
            dc.SubmitChanges();
        }
        BindRepeater();
    }
}