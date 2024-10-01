using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addwarehouse : System.Web.UI.Page
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
        ds = dm.getDataset("select * from tbl_warehouse");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    protected void btnaddwarehouse_Click(object sender, EventArgs e)
    {
        try
        {
            if (isSubmit())
            {
                Response.Write("<script>alert('Warehouse Added Successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Warehouse Not Added')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }

    }

    private bool isSubmit()
    {
        int submit = dm.executequery("insert into tbl_warehouse (warehouse_name) values('" + txtwarehousename.Text.Trim() + "')");
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
        int update = dm.executequery("update tbl_unit set unit_name='" + txtwarehousename.Text + "' where u_id='" + hfid.Value + "'");
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
        int delete = dm.executequery("delete tbl_unit where u_id='" + hfid.Value + "'");
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
            btnaddwarehouse.Visible = false;
            btnupdatewarehouse.Visible = true;
            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            Label Warehouse_Name = (Label)dgv.Rows[e.RowIndex].FindControl("lblwarehouse");

            hfid.Value = ID.Text;
            txtwarehousename.Text = Warehouse_Name.Text;

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
        txtwarehousename.Text = "";
    }

    protected void btnunitupdatte_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                bind_Gridview();
                Response.Write("<script>alert('Unit Updated Successfully')</script>");
                clear();
                btnupdatewarehouse.Visible = false;
                btnaddwarehouse.Visible = true;
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
}