<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckoutInfo.aspx.cs" Inherits="CheckoutInfo" %>

<!DOCTYPE html>


<html lang='en'>
<head>
    <meta charset="UTF-8" /> 
    <title>
       
    </title>
  
    <link rel="stylesheet" type="text/css" href="css/fstyle.css" />
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600' rel='stylesheet' type='text/css'>
    
    <style>
        .head {
            margin-left: 25%;
            font-size: 400%;
            font-family: Raleway;
            font-family: Poiret One;
        }

        a {
            text-decoration: none;
        }

        #rightDisplay {
            margin-left: 20%;
            margin-top: -160px;
        }

        .right {
            float: right !important;
            margin-top: -10%;
        }

        .subtotal {
            font-size: 18px;
            margin-top: 4%;
        }
        .finalize{
            border-radius:25px;
            float:right;
            margin-top:-5%!important;
            margin-right:-2%;
            z-index:1;
            outline:none;
            width:50px;
            font-size:40px;
            color:white;
            height:50px;
          
            border:1px solid #DDDDDD;
        }
       
    </style>
     <script>
         function validate(key) {
             var keycode = (key.which) ? key.which : key.keyCode;
             var phn = document.getElementById('telephone');
             if (!(keycode == 8 || keycode == 46) && (keycode < 48 || keycode > 57)) {
                 return false;
             }
             else {
                 if (phn.value.length < 10) {
                     return true;
                 }
                 else {
                     return false;
                 }
             }
         }

         function validate1(key) {
             var keycode = (key.which) ? key.which : key.keyCode;
             var phn = document.getElementById('zip');
             if (!(keycode == 8 || keycode == 46) && (keycode < 48 || keycode > 57)) {
                 return false;
             }
             else {
                 if (phn.value.length < 6) {
                     return true;
                 }
                 else {
                     return false;
                 }
             }
         }
         //$(document).ready(function () {
         //    $("#modify1").click(function () {
         //        $("#final_products").toggle();
         //    });
         // });
         function show() {
             if (document.getElementById('final_products').style.display == 'none') {
                 document.getElementById('final_products').style.display = 'block';
             } else {
                 document.getElementById('final_products').style.display = 'none';
             }
         }
         </script>

</head>
<body>
<div class="head">
    <a href="index.aspx">Fashion <span style="color:#FA03BB">O</span> Trendz</a>
                    
                    </div>
    <hr />

