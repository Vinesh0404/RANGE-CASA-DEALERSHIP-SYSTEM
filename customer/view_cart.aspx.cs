using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class customer_view_cart : System.Web.UI.Page
{
    Add_Cart Dt1 = new Add_Cart();

    DataTable dab = null;

    DbManager db = new DbManager();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindDataList();
        }

    }

    protected void BindDataList()
    {
        DataTable dt = new DataTable();

        if (Session["CurrentTable2"] == null)
        {
            dt = Dt1.Create_DataTable();
        }
        else
        {
            dt = (DataTable)Session["CurrentTable2"];
        }


        if (dt.Rows.Count > 0)
        {
            btnorder.Visible = true;
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

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        DataTable dab = new DataTable();
        dab = (DataTable)Session["CurrentTable2"];

        int Product_ID = Convert.ToInt32(e.CommandArgument);

        DataRow[] result = dab.Select("Product_ID = '" + Product_ID + "'");

        if (result.Length > 0)
        {

            foreach (DataRow row in result)
            {
                row.Delete();

                if (Session["qty"] != null)
                {
                    int qty = Convert.ToInt32(Session["qty"]);
                    Session["qty"] = (qty - 1).ToString();
                }
            }


        }

        Session["CurrentTable2"] = dab;
        BindDataList();
        Response.Redirect("view_cart.aspx");
    }

    protected void btnorder_Click(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {

            dab = (DataTable)Session["CurrentTable2"];
            Random r = new Random();

            int order_number = r.Next(5000, 99999);
            Session["order_number"] = order_number.ToString();

            if (dab.Rows.Count > 0)
            {
                for (int i = 0; i < dab.Rows.Count; i++)
                {
                    // insert into purchase order item
                    String product_ID = dab.Rows[i]["Product_ID"].ToString();

                    String Product_Price = dab.Rows[i]["Product_Price"].ToString();
                    String Product_Quantity = dab.Rows[i]["Product_Quantity"].ToString();
                    String Total_Price = dab.Rows[i]["Total_Price"].ToString();
                    String GST = dab.Rows[i]["GST"].ToString();

                    string final_amount = (Convert.ToInt32(Product_Price) + Convert.ToInt32(GST)).ToString();


                    //insert in table
                    db.executequery("insert into tbl_user_orders (order_number,user_id,product_id,quantity,total_price,GST_amount,final_amount,order_date) " + "values('" + order_number + "','" + Session["userid"] + "','" + product_ID + "'," + Product_Quantity + "," + Product_Price + "," + GST + ",'" + final_amount + "','" + DateTime.Now.ToShortDateString() + "')");

                }
                Session.Remove("CurrentTable2");

                ClientScriptManager CSM = Page.ClientScript;
                Generate_invoice(Session["order_number"].ToString());
                string strconfirm = "<script>if(window.confirm('Confirm Payment Details...')){window.location.href='payment_interface.aspx'}</script>";
                CSM.RegisterClientScriptBlock(this.GetType(), "Ok   ", strconfirm, false);

            }
        }
        else
        {
            Response.Write("<script>alert('Login Required')</script>");
        }
    }

    private void Generate_invoice(String order_id)
    {

        DataSet ds = new DataSet();
        DbManager db = new DbManager();
        string Query = "select   p.product_name, p.description,p.sale_price, uo.quantity,uo.total_price,uo.final_amount from [dbo].[tbl_user_orders] as uo  inner join [dbo].[tbl_product] as p on uo.product_id = p.p_id where uo.order_number='" + Session["order_number"] + "'";
        ds = db.getDataset(Query);

        // File Name

        String file_name = Server.MapPath("Invoice/") + Session["order_number"] + ".pdf";
        //C://data//invoice1.pdf

        // Create a new PDF document
        Document document = new Document();
        PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(file_name, FileMode.Create));
        document.Open();

        // Add invoice header
        Paragraph header = new Paragraph("Invoice", new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
        header.Alignment = Element.ALIGN_CENTER;
        document.Add(header);

        // Add invoice information
        Paragraph invoiceInfo = new Paragraph();
        invoiceInfo.SpacingBefore = 20;
        invoiceInfo.SpacingAfter = 20;

        invoiceInfo.Add(new Chunk("Invoice Number: "));
        invoiceInfo.Add(new Chunk(Session["order_number"].ToString()));
        invoiceInfo.Add(new Chunk("\n"));
        invoiceInfo.Add(new Chunk("Date: "));
        invoiceInfo.Add(new Chunk(DateTime.Now.ToShortDateString()));

        document.Add(invoiceInfo);

        // Add invoice table
        PdfPTable table = new PdfPTable(4);
        table.SpacingBefore = 20;
        table.SpacingAfter = 20;
        table.WidthPercentage = 100;

        // Add table headers
        table.AddCell("Product");
        table.AddCell("Description");
        table.AddCell("Quantity");
        table.AddCell("Price");
        string subtotal = "";
        string finaltotal = "";
        foreach (DataRow drRow in ds.Tables[0].Rows)
        {
            subtotal = drRow["total_price"].ToString();
            finaltotal = drRow["final_amount"].ToString();
            // Add table rows
            table.AddCell(drRow["product_name"].ToString());
            table.AddCell(drRow["description"].ToString());
            table.AddCell(drRow["quantity"].ToString());
            table.AddCell(drRow["sale_price"].ToString());
        }

        /*table.AddCell("Product 2");
        table.AddCell("Description of Product 2");
        table.AddCell("1");
        table.AddCell("$5.00");*/

        table.AddCell("");
        table.AddCell("");
        table.AddCell("Subtotal:");
        table.AddCell(subtotal);

        table.AddCell("");
        table.AddCell("");
        table.AddCell("Tax:");
        table.AddCell((Int32.Parse(finaltotal) - Int32.Parse(subtotal)).ToString());


        table.AddCell("");
        table.AddCell("");
        table.AddCell("Total:");
        table.AddCell(finaltotal);

        document.Add(table);

        // Close the document
        document.Close();

        Send_Invoice(Session["email"].ToString(), file_name);


    }

    public void Send_Invoice(string Email, string path)
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient smtpserver = new SmtpClient("smtp.gmail.com");
            mail.From = new MailAddress("s3021089@gmail.com");
            mail.To.Add(Email);
            mail.Subject = "RANGE CASA Invoice";

            string fileName = System.IO.Path.GetFileName(path);
            FileStream fileStream = new FileStream(path, FileMode.Open, FileAccess.Read);
            mail.Attachments.Add(new Attachment(fileStream, fileName));


            Random num = new Random();
            int otp = num.Next(100000, 1000000);
            mail.Body = "Download Your Invoice";
            //Session["otp"] = otp.ToString();
            smtpserver.Port = 587;
            smtpserver.EnableSsl = true;
            smtpserver.UseDefaultCredentials = false;
            smtpserver.Credentials = new System.Net.NetworkCredential("s3021089@gmail.com", "uxsmqareghsobihl");
            smtpserver.Send(mail);


        }
        catch (Exception ex)
        {
            Response.Write(" Error  " + ex.ToString());
        }

    }
}