using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(IsPostBack)
        //{
        //    return;
        //}
        if (Request.Cookies["User"] == null)
        {
            lbltxt.Text = "Your Gym Accessories Cart is Empty";
        }
        else
        {
            viewCartProducts();
        }
    }
    protected void viewCartProducts()
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            //Response.Cookies["User"]["uniqueID"] = uniqueID;
            var result = Request.Cookies["User"]["uniqueID"];
            var viewCartItems = db.ViewCart(result).ToList();
            var totalAmount = 0;
            var productListNames = "";
            for (int i = 0; i < viewCartItems.Count; i++)
            {
                totalAmount += Convert.ToInt32(viewCartItems[i].productPrice);
                productListNames += viewCartItems[i].productName + ", ";
            }
            //lbltxt.Text = totalAmount.ToString();
            totalPri.Text = "Total Price " + totalAmount.ToString();

            ProductsNames.Text = productListNames;
            //lbltxt.Text = viewCartItems.Count.ToString();
            DV.DataSource = viewCartItems;
            DV.DataBind();

            //var viewCartList = db.ViewCart(result).ToList();
            //lbltxt.Text = viewCartList.Count.ToString();
        }


    }

    //if(query.Count == 0)
    //{
    //    lbltxt.Text = "Your Gym Accessories Cart Is Empty";
    //}
    //class Products
    //{
    //    public string productName;
    //    public string productN;
    //    public float  productPrice;
    //    public string productName;

    //}
    //List<Products> CartProducts = new List<Products>

    //else if(query.Count>0)
    //{
    //    int totalPrice = 0;
    //    //var resultingProduct;
    //    for (int i = 0; i < query.Count; i++)
    //    {
    //        var productID = query[i].productID;
    //        var resultingProduct = db.productThrouPID(productID).ToList();
    //        totalPrice += Convert.ToInt32(resultingProduct[0].productPrice); 
    //        DV.DataSource = resultingProduct;
    //        DV.DataBind();
    //    }

    //    lbltxt.Text = totalPrice.ToString();
    //}
    //var query = db.viewcart(result).toList();
    //query.LongCount
    //lbltxt.Text = query.Count.ToString();

    //}
    //}
    //protected void DV_DeleteCommand(object source, DataListCommandEventArgs e)
    //{
    //    using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
    //    {
    //        db.deleteProduct(Convert.ToInt32(e.CommandArgument));

    //    }
    //    viewCartProducts();
    //}
    protected void DV_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "deleteCart")
        {
            using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
            {
                db.deleteProduct(Convert.ToInt32(e.CommandArgument));
            }
            viewCartProducts();
        }
    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkOut.aspx");
        //Checkout.Style.Add("visibility", "true");
        ////Checkout.Style.Add("visibility","true");
    }
    protected void btnConfirmOrder_Click(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {

        }
    }
}