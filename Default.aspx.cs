using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindevent();
        }
    }

    private void bindevent()
    {
        var dc = new DataClassesDataContext();
        var ob = (from ob1 in dc.tblEvents
                 join ob2 in dc.tblImages on ob1.AlbumId equals ob2.AlbumId
                 where ob2.IsDefault == true
                 select new
                 {
                     ob1.EventId,
                     ob2.Url,
                     ob1.EventName
                 }).Take(4);
        rptevent.DataSource = ob;
        rptevent.DataBind();
    }

    protected void rptevent_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        var dc = new DataClassesDataContext();
        int ID = Convert.ToInt32(e.CommandArgument);
        tblEventXUser eu = new tblEventXUser();
        eu.CreatedOn = DateTime.Now;
        eu.EventId = ID;
        if(Session["UID"]==null)
        {
            eu.UserId = null;
        }
        else
        {
            eu.UserId = Convert.ToInt32(Session["UID"]);
        }
        eu.IsActive = true;
        dc.tblEventXUsers.InsertOnSubmit(eu);
        dc.SubmitChanges();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('hello','hello','success')", true);
        bindevent();
    }

    protected void btndoginfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("DogInfo.aspx");
    }

    protected void btncatinfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("CatInfo.aspx");
    }
}