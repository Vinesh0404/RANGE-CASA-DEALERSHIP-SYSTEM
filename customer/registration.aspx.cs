using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class customer_registration : System.Web.UI.Page
{
    DbManager dm = new DbManager();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (isSubmit())
            {
                Response.Write("<script>alert('Registration Successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Registration Unsuccessfully')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }
    private bool isSubmit()
    {
        int submit = dm.executequery("insert into user_details (name,address,gender,email,mobile_no,password) " +
                "values('" + txtname.Text.Trim() + "','" + txtaddress.Text.Trim() + "','" + ddlgender.SelectedValue + "','" + txtemail.Text.Trim() + "','" + txtmobile.Text.Trim() + "','" + txtpass.Text.Trim() + "')");
        if (submit > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }
}