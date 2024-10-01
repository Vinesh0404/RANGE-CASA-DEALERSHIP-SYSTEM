using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Add_Cart
/// </summary>
public class Add_Cart
{
    public Add_Cart()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable Create_DataTable()
    {
        DataTable dt = new DataTable();


        DataColumn identity1 = new DataColumn("Product_ID", typeof(string));
        DataColumn identity5 = new DataColumn("Product_Name", typeof(string));
        DataColumn identity6 = new DataColumn("Description", typeof(string));
        DataColumn identity2 = new DataColumn("Product_Price", typeof(string));
        DataColumn identity3 = new DataColumn("Product_Quantity", typeof(string));
        DataColumn identity4 = new DataColumn("Total_Price", typeof(string));
        DataColumn identity7 = new DataColumn("Image", typeof(string));
        DataColumn identity8 = new DataColumn("GST", typeof(string));

        dt.Columns.Add(identity1);
        dt.Columns.Add(identity5);
        dt.Columns.Add(identity6);
        dt.Columns.Add(identity2);
        dt.Columns.Add(identity3);
        dt.Columns.Add(identity4);
        dt.Columns.Add(identity7);
        dt.Columns.Add(identity8);

        return dt;

    }

    public void Add_Record(String Product_ID, String Product_Name, string description, String Product_Price, String Product_Quantity, String Total_Price, string imgpath,string TotalGST, DataTable dt)
    {
        dt.Rows.Add(new object[] { Product_ID, Product_Name, description, Product_Price, Product_Quantity, Total_Price, imgpath,TotalGST });
    }
}
