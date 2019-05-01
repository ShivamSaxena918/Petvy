using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var ID = Convert.ToString(HttpContext.Current.Session["AID"]);
        if (ID == "")
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            binddata();
        }

        

    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        var ob1 = (from ob2 in dc.tblOrders where ob2.CreatedOn==DateTime.Now select ob2).ToList().Count;
        lblordernew.Text = Convert.ToString(ob1);
        var ob3 = (from ob4 in dc.tblOrders select ob4).ToList().Count;
        lblordertotal.Text = Convert.ToString(ob3);
        var ob5 = (from ob6 in dc.tblUsers where ob6.CreatedOn == DateTime.Now select ob6).ToList().Count;
        lblusernew.Text = Convert.ToString(ob5);
        var ob7 = (from ob8 in dc.tblUsers select ob8).ToList().Count;
        lblusertotal.Text = Convert.ToString(ob7);
        var ob9 = (from ob10 in dc.tblPosts where ob10.CreatedOn == DateTime.Now select ob10).ToList().Count;
        lblpostnew.Text = Convert.ToString(ob9);
        var ob11 = (from ob12 in dc.tblPosts select ob12).ToList().Count;
        lblposttotal.Text = Convert.ToString(ob11);
        var ob13 = (from ob14 in dc.tblEvents select ob14).ToList().Count;
        lbleventsnew.Text = Convert.ToString(ob13);
        var ob15 = (from ob16 in dc.tblEvents select ob16).ToList().Count;
        lbleventtotal.Text = Convert.ToString(ob15);
    }
}