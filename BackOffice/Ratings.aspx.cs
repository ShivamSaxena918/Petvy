using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ratings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var ID = Convert.ToString(HttpContext.Current.Session["AID"]);
            if (ID == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                bindrepeter();
            }
        }
    }
    private void bindrepeter()
    {
        var dc = new DataClassesDataContext();
        var ob = from ob1 in dc.tblRatings
                 join ob2 in dc.tblProducts on ob1.ProductId equals ob2.ProductId
                 join ob3 in dc.tblUsers on ob1.UserId equals ob3.UserId
                 join ob4 in dc.tblImages on ob2.AlbumId equals ob4.AlbumId
                 where ob4.IsDefault == true
                 select new
                 {
                        
                     ob1.Rating,
                     ob2.Name,
                     ob3.FName,
                     ob4.Url
                 };
        rptrating.DataSource = ob;
        rptrating.DataBind();
    }
    protected void rptrating_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        bindrepeter();
    }
}