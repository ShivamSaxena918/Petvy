using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var ID = Convert.ToString(Session["UID"]);
            var Id = Convert.ToString(Session["Price"]);
            if (ID == "" && Id == "")
            {
                Response.Redirect("Userlogin.aspx");
            }
            else
            {
                bindnew();
                binddd();
                binddata();
                bindrepeater();

            }
        }
    }

    private void bindnew()
    {
        var dc = new DataClassesDataContext();
        var country = dc.CountryMasters;
        ddcountrylist.DataTextField = "Name";
        ddcountrylist.DataValueField = "ID";
        ddcountrylist.DataSource = country;
        ddcountrylist.DataBind();

        var state = dc.StateMasters;
        ddstatelist.DataTextField = "Name";
        ddstatelist.DataValueField = "ID";
        ddstatelist.DataSource = state;
        ddstatelist.DataBind();

        var city = dc.CityMasters;
        ddcitylist.DataTextField = "Name";
        ddcitylist.DataValueField = "ID";
        ddcitylist.DataSource = city;
        ddcitylist.DataBind();
    }

    private void bindrepeater()
    {
        var dc = new DataClassesDataContext();
        var ID = Convert.ToInt32(Session["UID"]);
        var ob = from ob2 in dc.tblCarts
                 join ob3 in dc.tblProducts on ob2.ProductId equals ob3.ProductId
                 where ob2.UserId == ID
                 select new
                 {
                     ob3.Name,
                     ob2.Qty,
                     ob3.Price,
                 };
        rptproducts.DataSource = ob;
        rptproducts.DataBind();
        int cnt = 0;
        foreach (RepeaterItem item in rptproducts.Items)
        {
            Label lbltotal = (Label)item.FindControl("lblprice");
            Label lblqty = (Label)item.FindControl("lblquantity");
            HiddenField hf1 = (HiddenField)item.FindControl("HiddenField1");
            lbltotal.Text = Convert.ToString(Convert.ToInt32(hf1.Value) * Convert.ToInt32(lblqty.Text));
            cnt = Convert.ToInt32(lbltotal.Text) + cnt;
        }
        lblsubtotal.Text = Convert.ToString(cnt);
        //tblOrder to = (from obn in dc.tblOrders join obc in dc.tblCarts on obn.UserId equals obc.UserId orderby obn.OrderId descending select obn).Take(1).SingleOrDefault();
        Double CGST = 2.5;
        Double SGST = 2.5;
        lblCGST.Text = Convert.ToString((CGST / 100) * Convert.ToInt32(lblsubtotal.Text));
        lblSGST.Text = Convert.ToString((SGST / 100) * Convert.ToInt32(lblsubtotal.Text));
        lblttotal.Text = Convert.ToString(Session["Price"]);
    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        int UID = Convert.ToInt32(Session["UID"]);
        if (Session["UID"] != null)
        {
            tblUser tu = (from ob in dc.tblUsers where ob.UserId == UID select ob).Take(1).SingleOrDefault();
            txtname.Value = tu.FName;
            txtmname.Value = tu.MName;
            txtlname.Value = tu.LName;
            txtemail.Value = tu.Email;
            txtemail.Disabled = true;
            txtphno.Value = tu.ContactNo;

        }

    }

    private void binddd()
    {
        var dc = new DataClassesDataContext();
        int UID = Convert.ToInt32(Session["UID"]);


        var address = from ob in dc.tblAddresses where ob.UserId == UID select ob;
        ddaddresses.DataTextField = "Address";
        ddaddresses.DataValueField = "AddressID";
        ddaddresses.DataSource = address;
        ddaddresses.DataBind();

        ListItem itm1 = new ListItem("Select Address", "0");
        itm1.Selected = true;
        ddaddresses.Items.Add(itm1);

    }

    protected void ddcountrylist_SelectedIndexChanged(object sender, EventArgs e)
    {


        var dc = new DataClassesDataContext();
        var state = from ob in dc.StateMasters where ob.CountryID == Convert.ToInt32(ddcountrylist.SelectedValue) select ob;
        ddstatelist.DataTextField = "Name";
        ddstatelist.DataValueField = "ID";
        ddstatelist.DataSource = state;
        ddstatelist.DataBind();
    }
    protected void ddstatelist_SelectedIndexChanged(object sender, EventArgs e)
    {

        var dc = new DataClassesDataContext();
        var city = from ob in dc.CityMasters where ob.StateID == Convert.ToInt32(ddstatelist.SelectedValue) select ob;
        ddcitylist.DataTextField = "Name";
        ddcitylist.DataValueField = "ID";
        ddcitylist.DataSource = city;
        ddcitylist.DataBind();
    }

    protected void btnplaceorder_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        tblOrder to = new tblOrder();
        if (txtstreet.Value != "")
        {
            if (ddaddresses.SelectedValue == "0")
            {

                tblAddress ta = new tblAddress();
                ta.Address = txtstreet.Value;
                ta.Area = txtarea.Value;
                ta.CityId = Convert.ToInt32(ddcitylist.SelectedValue);
                ta.CreatedOn = DateTime.Now;
                ta.IsActive = true;
                ta.Landmark = txtlandmark.Value;
                ta.Pincode = txtpin.Value;
                ta.UserId = Convert.ToInt32(Session["UID"]);
                dc.tblAddresses.InsertOnSubmit(ta);
                dc.SubmitChanges();
                to.AddressId = (from ob in dc.tblAddresses orderby ob.AddressId descending select ob).Take(1).SingleOrDefault().AddressId;


            }
            else
            {
                tblAddress ta = (from ob in dc.tblAddresses where ob.AddressId == Convert.ToInt32(ddaddresses.SelectedValue) select ob).Take(1).SingleOrDefault();
                ta.Address = txtstreet.Value;
                ta.Area = txtarea.Value;
                ta.CityId = Convert.ToInt32(ddcitylist.SelectedValue);
                ta.Landmark = txtlandmark.Value;
                ta.Pincode = txtpin.Value;
                dc.SubmitChanges();
                to.AddressId = Convert.ToInt32(ddaddresses.SelectedValue);
            }
            to.Amt = lblttotal.Text;
            to.BankName = null;
            to.CGST = lblCGST.Text;
            to.SGST = lblSGST.Text;
            to.CreatedOn = DateTime.Now;
            to.IsPaid = false;
            to.PaymentType = null;
            to.TransNo = null;
            to.UserId = Convert.ToInt32(Session["UID"]);
            dc.tblOrders.InsertOnSubmit(to);
            dc.SubmitChanges();
            var lastid = (from ob in dc.tblOrders orderby ob.OrderId descending select ob).Take(1).SingleOrDefault().OrderId;
            //tblOrder toe =(from ob1 in dc.tblOrders where ob1.UserId == Convert.ToInt32(Session["UID"]) orderby ob1.OrderId descending select ob1).Take(1).SingleOrDefault() ;
            //to.AddressId = (from oba in dc.tblAddresses where oba.UserId == Convert.ToInt32(Session["UID"]) select oba).Take(1).SingleOrDefault().AddressId;
            var nn = from mm in dc.tblCarts where mm.UserId == Convert.ToInt32(Session["UID"]) select mm;
            foreach (tblCart tc in nn)
            {
                tblOrderDetail tod = new tblOrderDetail();
                tod.ProductId = tc.ProductId;
                tod.OrderId = lastid;
                tod.Qty = tc.Qty;
                dc.tblOrderDetails.InsertOnSubmit(tod);
                dc.SubmitChanges();
            }
            var obbc = from ob1 in dc.tblCarts where ob1.UserId == Convert.ToInt32(Session["UID"]) select ob1;
            dc.tblCarts.DeleteAllOnSubmit(obbc);
            dc.SubmitChanges();
            //var rr = from tcc in dc.tblCarts 
            Session["Order"] = lastid;
            Session["Amount"] = lblttotal.Text;
            Session["FirstName"] = txtname.Value + txtlname.Value;
            Session["Email"] = txtemail.Value;
            Session["PhoneNo"] = txtphno.Value;
            Session["ProductInfo"] = "Petvy Product";
            Session["SuccessURL"] = "http://" + HttpContext.Current.Request.Url.Authority + "/Success.aspx";
            Session["FailureURL"] = "http://" + HttpContext.Current.Request.Url.Authority + "/PayU/PayUFail.aspx";
            Response.Redirect("PayU/Default.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript111", "swal('error', 'Please Add New Address First ', 'error')", true);
        }
        //tblOrderDetail tod = new tblOrderDetail();


    }

    protected void ddaddresses_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        int UID = Convert.ToInt32(Session["UID"]);
        if (ddaddresses.SelectedValue == "0")
        {
            Panel1.Visible = false;
        }
        else
        {
            //bindnew();
            Panel1.Visible = true;
            tblAddress ta = (from ob in dc.tblAddresses where ob.AddressId == Convert.ToInt32(ddaddresses.SelectedValue) select ob).Take(1).SingleOrDefault();
            txtstreet.Value = ta.Address;
            txtlandmark.Value = ta.Landmark;
            txtarea.Value = ta.Area;
            txtpin.Value = ta.Pincode;
            int cityID = (from ob in dc.CityMasters where ob.ID == ta.CityId select ob).Take(1).SingleOrDefault().ID;
            ddcitylist.SelectedValue = Convert.ToString(cityID);
            int stateID = (from ob in dc.StateMasters join ob1 in dc.CityMasters on ob.ID equals ob1.StateID where ob1.ID == cityID select ob).Take(1).SingleOrDefault().ID;
            ddstatelist.SelectedValue = Convert.ToString(stateID);
            int countryID = (from ob in dc.CountryMasters join ob1 in dc.StateMasters on ob.ID equals ob1.CountryID where ob1.ID == stateID select ob).Take(1).SingleOrDefault().ID;
            ddcountrylist.SelectedValue = Convert.ToString(countryID);
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        txtarea.Value = "";
        txtlandmark.Value = "";
        txtpin.Value = "";
        txtstreet.Value = "";
        ddcitylist.SelectedValue = null;
        ddstatelist.SelectedValue = null;
        ddaddresses.SelectedValue = "0";


    }
}