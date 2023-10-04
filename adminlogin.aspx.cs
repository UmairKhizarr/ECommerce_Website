using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminlogin1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["CookieLogin"] != null)
        {
            Session["Id"] = Request.Cookies["cookieLogin"]["Id"];
            Session["Name"] = Request.Cookies["cookieLogin"]["Name"];
            Response.Redirect("adminDashboard.aspx");
        }
    }
    public static string Encryption(string password)
    {
        try
        {
            byte[] encData_byte = new byte[password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }
        catch (Exception ex)
        {
            throw new Exception("Error in base64Encode" + ex.Message);
        }
    }
    protected void btnAdminLogin_Click(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var encrypPass = Encryption(txtPassword.Text);
            var query = db.adminLogin(txtEmail.Text, encrypPass).ToList();
            if (query.Count > 0)
            {
                //Session format 
                var adminName = query[0].adminName;
                Session["Id"] = query[0].adminId;
                Session["Name"] = adminName;
                Session.Timeout = 720; //This time is in 720 minutes.

                //Cookie always accept only string values
                Response.Cookies["CookieLogin"]["Id"] = query[0].adminId.ToString();
                Response.Cookies["CookieLogin"]["Name"] = query[0].adminName;
                Response.Cookies["CookieLogin"].Expires = DateTime.Now.AddDays(1);

                //Response.Redirect("listAdmins.aspx");
                Response.Redirect("adminDashboard.aspx?adminName=" + adminName);

            }
            else
            {
                var error = "Invalid Email or Password";
                lblTxt.Text = error;
            }
        }
    }
}