using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addBrand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            return;
        }
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            if (Request.QueryString["brandID"] != null)
            {
                var query = Convert.ToInt32(Request.QueryString["brandID"]);
                tblBrand tb = db.tblBrands.FirstOrDefault(v => v.brandID == query);
                txtBrand.Text = tb.brandName;
            }
        }
    }
    protected void btnbrand_Click(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            tblBrand tb = null;
            if (Request.QueryString["brandId"] != null)
            {
                var query = Convert.ToInt32(Request.QueryString["brandID"]);
                tb = db.tblBrands.FirstOrDefault(v => v.brandID == query);
            }
            else
            {
                tb = new tblBrand();
                lbltxt.InnerText = "Brand added Successfully....";
            }
            tb.brandName = txtBrand.Text;
            if (Request.QueryString["brandID"] == null)
            {
                db.tblBrands.Add(tb);
            }
            db.SaveChanges();
            Response.Redirect("listBrands.aspx");
        }
    }
}