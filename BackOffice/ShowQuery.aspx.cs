using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlreply.Visible = true;
       
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    private void BindGrid()
    {
        var id = Request.QueryString["IID"];
        var dc = new DataClassesDataContext();
        var contact = dc.tblInquiries.SingleOrDefault(ob => ob.InquiryId == Convert.ToInt32(id));
        lblQuary.Text = contact.Quary;
    }
    //protected void reply_Click(object sender, EventArgs e)
    //{
    //    pnlreply.Visible = true;
    //    var dc = new DataClassesDataContext();
    //    var contact = dc.tblInquiries.SingleOrDefault(ob => ob.InquiryId == Convert.ToInt32(Session["InquiryId"]));

    //    contact.Reply = txtreply.Text;
    //    contact.ReplyBy = Convert.ToInt32(Session["AdminId"]);
    //    contact.RepliedOn = DateTime.Now;
    //    contact.IsReplied = true;
    //    var emailid = contact.Email;

    //    dc.SubmitChanges();
      



    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var contact = dc.tblInquiries.SingleOrDefault(ob => ob.InquiryId == Convert.ToInt32(Session["InquiryId"]));

        contact.Reply = txtreply.Text;
        contact.ReplyBy = Convert.ToInt32(Session["AdminId"]);
        contact.RepliedOn = DateTime.Now;
        contact.IsReplied = true;
        var emailid = contact.Email;

        dc.SubmitChanges();

        //MailMessage Msg = new MailMessage("utsavindia30@gmail.com", emailid.Trim());
        //Msg.Subject = "Reply";
        //Msg.Body = "<html><body> <h1> Reply of Your Query " + contact.Reply + "</h1></body></html>";
        //Msg.IsBodyHtml = true;
        //SmtpClient smtp = new SmtpClient();

        //smtp.Host = "smtp.gmail.com";
        //smtp.Port = 587;

        //smtp.UseDefaultCredentials = false;
        //smtp.EnableSsl = true;
        //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        //NetworkCredential MyCredentials = new NetworkCredential("utsavindia30@gmail.com", "utsavindia2018");
        //smtp.Credentials = MyCredentials;

        //smtp.Send(Msg);

        MailMessage Msg = new MailMessage("anyonecanuse52@gmail.com", contact.Email.Trim());
        Msg.Subject = "Password Recovery";
        Msg.Body = "<html><body> <h1> " + contact.Reply + "</h1></body></html>";
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
        //   ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Password Is Sent To Email.')", true);

        Response.Redirect("Inquiry.aspx");
    }

    
}