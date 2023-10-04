using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            return;
        }
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {
            var query = db.showCategory().ToList();
            ddl.DataSource = query;
            ddl.DataTextField = "categoryName";
            ddl.DataValueField = "categoryID";            
            ddl.DataBind();

            var queryBrand = db.showBrands().ToList();
            ddlBrand.DataSource = queryBrand;
            ddlBrand.DataTextField = "brandName";
            ddlBrand.DataValueField = "brandID";
            ddlBrand.DataBind();       
            if(Request.QueryString["productID"] != null)
            {
                var productIDquery = Convert.ToInt32(Request.QueryString["productID"]);
                tblProduct tb = db.tblProducts.FirstOrDefault(v => v.productID == productIDquery);
                proName.Text = tb.productName;
                proPrice.Text = tb.productPrice.ToString();
                ModelNo.Text = tb.productModel;
                ddl.SelectedValue = tb.categoryID.ToString();
                ddlBrand.SelectedValue = tb.brandID.ToString();
                img.ImageUrl = "/img/"+ tb.productImage;
            }
        }
     
    }
    protected void btnAddPro_Click(object sender, EventArgs e)
    {
        using (Gym_AccessoriesEntities db = new Gym_AccessoriesEntities())
        {

            tblProduct tb = null;
            if(Request.QueryString["productID"]!= null )
            {
                var resultId = Convert.ToInt32(Request.QueryString["productID"]);
                tb = db.tblProducts.FirstOrDefault(v => v.productID == resultId);
               
            }
            else
            {
                tb = new tblProduct();
            }
            tb.productName = proName.Text;
            tb.productPrice = Convert.ToDecimal(proPrice.Text);

            tb.productModel = ModelNo.Text;
            tb.brandID = Convert.ToInt32(ddlBrand.SelectedValue);

            if(Request.QueryString["productID"] != null)
            {
                if(fileUpload.FileName == null)
                {
                    tb.productImage = tb.productImage;
                }
            }
            var FileName = fileUpload.FileName;
            var FilePath = Server.MapPath("img/");
            fileUpload.SaveAs(FilePath + FileName);

            tb.productImage = FileName;
            tb.categoryID = Convert.ToInt32(ddl.SelectedValue);

            if(Request.QueryString["productID"] == null)
            {
                db.tblProducts.Add(tb);
            }          
            db.SaveChanges();
        }
        Response.Redirect("listProducts.aspx");
    }
}