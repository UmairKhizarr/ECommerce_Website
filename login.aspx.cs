using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Request.Cookies["CookieLogin"] != null)
        {
            Session["Id"] = Request.Cookies["CookieLogin"]["Id"];
            Session["Name"] = Request.Cookies["CookieLogin"]["Name"];
            Response.Redirect("home.aspx");
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
      using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
      {
          var query = db.adminLogin(txtUemail.Text, txtUpass.Text).ToList();
          if(query.Count>0)
          {
              Session["Id"] = query[0].adminId;
              Session["Name"] = query[0].adminName;
              Session.Timeout = 720; //Here Time is in minutes

              Response.Cookies["CookieLogin"]["Id"] = query[0].adminId.ToString();
              Response.Cookies["CookieLogin"]["Name"] = query[0].adminName;
              Response.Cookies["CookieLogin"].Expires = DateTime.Now.AddDays(1);
              Response.Redirect("home.aspx");
          }
          else
          {
              lblloginerror.Text = "Invalid Email or Password";
          }
      }
    }
  
    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}