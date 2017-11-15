<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageProduct.aspx.cs" Inherits="admin_admin_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).bind('keydown', 'Return', function (e) {
            var key = e.keyCode;
            if (key == 13) {  // Enter key pressed                
                //alert("key pressed..");
                var login_btn = $("#btn_submit");

                if (!login_btn.disabled) {
                    document.getElementById('<%= btnsubmit.ClientID %>').click();
                }
                return false;
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel panel-widget forms-panel">
        <div class="progressbar-heading general-heading">
            <h4>
                <asp:Label ID="lbl" runat="server" Text="Add Products :"></asp:Label></h4>
        </div>
        <div class="forms">
            <h3 class="title1"></h3>
            <div class="form-three widget-shadow">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="focusedinput" class="col-sm-2 control-label">Product Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtproduct" runat="server" CssClass="form-control1"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selector1" class="col-sm-2 control-label">Upload Image</label>
                        <div class="col-sm-8">
                            <asp:FileUpload ID="fileuplaod1" runat="server" AllowMultiple="true" Font-Bold="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selector1" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-8">
                            <textarea id="txtarea" cols="20" rows="4" maxlength="300" runat="server"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selector1" class="col-sm-2 control-label">Price</label>
                        <div class="col-sm-8">
                            ₹                                 
                            <asp:TextBox ID="txtprice" runat="server" maxlength="6" onkeypress="return isNumber(event)"></asp:TextBox>
                            <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtprice" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{0,3}$" runat="server" ErrorMessage=""></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selector1" class="col-sm-2 control-label">Category</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="drpcategory" runat="server" CssClass="form-control1">
                                <asp:ListItem Text="Men" Value="Men"></asp:ListItem>
                                <asp:ListItem Text="Women" Value="Women"></asp:ListItem>
                                <asp:ListItem Text="Kids" Value="Kids"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selector1" class="col-sm-2 control-label">Quantity</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtquantity" runat="server" maxlength="5" onkeypress="return isNumber(event)"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selector1" class="col-sm-2 control-label">Brand Name</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="drpbrand" runat="server" CssClass="form-control1">
                                <asp:ListItem Text="Raymond" Value="Raymond"></asp:ListItem>
                                <asp:ListItem Text="Peter England" Value="Peter England"></asp:ListItem>
                                <asp:ListItem Text="American Swan" Value="American Swan"></asp:ListItem>
                                <asp:ListItem Text="Allen Solly" Value="Allen Solly"></asp:ListItem>
                                <asp:ListItem Text="Westside" Value="Westside"></asp:ListItem>
                                <asp:ListItem Text="Monte Carlo" Value="Monte Carlo"></asp:ListItem>
                                <asp:ListItem Text="Denim" Value="Denim"></asp:ListItem>
                                <asp:ListItem Text="Levi's" Value="Levi's"></asp:ListItem>
                                <asp:ListItem Text="D&G" Value="D&G"></asp:ListItem>
                                <asp:ListItem Text="Pepe Jeans" Value="Pepe Jeans"></asp:ListItem>
                                <asp:ListItem Text="TopShop" Value="TopShop"></asp:ListItem>
                                <asp:ListItem Text="Calvin Klein" Value="Calvin Klein"></asp:ListItem>
                                <asp:ListItem Text="Jordan" Value="Jordan"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selector1" class="col-sm-2 control-label">Discount</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtdiscount" runat="server" maxlength="2" onkeypress="return isNumber(event)"></asp:TextBox>
                            %
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Size</label>
                        <div class="col-sm-8">
                            <div class="checkbox-inline">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Extra Small" />
                            </div>
                            <div class="checkbox-inline"></div>
                            <div class="checkbox-inline">
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="Small" />
                            </div>
                            <div class="checkbox-inline"></div>
                            <div class="checkbox-inline">
                                <asp:CheckBox ID="CheckBox3" runat="server" Text="Medium" />
                            </div>
                            <div class="checkbox-inline"></div>
                            <div class="checkbox-inline">
                                <asp:CheckBox ID="CheckBox4" runat="server" Text="Large" />
                            </div>
                            <div class="checkbox-inline"></div>
                            <div class="checkbox-inline">
                                <asp:CheckBox ID="CheckBox5" runat="server" Text="Extra Large" />
                            </div>
                            <div class="checkbox-inline"></div>
                        </div>
                    </div>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

