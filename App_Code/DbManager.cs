using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DbManager
/// </summary>
public class DbManager
{
    string CS = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    public DataSet getDataset(string query)
    {
        SqlConnection con = new SqlConnection(CS);
        con.Open();

        SqlCommand cmd = new SqlCommand(query, con);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        con.Close();

        return ds;
    }

    public int executequery(string query)
    {
        SqlConnection con = new SqlConnection(CS);
        con.Open();

        SqlCommand cmd = new SqlCommand(query, con);

        int result = cmd.ExecuteNonQuery();

        con.Close();

        return result;
    }
}