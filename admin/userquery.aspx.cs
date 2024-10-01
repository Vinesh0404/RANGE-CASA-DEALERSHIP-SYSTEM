using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_userquery : System.Web.UI.Page
{
    DbManager dm = new DbManager();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgridview();
        }
    }

    private void bindgridview()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select * from tbl_contact_us");
        dgv.DataSource = ds;
        dgv.DataBind();
    }
}