using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_purchase_order : System.Web.UI.Page
{
    DbManager dm = new DbManager();

    static string cat_id;
    DynamicTable Dt1 = new DynamicTable();
    DataTable dab = null;
    static int Product_ID;
    static string name;
    static string description;
    static string price;
    static string quantity;
    static string total_price;
  

    static Decimal total_price2, total_qty;
    static Decimal cgst, sgst;

    static Decimal total_amount, final_amount, total_gst;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["adminid"]==null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        if(!IsPostBack)
        {
            bindddlproduct();
            BindDataList();

            Bind_supplier();
        }
    }

    private void Bind_supplier()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select * from tbl_supplier_details");

        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlsupplier.DataSource = ds;
            ddlsupplier.DataTextField = "name";
            ddlsupplier.DataValueField = "s_id";
            ddlsupplier.DataBind();
            ddlsupplier.Items.Insert(0, new ListItem("-- Select Supplier --", "0"));
        }
    }

    private void bindddlproduct()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select * from tbl_product");

        if (ds.Tables[0].Rows.Count > 0)
        {
            dllproduct.DataSource = ds;
            dllproduct.DataTextField = "product_name";
            dllproduct.DataValueField = "p_id";
            dllproduct.DataBind();
            dllproduct.Items.Insert(0, new ListItem("-- Select Product --", "0"));
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        btnplaceorder.Visible = true;
        add_tocart();
    }

    public void add_tocart()
    {

        if (Session["adminid"] != null)
        {

            if (Session["CurrentTable2"] == null)
            {
                dab = Dt1.CreateDataSource();
            }
            else
            {
                dab = (DataTable)Session["CurrentTable2"];
            }

            quantity = "1";
            double a = Convert.ToDouble(txtrate.Text);
            double b = Convert.ToDouble(txtqty.Text);
            double c;
            c = a * b;
            total_price = c.ToString();


            DataRow[] result = dab.Select("Product_ID = '" + dllproduct.SelectedValue + "'");

            if (result.Length > 0)
            {

                foreach (DataRow row in result)
                {
                    Console.WriteLine("{0}, {1}", row[0], row[1]);

                    int qty = Convert.ToInt32(row[3].ToString());

                    row[3] = qty + 1;

                    Double total = Convert.ToDouble(row[4].ToString());

                    row[4] = total + c;

                }
            }
            else
            {
                calculate_Gst(dllproduct.SelectedValue.ToString(), Convert.ToDecimal (txttotal.Text));
                String final_amount = (Convert.ToDecimal(txttotal.Text) + (sgst+cgst)).ToString();

                admin_purchase_order.total_amount += Convert.ToDecimal(txttotal.Text);
                admin_purchase_order.total_gst += (sgst + cgst);


                admin_purchase_order.final_amount = Convert.ToDecimal(txttotal.Text)+ (sgst + cgst);


                Dt1.AddRow(dllproduct.SelectedValue.ToString(), dllproduct.Text, txtrate.Text, txtqty.Text, txttotal.Text,cgst.ToString(),sgst.ToString(),final_amount, dab);
            }
            Session["CurrentTable2"] = dab;

        }
        else
        {
           // Response.Redirect("~/user/login.aspx");
        }

        BindDataList();
    }


    protected void calculate_Gst(string product_code,Decimal product_amt)
    {
        //string query = "select * from tbl_gst where  g_id = '"+ product_code + "'";
        string query = "select g.cgst,g.sgst from dbo.tbl_product as p inner join dbo.tbl_gst as g on p.gst_code = g.g_id where g_id = '" + product_code + "'";
        DataSet ds = new DataSet();
        ds = dm.getDataset(query);

        if(ds.Tables[0].Rows.Count > 0)
        {
            Decimal  cgst_rate = Convert.ToDecimal(ds.Tables[0].Rows[0]["cgst"].ToString());
            Decimal sgst_rate = Convert.ToDecimal(ds.Tables[0].Rows[0]["cgst"].ToString());

            cgst = (product_amt* cgst_rate) /100 ;

            sgst = (product_amt * sgst_rate) /100 ;

        }

    }

    protected void dlCustomers_ItemCommand(object source, DataListCommandEventArgs e)
    {
        dab = (DataTable)Session["CurrentTable2"];

        int Product_ID = Convert.ToInt32(e.CommandArgument);

        DataRow[] result = dab.Select("Product_ID = '" + Product_ID + "'");

        if (result.Length > 0)
        {

            foreach (DataRow row in result)
            {

                row.Delete();




            }
        }

        Session["CurrentTable2"] = dab;
         BindDataList();
    }

    protected void BindDataList()
    {
        DataTable dt = new DataTable();

        if (Session["CurrentTable2"] == null)
        {
            dt = Dt1.CreateDataSource();
        }
        else
        {
            dt = (DataTable)Session["CurrentTable2"];
        }


        if (dt.Rows.Count > 0)
        {

            DataList1.DataSource = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        else
        {
            //message.InnerText = "No Food Items selected.............";
            //btnplaceorder.Enabled = false;
        }

    }

    protected void dllproduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(dllproduct.SelectedIndex != 0)
        { 
        string query = "select * from tbl_product where p_id ='" + dllproduct.SelectedValue + "'";
        DataSet checkdb = dm.getDataset(query);

            if (checkdb.Tables[0].Rows.Count > 0)
            {

                txtrate.Text = checkdb.Tables[0].Rows[0]["sale_price"].ToString();


            }
        }
    }

    protected void txtqty_TextChanged(object sender, EventArgs e)
    {
        if(txtrate.Text  != "")
        {
            int qty = Convert.ToInt32(txtqty.Text);

            int rate = Convert.ToInt32(txtrate.Text);

            int total = qty * rate;

            txttotal.Text = total.ToString();
        }
    }

    protected void btnplaceorder_Click(object sender, EventArgs e)
    {
        // get purchase order using max(po_id)+1;

        int poid = getproid();

        //insert into master
        if(issubmitinmaster())
        {

        }

        dab = (DataTable)Session["CurrentTable2"];

        if (dab.Rows.Count > 0)
        {
            for (int i = 0; i < dab.Rows.Count; i++)
            {
            // insert into purchase order item
                String product_code = dab.Rows[i]["product_id"].ToString();
                String product_Name = dab.Rows[i]["Product_Name"].ToString();
                String Product_Price = dab.Rows[i]["Product_Price"].ToString();
                String Product_Quantity = dab.Rows[i]["Product_Quantity"].ToString();
                String Total_Price = dab.Rows[i]["Total_Price"].ToString();
                String CGST = dab.Rows[i]["CGST"].ToString();
                String SGST = dab.Rows[i]["SGST"].ToString();
                String Fianl = dab.Rows[i]["Final"].ToString();


                //insert in table
                dm.executequery("insert into tbl_purchase_order_item_details (purchase_order_id,product_id,quantity,rate,gst_amount,total) " + "values('"+poid+"',"+product_code+","+Product_Quantity+","+Product_Price+",'"+ Convert.ToDecimal(Convert.ToDecimal(CGST) + Convert.ToDecimal(SGST)) + "',"+Fianl+")");

            }
        }
    }

    private bool issubmitinmaster()
    {

        int submit = dm.executequery("insert into tbl_purchase_order (supplier_id,date,total_amount,gst_amount,Final_amount) " +
                "values('"+ddlsupplier.SelectedValue+"','"+DateTime.Now.ToShortDateString()+ "','"+ total_amount + "','"+ total_gst + "','"+ final_amount + "')");
        if (submit > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }

    private int getproid()
    {
        DataSet ds = new DataSet();
        ds = dm.getDataset("select isnull( max(id)+1, 1) as po from dbo.tbl_purchase_order");

        if (ds.Tables[0].Rows.Count > 0)
        {
            int id = Convert.ToInt32(ds.Tables[0].Rows[0]["po"]);
           
            return id;
        }
        else
        {
            return 0;
        }
    }
}