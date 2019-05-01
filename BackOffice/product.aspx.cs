using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string ID = Convert.ToString(Session["AID"]);
            if (ID == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                BindGird();
            }

        }

    }
    private void BindGird()
    {
        var dc = new DataClassesDataContext();
        var ob = from ta in dc.tblProducts
                 select new
                 {
                     ta.ProductId,
                     ta.Name,
                     ta.CreatedOn,
                     ta.IsActive,
                     ta.AlbumId,
                     ta.UserId,
                     ImageName = (from ob2 in dc.tblImages where ob2.AlbumId == ta.AlbumId && ob2.IsDefault == true select ob2).Take(1).SingleOrDefault().Url
                 };
        rptpro.DataSource = ob;
        rptpro.DataBind();
        foreach (RepeaterItem item in rptpro.Items)
        {

            HiddenField HId = (HiddenField)item.FindControl("HId");
            Label lblActive = (Label)item.FindControl("lblActive");
            tblProduct tbl = (from obe in dc.tblProducts where obe.ProductId == Convert.ToInt32(HId.Value) select obe).Take(1).SingleOrDefault();
            if (tbl.IsActive == true)
            {
                lblActive.Text = "check";
            }
            else
            {
                lblActive.Text = "clear";
            }

        }


    }

    protected void rptview_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var dc = new DataClassesDataContext();
        int ID = Convert.ToInt32(e.CommandArgument);
        tblProduct ta = dc.tblProducts.SingleOrDefault(ob => ob.ProductId == ID);
        if (e.CommandName == "productview")
        {
            Response.Redirect("ProductDetails.aspx?PID=" + ID);
        }
        if(e.CommandName == "Active")
        {
            if(ta.IsActive == true)
            {
                ta.IsActive = false;
            }
            else
            {
                ta.IsActive = true;
            }
            dc.SubmitChanges();
        }
        BindGird();
    }
}