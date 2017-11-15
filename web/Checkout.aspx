<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--//header-->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInLeft;">
                <li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Checkout</li>
            </ol>
        </div>
    </div>
    <div class="order-box" id="orderbox" runat="server">
        <font size="5">Total<asp:Label ID="lbltotal" runat="server" Text="Label" CssClass="space"></asp:Label></font>
        <br />
        <asp:Button ID="btnproceed" runat="server" Text="PLACE ORDER" OnClick="btnproceed_Click" CssClass="wishlist-button" Style="width: 100%; margin-left: 0px;" />
        <div id="summary">
            Price<asp:Label ID="lblprice" runat="server" Text="Label" CssClass="space"></asp:Label><br />
            <br />
            Handling Charges<p style="color: green; float: right;">FREE</p>
            <br />
            <br />
            Estimated GST*<asp:Label ID="lbltax" runat="server" Text="Label" CssClass="space"></asp:Label><br />
            <br />
            <h6 style="margin-left: 15%; margin-top: -10px;">*Part of the taxes payable to the government</h6>
        </div>
    </div>
    <!---->
    <div class="container">
        <div class="check-out" id="cartbox" runat="server">
            <h2>My Cart</h2>            
            <asp:Repeater ID="d1" runat="server">
                <ItemTemplate>
                    <div class="cart-box">
                        <img src="admin/uploadImages/<%#Eval("ProductId") %>/<%#Eval("ImagePath") %>" width="140" height="140" style="margin-left: 20px; margin-top: 2%;">
                        <div class="quantity">                            
                            <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnmin" EventName="Click" />
                                </Triggers>
                                <ContentTemplate>
                                   <%-- <asp:Button ID="btnmin" runat="server" Text="-" OnClick="btnmin_Click" CssClass="max-min" />--%>
                                    <asp:Button ID="btnmin" runat="server" Text="-" CommandName="min" OnCommand="btnMin_Command"  CommandArgument='<%#Eval("ProductId") + ";" +Eval("SizeId") %>' CssClass="max-min" />
                                    <asp:TextBox ID="txtdisplay" runat="server" CssClass="max-min-display" Text='<%#Eval("TotalQuantity")%>' ></asp:TextBox>
                                     <asp:Button ID="btnmax" runat="server" Text="+" CommandName="max" OnCommand="btnMax_Command"  CommandArgument='<%#Eval("ProductId") + ";" +Eval("SizeId") %>' CssClass="max-min" />

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="wish-child">
                           <%-- <% int val = 0; val=#Eval("SizeId")%>--%>
                            
                            <h3><font size="4"><%#Eval("ProductName") %><hr style="width:155px;"><h6 style="color:gray;">Size:<%#Eval("SizeType") %></h6></font></h3>
                            <h5 class="item_price"><%# "<h4><font color='black'>₹ " +Convert.ToInt32(Eval("ProductPrice", "{0:F0}"))*(100-Convert.ToInt32(Eval("Discount", "{0:F0}")))/100+"  </font></h4><del><font color='gray'>₹"+Eval("ProductPrice", "{0:F0}")+" </font></del>&emsp;<font color='green'>"+Eval("Discount", "{0:F0}")+"% OFF</font>" %></h5>
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Buy Now" CommandName="buy_now" OnCommand="BuyNow_Command" CommandArgument='<%#Eval("ProductId") %>' CssClass="wishlist-button1" />
                            <asp:Button ID="btnRun" runat="server" CssClass="cross-icon" CommandName="delete" OnCommand="btnRun_Command" CommandArgument='<%#Eval("ProductId") %>' Text="X" Style="margin-top: -35%;"></asp:Button>
                        </div>
                        <div class="description">
                            <font size="2"><%#Eval("ProductDescription") %></font>
                            <br />
                            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>


        <%--<a href="CheckoutInfo.aspx" class=" to-buy">PROCEED TO BUY</a>--%>

        <div class="clearfix"></div>

    </div>
</asp:Content>

