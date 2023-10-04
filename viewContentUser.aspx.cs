using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewContentUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            //Acessing Catogories
            var query = db.showCategory().ToList();
            ddl.DataSource = query;
            ddl.DataTextField = "categoryName";
            ddl.DataValueField = "categoryID";
            ddl.DataBind();
            ddl.Items.Insert(0, "Select Category");

            //Accessing Brands Name
            var query1 = db.showBrands().ToList();
            GVB.DataSource = query1;
            GVB.DataBind();

            //Show all Products
            var productsList = db.showProductsWBC().ToList();
            DL.DataSource = productsList;
            DL.DataBind();
        }
    }

    protected void GVB_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            if (e.CommandName == "brand")
            {
                var catID = Convert.ToInt32(ddl.SelectedIndex);
                var brandID = Convert.ToInt32(e.CommandArgument);
                var queryresult = db.showProWBrAndCat(catID, brandID).ToList();
                //var queryresult = db.showBrandProduct(result).ToList();
                DL.DataSource = queryresult;
                DL.DataBind();
            }
        }
    }
    protected void DL_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "moreDetails")
        {
            Response.Redirect("MoreDetails1.aspx?productID=" + e.CommandArgument);
        }
        else if (e.CommandName == "addToCart")
        {

            using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
            {
                var uniqueIDD = Request.Cookies["User"]["uniqueID"];
                tblTemp tb = new tblTemp();
                tb.ProductIDD = Convert.ToInt32(e.CommandArgument);
                tb.currentDateAndTime = DateTime.Now.ToString();
                tb.uniqueID = uniqueIDD;
                //tblTemp tb = new tblTemp();
                //tb.currentDateAndTime = DateTime.Now.ToString();
                //tb.productID = Convert.ToInt32(e.CommandArgument);
                //tb.uniqueID = uniqueID;
                //db.
                //db.tblTemps.Add(tb);
                db.tblTemps.Add(tb);
                db.SaveChanges();
            }
            Response.Redirect("addToCart.aspx?productID=" + e.CommandArgument);
        }
    }
    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var CategoryId = Convert.ToInt32(ddl.SelectedIndex);
            var query = db.showProWithCat(CategoryId).ToList();
            DL.DataSource = query;
            DL.DataBind();
        }
    }
    protected void btnViewCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewCart.aspx");
    }
}