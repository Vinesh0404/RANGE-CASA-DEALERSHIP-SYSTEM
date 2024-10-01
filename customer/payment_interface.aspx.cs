using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_payment_interface : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool Push_User_Data(string card_name, string card_number, int expiry_month, int expiry_year, int cvv_no, string client_id, string payment_mode)
    {
        if (card_name == null || card_number == null || expiry_month == 0 || expiry_year == 0 || cvv_no == 0 || client_id == null || payment_mode == null)
        {
            return false;
        }
        else
        {
            DbManager db = new DbManager();

            string SqlQuery = "insert into payment_details values('" + card_name + "'," + card_number + ", " + expiry_month + "," + expiry_year + "," + cvv_no + ", '" + client_id + "','" + payment_mode + "')";

            int rowsAffected = db.executequery(SqlQuery);

            if (rowsAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

   

    protected void ConfirmPayment_Click(object sender, EventArgs e)
    {
        string name = name_on_debit_card.Text.Trim();
        string number = card_number.Text.Trim();
        int month = Convert.ToInt32(debit_expiry_month.SelectedValue.ToString());
        int year = Convert.ToInt32(debit_expiry_year.SelectedValue.ToString());
        int cvv_No = Convert.ToInt32(cvv_number.Text.Trim());
        string client_email = (string)Session["email"];
        string paymentMode = "Debit / Credit";

        if (name.Length > 0 && number.Length > 0 && month > 0 && year > 0 && cvv_No > 0 && client_email.Length > 0 && paymentMode.Length > 0)
        {
            Push_User_Data(name, number, month, year, cvv_No, client_email, paymentMode);
            //sendmail();
            Response.Redirect("index.aspx");
        }
    }
}