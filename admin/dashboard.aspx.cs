using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminid"] != null)
        {

        }
        else
        {
            Response.Redirect("adminlogin.aspx");
        }
        if (!IsPostBack)
        {
            AllOrdersDataBind();
        }
    }

    private void AllOrdersDataBind()
    {
        DataSet ds;
        DbManager db = new DbManager();

        string Query = "select * from tbl_user_orders as userOrder inner join tbl_product as Product on userOrder.product_id=Product.p_id";

        ds = db.getDataset(Query);

        if(ds.Tables[0].Rows.Count > 0)
        {
            allOrderDataList.DataSource = ds.Tables[0];
            allOrderDataList.DataBind();
        }
    }
}