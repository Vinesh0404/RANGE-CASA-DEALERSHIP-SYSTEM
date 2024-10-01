using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_order_history : System.Web.UI.Page
{
    DbManager dm = new DbManager();
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["userid"] != null)
            {

            }
            else
            {
                Response.Redirect("~/customer/index.aspx");
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
        ds = dm.getDataset("select * from tbl_user_orders as uo inner join tbl_product as p on uo.product_id=p.p_id where user_id='"+ Session["userid"] + "'");
        dgv.DataSource = ds;
        dgv.DataBind();
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

            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            //Label Unit_Name = (Label)dgv.Rows[e.RowIndex].FindControl("lblproductname");

            id = ID.Text;

            if (isUpdate())
            {
                bind_Gridview();
                Response.Write("<script>alert('Order Cancel')</script>");
            }
            else
            {
                Response.Write("<script>alert('Order not Cancel')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private bool isUpdate()
    {
        string status = "Order Canceled";
        int update = dm.executequery("update tbl_user_orders set Status='" + status + "' where id='" + id + "'");
        if (update > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }
}