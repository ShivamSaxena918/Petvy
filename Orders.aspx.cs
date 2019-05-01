using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
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
                binddata();

            }
        }
    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        var count = (from nn in dc.tblOrderDetails join mm in dc.tblOrders on nn.OrderId equals mm.OrderId where mm.UserId == Convert.ToInt32(Session["UID"]) select nn).ToList().Count;
        if (count <= 0)
        {
            Response.Redirect("EmptyOrder.aspx");
        }
        else
        {
            var ob = from ob1 in dc.tblOrderDetails
                     join ob2 in dc.tblOrders on ob1.OrderId equals ob2.OrderId
                     join ob3 in dc.tblProducts on ob1.ProductId equals ob3.ProductId
                     where ob2.UserId == Convert.ToInt32(Session["UID"])
                     select new
                     {
                         ob3.ProductId,
                         ob2.CreatedOn,
                         ob2.TransNo,
                         ob3.Price,
                         ob3.Name,
                         seller_fname = (from ob4 in dc.tblUsers where ob4.UserId == ob3.UserId select ob4).Take(1).SingleOrDefault().FName,
                         seller_lname = (from ob4 in dc.tblUsers where ob4.UserId == ob3.UserId select ob4).Take(1).SingleOrDefault().LName,
                     };
            Repeater1.DataSource = ob;
            Repeater1.DataBind();
            foreach (RepeaterItem item in Repeater1.Items)
            {
                HiddenField hfid = (HiddenField)item.FindControl("Hid");
                Image img = (Image)item.FindControl("imgproduct");
                var ob5 = (from ob6 in dc.tblImages join ob7 in dc.tblProducts on ob6.AlbumId equals ob7.AlbumId where ob7.ProductId == Convert.ToInt32(hfid.Value) && ob6.IsDefault == true select ob6).Take(1).SingleOrDefault().Url;
                img.ImageUrl = "Gallery/" + ob5;
            }
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);
        Response.Redirect("ProductProfile.aspx?PID=" + ID);
    }
}