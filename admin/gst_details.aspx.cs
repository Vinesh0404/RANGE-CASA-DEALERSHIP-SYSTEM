using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gst_details : System.Web.UI.Page
{
    DbManager dm = new DbManager();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["adminid"] != null)
            {

            }
            else
            {
                Response.Redirect("~/admin/adminlogin.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }

        bind_Gridview();
    }
    private void bind_Gridview()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select * from tbl_gst");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    protected void btnaddgstdetails_Click(object sender, EventArgs e)
    {
        try
        {
            if (isSubmit())
            {
                bind_Gridview();
                Response.Write("<script>alert('GST Details Added Successfully')</script>");
                clear();
            }
            else
            {
                Response.Write("<script>alert('GST Details Not Added')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private bool isSubmit()
    {
        int submit = dm.executequery("insert into tbl_gst (gst_code, cgst,sgst) values('" + txtgstcode.Text.Trim() + "','" + txtcgst.Text.Trim() + "','" + txtsgst.Text.Trim() + "')");
        if (submit > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }
    private bool isUpdate()
    {
        int update = dm.executequery("update tbl_gst set gst_code='" + txtgstcode.Text.Trim() + "', cgst='" + txtcgst.Text.Trim() + "',sgst='" + txtsgst.Text.Trim() + "' where g_id='" + hfid.Value + "'");
        if (update > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }

    private bool isDelete()
    {
        int delete = dm.executequery("delete tbl_gst where g_id='" + hfid.Value + "'");
        if (delete > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void dgv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            dgv.PageIndex = e.NewPageIndex;
            bind_Gridview();

            dgv.PageIndex = e.NewPageIndex;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    protected void dgv_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            btnaddgstdetails.Visible = false;
            btnupdategstdetails.Visible = true;
            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            Label GST_Code = (Label)dgv.Rows[e.RowIndex].FindControl("lblgstcode");
            Label CGST = (Label)dgv.Rows[e.RowIndex].FindControl("lblcgst");
            Label SGST = (Label)dgv.Rows[e.RowIndex].FindControl("lblsgst");

            hfid.Value = ID.Text;
            txtgstcode.Text = GST_Code.Text;
            txtcgst.Text = CGST.Text;
            txtsgst.Text = SGST.Text;


        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        bind_Gridview();
    }

    protected void dgv_RowDeleting(object sender, EventArgs e)
    {
        try
        {
            LinkButton btndetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            string unit_id = dgv.DataKeys[gvrow.RowIndex].Value.ToString();

            hfid.Value = unit_id;

            if (isDelete())
            {
                Response.Write("<script>alert('Data Deleted Successfully...')</script>");
            }
            else
            {
                Response.Write("<script>alert('Something is wrong. Please check...')</script>");
            }
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        bind_Gridview();
    }

    private void clear()
    {
        txtgstcode.Text=txtsgst.Text=txtcgst.Text = "";
    }

    protected void btnupdategstdetails_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                bind_Gridview();
                Response.Write("<script>alert('GST Details Updated Successfully')</script>");
                clear();
                btnupdategstdetails.Visible = false;
                btnaddgstdetails.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('GST Details Not Updated')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }




    
}