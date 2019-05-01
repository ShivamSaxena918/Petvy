using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.IO;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;

public partial class ProductProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        generateqr();
        if (!IsPostBack)
        {
            string ID = Request.QueryString["PID"];
            if (ID == null)
            {
                Response.Redirect("Product.aspx");
            }
            else
            {
                //generateqr();
                binddata();
                bindsmallimg();
                bindbigimg();
                
                var dc = new DataClassesDataContext();
                if (Session["UID"] != null)
                {
                    //Rating1.Visible = true;
                    int obdd = (from ob1 in dc.tblRatings
                                where ob1.UserId == Convert.ToInt32(Session["UID"]) && ob1.ProductId == Convert.ToInt32(Request.QueryString["PID"])
                                select ob1).ToList().Count;
                    if (obdd > 0)
                    {
                      //  Rating1.Visible = false;
                        lblexist.Text = "Your have already rated this product";
                        lblexist.Visible = true;
                    }
                }
                else
                {
                   // Rating1.Visible = false;
                    lblerr.Visible = true;
                    //Rating1.Visible = false;
                    lblexist.Visible = false;
                }


            }

        }
    }

    private void generateqr()
    {
        //string code = HttpContext.Current.Request.Url.ToString();
        string code = Request.Url.ToString();
        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
        System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
        imgBarCode.Height = 150;
        imgBarCode.Width = 150;
        using (Bitmap bitMap = qrCode.GetGraphic(20))
        {
            using (MemoryStream ms = new MemoryStream())
            {
                bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = ms.ToArray();
                imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }
            plBarCode.Controls.Add(imgBarCode);
        }
    }

    private void bindbigimg()
    {
        int PID = Convert.ToInt32(Request.QueryString["PID"]);
        var dc = new DataClassesDataContext();
        var tb = (from obp in dc.tblProducts join obi in dc.tblImages on obp.AlbumId equals obi.AlbumId where obp.ProductId == PID && obi.IsDefault == true select obi).Take(1).SingleOrDefault().Url;
        imgfirst.ImageUrl = "Gallery/" + tb;
        var ob = from ob1 in dc.tblProducts
                 join ob2 in dc.tblImages on ob1.AlbumId equals ob2.AlbumId
                 where ob1.ProductId == PID && ob2.IsDefault == false
                 select new
                 {
                     ob2.ImageId,
                     ob2.Url
                 };
        Repeater2.DataSource = ob;
        Repeater2.DataBind();
    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        int PID = Convert.ToInt32(Request.QueryString["PID"]);
        tblProduct tp = (from ob in dc.tblProducts where ob.ProductId == PID select ob).Take(1).SingleOrDefault();
        lblproductname.Text = tp.Name;
        lbldesc.Text = tp.Desc;
        lblprice.Text = tp.Price.ToString();
        lblcategory.Text = (from ob1 in dc.tblProducts join ob2 in dc.tblCategories on ob1.CategoryId equals ob2.CategoryId where ob1.ProductId == PID select ob2).Take(1).SingleOrDefault().Name;
        lblpprice.Text = tp.Price.ToString();
        lblmno.Text = tp.ModelNo;
        lblsellname.Text = (from ob3 in dc.tblProducts join ob4 in dc.tblUsers on ob3.UserId equals ob4.UserId where ob3.ProductId == PID select ob4).Take(1).SingleOrDefault().FName;
        lblmfd.Text = Convert.ToString(tp.MfdDate);
        lblexp.Text = Convert.ToString(tp.ExpDate);
        lblreviewcount.Text = Convert.ToString((from obr in dc.tblRatings where obr.ProductId == PID select obr).ToList().Count());
        lblavai.Text = lblreviewcount.Text;
        if (Convert.ToInt32(lblavai.Text) > 0)
        {
            lblstat.Text = "Please Provide Your Rating on &ldquo;" + lblproductname.Text + "&rdquo; ";
        }
        else
        {
            lblstat.Text = "Be the first to review &ldquo;" + lblproductname.Text + "&rdquo; ";
        }
    }

    private void bindsmallimg()
    {
        int PID = Convert.ToInt32(Request.QueryString["PID"]);
        var dc = new DataClassesDataContext();
        var tb = (from obp in dc.tblProducts join obi in dc.tblImages on obp.AlbumId equals obi.AlbumId where obp.ProductId == PID && obi.IsDefault == true select obi).Take(1).SingleOrDefault().Url;
        imgfirstthumb.ImageUrl = "Gallery/" + tb;
        //var ob3 = (from ob1 in dc.tblImages join ob2 in dc.tblProducts on ob1.AlbumId equals ob2.AlbumId where ob2.ProductId == 2 && ob1.IsDefault == false select ob1);
        //foreach ( tblImage obn in ob3)
        //{

        //}
        var ob = from ob1 in dc.tblProducts
                 join ob2 in dc.tblImages on ob1.AlbumId equals ob2.AlbumId
                 where ob1.ProductId == PID && ob2.IsDefault == false
                 select new
                 {
                     ob2.ImageId,
                     ob2.Url
                 };
        Repeater1.DataSource = ob;
        Repeater1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int PID = Convert.ToInt32(Request.QueryString["PID"]);
        var ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        if (ID > 0)
        {
            int nw = (from ob1 in dc.tblCarts where ob1.ProductId == PID && ob1.UserId == ID select ob1).ToList().Count();
            if (nw > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript10", "swal('Already Exist!', 'Product is already in cart !!','error')", true);
            }
            else
            {
                tblCart tc = new tblCart();
                tc.UserId = ID;
                tc.Qty = txtquantity.Value;
                tc.ProductId = PID;
                tc.MacAddress = Service.GetMacAddress();
                tc.CreatedOn = DateTime.Now;
                dc.tblCarts.InsertOnSubmit(tc);
                dc.SubmitChanges();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript11", "swal('Cart Updated!', 'Product is successfully inserted in cart', 'success')", true);
                var obc = (from obn in dc.tblCarts where obn.UserId == ID select obn).ToList().Count;
                Label lb = (Label)Master.FindControl("lblcounter");
                lb.Text = obc.ToString();
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript12", "swal('Not A User!', 'Please login/Register first', 'warning')", true);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
    protected void OnRatingChanged(object sender, RatingEventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO UserRatings VALUES(@Rating)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Rating", e.Value);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

    }

    protected void btnrating_Click(object sender, EventArgs e)
    {

    }

    protected void Rating1_Changed(object sender, RatingEventArgs e)
    {

        //int rating = Convert.ToInt32(e.Value);
        //var dc = new DataClassesDataContext();
        //tblRating tr = new tblRating();
        //tr.UserId = Convert.ToInt32(Session["UID"]);
        //tr.Rating = rating;
        //tr.ProductId = Convert.ToInt32(Request.QueryString["PID"]);
        //dc.tblRatings.InsertOnSubmit(tr);
        //dc.SubmitChanges();
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript10", "swal('Thank You', 'For Your Rating', 'success')", true);
        //Rating1.Visible = false;
    }
}
