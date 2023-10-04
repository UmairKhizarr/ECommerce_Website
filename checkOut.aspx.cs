using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
public partial class checkOut1 : System.Web.UI.Page
{
    //Email Sending Class Here
    public class Email
    {
        public static bool SendEmail(string toadd, string subject, string msg, string cc = "", string bcc = "")
        {
            MailMessage message = new MailMessage();
            SmtpClient client = new SmtpClient();
            try
            {
                string SendingEmail = "", MailServer = "", SendingPassword = "";
                SendingEmail = "gymaccessories64@gmail.com";
                MailServer = "smtp.gmail.com";
                SendingPassword = "rxbxftqjahswgnto";
                int ServerPort = 587;
                message.IsBodyHtml = true;

                message.From = new MailAddress(SendingEmail, "Noreply");

                if (toadd.Contains(","))
                {
                    string[] arrto = toadd.Split(',');
                    for (int i = 0; i <= arrto.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(arrto[i].Trim()))
                        {
                            message.To.Add(new MailAddress(arrto[i].Trim()));
                        }
                    }
                }
                else
                {
                    message.To.Add(new MailAddress(toadd.ToString()));
                }

                if (!string.IsNullOrEmpty(cc))
                {
                    message.CC.Add(new MailAddress(cc.ToString()));
                }

                if (!string.IsNullOrEmpty(bcc))
                {
                    message.Bcc.Add(new MailAddress(bcc.ToString()));
                }
                message.Body = msg;
                message.Subject = subject;

                client.Host = MailServer;
                client.Port = ServerPort;
                client.EnableSsl = true;
                client.UseDefaultCredentials = true;
                client.Credentials = new System.Net.NetworkCredential(SendingEmail, SendingPassword);

                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                message = null;
                client = null;
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var result = Request.Cookies["User"]["uniqueID"];
            var viewCartItems = db.ViewCart(result).ToList();
            var totalAmount = 0;
            var productListNames = "";
            for (int i = 0; i < viewCartItems.Count; i++)
            {
                totalAmount += Convert.ToInt32(viewCartItems[i].productPrice);
                productListNames += viewCartItems[i].productName + ", ";
            }
            totalPri.Text = totalAmount.ToString();
            ProductsNames.Text = productListNames;
        }
    }
    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        //Email.SendEmail("")

        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            tblOrderMain tb = new tblOrderMain();
            tb.FName = txtFName.Text;
            tb.LName = txtLName.Text;
            tb.EmailID = txtemail.Text;
            tb.MobileNo = txtmobile.Text;
            tb.ShippingAddress = SAddress.Text;
            tb.TotalAmount = Convert.ToDecimal(totalPri.Text);
            db.tblOrderMains.Add(tb);
            db.SaveChanges();
            int keyId = tb.userID;

            var result = Request.Cookies["User"]["uniqueID"];
            var viewCartItems = db.ViewCart(result).ToList();
            for (int i = 0; i < viewCartItems.Count; i++)
            {
                tblOrderDetail td = new tblOrderDetail();
                td.productID = viewCartItems[i].productID;
                td.productPrice = viewCartItems[i].productPrice;
                td.userID = keyId;
                db.tblOrderDetails.Add(td);
                db.SaveChanges();
            }
        var TrackingID = Request.Cookies["User"]["uniqueID"];
        var message = "Thanks For Shopping on Gym Accessroies Store. Your Order has been Shipped Aganist the Tracking ID " + TrackingID + ".";
        var EmailToSend = tb.EmailID;
        var subject = tb.FName;
        Email.SendEmail(EmailToSend,subject, message, "", "");
        lblConfirmOrder.Text = "Your Order has been Successfully Compelted. Your Shippinment will be Confirmed Soon. ";
        }
    }
}