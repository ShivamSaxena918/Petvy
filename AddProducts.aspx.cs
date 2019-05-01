using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProducts : System.Web.UI.Page
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
                binddd();
                bindrepeater();

            }
        }
        ddsubcategory.Visible = false;
        lblcate.Visible = false;

    }

    private void bindrepeater()
    {
        var dc = new DataClassesDataContext();
        var tp = (from ob in dc.tblProducts
                  where ob.UserId == Convert.ToInt32(Session["UID"])
                  orderby ob.ProductId descending
                  select new
                  {
                      ob.ProductId,
                      ob.Price,
                      ob.Name,
                      ob.UserId,
                      Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                      Product_Image2 = (from ob2 in dc.tblImages where ob.AlbumId == ob2.AlbumId && ob2.IsDefault == false select ob2).Take(1).SingleOrDefault().Url
                  }).Take(3);
        DataList1.DataSource = tp;
        DataList1.DataBind();
    }

    private void binddd()
    {
        var dc = new DataClassesDataContext();
        var ob = from ob1 in dc.tblCategories where ob1.ParentCategoryId == null select ob1;
        ddcategory.DataTextField = "Name";
        ddcategory.DataValueField = "CategoryID";
        ddcategory.DataSource = ob;
        ddcategory.DataBind();
        ListItem itm = new ListItem("Select Category", "0");
        itm.Selected = true;
        ddcategory.Items.Add(itm);

    }
    protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddcategory.SelectedValue == Convert.ToString(0))
        {
            ddsubcategory.Visible = false;
            lblcate.Visible = false;

        }
        else
        {
            lblcate.Visible = true;
            ddsubcategory.Visible = true;
            var dc = new DataClassesDataContext();
            var cate = from ob in dc.tblCategories where ob.ParentCategoryId == Convert.ToInt32(ddcategory.SelectedValue) select ob;
            ddsubcategory.DataTextField = "Name";
            ddsubcategory.DataValueField = "CategoryID";
            ddsubcategory.DataSource = cate;
            ddsubcategory.DataBind();
        }

    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var da = DateTime.Today;

        if (FileUpload1.HasFile)
        {
            if (Convert.ToDateTime(txtmfdate.Text) < da && Convert.ToDateTime(txtexpdate.Text) > da && Convert.ToDateTime(txtexpdate.Text) != Convert.ToDateTime(txtmfdate.Text))
            {
                if (ddcategory.SelectedValue == "0")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript11", "swal('Fatal Error', 'No Category Selected', 'error')", true);
                }
                else
                {

                    var ob = (from oba in dc.tblProducts select oba).ToList().Count;
                    tblAlbum ta = new tblAlbum();
                    ta.CreatedOn = DateTime.Now;
                    ta.IsActive = true;
                    ta.IsAudio = false;
                    ta.IsImage = true;
                    ta.IsVideo = false;
                    ta.Name = "Product" + ob;
                    dc.tblAlbums.InsertOnSubmit(ta);
                    dc.SubmitChanges();

                    string path = Server.MapPath("Gallery");
                    int obnn = (from taa in dc.tblAlbums orderby taa.AlbumId descending select taa).Take(1).SingleOrDefault().AlbumId;
                    if (FileUpload1.HasFile)
                    {


                        if (FileUpload1.PostedFiles.Count < 2)
                        {
                            tblImage obj = new tblImage();
                            obj.Url = FileUpload1.FileName;
                            FileUpload1.SaveAs(path + "/" + FileUpload1.FileName);
                            obj.AlbumId = obnn;
                            obj.CreatedOn = DateTime.Now;
                            obj.IsActive = true;
                            obj.IsDefault = true;
                            dc.tblImages.InsertOnSubmit(obj);
                            dc.SubmitChanges();
                            tblImage oob = new tblImage();
                            oob.Url = "download.png";
                            oob.AlbumId = obnn;
                            oob.CreatedOn = DateTime.Now;
                            oob.IsActive = true;
                            oob.IsDefault = false;
                            dc.tblImages.InsertOnSubmit(oob);
                            dc.SubmitChanges();
                        }
                        else
                        {
                            foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                            {
                                tblImage LastID = (from oi in dc.tblImages orderby oi.ImageId descending select oi).Take(1).SingleOrDefault();
                                string ext = System.IO.Path.GetExtension(file.FileName);
                                int IDD;

                                if (LastID == null)
                                {
                                    IDD = 1;

                                }
                                else
                                {
                                    IDD = LastID.ImageId + 1;
                                }
                                tblImage obj = new tblImage();
                                if (FileUpload1.PostedFiles.First() == file)
                                {
                                    obj.IsDefault = true;
                                }
                                else
                                {
                                    obj.IsDefault = false;
                                }
                                obj.AlbumId = obnn;
                                obj.CreatedOn = DateTime.Now;
                                obj.Url = IDD + ext;
                                obj.IsActive = true;
                                dc.tblImages.InsertOnSubmit(obj);
                                dc.SubmitChanges();
                                file.SaveAs(path + "/" + IDD + "" + ext);
                            }
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript91", "swal('Fatal Error', 'No Image Found', 'error')", true);
                    }





                    int obnd = (from taa in dc.tblAlbums orderby taa.AlbumId descending select taa).Take(1).SingleOrDefault().AlbumId;
                    tblProduct tp = new tblProduct();
                    tp.UserId = Convert.ToInt32(Session["UID"]);
                    tp.Price = Convert.ToDecimal(txtprice.Value);
                    tp.Name = txtpname.Value;
                    tp.ModelNo = txtmno.Value;
                    tp.MfdDate = Convert.ToDateTime(txtmfdate.Text);
                    if (ddcategory.SelectedValue == "Food")
                    {
                        tp.IsFood = true;
                    }
                    else
                    {
                        tp.IsAccessory = false;
                    }
                    tp.IsActive = true;
                    tp.ExpDate = Convert.ToDateTime(txtexpdate.Text);
                    tp.CreatedOn = DateTime.Now;
                    tp.CategoryId = Convert.ToInt32(ddsubcategory.SelectedValue);
                    tp.AlbumId = obnd;
                    tp.Desc = txtdesc.Text;
                    dc.tblProducts.InsertOnSubmit(tp);
                    dc.SubmitChanges();
                    var last = (from obdp in dc.tblProducts orderby obdp.ProductId descending select obdp).Take(1).SingleOrDefault().ProductId;
                    Response.Redirect("ProductProfile.aspx?PID=" + last);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript91", "swal('Fatal Error', 'Please Select Valid Manufacturing OR Expiry Date', 'error')", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript91", "swal('Fatal Error', 'No Image Found', 'error')", true);
        }
        //var last = (from la in dc.tblProducts orderby la.ProductId descending select la).Take(1).SingleOrDefault().ProductId;    
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Success', 'Your Product Is Successfully Added', 'success')", true);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript2", "window.location='ProductProfile.aspx?PID="+last+"';", true);
    }

    protected void ddsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}