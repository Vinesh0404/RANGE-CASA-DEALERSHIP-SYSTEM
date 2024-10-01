using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addcategory : System.Web.UI.Page
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
        ds = dm.getDataset("select * from tbl_category");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    protected void btnaddcategory_Click(object sender, EventArgs e)
    {
        try
        {
            if (isSubmit())
            {
                Response.Write("<script>alert('Category Added Successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Category Not Added')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private bool isSubmit()
    {
        int submit = dm.executequery("insert into tbl_category (category_name) values('" + txtcategory.Text.Trim() + "')");
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
        int update = dm.executequery("update tbl_category set category_name='" + txtcategory.Text + "' where c_id = '" + hfid.Value + "'");
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
        int delete = dm.executequery("delete tbl_category where c_id='" + hfid.Value + "'");
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
            btnaddcategory.Visible = false;
            btncategoryupdate.Visible = true;
            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            Label category_Name = (Label)dgv.Rows[e.RowIndex].FindControl("lblproductname");


            hfid.Value = ID.Text;
            txtcategory.Text = category_Name.Text;

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
            string category_id = dgv.DataKeys[gvrow.RowIndex].Value.ToString();

            hfid.Value = category_id;

            if (isDelete())
            {
                clear();
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

    protected void btncategoryupdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                bind_Gridview();
                Response.Write("<script>alert('Unit Updated Successfully')</script>");
                clear();
                btncategoryupdate.Visible = false;
                btnaddcategory.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Unit Not Updated')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private void clear()
    {
        txtcategory.Text = "";
    }
}