<!--  Start here -->

    
<div id="wrap">
	<div id="accordian">
		<div class="step" id="step1">
			<div class="number">
				<span>1</span>
			</div>
			<div class="title">
				<h1>Email Address</h1>
			</div>
			<div class="modify">
				<i class="fa fa-plus-circle"></i>
			</div>
		</div>
		<div class="content" id="email">
			<form class="go-right">
                  
				<div>
        <input type="email" name="email" value="<%=emailId %>"" id="email-address" readonly="readonly"/><%--<label for="email">Email Address</label>--%>


				</div>			            
                <%--<a class="continue" href="#">Change</a>				--%>
			</form>			
		</div>
		<div class="step" id="step2">
			<div class="number">
				<span>2</span>
			</div>
			<div class="title">
				<h1>Billing Information</h1>
			</div>
			<div class="modify">
				<i class="fa fa-plus-circle"></i>
			</div>
		</div>
		<div class="content" id="address">
			<form class="go-right" runat="server">
                 <asp:ScriptManager ID="ScriptManager1" runat="server" />
				<div>
				<input type="name" name="first_name" value="<%=firstName %>"" id="first_name" readonly="readonly"/>
                    <br/>
        </div>
				<div>
				<input type="name" name="last_name" value="<%=lastName %>"" id="last_name" readonly="readonly" /><br/>
				</div>
				<div style="height:45px;">
				<%--<input type="phone" pattern="[789][0-9]{9}" name="telephone" value="" id="telephone" placeholder="Mobile number" data-trigger="change" data-validation-minlength="1" data-type="number" data-required="true" data-error-message="Enter Your Telephone Number"/>
				--%>
                    <asp:TextBox ID="telephone" placeholder="Mobile number" runat="server" onkeypress="return validate(event)"></asp:TextBox>
                       
                </div>
				<%--<div>
				<input type="text" name="company" value="" id="company" placeholder="Company" data-trigger="change" data-validation-minlength="1" data-type="name" data-required="false"/><label for="Company">Company</label>
				</div>--%>
				<div>
				<%--<input type="text" name="address" value="" id="address" placeholder="Address" data-trigger="change" data-validation-minlength="1" data-type="text" data-required="true" data-error-message="Enter Your Billing Address"/>--%>
				<asp:TextBox ID="address1" placeholder="Address" runat="server" MaxLength="200"></asp:TextBox>
                </div>
				<div>
				<%--<input type="text" name="city" value="" id="city" placeholder="City" data-trigger="change" data-validation-minlength="1" data-type="text" data-required="true" data-error-message="Enter Your Billing City"/>--%>
				<asp:TextBox ID="city" placeholder="City" runat="server"></asp:TextBox>
                </div>
				<div>
				<div class="state_options">
        			<div class="select">
                 		<select id="state">
                  	 		<option value = "1">Gujarat</option>
                   			<option value = "2">Rajasthan</option>
                   			<option value = "3">Delhi</option>
                   			<option value = "4">Mumbai</option>
                 		</select>
                 	</div>
          		</div>
				</div>
				<div>
				<%--<input type="text" name="zip" value="" id="zip" placeholder="Pincode" data-trigger="change" data-validation-minlength="1" data-type="text" data-required="true" data-error-message="Enter Your Billing Zip Code"/>--%>
				<asp:TextBox ID="zip" placeholder="Pincode" runat="server" onkeypress="return validate1(event)"></asp:TextBox>
                </div>
				<div>
				<div class="country_options">
				 
        			<div class="select">
                 		<select id="country">
                  	 		<option>India</option>
                 		</select>
                 	</div>
          		</div>
				</div>
				<div>
				<%--<input type="checkbox"/>--%>
			<%--	<label class="same" for="same_as_shipping">Same As Shipping Address</label><span></span>--%>
				</div>
			
			
		</div>
		<div class="step" id="step3">
			<div class="number">
				<span>3</span>
			</div>
			<div class="title">
				<h1>Shipping Information</h1>
			</div>
			<div class="modify">
				<i class="fa fa-plus-circle"></i>
			</div>
		</div>
		<div class="content" id="shipping">
			<%--<form>--%>
				<div>
					<input type="radio" id="cod" value="1" runat="server"/><label for="shipping_1"> COD <span class="price">Free Shipping</span></label>
        </div>
				
			<%--</form>--%>
			
		</div>

         
        <asp:UpdatePanel runat="server" id="UpdatePane243425" updatemode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="btnFinlizeOrder" eventname="Click" />
        </Triggers>
            <ContentTemplate>               
		<div class="step" id="step4">
			<div class="number">
				<span>4</span>
			</div>
			
			<div class="title">
				<h1>Finalize Order</h1> <asp:Button ID="btnFinlizeOrder"  OnClick="btnFinlizeOrder_Click" runat="server" Text="+" CssClass="finalize" />
			</div> 
			<%--<div class="modify" id="modify1"  onclick="show()">--%>
            <div class="modi">
				<%--<i class="fa fa-plus-circle"></i>--%>
			</div>
		</div>
		<div class="content" id="final_products" runat="server">
			<div class="left" id="ordered" runat="server">
				<div class="products"  >
					<div class="product_image">
						<img src="admin/uploadImages/<%=productId %>/<%=imagePath %>"/>
					</div>
					<div class="product_details">
                        <asp:Label ID="product_name" runat="server" Text=""></asp:Label><br/>
                        <asp:Label ID="quantity" runat="server" Text=""></asp:Label><br/>
                        <asp:Label ID="price" runat="server" Text=""></asp:Label>
                    </div>
				</div>
				<div class="totals">
					<span class="subtitle">Subtotal: <asp:Label ID="lbltotal" runat="server"></asp:Label></span>
					<span class="subtitle">Tax: <asp:Label ID="lbltax" runat="server" Text=""></asp:Label></span>
					<span class="subtitle">Shipping: <span id="sub_ship">Free</span></span>
				</div>
				<div class="final">
					<span class="title">Total: <asp:Label ID="lblfinal" runat="server" Text=""></asp:Label></span>
				</div>
			</div>	

            <div class="allProducts" id="allProducts" runat="server">
                <asp:Repeater ID="d1" runat="server">
                <ItemTemplate>
                    <div class="cart-box" style="margin-top:30px;">
                        <img src="admin/uploadImages/<%#Eval("ProductId") %>/<%#Eval("ImagePath") %>" width="140" height="140" style="margin-left: 20px; margin-top: 2%;">
                        <div class="quantity">                            
                        </div>
                        <div class="wish-child">
                            <div id="rightDisplay">  
                            <h3><font size="4"><%#Eval("ProductName") %><h6 style="color:gray;">Size:<%#Eval("SizeType") %></h6></font></h3>Qty:<%#Eval("TotalQuantity") %>&emsp;&emsp;&emsp;<%# "₹ " + Convert.ToInt32(Convert.ToInt32(Eval("ProductPrice", "{0:F0}")) * (100 - Convert.ToInt32(Eval("Discount", "{0:F0}"))) / 100)%></div>

                            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
                <div class="subtotal">
					<span class="subtitle">Subtotal: <asp:Label ID="Label1" runat="server" Text=""></asp:Label></span><br/>
                    <span class="subtitle">Tax: <asp:Label ID="Label2" runat="server" Text=""></asp:Label></span><br/>
					<span class="subtitle">Total: <asp:Label ID="Label3" runat="server" Text=""></asp:Label></span><br/>
					<span class="subtitle">Shipping: Free</span></span>
				</div>   
                </div>

			<div class="right" id="reviewed">               
				<div class="billing">
                        
					<span class="title">Billing:</span>
					<%--<div class="address_reviewed">
						<span class="name">John Smith</span>
						<span class="address">123 Main Street</span>
						<span class="location">Everytown, USA, 12345</span>
						<span class="phone">(123)867-5309</span>
					</div>--%>
                    <asp:Label ID="address" runat="server" Text="Label"></asp:Label>
				</div>
				<%--<div class="shipping">
					<span class="title">Shipping:</span>
					<div class="address_reviewed">
						<span class="name">John Smith</span>
						<span class="address">123 Main Street</span>
						<span class="location">Everytown, USA, 12345</span>
						<span class="phone">(123)867-5309</span>

					</div>
				</div>--%>
				<div class="payment">
					<span class="title">Payment:</span>
					<div class="payment_reviewed">
						<span class="method">Cash On Delivery</span>
					</div>
				</div>
                                               
                   
				<div id="complete1">
				<%--<a class="big_button" id="complete" href="#">Complete Order</a>--%>
                    <asp:Button ID="complete" CssClass="big_button" runat="server" Text="Complete Order" onclick="complete_Click"/>
				<span class="sub">By selecting this button you agree to the purchase and subsequent payment for this order.</span> 
			</div>


</div>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
        </div>
    </div>
</body>

</html>