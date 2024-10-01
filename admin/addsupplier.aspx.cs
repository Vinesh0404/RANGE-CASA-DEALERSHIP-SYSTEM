using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addsupplier : System.Web.UI.Page
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
        ds = dm.getDataset("select * from tbl_supplier_details");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    protected void btnaddsupplier_Click(object sender, EventArgs e)
    {
        try
        {
            if (checkexistornot())
            {
                Response.Write("<script>alert('Supplier already exist with same name and email')</script>");
            }
            else
            {
                try
                {
                    if (isSubmit())
                    {
                        clear();
                        Response.Write("<script>alert('Supplier Added Successfully')</script>");
                        bind_Gridview();

                    }
                    else
                    {
                        Response.Write("<script>alert('Supplier Not Unsuccessfully')</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private bool isSubmit()
    {
        int submit = dm.executequery("insert into tbl_supplier_details (name,email,address,pin_code,mobile_no) " +
                "values('" + txtsuppliername.Text.Trim() + "','" + txtemail.Text.Trim() + "','" + txtaddress.Text.Trim() + "','" + txtpincode.Text.Trim() + "','" + txtmobilenumber.Text.Trim() + "')");
        if (submit > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }
    private bool checkexistornot()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select * from tbl_supplier_details where name='" + txtsuppliername.Text.Trim() + "'and email='" + txtemail.Text.Trim() + "'");

        if (ds.Tables[0].Rows.Count > 0)
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
        int update = dm.executequery("update tbl_supplier_details set name='" + txtsuppliername.Text.Trim() + "'" + ",email='" + txtemail.Text.Trim() + "',address='" + txtaddress.Text.Trim() + "',pin_code='" + txtpincode.Text.Trim() + "',mobile_no='" + txtmobilenumber.Text.Trim() + "' where s_id='" + hfid.Value + "'");
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
        int delete = dm.executequery("delete tbl_supplier_details where s_id='" + hfid.Value + "'");
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
            btnaddsupplier.Visible = false;
            btnupdatesupplier.Visible = true;

            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            Label Supplier_Name = (Label)dgv.Rows[e.RowIndex].FindControl("lblname");
            Label email = (Label)dgv.Rows[e.RowIndex].FindControl("lblemail");
            Label address = (Label)dgv.Rows[e.RowIndex].FindControl("lbladdress");
            Label pin_code = (Label)dgv.Rows[e.RowIndex].FindControl("lblpincode");
            Label mobile_no = (Label)dgv.Rows[e.RowIndex].FindControl("lblmobileno");

            hfid.Value = ID.Text;
            txtsuppliername.Text = Supplier_Name.Text;
            txtemail.Text = email.Text;
            txtaddress.Text = address.Text;
            txtpincode.Text = pin_code.Text;
            txtmobilenumber.Text = mobile_no.Text;
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
            string product_id = dgv.DataKeys[gvrow.RowIndex].Value.ToString();

            hfid.Value = product_id;

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


    protected void btnupdatesupplier_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                bind_Gridview();
                Response.Write("<script>alert('Supplier Updated Successfully')</script>");
                clear();
                btnupdatesupplier.Visible = false;
                btnupdatesupplier.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Supplier Not Updated')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private void clear()
    {
        txtaddress.Text = txtemail.Text = txtmobilenumber.Text = txtpincode.Text = txtsuppliername.Text = "";
    }
}