using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using(Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var query = db.showCategory().ToList();
            GV.DataSource = query;
            GV.DataBind();
        }
    }
    protected void GV_RowEditing(object sender, GridViewEditEventArgs e)
    {
        
    }
    protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "edit")
        {
            Response.Redirect("addCategory.aspx?categoryID=" + e.CommandArgument);
        }
        else if(e.CommandName == "delete")
        {
            using(Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
            {
                var query = Convert.ToInt32(e.CommandArgument);
                db.deleteCategory(query);
            }
        }
        Response.Redirect("listCategories.aspx");
    }
    protected void GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}