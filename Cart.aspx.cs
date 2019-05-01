using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var ID = Convert.ToString(Session["UID"]);
            if (ID == "")
            {
                Response.Redirect("Userlogin.aspx");
            }
            else
            {
                bindcart();
            }
        }

    }

    private void bindcart()
    {
        var dc = new DataClassesDataContext();
        var ID = Convert.ToInt32(Session["UID"]);
        var empty = (from obnn in dc.tblCarts where obnn.UserId == ID select obnn).ToList().Count;
        if (empty <= 0)
        {
            Response.Redirect("Emptycart.aspx");
            
        }
        else
        {
            var ob = from ob1 in dc.tblCarts
                     join ob2 in dc.tblProducts on ob1.ProductId equals ob2.ProductId
                     join ob3 in dc.tblUsers on ob1.UserId equals ob3.UserId
                     join ob4 in dc.tblImages on ob2.AlbumId equals ob4.AlbumId
                     where ob3.UserId == ID && ob4.IsDefault == true
                     select new
                     {
                         ob1.ProductId,
                         ob1.UserId,
                         ob1.CartId,
                         ob1.Qty,
                         ob2.Name,
                         ob2.Price,
                         ob4.Url,
                     };
            Repeater1.DataSource = ob;
            Repeater1.DataBind();
            int st = 0;
            foreach (RepeaterItem item in Repeater1.Items)
            {
                Label lblprice = (Label)item.FindControl("lblprice");
                Label lblsstotal = (Label)item.FindControl("lbltotal");
                TextBox txtqty = (TextBox)item.FindControl("txtqty");
                lblsstotal.Text = Convert.ToString(Convert.ToInt32(lblprice.Text) * Convert.ToInt32(txtqty.Text));
                st = Convert.ToInt32(lblsstotal.Text) + st;
            }
            lblsubtotal.Text = Convert.ToString(st);
            lblcgst.Text = Convert.ToString(2.5 / 100 * Convert.ToInt32(lblsubtotal.Text));
            lblsgst.Text = Convert.ToString(2.5 / 100 * Convert.ToInt32(lblsubtotal.Text));
            double cgst = Convert.ToDouble(lblcgst.Text);
            double sgst = Convert.ToDouble(lblsgst.Text);
            lbltttotal.Text = Convert.ToString(st + cgst + sgst);
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();

        foreach (RepeaterItem item in Repeater1.Items)
        {
            HiddenField hid = (HiddenField)item.FindControl("HiddenField1");
            tblCart tc = (from ob in dc.tblCarts where ob.CartId == Convert.ToInt32(hid.Value) select ob).Take(1).SingleOrDefault();
            TextBox txtqty = (TextBox)item.FindControl("txtqty");
            tc.Qty = txtqty.Text;
            dc.SubmitChanges();
        }

        bindcart();
    }

    protected void btncheckout_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        //tblOrder to = new tblOrder();
        //to.AddressId = null;
        //to.Amt = lbltotal.Text;
        //to.BankName = null;
        //to.CGST = "2.5";
        //to.SGST = "2.5";
        //to.CreatedOn = DateTime.Now;
        //to.IsPaid = false;
        //to.PaymentType = null;
        //to.TransNo = null;
        //to.UserId = Convert.ToInt32(Session["UID"]);
        //dc.tblOrders.InsertOnSubmit(to);
        //dc.SubmitChanges();
        //var lastid = (from ob in dc.tblOrders orderby ob.OrderId descending select ob).Take(1).SingleOrDefault().OrderId;
        Session["Price"] = lbltttotal.Text;
        
        Response.Redirect("Checkout.aspx");
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        var dc = new DataClassesDataContext();
        var ob = (from obc in dc.tblCarts where obc.CartId == ID select obc).Take(1).SingleOrDefault();
        dc.tblCarts.DeleteOnSubmit(ob);
        dc.SubmitChanges();
        var obd = (from obn in dc.tblCarts where obn.UserId == Convert.ToInt32(Session["UID"]) select obn).ToList().Count;
        Label lb = (Label)Master.FindControl("lblcounter");
        lb.Text = obd.ToString();
        bindcart();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Cart Updated!', 'Product is successfully removed', 'success')", true);
       
        //Response.Redirect("Cart.aspx");
    }
}