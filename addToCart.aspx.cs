using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addToCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var query = Convert.ToInt32(Request.QueryString["productID"]);
            //var result = db.tblProducts.FirstOrDefault(v => v.productID = query);
            var result = db.productThrouPID(query).ToList();
            DL.DataSource = result;
            DL.DataBind();
            //int totalAmount = 0;
            //var resultID = Request.Cookies["User"]["uniqueID"];
            //var queryReuslt = db.ViewCart(resultID).ToList();
            //if (queryReuslt.Count > 0)
            //{
            //    for (int i = 0; i < queryReuslt.Count; i++)
            //    {
            //        var productID = queryReuslt[i].productID;
            //        var resultingProduct = db.productThrouPID(productID).ToList();
            //        totalAmount += Convert.ToInt32(resultingProduct[0].productPrice);
            //    }
            //    lbltxt.Text = totalAmount.ToString();
            //}
        }
    }
    protected void DL_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkOut.aspx");
    }
}