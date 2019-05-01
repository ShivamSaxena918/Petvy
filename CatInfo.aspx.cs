using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CatInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddata();
        }
    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        var ob = (from cm in dc.tblCMSPages where cm.Title == "CatInfo" select cm).Take(1).SingleOrDefault().Description;
        Label1.Text = ob;
    }
}