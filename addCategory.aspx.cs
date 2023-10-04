using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            return;
        }
        if (Request.QueryString["categoryID"] != null)
        {
            using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
            {
                var query = Convert.ToInt32(Request.QueryString["categoryID"]);
                tblCategory ct = db.tblCategories.FirstOrDefault(v => v.categoryID == query);
                txtaddCat.Text = ct.categoryName;
            }
        }
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        tblCategory ct = null;
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            if (Request.QueryString["categoryID"] != null)
            {
                var queryID = Convert.ToInt32(Request.QueryString["categoryID"]);
                ct = db.tblCategories.FirstOrDefault(v => v.categoryID == queryID);
            }
            else
            {
                ct = new tblCategory();
            }
            ct.categoryName = txtaddCat.Text;
            if (Request.QueryString["categoryID"] == null)
            {
                db.tblCategories.Add(ct);
            }
            db.SaveChanges();
            Response.Redirect("listCategories.aspx");
        }
    }
}