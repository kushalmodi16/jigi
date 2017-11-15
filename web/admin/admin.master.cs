using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["fashionConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["message"]!=null) {
            lblmsg.Text = Session["message"].ToString();
                }
    }
    protected void Search(object sender, EventArgs e)
    {
        Session["searchValue"] = txtsearch.Text.Trim(); ;
        string chk = Session["searchValue"].ToString();
        if (chk != "")
        {
            Response.Redirect("UpdateProduct.aspx");
        }
        //this.showdata();
    }
    //    protected void shareSession(object sender, EventArgs e)
    //    {
    //        List<Employees> emplist = new List<Employees>();

    //        for (int i = 0; i < GridView1.Rows.Count; i++)
    //        {
    //            if (GridView1.Rows[i].RowType == DataControlRowType.DataRow)
    //            {
    //                

    //ChkSelect = GridView1.Rows[i].FindControl("ChkSelect") as CheckBox;
    //                if (ChkSelect.Checked)
    //                {
    //                    Employees emp = new Employees();
    //                    Label lblEmp = GridView1.Rows[i].FindControl("lblName") as Label;
    //                    emp.EmployeeName = lblEmp.Text;
    //                    emplist.Add(emp);
    //                }
    //            }
    //        }

    //        Session["EmployeeData"] = emplist;

    //        Response.Redirect("SecondPage.aspx", true);
    //    }
    //}
    private void showdata()
    {
        string constr = ConfigurationManager.ConnectionStrings["fashionConnectionString"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT [ProductName],[ProductDescription],[ProductCategory],[ProductQuantity],[ProductSold],[ProductPrice],[Discount] FROM Product WHERE ProductName LIKE '%' + @name + '%'";
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@name", txtsearch.Text.Trim());
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
        }
    }
}
