using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminlogin : System.Web.UI.Page
{
    DbManager dm = new DbManager();
    string admin_id;
    string admin_email;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (isadmin())
            {
                Session["adminid"] = admin_id;
                Session["email"] = admin_email;

                Response.Redirect("dashboard.aspx");
            }

            else
            {
                Response.Write("<script>alert('Invalid Username and Password')</script>");
            }
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private bool isadmin()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select * from tbl_admin_login where email='" + txtemail.Text.Trim() + "'and password='" + txtpass.Text.Trim() + "'");

        if (ds.Tables[0].Rows.Count > 0)
        {
            admin_id = ds.Tables[0].Rows[0]["a_id"].ToString();
            admin_email = ds.Tables[0].Rows[0]["email"].ToString();
            return true;
        }
        else
        {
            return false;
        }
    }
}