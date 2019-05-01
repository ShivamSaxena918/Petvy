using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
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
                Panel1.Visible = false;
                btnsubmit2.Visible = false;
                btncancle2.Visible = false;
                binddata();
                bindcity();
                bindstate();
                bindcountry();
            }
        }
    }

    private void bindcountry()
    {
        var dc = new DataClassesDataContext();
        ddcountrylist.DataSource = from ob in dc.CountryMasters select ob;
        ddcountrylist.DataTextField = "Name";
        ddcountrylist.DataValueField = "ID";
        ddcountrylist.DataBind();
        DropDownList1.DataSource = from ob in dc.CountryMasters select ob;
        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "ID";
        DropDownList1.DataBind();

    }

    private void bindstate()
    {
        var dc = new DataClassesDataContext();
        ddstatelist.DataSource = from ob in dc.StateMasters select ob;
        ddstatelist.DataTextField = "Name";
        ddstatelist.DataValueField = "ID";
        ddstatelist.DataBind();
        DropDownList2.DataSource = from ob in dc.StateMasters select ob;
        DropDownList2.DataTextField = "Name";
        DropDownList2.DataValueField = "ID";
        DropDownList2.DataBind();
    }

    private void bindcity()
    {
        var dc = new DataClassesDataContext();
        ddcitylist.DataSource = from ob in dc.CityMasters select ob;
        ddcitylist.DataTextField = "Name";
        ddcitylist.DataValueField = "ID";
        ddcitylist.DataBind();
        DropDownList3.DataSource = from ob in dc.CityMasters select ob;
        DropDownList3.DataTextField = "Name";
        DropDownList3.DataValueField = "ID";
        DropDownList3.DataBind();
    }

    private void binddata()
    {
        int ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        tblUser tu = (from ob in dc.tblUsers where ob.UserId == ID select ob).Take(1).SingleOrDefault();
        imgprofile.ImageUrl = "User_Images/" + tu.Image;
        txtname.Value = tu.FName;
        txtmname.Value = tu.MName;
        txtlname.Value = tu.LName;
        txtcno.Value = tu.ContactNo;
        txtemail.Value = tu.Email;
        tblAddress ta = (from ob1 in dc.tblAddresses where ob1.UserId == ID select ob1).Take(1).SingleOrDefault();
        var count = (from obn in dc.tblAddresses where obn.UserId == ID select obn).ToList().Count;
        if (count > 0)
        {
            txtarea.Value = ta.Area;
            txtlandmark.Value = ta.Landmark;
            txtpin.Value = ta.Pincode;
            txtstreet.Value = ta.Address;
            int cityID = (from ob in dc.CityMasters where ob.ID == ta.CityId select ob).Take(1).SingleOrDefault().ID;
            ddcitylist.SelectedValue = Convert.ToString(cityID);
            int stateID = (from ob in dc.StateMasters join ob1 in dc.CityMasters on ob.ID equals ob1.StateID where ob1.ID == cityID select ob).Take(1).SingleOrDefault().ID;
            ddstatelist.SelectedValue = Convert.ToString(stateID);
            int countryID = (from ob in dc.CountryMasters join ob1 in dc.StateMasters on ob.ID equals ob1.CountryID where ob1.ID == stateID select ob).Take(1).SingleOrDefault().ID;
            ddcountrylist.SelectedValue = Convert.ToString(countryID);
        }
        var count1 = (from ob in dc.tblBusinesses where ob.UserId == ID select ob).ToList().Count;
        if (count1 > 0)
        {
            tblBusiness tb = (from ob in dc.tblBusinesses where ob.UserId == ID select ob).Take(1).SingleOrDefault();
            txtGST.Value = tb.GSTNo;
            txtURL.Value = tb.WebURL;
            txttitle.Value = tb.Title;
            txteemail.Value = tb.Email;
            txttphno.Value = tb.ContactNo;
            tblAddress taa = (from ob1 in dc.tblAddresses where ob1.AddressId == tb.AddressId select ob1).Take(1).SingleOrDefault();
            txttstreet.Value = taa.Address;
            txttarea.Value = taa.Area;
            txttpin.Value = taa.Pincode;
            txttlandmark.Value = taa.Landmark;
            int cityID = (from ob in dc.CityMasters where ob.ID == taa.CityId select ob).Take(1).SingleOrDefault().ID;
            DropDownList3.SelectedValue = Convert.ToString(cityID);
            int stateID = (from ob in dc.StateMasters join ob1 in dc.CityMasters on ob.ID equals ob1.StateID where ob1.ID == cityID select ob).Take(1).SingleOrDefault().ID;
            DropDownList2.SelectedValue = Convert.ToString(stateID);
            int countryID = (from ob in dc.CountryMasters join ob1 in dc.StateMasters on ob.ID equals ob1.CountryID where ob1.ID == stateID select ob).Take(1).SingleOrDefault().ID;
            DropDownList1.SelectedValue = Convert.ToString(countryID);
            var all = from obb in dc.tblBusinesses
                      join obi in dc.tblImages on obb.AlbumId equals obi.AlbumId
                      where obb.UserId == ID
                      select new
                      {
                          obi.ImageId,
                          obi.Url
                      };
            DataList1.DataSource = all;
            DataList1.DataBind();

        }

        if (tu.IsBusiness == true)
        {
            lbbusiness.Visible = true;
        }
        else
        {
            lbbusiness.Visible = false;
        }
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


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        tblUser tu = (from ob in dc.tblUsers where ob.UserId == ID select ob).Take(1).SingleOrDefault();
        tu.FName = txtname.Value;
        tu.MName = txtmname.Value;
        tu.LName = txtlname.Value;
        tu.ContactNo = txtcno.Value;
        if (FileUpload1.HasFile)
        {
            tu.Image = FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("User_Images") + "/" + FileUpload1.FileName);
        }
        dc.SubmitChanges();

        var count = (from ob in dc.tblAddresses where ob.UserId == ID select ob).ToList().Count;
        if (count > 0)
        {
            tblAddress ta = (from ob in dc.tblAddresses where ob.UserId == ID select ob).Take(1).SingleOrDefault();
            ta.Pincode = txtpin.Value;
            ta.CityId = Convert.ToInt32(ddcitylist.SelectedValue);
            ta.Address = txtstreet.Value;
            ta.Landmark = txtlandmark.Value;
            ta.Area = txtarea.Value;
            dc.SubmitChanges();

        }
        else
        {
            tblAddress ta = new tblAddress();
            ta.Address = txtstreet.Value;
            ta.Landmark = txtlandmark.Value;
            ta.Area = txtarea.Value;
            ta.Pincode = txtpin.Value;
            ta.CreatedOn = DateTime.Now;
            ta.IsActive = true;
            ta.CityId = Convert.ToInt32(ddcitylist.SelectedValue);
            ta.UserId = ID;
            dc.tblAddresses.InsertOnSubmit(ta);
            dc.SubmitChanges();
        }
        Response.Redirect("Profile1.aspx");
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        btnsubmit.Visible = false;
        Panel1.Visible = true;
        btnsubmit2.Visible = true;
        btncancel1.Visible = false;
        lbbusiness.Visible = false;
        btncancle2.Visible = true;
    }

    protected void btnsubmit2_Click(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        tblUser tu = (from ob in dc.tblUsers where ob.UserId == ID select ob).Take(1).SingleOrDefault();
        tu.FName = txtname.Value;
        tu.MName = txtmname.Value;
        tu.LName = txtlname.Value;
        tu.ContactNo = txtcno.Value;
        if (FileUpload1.HasFile)
        {
            tu.Image = FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("User_Images") + "/" + FileUpload1.FileName);
        }
        dc.SubmitChanges();

        var count = (from ob in dc.tblAddresses where ob.UserId == ID select ob).ToList().Count;
        if (count > 0)
        {
            tblAddress ta = (from ob in dc.tblAddresses where ob.UserId == ID select ob).Take(1).SingleOrDefault();
            ta.Pincode = txtpin.Value;
            ta.CityId = Convert.ToInt32(ddcitylist.SelectedValue);
            ta.Address = txtstreet.Value;
            ta.Landmark = txtlandmark.Value;
            ta.Area = txtarea.Value;
            dc.SubmitChanges();

        }
        else
        {
            tblAddress ta = new tblAddress();
            ta.Address = txtstreet.Value;
            ta.Landmark = txtlandmark.Value;
            ta.Area = txtarea.Value;
            ta.Pincode = txtpin.Value;
            ta.CreatedOn = DateTime.Now;
            ta.IsActive = true;
            ta.CityId = Convert.ToInt32(ddcitylist.SelectedValue);
            ta.UserId = ID;
            dc.tblAddresses.InsertOnSubmit(ta);
            dc.SubmitChanges();
        }
        tblBusiness tb = (from ob in dc.tblBusinesses where ob.UserId == ID select ob).Take(1).SingleOrDefault();
        tb.WebURL = txtURL.Value;
        tb.Title = txttitle.Value;
        tb.GSTNo = txtGST.Value;
        tb.Email = txteemail.Value;
        tb.ContactNo = txttphno.Value;
        int last = Convert.ToInt32(tb.AlbumId);
        tblAddress tea = (from ob in dc.tblAddresses where ob.AddressId == tb.AddressId select ob).Take(1).SingleOrDefault();
        tea.Address = txttstreet.Value;
        tea.Area = txttarea.Value;
        tea.CityId = Convert.ToInt32(DropDownList3.SelectedValue);
        tea.Landmark = txttlandmark.Value;
        tea.Pincode = txttpin.Value;
        dc.SubmitChanges();
        string path = Server.MapPath("Gallery");
        if (FileUpload2.HasFile)
        {
            foreach (HttpPostedFile file in FileUpload2.PostedFiles)
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
                obj.AlbumId = last;
                obj.CreatedOn = DateTime.Now;
                obj.Url = IDD + ext;
                obj.IsActive = true;
                dc.tblImages.InsertOnSubmit(obj);
                dc.SubmitChanges();
                file.SaveAs(path + "/" + IDD + "" + ext);
            }
        }
        Response.Redirect("Profile1.aspx");
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        var dc = new DataClassesDataContext();
        int imgid = Convert.ToInt32(e.CommandArgument);
        int ID = Convert.ToInt32(Session["UID"]);
        if (e.CommandName == "delete")
        {
            var ob = (from tb in dc.tblBusinesses join ti in dc.tblImages on tb.AlbumId equals ti.AlbumId where ti.ImageId == imgid && tb.UserId == ID select ti).Take(1).SingleOrDefault();
            dc.tblImages.DeleteOnSubmit(ob);
            dc.SubmitChanges();
            binddata();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var state = from ob in dc.StateMasters where ob.CountryID == Convert.ToInt32(ddcountrylist.SelectedValue) select ob;
        DropDownList2.DataTextField = "Name";
        DropDownList2.DataValueField = "ID";
        DropDownList2.DataSource = state;
        DropDownList2.DataBind();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var city = from ob in dc.CityMasters where ob.StateID == Convert.ToInt32(ddstatelist.SelectedValue) select ob;
        DropDownList3.DataTextField = "Name";
        DropDownList3.DataValueField = "ID";
        DropDownList3.DataSource = city;
        DropDownList3.DataBind();
    }

    protected void btncancel1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profile1.aspx");
    }
}