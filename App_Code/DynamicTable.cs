using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for DynamicTable
/// </summary>
public class DynamicTable
{
    public DynamicTable()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DataTable CreateDataSource()
    {
        DataTable dt = new DataTable();
        DataColumn identity = new DataColumn("Product_ID", typeof(string));
        DataColumn identity1 = new DataColumn("Product_Name", typeof(string));
        DataColumn identity2 = new DataColumn("Product_Price", typeof(string));
        DataColumn identity3 = new DataColumn("Product_Quantity", typeof(string));
        DataColumn identity4 = new DataColumn("Total_Price", typeof(string));
        DataColumn identity5 = new DataColumn("SGST", typeof(string));
         DataColumn identity6 = new DataColumn("CGST", typeof(string));
        DataColumn identity7 = new DataColumn("Final", typeof(string));


        dt.Columns.Add(identity);
        dt.Columns.Add(identity1);
        dt.Columns.Add(identity2);
        dt.Columns.Add(identity3);
        dt.Columns.Add(identity4);
        dt.Columns.Add(identity5);
        dt.Columns.Add(identity6);
        dt.Columns.Add(identity7);


        return dt;
    }

    //This is the AddRow method to add a new row in Table dt 
    public void AddRow(string Product_ID, string Product_Name, string Product_Price, string Product_Quantity, string Total_Price, string CGST, string SGST,string final_amount ,DataTable dt)
    {
        dt.Rows.Add(new object[] { Product_ID, Product_Name, Product_Price, Product_Quantity, Total_Price,SGST,CGST,final_amount });
    }

    public void newrow(DataTable dtl)
    {
        dtl.Rows.Add();
    }
}