using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listBrands : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using(Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var query = db.showBrands().ToList();
            GVB.DataSource = query;
            GVB.DataBind();
        }
    }
    protected void GVB_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "edit")
        {
            Response.Redirect("addBrand.aspx?brandID=" + e.CommandArgument);
        }
        else if(e.CommandName == "delete")
        {
            using(Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
            {
                var query = Convert.ToInt32(e.CommandArgument);
                db.deleteBrand(query);
                //db.deleteBrand(query);
            }
            Response.Redirect("listBrands.aspx");
        }

    }
    protected void GVB_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GVB_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}