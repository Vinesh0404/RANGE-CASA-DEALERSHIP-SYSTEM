using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Session.Clear();
        if(Session["userid"]==null)
        {
            Response.Redirect("~/customer/index.aspx");
        }
        else
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Clear();
        }
    }
}