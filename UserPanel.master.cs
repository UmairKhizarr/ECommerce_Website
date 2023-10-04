using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["User"] == null)
        {
            var uniqueID = (DateTime.Now).ToString("yyyyMMddhhmmss");
            Response.Cookies["User"]["uniqueID"] = uniqueID;
            Response.Cookies["User"].Expires = DateTime.Now.AddDays(4);

        }
        if (IsPostBack)
        {
            return;
        }
    }
    protected void viewCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewCart.aspx");
    }
}
