using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProduct();
        }
        

    }
    private void BindProduct()

    {
        var Id = Request.QueryString["PID"];
        var dc = new DataClassesDataContext();
        tblProduct ta = (from ob in dc.tblProducts where ob.ProductId == Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
        lblproName.Text = ta.Name;
        lblPrice.Text = " " + ta.Price;
        lblmfgDate.Text = " " + ta.MfdDate;
        lblExpDate.Text = " " + ta.ExpDate;
        lblCreatedOn.Text = " " + ta.CreatedOn;
        var Images = from ob in dc.tblImages
                     join ob2 in dc.tblProducts on ob.AlbumId equals ob2.AlbumId
                     where ob2.ProductId == Convert.ToInt32(Id) 
                     select new
                     {
                         ob.Url,
                         ob.AlbumId
                     };
        ddproduct.DataSource = Images;
        ddproduct.DataBind();


        
        //var Id = Request.QueryString["PID"];
        //var dc = new DataClassesDataContext();
        //var product = from ob in dc.tblProducts
        //            select new
        //                {
        //                    ob.Name,
        //                    ob.UserId,
        //                    ob.Price,
        //                    ob.MfdDate,
        //                    ob.ExpDate,
        //                    ob.AlbumId,
        //                    ob.CreatedOn,
        //                    ob.IsActive,
        //                    ImageName = (from ob2 in dc.tblImages where ob2.AlbumId == ob.AlbumId && ob2.IsDefault == true select ob2.Url).Take(1).SingleOrDefault()
        //                };
       
        //rptproduct.DataSource = product;
        //rptproduct.DataBind();
        //foreach(RepeaterItem itms in rptproduct.Items)
        //{
        //    Label lblactive = (Label)itms.FindControl("lblActive");
        //    tblProduct protbl = (from obe in dc.tblProducts where obe.ProductId == Convert.ToInt32(Id) select obe).Take(1).SingleOrDefault();
        //    if (protbl.IsActive == true)
        //    {
        //        lblactive.Text = "check";
            
        //    }
        //    else
        //    {
        //        lblactive.Text = "clear";
            
        //    }

        //}
    }

    protected void rptproduct_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}