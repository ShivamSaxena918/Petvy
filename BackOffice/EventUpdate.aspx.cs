using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_EventUpdate_aspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var ID = Convert.ToString(HttpContext.Current.Session["AID"]);
        if (ID == "")
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            BindEvent();
        }

    }
    private void BindEvent()
    {
        var Id = Request.QueryString["EID"];
        var dc = new DataClassesDataContext();
        tblEvent ta = (from ob in dc.tblEvents where ob.EventId == Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
        txtename.Value = ta.EventName;
        txtstime.Value = Convert.ToString(ta.StartTime);
        txtetime.Value = Convert.ToString(ta.EndTime);
        txtstartdate.Value = Convert.ToString(ta.StartDate);
        txtenddate.Value = Convert.ToString(ta.EndDate);
        txtarea2.Value = ta.Details;
        var Images = from ob in dc.tblEvents
                     join ob2 in dc.tblImages on ob.AlbumId equals ob2.AlbumId
                     where ob.EventId == Convert.ToInt32(Id)
                     select new
                     {
                         ob2.Url,
                         ob.AlbumId
                     };
        ddevent.DataSource = Images;
        ddevent.DataBind();

    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (Convert.ToDateTime(txtstartdate.Value) < DateTime.Today)
        {
            var Id = Request.QueryString["EID"];
            var dc = new DataClassesDataContext();
            tblEvent ta = (from ob in dc.tblEvents where ob.EventId == Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
            ta.EventName = txtename.Value;
            ta.StartTime = TimeSpan.Parse(txtstime.Value);
            ta.EndTime = TimeSpan.Parse(txtetime.Value);
            ta.StartDate = Convert.ToDateTime(txtstartdate.Value);
            ta.EndDate = Convert.ToDateTime(txtenddate.Value);
            ta.Details = txtarea2.Value;
            dc.SubmitChanges();
            Response.Redirect("Events.aspx");
           

        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "alert('Start Date Cannot Be Before Today')", true);

        }



    }
}