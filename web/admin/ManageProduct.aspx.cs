using Connection_query;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin_form : System.Web.UI.Page
{
    Connection_class connection = new Connection_class();
    SqlDataReader datareader;
    int productId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        productId = Request.QueryString["prodId"] != null ? Convert.ToInt16(Request.QueryString["prodId"]) : 0;
        if (!IsPostBack)
        {
            Session["message"] = null;
            if (productId != 0)
            {
                DisplayProductDetails();
                lbl.Text = "Update Products :";
            }
        }
        connection.OpenConection();
        datareader = connection.DataReader("select BrandName from Brand");
        while (datareader.Read())
        {
            drpbrand.Items.Add(new ListItem(datareader[0].ToString(), datareader[0].ToString()));
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string InQuery = "";
        try
        {
            string pName = txtproduct.Text.ToString();
            string pDesc = txtarea.Value;
            string pPrice = txtprice.Text.ToString();
            string pQnt = txtquantity.Text.ToString();
            string pCategory = drpcategory.SelectedValue.ToString();
            string pBrand = drpbrand.SelectedValue.ToString();
            string pDisc = txtdiscount.Text.ToString();
            int BrandId = getBrandid(pBrand);   //function calling
            string pDiscount = txtdiscount.Text.ToString();

            /*Imge Upload*/
            string serverfolder = string.Empty;
            string serverpath = string.Empty;
            HttpPostedFile file = null;
            int fileCount = Request.Files.Count;
           
            if (fileCount > 0 && fileuplaod1.HasFile)
            {
                if (fileCount <= 5)
                {
                    for (int i = 0; i < fileCount; i++)
                    {
                        file = Request.Files[i];
                        string filetype = Path.GetExtension(file.FileName);
                        if (filetype.ToLower() == ".jpg" || filetype.ToLower() == ".png" || filetype.ToLower() == ".jpeg" || filetype.ToLower() == ".gif")
                        {
                            double filesize = file.ContentLength;
                            if (filesize > (1048576))
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File(s) not uploaded...File(s) Size is > 1 MB')", true);
                                return;
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('only Images allowed...')", true);
                            return;
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('maximum 5 files are allowed...')", true);
                    return;
                }
            }else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Image Files are not selected...')", true);
                return;
            }            
            connection.OpenConection();
        if (productId == 0)
        {
            InQuery = "INSERT INTO Product values ('" + pName + "','" + pDesc + "','" + pCategory + "','" + pQnt + "','0','" + pPrice + "','" + BrandId + "','" + pDisc + "')";
            connection.ExecuteQueries(InQuery);
                string productQuery = "select ProductId from Product where BrandId='" + BrandId + "' and ProductName='" + pName + "'";
                datareader = connection.DataReader(productQuery);

                if (datareader.Read())
                {
                    productId = Convert.ToInt32(datareader["ProductId"]);
                }
            }
        else
        {
            InQuery = "UPDATE Product SET ProductName = '" + pName + "', ProductDescription = '" + pDesc + "',ProductCategory='" + pCategory + "',ProductQuantity='" + pQnt + "',ProductPrice='" + pPrice + "',Discount='" + pDisc + "',BrandId='" + BrandId + "' WHERE ProductId = '" + productId + "'";
            connection.ExecuteQueries(InQuery);
        }

           
        //string productQuery = "select ProductId from Product where BrandId='" + BrandId + "' and ProductName='" + pName + "'";
        //datareader = connection.DataReader(productQuery);

        //if (datareader.Read())
        //{
        //    productId = Convert.ToInt32(datareader["ProductId"]);
        //}

        for (int i = 0; i < fileCount; i++)
        {
            file = Request.Files[i];
            serverfolder = string.Empty;
            serverpath = string.Empty;
            // Adding File Into Scecific Folder Depend On his Extension  

            serverfolder = Server.MapPath(@"uploadImages/"+ productId +"/");
            //check Folder avlalible or not  
            if (!Directory.Exists(serverfolder))
            {
                // create Folder  
                Directory.CreateDirectory(serverfolder);
            }
                //serverpath = serverfolder + Path.GetFileName(productId + "_" + file.FileName);
                serverpath = serverfolder + Path.GetFileName(file.FileName);
                file.SaveAs(serverpath);
            connection.ExecuteQueries("insert into Image values('" + file.FileName + "','" + productId + "')");
        }

        if (CheckBox1.Checked) connection.ExecuteQueries("insert into SizeProduct values('" + productId + "','1')");
        if (CheckBox2.Checked) connection.ExecuteQueries("insert into SizeProduct values('" + productId + "','2')");
        if (CheckBox3.Checked) connection.ExecuteQueries("insert into SizeProduct values('" + productId + "','3')");
        if (CheckBox4.Checked) connection.ExecuteQueries("insert into SizeProduct values('" + productId + "','4')");
        if (CheckBox5.Checked) connection.ExecuteQueries("insert into SizeProduct values('" + productId + "','5')");

        clear();
        connection.CloseConnection();
    }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void clear()
{
    txtproduct.Text = "";
    txtarea.Value = "";
    txtprice.Text = "";
    txtquantity.Text = "";
    txtdiscount.Text = "";
    drpbrand.Text = "Raymond";
    drpcategory.Text = "Men";
    CheckBox1.Checked = false;
    CheckBox2.Checked = false;
    CheckBox3.Checked = false;
    CheckBox4.Checked = false;
    CheckBox5.Checked = false;
    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
}

public int getBrandid(string brandName)
{
    connection.OpenConection();
    string brandQuery = "select BrandId from Brand where BrandName='" + brandName + "'";
    datareader = connection.DataReader(brandQuery);
    int BrandId = -1;

    if (datareader.Read())
    {
        BrandId = Convert.ToInt32(datareader["BrandId"]);
    }
    connection.CloseConnection();
    return BrandId;
}

public void DisplayProductDetails()
{
    string Query = "select * from Product where ProductId='" + productId + "'";
    connection.OpenConection();
    datareader = connection.DataReader(Query);
    if (datareader.Read())
    {
        txtproduct.Text = datareader["ProductName"].ToString();
        txtarea.InnerText = datareader["ProductDescription"].ToString();
        drpcategory.Items.FindByValue(datareader["ProductCategory"].ToString()).Selected = true;
        txtquantity.Text = datareader["ProductQuantity"].ToString();
        txtprice.Text = datareader["ProductPrice"].ToString();
        txtdiscount.Text = datareader["Discount"].ToString();
        string query = "select BrandId from Product where ProductId='" + productId + "'";
        datareader = connection.DataReader(query);
        int brandId = -1;
        if (datareader.Read())
        {
            brandId = Convert.ToInt32(datareader["BrandId"]);
        }
        string query1 = "select BrandName from Brand where BrandId='" + brandId + "'";
        datareader = connection.DataReader(query1);
        if (datareader.Read())
        {
            drpbrand.Items.FindByValue(datareader["BrandName"].ToString()).Selected = true;
        }

            //fetching checkbox values
            datareader = connection.DataReader("select SizeId from SizeProduct where ProductId='"+productId+"'");
            while (datareader.Read()) {
               int checkValue= Convert.ToInt32(datareader["SizeId"]);
                switch (checkValue)
                {
                    case 1: CheckBox1.Checked = true;
                            break;
                    case 2:CheckBox2.Checked = true;
                           break;
                    case 3:CheckBox3.Checked = true;
                           break;
                    case 4:CheckBox4.Checked = true;
                           break;
                    case 5:CheckBox5.Checked = true;
                           break;
                }
                                      }
    }
    connection.CloseConnection();

    }
}


