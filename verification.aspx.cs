using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btndone_Click(object sender, EventArgs e)

    {
        Label1.Text = Convert.ToString(Session["Email"]);

        if (txtCode.Text.Trim() == Session["VarificationCode"].ToString())
        {
            var dc = new DataClassesDataContext();
            tblUser ob = (from obad in dc.tblUsers where obad.Email == Session["Email"].ToString() select obad).Take(1).SingleOrDefault();
            if (ob != null)
            {
                ob.IsActive = true;
                Session["UID"] = ob.UserId;
                dc.SubmitChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "swal('Success', 'Account Varified', 'success')", true);
                //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Account Varified')", true);
                Response.Redirect("Default.aspx");

            }
        }
    }
}