using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addproduct : System.Web.UI.Page
{
    DbManager dm = new DbManager();
    string imgname;
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

        if (!IsPostBack)
        {
            bindunitandcategory();
        }
    }

    private void bind_Gridview()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select a.p_id,a.unit_type,a.category, a.product_name,b.unit_name,a.sale_price,c.category_name,a.description from tbl_product as a inner join tbl_unit as b on a.unit_type=b.u_id inner join tbl_category as c on a.category=c.c_id");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    private void bindunitandcategory()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = dm.getDataset("select * from tbl_unit");

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlunittype.DataSource = ds;
                ddlunittype.DataTextField = "unit_name";
                ddlunittype.DataValueField = "u_id";
                ddlunittype.DataBind();
                ddlunittype.Items.Insert(0, new ListItem("-- Select Unit --", "0"));
            }

            ds = dm.getDataset("select * from tbl_category");

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlcategory.DataSource = ds;
                ddlcategory.DataTextField = "category_name";
                ddlcategory.DataValueField = "c_id";
                ddlcategory.DataBind();
                ddlcategory.Items.Insert(0, new ListItem("-- Select Category --", "0"));
            }

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    protected void btnaddproduct_Click(object sender, EventArgs e)
    {
        try
        {
            if (isSubmit())
            {
                clear();
                bind_Gridview();
                Response.Write("<script>alert('Product Added Successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Product Not Added')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private bool isSubmit()
    {
        
        if (productimg.HasFile)
        {
            imgname = productimg.FileName.ToString();
            productimg.PostedFile.SaveAs(Server.MapPath("~/admin/productimg/") + imgname);
        }
            int submit = dm.executequery("insert into tbl_product (product_name,unit_type,sale_price,category,description,image_url) values('" + txtproductname.Text.Trim() + "','" + ddlunittype.SelectedValue + "','" + txtsaleprice.Text.Trim() + "','" + ddlcategory.SelectedValue + "','" + txtdescription.Text.Trim() + "','"+imgname+"')");
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
        int update = dm.executequery("update tbl_product set product_name='" + txtproductname.Text + "'" + ",unit_type='" + ddlunittype.SelectedValue + "',sale_price='" + txtsaleprice.Text + "',category='" + ddlcategory.SelectedValue + "',description='" + txtdescription.Text + "' where p_id='" + hfid.Value + "'");
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
        int delete = dm.executequery("delete tbl_product where p_id='" + hfid.Value + "'");
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
            btnaddproduct.Visible = false;
            btnupadteproduct.Visible = true;

            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            Label Product_Name = (Label)dgv.Rows[e.RowIndex].FindControl("lblproductname");
            Label unit_type = (Label)dgv.Rows[e.RowIndex].FindControl("lblunittype");
            Label sale_price = (Label)dgv.Rows[e.RowIndex].FindControl("lblsaleprice");
            Label category = (Label)dgv.Rows[e.RowIndex].FindControl("lblcategory");
            Label description = (Label)dgv.Rows[e.RowIndex].FindControl("lbldescription");

            Label unitI_ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblunitid");
            Label Category_ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblcatagoryid");

            hfid.Value = ID.Text;
            txtproductname.Text = Product_Name.Text;
            ddlunittype.SelectedValue = unitI_ID.Text;
            txtsaleprice.Text = sale_price.Text;
            ddlcategory.SelectedValue = Category_ID.Text;
            txtdescription.Text = description.Text;
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

    protected void btnupadteproduct_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                bind_Gridview();
                Response.Write("<script>alert('Category Updated Successfully')</script>");
                clear();
                btnupadteproduct.Visible = false;
                btnaddproduct.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Category Not Updated')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private void clear()
    {
        txtdescription.Text = txtproductname.Text = txtsaleprice.Text = "";
        ddlcategory.ClearSelection();
        ddlunittype.ClearSelection();
    }
}