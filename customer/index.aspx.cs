using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_index : System.Web.UI.Page
{
    DbManager db = new DbManager();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_datalist();
        }
    }

    private void bind_datalist()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select top 6 * from  tbl_product");

        if (ds.Tables[0].Rows.Count > 0)
        {
            Repeater1.DataSource = ds.Tables[0];
            Repeater1.DataBind();
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}