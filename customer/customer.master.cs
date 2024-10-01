using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_customer : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["qty"] != null)
        {
            qty.Text = "(" + Session["qty"].ToString() + ")";
        }
        else
        {
            qty.Text = "(0)";
        }
        if (Session["userid"] != null)
        {
            btnlogin.Visible = false;
            btnreg.Visible = false;
            btnadminlogin.Visible = false;
            btnlogout.Visible = true;
            btnohistory.Visible = true;
            uname.InnerText = Session["email"].ToString() + " ";
        }
        else
        {
            btnlogin.Visible = true;
            btnreg.Visible = true;
            btnadminlogin.Visible = true;
            btnlogout.Visible = false;
            btnohistory.Visible = false;
        }
    }

}

/*protected void btnSearch_Click(object sender, EventArgs e)
{
    string searchTerm = txtSearch.Text.Trim();

    // Perform your search logic here
    // For example, redirecting to a search results page passing the search term as a query parameter
    if (!string.IsNullOrEmpty(searchTerm))
    {
        Response.Redirect("~/customer/search_results.aspx?searchTerm=" + searchTerm);
    }
    else
    {
        // Handle empty search term scenario
        // You can display a message or perform a different action
    }
}*/

