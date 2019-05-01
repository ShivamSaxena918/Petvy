using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindlb();
        btnprofileimg.Visible = false;
        lbsignin.Visible = false;
        if (Session["UID"] == null)
        {
            lbsignin.Visible = true;
            lblcounter.Text = "0";
            lbadd.Visible = false;
        }
        else
        {
          
            lblcounter.Visible = true;
            btnprofileimg.Visible = true;
            var ID = Convert.ToInt32(Session["UID"]);
            var dc = new DataClassesDataContext();
            var tu = (from obn in dc.tblUsers where obn.UserId == ID select obn).Take(1).SingleOrDefault().Image;
            btnprofileimg.ImageUrl = "User_Images/" + tu;
            int c = (from ob in dc.tblCarts where ob.UserId == ID select ob).ToList().Count();
            lblcounter.Text = Convert.ToString(c);
            tblUser tua = (from ob1 in dc.tblUsers where ob1.UserId == ID select ob1).Take(1).SingleOrDefault();
            txtsubscribe.Text = tua.Email;
            if(tua.IsBusiness == true)
            {
                lbadd.Visible = true;
                lborders.Visible = true;
            }
            else
            {
                lbadd.Visible = false;
                lborders.Visible = false;
            }
            var ordcnt = (from ob in dc.tblOrderDetails join ob1 in dc.tblOrders on ob.OrderId equals ob1.OrderId join ob2 in dc.tblProducts on ob.ProductId equals ob2.ProductId where ob2.UserId == Convert.ToInt32(Session["UID"]) select ob).ToList().Count;
            lblordercount.Text = ordcnt.ToString();
            var obc = (from ob1n in dc.tblNewsLetters join ob2u in dc.tblUsers on ob1n.Email equals ob2u.Email where ob2u.UserId == Convert.ToInt32(Session["UID"]) select ob1n).ToList().Count;
            if (obc > 0)
            {
                txtsubscribe.Visible = false;
                btnsub.Visible = false;
            }
        }
    }

    private void bindlb()
    {
        var dc = new DataClassesDataContext();
        var ID = Convert.ToInt32(Session["UID"]);
        var ob = (from ob1 in dc.tblUsers where ob1.UserId == ID && ob1.IsBusiness == true select ob1).Take(1).SingleOrDefault();
        if(ob != null)
        {
            lbbusiness.Visible = false;
        }
        else
        {
            lbbusiness.Visible = true;
        }
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Userlogin.aspx");
    }

    protected void btnprofileimg_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UID"] == null)
        {

        }
        else
        {
            var ID = Convert.ToInt32(Session["UID"]);
            var dc = new DataClassesDataContext();
            var tu = (from obn in dc.tblUsers where obn.UserId == ID select obn).Take(1).SingleOrDefault().Image;
            btnprofileimg.ImageUrl = "User_Images/" + tu;
        }
    }

    protected void lbbusiness_Click(object sender, EventArgs e)
    {
        if(Session["UID"]==null)
        {
            Session["BID"] = 1;
            Response.Redirect("Userlogin.aspx");
            lbbusiness.Visible = false;
        }
        else
        {
            lbbusiness.Visible = false;
            Response.Redirect("Business.aspx");
            
        }
    }

    protected void btnsub_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        tblNewsLetter ob = new tblNewsLetter();
        ob.SubscribedDate = DateTime.Now;
        ob.Email = txtsubscribe.Text;
        dc.tblNewsLetters.InsertOnSubmit(ob);
        dc.SubmitChanges();
    }

   }
