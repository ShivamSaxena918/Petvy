using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbldate.Text = DateTime.Now.ToLongDateString().ToString();
            bindins();
            binddata();
        }
    }

    private void bindins()
    {
        var dc = new DataClassesDataContext();

    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        
        tblOrder to = (from ob in dc.tblOrders where ob.OrderId == Convert.ToInt32(Session["Order"]) select ob).Take(1).SingleOrDefault();
        to.BankName = "PayUMoney";
        to.IsPaid = true;
        to.PaymentType = "Online";
        if(Request.Form["txnid"] == null)
        {

        }
        else
        { 
        to.TransNo = Request.Form["txnid"];
        }
        dc.SubmitChanges();
        lbltran.Text = (from ob in dc.tblOrders where ob.OrderId == Convert.ToInt32(Session["Order"]) select ob).Take(1).SingleOrDefault().TransNo ;
        lblprice.Text = Session["Amount"].ToString();
        var OrderID = Convert.ToInt32(Session["Order"]);
        var UID = Convert.ToInt32(Session["UID"]);
        tblUser tu = (from ob in dc.tblUsers where ob.UserId == UID select ob).Take(1).SingleOrDefault();
        lblName.Text = tu.FName + " " + tu.MName + " " + tu.LName;
        lblemail.Text = tu.Email;
        lblcno.Text = tu.ContactNo;
        tblAddress ta = (from ob in dc.tblAddresses join ob1 in dc.tblOrders on ob.UserId equals ob1.UserId where ob1.OrderId == OrderID select ob).Take(1).SingleOrDefault();
        lbladdress1.Text = ta.Address;
        lbladdress2.Text = ta.Landmark + " " + ta.Area;
        var city = (from ob in dc.CityMasters where ob.ID == ta.CityId select ob).Take(1).SingleOrDefault().Name;
        var cityy = (from ob in dc.CityMasters where ob.ID == ta.CityId select ob).Take(1).SingleOrDefault().StateID;
        var state = (from ob in dc.StateMasters where ob.ID == cityy select ob).Take(1).SingleOrDefault().Name;
        lbladdress3.Text = ta.Pincode + " " + city + " " + state;

        var data = from ob in dc.tblOrderDetails
                   join ob1 in dc.tblOrders on ob.OrderId equals ob1.OrderId
                   join ob2 in dc.tblProducts on ob.ProductId equals ob2.ProductId
                   where ob.OrderId == OrderID
                   select new
                   {
                       ob2.ProductId,
                       ob2.Name,
                       ob.Qty,
                       ob2.Price
                   };
        Repeater1.DataSource = data;
        Repeater1.DataBind();
        foreach (RepeaterItem item in Repeater1.Items)
        {
            //HiddenField HID = (HiddenField)item.FindControl("HiddenField1");
            Label hidd = (Label)item.FindControl("lblhdd");
            Label lbl = (Label)item.FindControl("lblprice");
            int qty = Convert.ToInt32((from ob in dc.tblProducts join ob1 in dc.tblOrderDetails on ob.ProductId equals ob1.ProductId join ob2 in dc.tblOrders on ob1.OrderId equals ob2.OrderId where ob.ProductId == Convert.ToInt32(hidd.Text) && ob2.UserId == Convert.ToInt32(Session["UID"]) orderby ob1.OrderDetailId descending  select ob1).Take(1).SingleOrDefault().Qty);
            int price = Convert.ToInt32((from ob in dc.tblProducts where ob.ProductId == Convert.ToInt32(hidd.Text) select ob).Take(1).SingleOrDefault().Price);
            int total = qty * price;
            lbl.Text = total.ToString();
        }
        lbltotal.Text = Session["Price"].ToString();
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Product.aspx");
    }

    protected void btngenerate_Click(object sender, EventArgs e)
    {

        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=" + "PETVY" + DateTime.Today.ToString() + ".pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A3, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
}