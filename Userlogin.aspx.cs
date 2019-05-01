using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        binddatalist();
    }

    private void binddatalist()
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
    }

    protected void btnNext1_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "nextPrev(1)", true);
        
    }

    protected void btnprev2_Click(object sender, EventArgs e)
    {
        
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "nextPrev(-1)", true);
    }

    protected void btnnext2_Click(object sender, EventArgs e)
    {
        if (txtDOB.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "swal('Warning', 'Please Select Gender', 'warning')", true);
        }
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "nextPrev(1)", true);
        }

    }

    protected void btnnext3_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "nextPrev(1)", true);
    }

    protected void btnprev3_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "nextPrev(-1)", true);
    }

    protected void btninsert_Click(object sender, EventArgs e)
    {

    }

    protected void btninsert_Click1(object sender, EventArgs e)
    {
        


    }
    protected void ValidateCaptcha(object sender, ServerValidateEventArgs e)
    {
        Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
        e.IsValid = Captcha1.UserValidated;
        if (e.IsValid)
        {
            var dc = new DataClassesDataContext();
            var ob = (from ob1 in dc.tblUsers where ob1.Email == txtregemail.Value select ob1).ToList().Count;
            if (ob <= 0)
            {
                tblUser tu = new tblUser();
                tu.ContactNo = txtcno.Value;
                tu.CreatedOn = DateTime.Now;
                tu.DOB = Convert.ToDateTime(txtDOB.Text);
                tu.Email = txtregemail.Value;
                tu.FName = txtfname.Value;
                tu.MName = txtmname.Value;
                tu.LName = txtlname.Value;
                tu.Gender = ddgender.SelectedValue;
                tu.IsActive = false;
                tu.IsBlocked = false;
                tu.IsBusiness = false;
                tu.MacAddress = Service.GetMacAddress();
                tu.Password = txtregcpass.Value;
                if (FileUpload1.HasFile)
                {
                    tu.Image = FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath("User_Images") + "/" + FileUpload1.FileName);
                }
                else
                {
                    tu.Image = "default.png";
                }
                dc.tblUsers.InsertOnSubmit(tu);
                dc.SubmitChanges();

                

                MailMessage Msg = new MailMessage("anyonecanuse52@gmail.com", txtregemail.Value);

                Msg.Subject = " Varification Email From Petvy";
                Random rnd = new Random();
                String VarificationCode = "P1" + rnd.Next(100000, 999999);
                Session["VarificationCode"] = VarificationCode;
                Session["Email"] = txtregemail.Value;

                Msg.Body = "<html><body> <h1> Varification Code is : " + VarificationCode + "</h1> <br/> <p> Please Insert this Code on Varification Page</p></body></html>";
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

                Response.Redirect("verification.aspx");


            }
            else
            {
                
                Response.Redirect("Error404.aspx");
            }
        }
        else
        {
            
            var dc = new DataClassesDataContext();
            tblUser tu = (from ob in dc.tblUsers where ob.Email == txtemail.Value && ob.Password == txtpass.Value && ob.IsActive == true select ob).Take(1).SingleOrDefault();
            if (tu != null)
            {
                if (Session["BID"] != null)
                {
                    Session["BID"] = null;
                    Session["UID"] = tu.UserId;
                    Response.Redirect("Business.aspx");
                }
                else
                {
                    //Session['AId'] = ta.AdminId;
                    Session["UID"] = tu.UserId;
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                txtemail.Value = "";
                txtpass.Value = "";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Login!', 'Please Enter Valid Email/Password', 'error')", true);
                
            }
        }
    }

}







