using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inquiry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
    }
    private void BindGrid()
    {
        var dc = new DataClassesDataContext();
        var data = dc.tblInquiries;
        rptinquiry.DataSource = data;
        rptinquiry.DataBind();

        foreach (RepeaterItem item in rptinquiry.Items)
        {
            HiddenField hdninquiryId = (HiddenField)item.FindControl("hdnInquiryId");
            ImageButton imgReplied = (ImageButton)item.FindControl("imgReplied");
            Label lblicon = (Label)item.FindControl("lblactive");
            int ID = Convert.ToInt32(hdninquiryId.Value);
            tblInquiry contact = dc.tblInquiries.SingleOrDefault(ob => ob.InquiryId == ID);
            if (contact.IsReplied == true)
            {
                lblicon.Text = "check";

            }
            else
            {
                lblicon.Text = "clear";
                lblicon.Attributes.Add("style", "color: red; font-weight: bolder;");
            }
        }
    }
    protected void rptinquiry_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int InquiryId = Convert.ToInt32(e.CommandArgument);
        ViewState["InquiryId"] = InquiryId;
        Session["InquiryId"] = InquiryId;
        var dc = new DataClassesDataContext();
        tblInquiry contact = dc.tblInquiries.SingleOrDefault(ob => ob.InquiryId == InquiryId);

        if (e.CommandName == "Reply")
        {
            if (contact.IsReplied == true)
            {
                contact.IsReplied = false;
            }
            else
            {
                contact.IsReplied = true;
            }
            dc.SubmitChanges();
        }
        if (e.CommandName == "showQuery")
        {
            Response.Redirect("ShowQuery.aspx?IID=" + InquiryId);
        }

        BindGrid();
    }
}