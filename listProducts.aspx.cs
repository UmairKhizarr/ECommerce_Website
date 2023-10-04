using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showProducts();
    }
    protected void showProducts()
    {
        using(Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var query = db.showProductsWBC().ToList();
            GVP.DataSource = query;
            GVP.DataBind();
        }
    }

    protected void btnAP_Click(object sender, EventArgs e)
    {
        Response.Redirect("addProduct.aspx");
    }

    protected void GVP_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "edit")
        {
            Response.Redirect("addProduct.aspx?productID=" + e.CommandArgument);
        }
        else if(e.CommandName == "delete")
        {
            using(Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
            {
                var delProductID = Convert.ToInt32(e.CommandArgument);
                db.deleteProduct(delProductID);
            }
        }
        showProducts();
    }
    protected void GVP_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GVP_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void btnAddNewPro_Click(object sender, EventArgs e)
    {
        Response.Redirect("addProduct.aspx");
    }
}