using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_View_product : System.Web.UI.Page
{
    DbManager db = new DbManager();
    Add_Cart Dt1 = new Add_Cart();
    DataTable dab = null;
    static string gst;

    string TotalGST;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_datalist();
        }
        bind_cart_View();

    }

    private void bind_cart_View()
    {

        Decimal total_price = 0;
        Decimal total_qty = 0;
        if (Session["CurrentTable2"] == null)
        {
            dab = Dt1.Create_DataTable();
        }
        else
        {
            dab = (DataTable)Session["CurrentTable2"];
        }

        DataRow[] row = dab.Select();


        if (row.Length > 0)
        {
            foreach (DataRow r in row)
            {
                // r[0].ToString();


                total_price += Convert.ToDecimal(r["Total_Price"].ToString());
                total_qty += Convert.ToInt32(r["Product_Quantity"].ToString());
            }
        }

        //string str = this.Master.FindControl("pro_qty") as string;
        //amt.InnerText = total_price.ToString();
        //qty.InnerText = total_qty.ToString();
        
    }
    private void bind_datalist()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from  tbl_product");

        if (ds.Tables[0].Rows.Count > 0)
        {
            //DataList1.DataSource = ds.Tables[0];
            //DataList1.DataBind();

            Repeater1.DataSource = ds.Tables[0];
            Repeater1.DataBind();




        }

    }
    public void add_tocart(String product_id, String product_name, string description, String product_price, string imgurl, string TotalGST)
    {



        if (Session["CurrentTable2"] == null)
        {
            dab = Dt1.Create_DataTable();
        }
        else
        {
            dab = (DataTable)Session["CurrentTable2"];
        }

        int quantity = 1;
        double a = Convert.ToDouble(product_price);
        double b = Convert.ToDouble(quantity);
        int g = Convert.ToInt32(TotalGST);
        double c;
        c = a * b;
        String total_price = c.ToString();


        DataRow[] result = dab.Select("Product_ID = '" + product_id + "'");

        if (result.Length > 0)
        {

            foreach (DataRow row in result)
            {
                Console.WriteLine("{0}, {1}", row[0], row[1]);

                int qty = Convert.ToInt32(row[4].ToString());

                row[4] = qty + 1;

                Double total = Convert.ToDouble(row[3].ToString());

                row[3] = total + c;

                int total_gst = Convert.ToInt32(row[7].ToString());

                row[7] = total_gst +g ;

                //Session["qty"] = (qty + 1).ToString();

            }
        }
        else
        {
            Dt1.Add_Record(product_id, product_name, description, product_price, quantity.ToString(), total_price,imgurl, TotalGST, dab);

            if (Session["qty"] == null)
            {
                int qty = 0;
                Session["qty"] = (qty + 1).ToString();
            }
            else
            {
                int qty = Convert.ToInt32(Session["qty"]);
                Session["qty"]= (qty + 1).ToString();
            }
        }
        Session["CurrentTable2"] = dab;
        Response.Redirect("View_product.aspx");
    }



    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "add_cart") // check command is cmd_delete
        {

            int Product_ID = Convert.ToInt32(e.CommandArgument); // value from CommandArgument



            string query = "select * from tbl_product as p inner join tbl_gst as g on p.gst_code=g.g_id where p_id ='" + Product_ID + "'";
            DataSet checkdb = db.getDataset(query);

            if (checkdb.Tables[0].Rows.Count > 0)
            {
                String id = checkdb.Tables[0].Rows[0]["p_id"].ToString();
                String name = checkdb.Tables[0].Rows[0]["product_name"].ToString();
                String description = checkdb.Tables[0].Rows[0]["description"].ToString();
                String price = checkdb.Tables[0].Rows[0]["sale_price"].ToString();


                String CGST = checkdb.Tables[0].Rows[0]["cgst"].ToString();
                String SGST = checkdb.Tables[0].Rows[0]["sgst"].ToString();


               string imgpath = "admin/productimg/" + checkdb.Tables[0].Rows[0]["image_url"].ToString();

                int cgst = (Convert.ToInt32(price) * Convert.ToInt32(CGST)) / 100;

                int sgst = (Convert.ToInt32(price) * Convert.ToInt32(SGST)) / 100;

                TotalGST = (Convert.ToInt32(cgst) + Convert.ToInt32(sgst)).ToString();


                add_tocart(id, name, description, price,imgpath, TotalGST);
            }

        }
    }
}