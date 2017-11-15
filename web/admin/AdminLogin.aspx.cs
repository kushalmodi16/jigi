using Connection_query;
using System;
using System.Data.SqlClient;
using System.Text;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    Connection_class connection = new Connection_class();
    SqlDataReader datareader;
    SqlCommand cmd = new SqlCommand();
    bool isAuthorizedUser = false;
    protected void btnlsubmit_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        connection.OpenConection();
        string pass = encryptpass(txtlpass.Text);
        string email = txtlemail.Text;

        string sql = "select * from Users where Email='" + email + "' and Password='" + pass + "' and Admin='1'";
        datareader = connection.DataReader(sql);
        
        if (datareader.Read())
        {
            isAuthorizedUser = true;
            //Session["id"] = "Hii " + datareader["FirstName"];
            Response.Redirect("Dashboard.aspx");
        }
        if (!isAuthorizedUser)
            {
                clear();
                lblmsg.Text = "Invalid Email Id or password !!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + lblmsg.Text;
            }       
    }
    public string encryptpass(string password)
    {
        string msg = "";
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        msg = Convert.ToBase64String(encode);
        return msg;
    }
    public void clear()
    {
        txtlpass.Text = "";
        txtlemail.Text = "";

    }
}
