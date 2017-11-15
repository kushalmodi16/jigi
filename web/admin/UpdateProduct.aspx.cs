using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Connection_query;

public partial class UpdateProduct : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["fashionConnectionString"].ConnectionString;
    Connection_class conn = new Connection_class();
    SqlConnection connection;
    SqlDataAdapter adapt;
    DataTable dt;
    SqlDataReader datareader;
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["message"] = null;
        if (Session["searchValue"] != null)
        {
            string searchValue = Session["searchValue"].ToString();
            string Query = "Select ProductId,ProductName,ProductDescription,ProductCategory,ProductQuantity,ProductPrice,Discount from Product where ProductName LIKE  '%" + searchValue + "%'";
            bool flag = this.ShowData(Query);
            if (!flag) Session["message"] = "No Record Found!!";
            Session["searchValue"] = null;
        }
        else if (!IsPostBack)
        {
            string Query = "Select ProductId,ProductName,ProductDescription,ProductCategory,ProductQuantity,ProductPrice,Discount from Product";
            ShowData(Query);
        }
    }
    protected bool ShowData(string Query)
    {
        dt = new DataTable();
        connection = new SqlConnection(cs);
        connection.Open();
        bool flag = false;
        adapt = new SqlDataAdapter(Query, connection);
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            flag = true;
        }
        connection.Close();
        return flag;
    }

    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        Label ProductId = GridView1.Rows[e.RowIndex].FindControl("lblpid") as Label;
        int productid = Convert.ToInt32(ProductId.Text);
       // Session["updateLabel"] = "true";//for dynamic naming
        Response.Redirect("ManageProduct.aspx?prodId=" + productid);
    }

    protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        Label ProductId = GridView1.Rows[e.RowIndex].FindControl("lblpid") as Label;
        int productid = Convert.ToInt32(ProductId.Text);
        conn.OpenConection();
        conn.ExecuteQueries("delete from SizeProduct where ProductId='" + productid + "'");
        string Query = "DELETE FROM Product WHERE  ProductId='" + productid + "'";
        this.ShowData(Query);
        conn.CloseConnection();
        Response.Redirect("UpdateProduct.aspx");
    }
    protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.ShowData("null");
    }
   
}