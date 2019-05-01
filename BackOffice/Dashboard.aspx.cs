using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                var dc = new DataClassesDataContext();
                var data = dc.tblOrders.ToList();
                string[] x = new string[data.Count];
                int[] y = new int[data.Count];
                int i = 0;
                foreach (tblOrder or in data)
                {
                    x[i] = or.CreatedOn.Value.Month.ToString();
                    y[i] = (from ob in dc.tblOrders where ob.CreatedOn.Value.Month.ToString() == x[i] select ob).Count();
                    i++;
                }
                // Handler in Webconfig
                MyChart.Series[0].Points.DataBindXY(x, y);
                MyChart.Series[0].ChartType = SeriesChartType.Bar;
                MyChart.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                MyChart.Legends[0].Enabled = true;
            }


        }
        binddata();
    }
    private void binddata()
    {
        var dc = new DataClassesDataContext();
        var ob1 = (from ob2 in dc.tblOrders where ob2.CreatedOn == DateTime.UtcNow.Date select ob2).ToList().Count;
        lblordernew.Text = Convert.ToString(ob1);
        var ob3 = (from ob4 in dc.tblOrders select ob4).ToList().Count;
        lblordertotal.Text = Convert.ToString(ob3);
        var ob5 = (from ob6 in dc.tblUsers where ob6.CreatedOn == DateTime.UtcNow.Date select ob6).ToList().Count;
        lblusernew.Text = Convert.ToString(ob5);
        var ob7 = (from ob8 in dc.tblUsers select ob8).ToList().Count;
        lblusertotal.Text = Convert.ToString(ob7);
        var ob9 = (from ob10 in dc.tblPosts where ob10.CreatedOn == DateTime.Now select ob10).ToList().Count;
        lblpostnew.Text = Convert.ToString(ob9);
        var ob11 = (from ob12 in dc.tblPosts select ob12).ToList().Count;
        lblposttotal.Text = Convert.ToString(ob11);
        var ob13 = (from ob14 in dc.tblEvents where ob14.IsActive == true select ob14).ToList().Count;
        lbleventnew.Text = Convert.ToString(ob13);
        var ob15 = (from ob16 in dc.tblEvents where ob16.IsActive == true select ob16).ToList().Count;
        lbleventtotal.Text = Convert.ToString(ob15);
        var ob17 = (from ob18 in dc.tblUsers where ob18.IsBusiness == true && ob18.CreatedOn == DateTime.UtcNow.Date && ob18.IsActive == true select ob18).ToList().Count;
        lblsellernew.Text = Convert.ToString(ob17);
        var ob19 = (from ob20 in dc.tblUsers where ob20.IsBusiness == true &&  ob20.IsActive == true select ob20).ToList().Count;
        lblsellertotal.Text = Convert.ToString(ob19);
        var ob21 = (from ob22 in dc.tblProducts where ob22.IsActive == true select ob22).ToList().Count;
        lblproductactive.Text = Convert.ToString(ob21);
        var ob23 = (from ob24 in dc.tblProducts select ob24).ToList().Count;
        lblproducttotal.Text = Convert.ToString(ob23);
        var ob25 = (from ob26 in dc.tblCategories where ob26.IsActive == true select ob26).ToList().Count;
        lblcategoryactive.Text = Convert.ToString(ob25);
        var ob27 = (from ob28 in dc.tblCategories select ob28).ToList().Count;
        lblcategorytotal.Text = Convert.ToString(ob27);
        var ob29 = (from ob30 in dc.tblInquiries where ob30.IsReplied == false select ob30).ToList().Count;
        lblinquirynew.Text = ob29.ToString();
        var ob31 = (from ob32 in dc.tblInquiries select ob32).ToList().Count;
        lblinquirytotal.Text = ob31.ToString();
        //var Amoutnsum = (from ob in dc.tblOrders where ob.IsPaid == true select ob.Amt).Sum();
        // lbltotalorder.Text = Convert.ToString( Amoutnsum);


    }

}
