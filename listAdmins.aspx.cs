using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listAdmins : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
          showAdmin();
          GV.UseAccessibleHeader = true;
          GV.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    protected void showAdmin()
    {
        using(Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var result = db.listAdmins().ToList();
            GV.DataSource = result;
            GV.DataBind();

        }
    }
    protected void addAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("addAdmin.aspx");
    }
    protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("addAdmin.aspx?adminId=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
            {
                var delAdminID = Convert.ToInt32(e.CommandArgument);
                db.deleteAdmin(delAdminID);
            }
            showAdmin();
        }
    }
    protected void GV_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("logoutAdmin.aspx");
    }
    protected void addProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("addProduct.aspx");
    }
    protected void addCategory_Click(object sender, EventArgs e)
    {
        Response.Redirect("addCategory.aspx");
    }
}