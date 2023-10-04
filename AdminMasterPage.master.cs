using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var adminName = Request.QueryString["adminName"];
        lbladminName.Text = "Welcome, " + adminName + "!!";
        //Response.Redirect("adminDashboard.aspx");
    }
}
