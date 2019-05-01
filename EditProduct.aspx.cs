using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                boundcategory();
                boundsub();
                binddata();
            }
        }
    }

    private void boundsub()
    {
        int ID = Convert.ToInt32(Request.QueryString["PID"]);
        var dc = new DataClassesDataContext();
        var ob = from ob1 in dc.tblCategories where ob1.ParentCategoryId != null select ob1;
        ddsubcategory.DataTextField = "Name";
        ddsubcategory.DataValueField = "CategoryId";
        ddsubcategory.DataSource = ob;
        ddsubcategory.DataBind();

    }

    private void boundcategory()
    {
        int ID = Convert.ToInt32(Request.QueryString["PID"]);
        var dc = new DataClassesDataContext();
        var ob = from ob1 in dc.tblCategories where ob1.ParentCategoryId == null select ob1;
        ddcategory.DataTextField = "Name";
        ddcategory.DataValueField = "CategoryId";
        ddcategory.DataSource = ob;
        ddcategory.DataBind();
    }

    private void binddata()
    {
        int ID = Convert.ToInt32(Request.QueryString["PID"]);
        var dc = new DataClassesDataContext();
        tblProduct tp = (from ob in dc.tblProducts where ob.ProductId == ID select ob).Take(1).SingleOrDefault();
        txtpname.Value = tp.Name;
        txtprice.Value = tp.Price.ToString();
        txtmno.Value = tp.ModelNo;
        txtmfdate.Text = tp.MfdDate.ToString();
        txtexpdate.Text = tp.ExpDate.ToString();
        txtdesc.Text = tp.Desc;
        tblCategory CatID = (from obc in dc.tblCategories where obc.CategoryId == tp.CategoryId select obc).Take(1).SingleOrDefault();
        ddsubcategory.SelectedValue = CatID.CategoryId.ToString();
        ddcategory.SelectedValue = (from obc in dc.tblCategories where obc.CategoryId == CatID.ParentCategoryId select obc).Take(1).SingleOrDefault().CategoryId.ToString();
        var obbb = from ob1 in dc.tblProducts
                   join ob2 in dc.tblImages on ob1.AlbumId equals ob2.AlbumId
                   where ob1.ProductId == ID
                   select new
                   {
                       ob2.ImageId,
                       ob2.Url
                   };
        DataList1.DataSource = obbb;
        DataList1.DataBind();
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int IDD = Convert.ToInt32(Request.QueryString["PID"]);
        var ID = Convert.ToInt32(e.CommandArgument);
        var dc = new DataClassesDataContext();
        tblImage del = (from ob1 in dc.tblImages where ob1.ImageId == ID select ob1).Take(1).SingleOrDefault();
        if (del.IsDefault == false)
        {
            dc.tblImages.DeleteOnSubmit(del);
            dc.SubmitChanges();
        }
        else
        {
            dc.tblImages.DeleteOnSubmit(del);
            dc.SubmitChanges();
            tblImage take = (from ob in dc.tblImages join ob1 in dc.tblProducts on ob.AlbumId equals ob1.AlbumId where ob1.ProductId == IDD && ob.IsDefault== false select ob).Take(1).SingleOrDefault();
            take.IsDefault = true;
            dc.SubmitChanges();
        }
        
        binddata();
    }

    protected void btnregister_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var da = DateTime.Today;

        
            if (Convert.ToDateTime(txtmfdate.Text) < da && Convert.ToDateTime(txtexpdate.Text) > da && Convert.ToDateTime(txtexpdate.Text) != Convert.ToDateTime(txtmfdate.Text))
            {
                if (ddcategory.SelectedValue == "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript11", "swal('Fatal Error', 'No Category Selected', 'error')", true);
                }
                else
                {

                    tblProduct tp = (from ob in dc.tblProducts where ob.ProductId == Convert.ToInt32(Request.QueryString["PID"]) select ob).Take(1).SingleOrDefault();
                    tp.Price = Convert.ToDecimal(txtprice.Value);
                    tp.Name = txtpname.Value;
                    tp.ModelNo = txtmno.Value;
                    tp.MfdDate = Convert.ToDateTime(txtmfdate.Text);
                    tp.ExpDate = Convert.ToDateTime(txtexpdate.Text);
                    tp.CategoryId = Convert.ToInt32(ddsubcategory.SelectedValue);
                    tp.Desc = txtdesc.Text;
                    dc.SubmitChanges();
                    var last = (from ob1 in dc.tblProducts where ob1.ProductId == Convert.ToInt32(Request.QueryString["PID"]) select ob1).Take(1).SingleOrDefault().ProductId;
                    Response.Redirect("ProductProfile.aspx?PID=" + last);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript91", "swal('Fatal Error', 'Please Select Valid Manufacturing OR Expiry Date', 'error')", true);
            }
        
        //var last = (from la in dc.tblProducts orderby la.ProductId descending select la).Take(1).SingleOrDefault().ProductId;    
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Success', 'Your Product Is Successfully Added', 'success')", true);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript2", "window.location='ProductProfile.aspx?PID="+last+"';", true);
    }
}