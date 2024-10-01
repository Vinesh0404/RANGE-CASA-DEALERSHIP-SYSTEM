using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_contactus : System.Web.UI.Page
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
                Response.Write("<script>alert('Message sent Successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Message not sent')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }
    private bool isSubmit()
    {
        int submit = dm.executequery("insert into tbl_contact_us (name,email,subject,message) " +
                "values('" + txtuname.Text.Trim() + "','" + txtemail.Text.Trim() + "','" + txtsubject.Text.Trim() + "','" + txtmessage.Text.Trim() + "')");
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