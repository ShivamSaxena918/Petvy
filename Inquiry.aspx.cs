using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inquiry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindtext();
    }

    private void bindtext()
    {
        var dc = new DataClassesDataContext();
        var ID = Convert.ToInt32(Session["UID"]);
        if (ID <= 0)
        {

        }
        else
        {
            tblUser tu = (from ob in dc.tblUsers where ob.UserId == ID select ob).Take(1).SingleOrDefault();
            txtname.Text = tu.FName + tu.LName;
            txtemail.Text = tu.Email;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        var dc = new DataClassesDataContext();
        var ob = (from ob1 in dc.tblInquiries where ob1.Email == txtemail.Text  select ob1).ToList().Count;
        if (ob > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Error', 'Your Inquiry Is Already Submitted With Us', 'error')", true);
        }
        else
        {
            tblInquiry ti = new tblInquiry();
            ti.CreatedOn = DateTime.Now;
            ti.Email = txtemail.Text;
            ti.IsReplied = false;
            ti.Name = txtname.Text;
            ti.Quary = txtmessage.Value;
            ti.RepliedOn = null;
            ti.Reply = null;
            ti.ReplyBy = null;
            ti.ContactNo = null;
            dc.tblInquiries.InsertOnSubmit(ti);
            dc.SubmitChanges();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Your Inquiry is Successfully Submited', 'Wait For Your Inqiry Reply', 'success')", true);
        }
      

    }
}