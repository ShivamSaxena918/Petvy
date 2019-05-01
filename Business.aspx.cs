using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Business : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddd();
        }

    }
    private void binddd()
    {
        var dc = new DataClassesDataContext();
        var country = dc.CountryMasters;
        ddcountrylist.DataTextField = "Name";
        ddcountrylist.DataValueField = "ID";
        ddcountrylist.DataSource = country;
        ddcountrylist.DataBind();
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

    protected void btnregister_Click(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        if (FileUpload1.HasFile)
        {
            string path = Server.MapPath("Gallery");
            tblAlbum ta = new tblAlbum();
            ta.CreatedOn = DateTime.Now;
            ta.IsActive = true;
            ta.IsAudio = false;
            ta.IsImage = true;
            ta.IsVideo = false;
            ta.Name = "Business" + Convert.ToString(ID);
            dc.tblAlbums.InsertOnSubmit(ta);
            dc.SubmitChanges();

            int ob = (from taab in dc.tblAlbums orderby taab.AlbumId descending select taab).Take(1).SingleOrDefault().AlbumId;

            foreach (HttpPostedFile file in FileUpload1.PostedFiles)
            {
                string ext = System.IO.Path.GetExtension(file.FileName);
                int IDD;
                tblImage LastID = (from oi in dc.tblImages orderby oi.ImageId descending select oi).Take(1).SingleOrDefault();
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
                obj.AlbumId = ob;
                obj.CreatedOn = DateTime.Now;
                obj.Url = IDD + ext;
                obj.IsActive = true;
                dc.tblImages.InsertOnSubmit(obj);
                dc.SubmitChanges();
                file.SaveAs(path + "/" + IDD + "" + ext);
            }

            tblAddress taa = new tblAddress();
            taa.Address = txtstreet.Value;
            taa.Area = txtarea.Value;
            taa.CityId = Convert.ToInt32(ddcitylist.SelectedValue);
            taa.CreatedOn = DateTime.Now;
            taa.IsActive = true;
            taa.Landmark = txtlandmark.Value;
            taa.Pincode = txtpin.Value;
            taa.UserId = ID;
            dc.tblAddresses.InsertOnSubmit(taa);
            dc.SubmitChanges();
            int last = (from oob in dc.tblAddresses orderby oob.AddressId descending select oob).Take(1).SingleOrDefault().AddressId;

            tblBusiness tb = new tblBusiness();
            tb.UserId = ID;
            tb.Title = txttitle.Value;
            tb.GSTNo = txtGST.Value;
            tb.ContactNo = txtphno.Value;
            tb.Email = txtemail.Value;
            tb.AlbumId = ob;
            tb.WebURL = txtURL.Value;
            tb.AddressId = last;
            dc.tblBusinesses.InsertOnSubmit(tb);
            dc.SubmitChanges();
            tblUser tu = (from obu in dc.tblUsers where obu.UserId == ID select obu).Take(1).SingleOrDefault(); ;
            tu.IsBusiness = true;
            dc.SubmitChanges();
            Response.Redirect("Default.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Fatal Error', 'No Image Found', 'error')", true);
        }
    }
}