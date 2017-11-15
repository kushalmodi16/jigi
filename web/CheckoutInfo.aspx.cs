using Connection_query;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class CheckoutInfo : System.Web.UI.Page
{
    SqlConnection connection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["fashionConnectionString"].ConnectionString);
    Connection_class connection = new Connection_class();
    SqlDataReader datareader;
    public string emailId = string.Empty;
    public string firstName = string.Empty;
    public string lastName = string.Empty;
    public int productId = 0;
    public string imagePath;
    SqlDataAdapter DataAdapter1;
    DataTable DataTable1;
    SqlCommand cmd1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cod.Checked = true;
            ClientScript.RegisterStartupScript(GetType(), "hwa", "show();", true);
            productId = Request.QueryString["productId"] != null ? Convert.ToInt16(Request.QueryString["productId"]) : 0;
            int userId = Convert.ToInt32(Session["userid"]);

            connection.OpenConection();
            string query = "select Email,FirstName,LastName from Users where UserId='" + userId + "'";
            datareader = connection.DataReader(query);

            if (datareader.Read())
            {
                emailId = datareader["Email"].ToString();
                firstName = datareader["FirstName"].ToString();
                lastName = datareader["LastName"].ToString();
            }
            if (productId == 0)
            {
                connection.CloseConnection();
                displayAllItems(userId);
                return;
            }
            allProducts.Visible = false;
            query = "select Top 1 * from (select table1.ImagePath,product.productname,product.productid,product.discount,product.productprice from product join (select * from Image) table1 on table1.productid = product.productid and product.productid = '" + productId + "') table2 JOIN (select * from CartProduct where cartid in (select cartid from cart where userid = '" + Convert.ToInt32(Session["userid"]) + "')) table3 on table2.productId = table3.ProductId";
            datareader = connection.DataReader(query);
            if (datareader.Read())
            {
                product_name.Text = "Name : " + datareader["productname"].ToString();
                quantity.Text = "Qty : " + datareader["TotalQuantity"].ToString();
                price.Text = "Amount : ₹" + Convert.ToInt32(Convert.ToInt32(datareader["productprice"]) * (100 - Convert.ToInt32(datareader["discount"])) / 100).ToString();
                price.ForeColor = System.Drawing.Color.Black;
                lbltotal.Text = Convert.ToInt32(Convert.ToInt32(datareader["TotalQuantity"]) * Convert.ToInt32(Convert.ToInt32(datareader["productprice"]) * 1.13 * (100 - Convert.ToInt32(datareader["discount"])) / 100)).ToString();
                lbltax.Text = Convert.ToInt32(Convert.ToInt32(datareader["TotalQuantity"]) * (Convert.ToInt32(Convert.ToInt32(datareader["productprice"]) * 0.13 * (100 - Convert.ToInt32(datareader["discount"])) / 100))).ToString();
                product_name.ForeColor = System.Drawing.Color.Black;
                quantity.ForeColor = System.Drawing.Color.Black;
                imagePath = datareader["ImagePath"].ToString();
                lblfinal.Text = Convert.ToInt32(Convert.ToInt32(lbltotal.Text) + Convert.ToInt32(lbltax.Text)).ToString();
                price.Font.Size = 12;
                product_name.Font.Size = 12;
                quantity.Font.Size = 12;
            }
            connection.CloseConnection();
        }
    }

    protected void displayAllItems(int userId)
    {
        ordered.Visible = false;
        connection1.Open();
        cmd1 = connection1.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        int userid = Convert.ToInt32(Session["userid"]);
        //cmd1.CommandText = "select Distinct Table1.ProductId,Table1.ProductDescription,Table1.ProductName,Table1.Discount,Table1.ProductPrice,Table1.ProductQuantity,Table1.ImagePath from (SELECT Product.ProductId,Product.ProductDescription,Product.ProductQuantity, Product.ProductName, Product.Discount, Product.ProductPrice , Product.ProductCategory, Image.ImagePath FROM Product LEFT JOIN Image ON Image.ProductId = Product.ProductId AND Image.ImagePath = (SELECT TOP 1 ImagePath FROM Image WHERE Image.ProductId = Product.ProductId)) Table1 JOIN (select * from Product where ProductId IN(select ProductId from CartProduct where CartId IN(select CartId from Cart where UserId = '" + userid + "'))) Table2 ON Table1.ProductId = Table2.ProductId; ";
        cmd1.CommandText = "select * from(select Table3.ProductId,Table3.ProductDescription,Table3.ProductName,Table3.Discount,Table3.ProductPrice,Table3.ImagePath,Table4.CartProductId,Table4.CartId,Table4.SizeId,Table4.TotalQuantity from (select Distinct Table1.ProductId, Table1.ProductDescription,Table1.ProductName, Table1.Discount, Table1.ProductPrice, Table1.ProductQuantity,Table1.ImagePath from(SELECT Product.ProductId, Product.ProductDescription,Product.ProductQuantity, Product.ProductName, Product.Discount, Product.ProductPrice,Product.ProductCategory, Image.ImagePath FROM Product LEFT JOIN Image ON Image.ProductId = Product.ProductId AND Image.ImagePath =(SELECT TOP 1 ImagePath FROM Image WHERE Image.ProductId = Product.ProductId)) Table1 JOIN(select * from Product where ProductId IN(select ProductId from CartProduct where CartId IN(select CartId from Cart where UserId = '3'))) Table2 ON Table1.ProductId = Table2.ProductId) Table3 JOIN(select * from cartproduct) Table4 on Table3.ProductId = Table4.ProductId ) Table5 JOIN (select * from Size) Table6 ON Table5.SizeId = Table6.SizeId; ";
        cmd1.ExecuteNonQuery();
        DataTable1 = new DataTable();
        DataAdapter1 = new SqlDataAdapter(cmd1);
        DataAdapter1.Fill(DataTable1);
        d1.DataSource = DataTable1;
        d1.DataBind();total();
        connection1.Close();
    }
    protected void total()
    {
        connection.OpenConection();
        int totalSum = 0;
        // string query = "select Sum((100-Discount)*ProductPrice/100) As TotalPrice from Product where ProductId In (select ProductId from CartProduct where CartId In (select CartId from Cart where UserId='" + Convert.ToInt32(Session["userid"]) + "'))";
        string query = "select Table1.ProductId,Table1.TotalQuantity,Table2.ProductPrice,Table2.Discount from (select ProductId,TotalQuantity from CartProduct where CartId in (select CartId from Cart where UserId='" + Convert.ToInt32(Session["userid"]) + "')) Table1 JOIN (select ProductId,ProductPrice,Discount from Product) Table2 ON Table1.ProductId=Table2.ProductId";
        datareader = connection.DataReader(query);
        while (datareader.Read())
        {
            totalSum += (Convert.ToInt32((100 - Convert.ToInt32(datareader["Discount"])) * Convert.ToInt32(datareader["ProductPrice"]) / 100) * Convert.ToInt32(datareader["TotalQuantity"]));

        }
       Label1.Text = "₹" + (totalSum).ToString();
       Label2.Text = "₹" + Convert.ToInt32(totalSum * 1.13).ToString();
       Label3.Text = "₹" + Convert.ToInt32(totalSum * 0.13).ToString();
        connection.CloseConnection();
    }

    protected void btnFinlizeOrder_Click(object sender, EventArgs e)
    {
        address.Text = address1.Text + "<br> " + city.Text + "-" + zip.Text;
        address.Font.Size = 12;
        cod.Checked = true; 
    }

    protected void complete_Click(object sender, EventArgs e)
    {
        string state=string.Empty;
        int selectedOption = Convert.ToInt32(Request["state"]);
        if (selectedOption == 1) state = "Gujarat";
        else if (selectedOption == 2) state = "Rajasthan";
        else if (selectedOption == 3) state = "Delhi";
        else state = "Mumbai";
        connection.OpenConection();
        string email = "";
        string query = "select Email from Users where UserId='"+Convert.ToInt32(Session["userid"])+"'";
        datareader = connection.DataReader(query);
        if (datareader.Read()) email = datareader["Email"].ToString();
       
        string rupees= lbltotal.Text.ToString();
       
        query = "insert into Orders values('"+email+"','"+Convert.ToInt32(Session["userid"])+"','"+rupees+"','"+ getIndianStandardTime()+"','"+telephone.Text+"','"+address1.Text+"','"+city.Text+"','"+state+"','"+Convert.ToInt32(zip.Text)+"','India')";
        //connection.ExecuteQueries(query);
        connection.CloseConnection();
    }
    public DateTime getIndianStandardTime()
    {
        TimeZoneInfo IND_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, IND_ZONE);
    }
}