using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        if (Session["Id"] == null)
        {
            Response.Redirect("adminLogin.aspx");
        }

        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            if (Request.QueryString["adminId"] != null)
            {
                var adminID = Convert.ToInt32(Request.QueryString["adminId"]);
                tblAdmin ad = db.tblAdmins.FirstOrDefault(v =>v.adminId == adminID);
                //tblUser us = db.tblUsers.FirstOrDefault(v => v.ID == adminId);
                txtEmail.Text = ad.adminEmail;
                txtPassword.Attributes["Value"] = ad.adminPassword;
                txtCofirmPass.Attributes["Value"] = ad.adminPassword;
                Name.Text = ad.adminName;               
            }
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
    protected void mAdminbtn_Click(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db1 = new Gym_AccessoriesEntities())
        {
            tblAdmin tb = null;
            if (Request.QueryString["adminId"] != null)
            {
                var adminId = Convert.ToInt32(Request.QueryString["adminId"]);
                tb = db1.tblAdmins.FirstOrDefault(v => v.adminId == adminId);
                lbltxt.InnerText = "Admin Record Updated Sucessfully.....";
                tblAdmin ss = db1.tblAdmins.FirstOrDefault(v => v.adminEmail == txtEmail.Text & v.adminId != adminId);
                if (ss != null)
                {
                    lbltxt.InnerText = "Already Registered on that Email ID... Try Another One.";
                    return;
                }
            }
            else
            {
                tblAdmin ss = db1.tblAdmins.FirstOrDefault(v => v.adminEmail == txtEmail.Text);

                if (ss != null)
                {
                    lbltxt.InnerText = "Already Registered on that Email ID... Try Another One.";
                    return;
                }
                tb = new tblAdmin();
            }

           
            tb.adminName = Name.Text;
            //var emailtxt = txtEmail.Text;
            //var query = db1.DoLogin(emailtxt,txtPassword.Text).ToList();
            tb.adminEmail = txtEmail.Text;
            var enPass = Encryption(txtPassword.Text);
            tb.adminPassword = enPass;
            if (Request.QueryString["adminId"] == null)
            {
                db1.tblAdmins.Add(tb);
                lbltxt.InnerText = "Admin Added Sucessfully";
            }
            db1.SaveChanges();
            Response.Redirect("listAdmins.aspx");
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("logoutAdmin.aspx");
    }
}