using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logoutAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserId"] = null;
        //Session["FirstName"] = null;
        Session.Abandon();
        //It will destorys all the sessions from our website instead of doing null all of them induviusally.

        Response.Cookies["CookieLogin"].Expires = DateTime.Now.AddDays(-5);
        Response.Redirect("login.aspx");
    }
}