using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsLetter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["AID"]== null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                bind();
            }
        }
    }
    private void bind()
    {
        var dc = new DataClassesDataContext();
        var c = from ob in dc.tblCMSPages where ob.IsActive == true orderby ob.CmsPageId descending select ob;
        ddnews.DataTextField = "Title";
        ddnews.DataValueField = "CmsPageId";
        ddnews.DataSource = c;
        ddnews.DataBind();
        ListItem itm = new ListItem("Select", "0");
        itm.Selected = true;
        ddnews.Items.Add(itm);

    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        try
        {

        var dc = new DataClassesDataContext();
        var email = from ob in dc.tblNewsLetters where ob.UnsubscribedDate == null select ob;
        foreach (var eml in email)
        {

            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress("anyonecanuse52@gmail.com");
            Msg.To.Add(new MailAddress(eml.Email.ToString()));

            Msg.Subject = "Suscribed Newsletter";
            Msg.Body = "<html><body> <h4> "+ txtdescription.Text + "</h4></body></html>";
            Msg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;

            smtp.UseDefaultCredentials = false;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            NetworkCredential MyCredentials = new NetworkCredential("anyonecanuse52@gmail.com", "mayaonly18");
            smtp.Credentials = MyCredentials;

            smtp.Send(Msg);

        }
            tblAction ac = new tblAction();
            ac.AdminId = Convert.ToInt32(Session["AID"]);
            ac.PageName = "NewsLetter.aspx";
            ac.Action = "Insert";
            ac.CreatedOn = DateTime.Now;
            ac.MacAddress = Service.GetMacAddress();
            dc.tblActions.InsertOnSubmit(ac);
            dc.SubmitChanges();

        }
        catch(Exception ex)
        {
            var dc = new DataClassesDataContext();
            tblError err = new tblError();
            err.PageName = "NewsLetter.aspx";
            err.MacAddress = Service.GetMacAddress();
            err.Description = ex.ToString();
            err.CreatedOn = DateTime.Now;
            err.AdminId = Convert.ToInt32(Session["AID"]);
            dc.tblErrors.InsertOnSubmit(err);
            dc.SubmitChanges();
            Response.Redirect("Error.aspx");
        }
    }

    protected void ddnews_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddnews.SelectedValue == "0")
        {
            Response.Redirect("CMS.aspx");
        }
        else
        {
            txtdescription.Text = "";
            var dc = new DataClassesDataContext();
            tblCMSPage C3 = (from ob in dc.tblCMSPages where ob.CmsPageId == Convert.ToInt32(ddnews.SelectedValue) select ob).Take(1).SingleOrDefault();
            //C3.Description = txtDec.Text;
            txtdescription.Text = C3.Description;
        }
    }
}