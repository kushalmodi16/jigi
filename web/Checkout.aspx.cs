using Connection_query;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

public partial class Checkout : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["fashionConnectionString"].ConnectionString);
    SqlDataAdapter DataAdapter1;
    DataTable DataTable1;
    SqlCommand cmd1;
    SqlDataReader datareader;
    Connection_class connection1 = new Connection_class();
    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (!IsPostBack)
        {
            connection.Open();
            cmd1 = connection.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            int userid = Convert.ToInt32(Session["userid"]);
            //cmd1.CommandText = "select Distinct Table1.ProductId,Table1.ProductDescription,Table1.ProductName,Table1.Discount,Table1.ProductPrice,Table1.ProductQuantity,Table1.ImagePath from (SELECT Product.ProductId,Product.ProductDescription,Product.ProductQuantity, Product.ProductName, Product.Discount, Product.ProductPrice , Product.ProductCategory, Image.ImagePath FROM Product LEFT JOIN Image ON Image.ProductId = Product.ProductId AND Image.ImagePath = (SELECT TOP 1 ImagePath FROM Image WHERE Image.ProductId = Product.ProductId)) Table1 JOIN (select * from Product where ProductId IN(select ProductId from CartProduct where CartId IN(select CartId from Cart where UserId = '" + userid + "'))) Table2 ON Table1.ProductId = Table2.ProductId; ";
            cmd1.CommandText = "select * from (select Table3.ProductId,Table3.ProductDescription,Table3.ProductName,Table3.Discount,Table3.ProductPrice,Table3.ImagePath,Table4.CartProductId,Table4.CartId,Table4.SizeId,Table4.TotalQuantity from (select Distinct Table1.ProductId, Table1.ProductDescription,Table1.ProductName, Table1.Discount, Table1.ProductPrice, Table1.ProductQuantity,Table1.ImagePath from(SELECT Product.ProductId, Product.ProductDescription,Product.ProductQuantity, Product.ProductName, Product.Discount, Product.ProductPrice,Product.ProductCategory, Image.ImagePath FROM Product LEFT JOIN Image ON Image.ProductId = Product.ProductId AND Image.ImagePath =(SELECT TOP 1 ImagePath FROM Image WHERE Image.ProductId = Product.ProductId)) Table1 JOIN(select * from Product where ProductId IN(select ProductId from CartProduct where CartId IN(select CartId from Cart where UserId = '3'))) Table2 ON Table1.ProductId = Table2.ProductId) Table3 JOIN(select * from cartproduct) Table4 on Table3.ProductId = Table4.ProductId ) Table5 JOIN (select * from Size) Table6 ON Table5.SizeId = Table6.SizeId; ";
            cmd1.ExecuteNonQuery();
            DataTable1 = new DataTable();
            DataAdapter1 = new SqlDataAdapter(cmd1);
            DataAdapter1.Fill(DataTable1);
            d1.DataSource = DataTable1;
            d1.DataBind();
            connection.Close();

            PlaceOrderBox();
        }
    }

    protected void hideOrderBox()
    {
        orderbox.Style.Add("visibility", "hidden");
    }
    protected void btnRun_Command(object sender, CommandEventArgs e)
    {
        int cartProductId = 0, cartId = 0;
        int productId = Convert.ToInt32(e.CommandArgument);
        int userId = Convert.ToInt32(Session["userid"]);
        connection1.OpenConection();
        datareader = connection1.DataReader("select CartId,CartProductId from CartProduct where ProductId='" + productId + " ' AND CartId In (select CartId from Cart where UserId='" + userId + "')");
        if (datareader.Read())
        {
            cartId = Convert.ToInt32(datareader["CartId"]);
            cartProductId = Convert.ToInt32(datareader["CartProductId"]);
        }
        connection1.ExecuteQueries("delete from CartProduct where CartProductId='" + cartProductId + "'");
        connection1.ExecuteQueries("delete from Cart where CartId='" + cartId + "'");
        connection1.CloseConnection();
        Response.Redirect("Checkout.aspx");
    }
    protected void PlaceOrderBox()
    {
        connection1.OpenConection();
        var sql = "SELECT * FROM CART WHERE UserId='" + Convert.ToInt32(Session["userid"]) + "'";
        datareader = connection1.DataReader(sql);
        if (datareader.Read())
        {
            int totalSum = 0;
            // string query = "select Sum((100-Discount)*ProductPrice/100) As TotalPrice from Product where ProductId In (select ProductId from CartProduct where CartId In (select CartId from Cart where UserId='" + Convert.ToInt32(Session["userid"]) + "'))";
            string query = "select Table1.ProductId,Table1.TotalQuantity,Table2.ProductPrice,Table2.Discount from (select ProductId,TotalQuantity from CartProduct where CartId in (select CartId from Cart where UserId='"+ Convert.ToInt32(Session["userid"]) + "')) Table1 JOIN (select ProductId,ProductPrice,Discount from Product) Table2 ON Table1.ProductId=Table2.ProductId";
            datareader = connection1.DataReader(query);
           while (datareader.Read())
            {
                totalSum +=(Convert.ToInt32((100-Convert.ToInt32(datareader["Discount"]))*Convert.ToInt32(datareader["ProductPrice"])/100)*Convert.ToInt32(datareader["TotalQuantity"]));
              
            }
            lblprice.Text = "₹" + (totalSum).ToString();
            lbltotal.Text = "₹" + Convert.ToInt32(totalSum * 1.13).ToString();
            lbltax.Text = "₹" + Convert.ToInt32(totalSum * 0.13).ToString();
        }
        else
        {
            orderbox.Style.Add("visibility", "hidden");
            StringBuilder htmlBuilder = new StringBuilder();
            htmlBuilder.AppendLine("<div id='emptyCart'>OOPS... SHOPPING CART IS EMPTY<hr/><div id='desc1'>You can add items from your wishlist by clicking on Add to cart button<br/></div><div id='or'>OR</div><br><div id='desc2'>Get started with options below</div><br/><div id='links'><a href='Women.aspx'>Women</a>&nbsp;|&nbsp;<a href='Men.aspx'>Men</a>&nbsp;|&nbsp;<a href='Kids.aspx'>Kids</a></div></div>");
            htmlBuilder = htmlBuilder.Replace("'", "\"");
            Literal lit = new Literal();
            lit.Text = htmlBuilder.ToString();
            PlaceHolder1.Controls.Add(lit);
        }
        connection1.CloseConnection();
    }

    protected void btnMax_Command(object sender, CommandEventArgs e)
    {
        string[] arg = new string[2];
        arg = e.CommandArgument.ToString().Split(';');
        //int productId = Convert.ToInt32(e.CommandArgument);
        int productId = Convert.ToInt32(arg[0]);
        int sizeId = Convert.ToInt32(arg[1]);
        int totalQuantity = getTotalQuantity(productId);

        int currentQuantity = getSelectedQuantity(productId,sizeId);
        if (currentQuantity < totalQuantity)
        {
            //txtdisplay.Text = (Convert.ToInt16(txtdisplay.Text) + 1).ToString();
            currentQuantity += 1;
        }
        
        setCurrentQuantity(productId, currentQuantity,sizeId);
        Response.Redirect("Checkout.aspx");
    }

    protected void btnMin_Command(object sender, CommandEventArgs e)
    {
        //int currentQuantity = Convert.ToInt32(txtdisplay.Text);
        //if (currentQuantity > 1)
        //{
        //    txtdisplay.Text = (Convert.ToInt32(txtdisplay.Text) - 1).ToString();
        //}
        string[] arg = new string[2];
        arg = e.CommandArgument.ToString().Split(';');
        //int productId = Convert.ToInt32(e.CommandArgument);
        int productId = Convert.ToInt32(arg[0]);
        int sizeId = Convert.ToInt32(arg[1]);

        int currentQuantity = getSelectedQuantity(productId, sizeId);
        if (currentQuantity > 1 )
        {
            //txtdisplay.Text = (Convert.ToInt16(txtdisplay.Text) + 1).ToString();
            currentQuantity -= 1;
        }

        setCurrentQuantity(productId, currentQuantity, sizeId);
        Response.Redirect("Checkout.aspx");
    }
    protected int getTotalQuantity(int productId)
    {
        connection1.OpenConection();
        string query = "select ProductQuantity from Product where ProductId='" + productId + "'";
        datareader = connection1.DataReader(query);
        if (datareader.Read())
        {
            return Convert.ToInt32(datareader["ProductQuantity"]);
        }
        return 0;
    }

    protected int getSelectedQuantity(int productId, int sizeId) {
        connection1.OpenConection();
        int userId = Convert.ToInt32(Session["userid"]);
        string query = "select TotalQuantity from CartProduct where CartId in(select CartId from Cart where UserId='" + userId + "') and ProductId='" + productId + "' and SizeId='" + sizeId + "'";
        datareader = connection1.DataReader(query);
        int quantity=0;
        if (datareader.Read()) {
            quantity = Convert.ToInt32(datareader["TotalQuantity"]);   
                                }
        connection1.CloseConnection();
        return quantity;
                                                     }
    protected void setCurrentQuantity(int productId,int totalQuantity,int sizeId) {
        connection1.OpenConection();
        int userId = Convert.ToInt32(Session["userid"]);
        string query = "update cartproduct set TotalQuantity='"+totalQuantity+"' where productid='"+productId+"' and sizeid='"+sizeId+"' and CartId in (select CartId from Cart where UserId='"+userId+"')";
        connection1.ExecuteQueries(query);
        connection1.CloseConnection();
            
                                                                      }
    protected void btnproceed_Click(object sender, EventArgs e)
    {
       Response.Redirect("CheckoutInfo.aspx");
    }
    
    protected void BuyNow_Command(object sender, CommandEventArgs e)
    {
        int productId = Convert.ToInt32(e.CommandArgument);
        Response.Redirect("CheckoutInfo.aspx?productId="+productId);
    }
}