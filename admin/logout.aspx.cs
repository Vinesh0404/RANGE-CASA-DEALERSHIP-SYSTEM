using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session.Remove("email");
        if (Session["email"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        else
        {
            Session.Abandon();
            Session.RemoveAll();
            Session.Remove("email");
            Response.Redirect("adminlogin.aspx");
        }
    }
}