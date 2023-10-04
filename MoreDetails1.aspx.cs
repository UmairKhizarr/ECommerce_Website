using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MoreDetails1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            if (Request.QueryString["productID"] != null)
            {
                var query = Convert.ToInt32(Request.QueryString["productID"]);
                var reuslt = db.productThrouPID(query).ToList();
                DL.DataSource = reuslt;
                DL.DataBind();
                //tb = db.tblProducts.FirstOrDefault(v => v.productID == query);
            }

        }
    }
}