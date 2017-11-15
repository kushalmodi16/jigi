<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Admin Panel</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Classic Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href="../css/style1.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="../css/font-awesome1.css"/> <!-- Font-Awesome-Icons-CSS -->
    <style>
        .right{
                margin-top:95px;
              }
        </style>
<!-- //css files -->

<!-- js -->
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!-- online-fonts -->
<link href="//fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext" rel="stylesheet"/>
<!-- //online-fonts -->

     <%--<scipt src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>--%>
    <script type="text/javascript">
        $(document).bind('keydown', 'Return', function (e) {
            var key = e.keyCode;
            if (key == 13) {  // Enter key pressed                
                //alert("key pressed..");
                var login_btn = $("#btn_submit");
              
                if (!login_btn.disabled) {
                    document.getElementById('<%= btnlsubmit.ClientID %>').click();
                    //login_btn.click();
                }
                return false;
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <script src="../js/jquery.vide.min.js"></script>
	<!-- main -->
	<div data-vide-bg="../video/Ipad">
		<div class="center-container">
			<!--header-->
			<div class="header-w3l">
				<h1>Admin Panel</h1>
			</div>
			<!--//header-->
			<div class="main-content-agile">
				<div class="sub-main-w3">	
					<div class="wthree-pro">
						<h2>Login Here</h2><asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>   
					</div>

					<%--<form action="#" method="post">--%>
						<%--<input placeholder="Username or E-mail" name="Name" class="user" type="email" required=""/>--%>
                    <asp:TextBox ID="txtlemail" runat="server" CssClass="user" placeholder="E-mail"  type="email"></asp:TextBox>
						<span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br/><br/>
						<%--<input  placeholder="Password" name="Password" class="pass" type="password" required=""/>--%>
                    <asp:TextBox ID="txtlpass" runat="server" CssClass="pass" placeholder="Password"  type="password"></asp:TextBox>
                    <div class="right">                            
						<span class="icon2"><i class="fa fa-unlock" aria-hidden="true" ></i></span>
							<asp:Button ID="btnlsubmit" runat="server" Text="Login" OnClick="btnlsubmit_Click"  />
							</div>
						<div class="sub-w3l">							
							<div class="right-w3l">
								<%--<input type="submit" value="Login"/>--%>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--//main-->
			<!--footer-->
			<div class="footer">
				<p>&copy; 2017 Fashion O Trendz. All rights reserved | Design by <a href="#">B&J</a></p>
			</div>
			<!--//footer-->
		</div>
	</div>
   <%-- </form>--%>
</body>
</html>
