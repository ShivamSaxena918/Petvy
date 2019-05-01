using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        //var forget = dc.tblUsers .SingleOrDefault(ob => ob.UserId == Convert.ToInt32(Session["UID"]));
        //forget.Email = txteemail.Text;
        //dc.SubmitChanges();
        var ob = (from ob1 in dc.tblUsers where ob1.Email == txteemail.Text select ob1).ToList().Count;
        if (ob <= 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Error', 'You Are Not Registered With Us', 'error')", true);
        }
        else
        {
            Random ro = new Random();
            MailMessage Msg = new MailMessage("anyonecanuse52@gmail.com",txteemail.Text);

            Msg.Subject = " Email Varification From Petvy";
            Random rnd = new Random();
            int random = rnd.Next(100000, 999999);
            //string host = HttpContext.Current.Request.Url.Authority;
            //string link = "/NewPassword.aspx?verify=" + random;
            //String VarificationCode = "P1" + random;
            tblUser nn = (from obn in dc.tblUsers where obn.Email == txteemail.Text select obn).Take(1).SingleOrDefault();
            nn.Password = Convert.ToString(random);
            dc.SubmitChanges();
            //Session["VarificationPass"] = random;
            //Session["Email"] = txtregemail.Value;

            Msg.Body = "<html><body> <h1> Please Enter This As Your Password on Petvy : "+random+ " </h1> <br/> <p> Please use this password to Login.</p></body></html>";
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
            Response.Redirect("Userlogin.aspx");
        }
    }
}