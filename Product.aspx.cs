using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindsort();
            binddata();
            binddropdown();
            DropDownList2.Visible = false;
        }
    }

    private void bindsort()
    {
        ListItem itm1 = new ListItem("None", "0");
        itm1.Selected = true;
        ddsort.Items.Add(itm1);
        ListItem itm2 = new ListItem("Sort By Price(Ascending)", "1");
        ddsort.Items.Add(itm2);
        ListItem itm3 = new ListItem("Sort By Price(Descending)", "2");
        ddsort.Items.Add(itm3);

    }

    private void binddropdown()
    {
        var dc = new DataClassesDataContext();
        var ob = from ob1 in dc.tblCategories where ob1.ParentCategoryId == null && ob1.IsActive == true select ob1;
        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "CategoryID";
        DropDownList1.DataSource = ob;
        DropDownList1.DataBind();
        ListItem itm = new ListItem("Select All", "0");
        itm.Selected = true;
        DropDownList1.Items.Add(itm);



    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        var tp = from ob in dc.tblProducts
                 where ob.IsActive == true
                 select new
                 {
                     ob.ProductId,
                     ob.Price,
                     ob.Name,
                     ob.UserId,
                     Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                     Product_Image2 = (from ob2 in dc.tblImages where ob.AlbumId == ob2.AlbumId && ob2.IsDefault == false select ob2).Take(1).SingleOrDefault().Url
                 };
        DataList1.DataSource = tp;
        DataList1.DataBind();

    }

    protected void DataList1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        var ID = Convert.ToInt32(Session["UID"]);
        var id = Convert.ToInt32(e.CommandArgument);
        var dc = new DataClassesDataContext();
        if (e.CommandName == "addtocart")
        {
            if (ID != 0)
            {
                int nw = (from ob1 in dc.tblCarts where ob1.ProductId == id && ob1.UserId == ID select ob1).ToList().Count();
                if (nw > 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Already Exist!', 'Product is already in cart !!','error')", true);
                }
                else
                {
                    tblCart tc = new tblCart();
                    tc.CreatedOn = DateTime.Now;
                    tc.ProductId = id;
                    tc.UserId = ID;
                    tc.Qty = Convert.ToString(1);
                    dc.tblCarts.InsertOnSubmit(tc);
                    dc.SubmitChanges();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Cart Updated!', 'Product is successfully inserted in cart', 'success')", true);
                    var obc = (from obn in dc.tblCarts where obn.UserId == ID select obn).ToList().Count;
                    Label lb = (Label)Master.FindControl("lblcounter");
                    lb.Text = obc.ToString();
                    //Response.Redirect("Product.aspx");
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Not A User!', 'Please login/Register first', 'warning')", true);
                //Response.Redirect("Userlogin.aspx");
            }
        }
        //binddata();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        if (DropDownList1.SelectedValue != "0")
        {


            var obf = from ob in dc.tblProducts
                      join ob2 in dc.tblCategories on ob.CategoryId equals ob2.CategoryId
                      where ob2.ParentCategoryId == Convert.ToInt32(DropDownList1.SelectedValue)
                       && ob.IsActive == true
                      select new
                      {
                          ob.ProductId,
                          ob.Price,
                          ob.Name,
                          ob.UserId,
                          Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                          Product_Image2 = (from obn in dc.tblImages where ob.AlbumId == obn.AlbumId && obn.IsDefault == false select obn).Take(1).SingleOrDefault().Url
                      };
            DataList1.DataSource = obf;
            DataList1.DataBind();
            var obm = (from ob3 in dc.tblCategories where ob3.ParentCategoryId == Convert.ToInt32(DropDownList1.SelectedValue) && ob3.IsActive == true select ob3);
            DropDownList2.DataTextField = "Name";
            DropDownList2.DataValueField = "CategoryID";
            DropDownList2.DataSource = obm;
            DropDownList2.DataBind();
            ListItem itm = new ListItem("Select All", "0");
            itm.Selected = true;
            DropDownList2.Items.Add(itm);
            DropDownList2.Visible = true;
        }
        else
        {
            DropDownList2.SelectedValue = Convert.ToString(0);
            DropDownList2.Visible = false;
            binddata();
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        if (DropDownList2.SelectedValue != "0")
        {
            var obf = from ob in dc.tblProducts
                      join ob2 in dc.tblCategories on ob.CategoryId equals ob2.CategoryId
                      where ob2.CategoryId == Convert.ToInt32(DropDownList2.SelectedValue) && ob.IsActive == true
                      select new
                      {
                          ob.ProductId,
                          ob.Price,
                          ob.Name,
                          ob.UserId,
                          Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                          Product_Image2 = (from obn in dc.tblImages where ob.AlbumId == obn.AlbumId && obn.IsDefault == false select obn).Take(1).SingleOrDefault().Url
                      };
            DataList1.DataSource = obf;
            DataList1.DataBind();
        }
        else if (DropDownList2.SelectedValue == "0")
        {
            //DropDownList2.Visible = false;

            var obfm = from ob in dc.tblProducts
                       join ob2 in dc.tblCategories on ob.CategoryId equals ob2.CategoryId
                       where ob2.ParentCategoryId == Convert.ToInt32(DropDownList1.SelectedValue)
                       && ob.IsActive == true
                       select new
                       {
                           ob.ProductId,
                           ob.Price,
                           ob.Name,
                           ob.UserId,
                           Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                           Product_Image2 = (from obn in dc.tblImages where ob.AlbumId == obn.AlbumId && obn.IsDefault == false select obn).Take(1).SingleOrDefault().Url
                       };
            DataList1.DataSource = obfm;
            DataList1.DataBind();
            //binddata();
        }
    }

    protected void ddsort_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();

        if (ddsort.SelectedValue == "0")
        {
            binddata();
        }
        if (ddsort.SelectedValue == "1")
        {
            if (DropDownList1.SelectedValue != "0")
            {
                if (DropDownList2.SelectedValue == "0")
                {
                    var obf = from ob in dc.tblProducts
                              join ob2 in dc.tblCategories on ob.CategoryId equals ob2.CategoryId
                              where ob2.ParentCategoryId == Convert.ToInt32(DropDownList1.SelectedValue)
                               && ob.IsActive == true
                              orderby ob.Price ascending
                              select new
                              {
                                  ob.ProductId,
                                  ob.Price,
                                  ob.Name,
                                  ob.UserId,
                                  Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                                  Product_Image2 = (from obn in dc.tblImages where ob.AlbumId == obn.AlbumId && obn.IsDefault == false select obn).Take(1).SingleOrDefault().Url
                              };
                    DataList1.DataSource = obf;
                    DataList1.DataBind();
                }
                else if(DropDownList2.SelectedValue !="0")
                {
                    var obf = from ob in dc.tblProducts
                              join ob2 in dc.tblCategories on ob.CategoryId equals ob2.CategoryId
                              where ob2.ParentCategoryId == Convert.ToInt32(DropDownList1.SelectedValue)
                               && ob.IsActive == true
                               && ob2.CategoryId == Convert.ToInt32(DropDownList2.SelectedValue)
                              orderby ob.Price ascending
                              select new
                              {
                                  ob.ProductId,
                                  ob.Price,
                                  ob.Name,
                                  ob.UserId,
                                  Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                                  Product_Image2 = (from obn in dc.tblImages where ob.AlbumId == obn.AlbumId && obn.IsDefault == false select obn).Take(1).SingleOrDefault().Url
                              };
                    DataList1.DataSource = obf;
                    DataList1.DataBind();
                }
            }
            else
            {
                var tp = from ob in dc.tblProducts
                         where ob.IsActive == true
                         orderby ob.Price ascending
                         select new
                         {
                             ob.ProductId,
                             ob.Price,
                             ob.Name,
                             ob.UserId,
                             Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                             Product_Image2 = (from ob2 in dc.tblImages where ob.AlbumId == ob2.AlbumId && ob2.IsDefault == false select ob2).Take(1).SingleOrDefault().Url
                         };
                DataList1.DataSource = tp;
                DataList1.DataBind();
            }

        }
        if (ddsort.SelectedValue == "2")
        {
            if (DropDownList1.SelectedValue != "0")
            {
                if (DropDownList2.SelectedValue == "0")
                { 

                    var obf = from ob in dc.tblProducts
                          join ob2 in dc.tblCategories on ob.CategoryId equals ob2.CategoryId
                          where ob2.ParentCategoryId == Convert.ToInt32(DropDownList1.SelectedValue)
                           && ob.IsActive == true
                          orderby ob.Price descending
                          select new
                          {
                              ob.ProductId,
                              ob.Price,
                              ob.Name,
                              ob.UserId,
                              Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                              Product_Image2 = (from obn in dc.tblImages where ob.AlbumId == obn.AlbumId && obn.IsDefault == false select obn).Take(1).SingleOrDefault().Url
                          };
                DataList1.DataSource = obf;
                DataList1.DataBind();
                }
                else if (DropDownList2.SelectedValue !="0")
                {
                    var obf = from ob in dc.tblProducts
                              join ob2 in dc.tblCategories on ob.CategoryId equals ob2.CategoryId
                              where ob2.ParentCategoryId == Convert.ToInt32(DropDownList1.SelectedValue)
                               && ob.IsActive == true
                               && ob2.CategoryId == Convert.ToInt32(DropDownList2.SelectedValue)
                              orderby ob.Price descending
                              select new
                              {
                                  ob.ProductId,
                                  ob.Price,
                                  ob.Name,
                                  ob.UserId,
                                  Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                                  Product_Image2 = (from obn in dc.tblImages where ob.AlbumId == obn.AlbumId && obn.IsDefault == false select obn).Take(1).SingleOrDefault().Url
                              };
                    DataList1.DataSource = obf;
                    DataList1.DataBind();

                }
            }
        
            else
            {
                var tp = from ob in dc.tblProducts
                         where ob.IsActive == true
                         orderby ob.Price descending
                         select new
                         {
                             ob.ProductId,
                             ob.Price,
                             ob.Name,
                             ob.UserId,
                             Product_Image = (from ob1 in dc.tblImages where ob.AlbumId == ob1.AlbumId && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url,
                             Product_Image2 = (from ob2 in dc.tblImages where ob.AlbumId == ob2.AlbumId && ob2.IsDefault == false select ob2).Take(1).SingleOrDefault().Url
                         };
                DataList1.DataSource = tp;
                DataList1.DataBind();
            }
        }
    }
}
