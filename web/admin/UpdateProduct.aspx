<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="add"><a href="ManageProduct.aspx" onclick="return add_onclick()"><i class="fa fa-plus-circle" ></i>Add Product <i class="fa fa-arrow-right" aria-hidden="true"></i> </a></div> 
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" CssClass="grid-table" OnPageIndexChanging="grdData_PageIndexChanging" PageSize="5">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="btn_Update" ImageUrl="../images/update.png" Width="60" Height="50" runat="server" Text="Update" CommandName="Update" CssClass="btn" />
                        <asp:ImageButton ID="btn_Delete" ImageUrl="../images/delete.png" Width="60" Height="50" runat="server" Text="Delete" CommandName="Delete" CssClass="btn" OnClientClick="return ConfirmOnDelete();" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Id" HeaderStyle-CssClass="header">
                    <ItemTemplate>
                        <asp:Label ID="lblpid" runat="server" Text='<%#Eval("ProductId") %>' CssClass="header"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtpid" runat="server" Text='<%#Eval("ProductId") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Name">
                    <ItemTemplate>
                        <asp:Label ID="lblpname" runat="server" Text='<%#Eval("ProductName") %>' CssClass="header"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtname" runat="server" Text='<%#Eval("ProductName") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Category" HeaderStyle-CssClass="header">
                    <ItemTemplate>
                        <asp:Label ID="lblpcat" runat="server" Text='<%#Eval("ProductCategory") %>' CssClass="header"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtcat" runat="server" Text='<%#Eval("ProductCategory") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField> 
                   

                <asp:TemplateField HeaderText="Product Quantity">
                    <ItemTemplate>
                        <asp:Label ID="lblpquan" runat="server" Text='<%#Eval("ProductQuantity") %>' CssClass="header"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtquan" runat="server" Text='<%#Eval("ProductQuantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <%--<asp:TemplateField HeaderText="Brand Id">
                    <ItemTemplate>
                        <asp:Label ID="lblbid" runat="server" Text='<%#Eval("BrandId") %>' CssClass="header"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtbid" runat="server" Text='<%#Eval("BrandId") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>--%>                      
                 
                    <asp:TemplateField HeaderText="Product Price">
                    <ItemTemplate>
                        <asp:Label ID="lblpprice" runat="server" Text='<%# "₹ " +Eval("ProductPrice", "{0:F0}") %>' CssClass="header"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtprice" runat="server" Text='<%#Eval("ProductPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discount">
                    <ItemTemplate>
                        <asp:Label ID="lbldiscount" runat="server" Text='<%#Eval("Discount") %>' CssClass="header"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdiscount" runat="server" Text='<%#Eval("Discount") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#00BCD4" ForeColor="#ffffff" />
            <RowStyle BackColor="#D0D0D0" />
        </asp:GridView>
    </div>
</asp:Content>

