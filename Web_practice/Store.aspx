﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="Web_practice.Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            height: 32px;
        }
        .auto-style4 {
            font-size: large;
            background-color: #FFFFFF;
        }
        .auto-style6 {
            width: 619px;
        }
        .auto-style7 {
            background-color: #FFFFFF;
        }
        .auto-style8 {
            font-size: x-large;
            background-color: #FFFFFF;
        }
    </style>
</head>
<body style="background-position: center center; background-image: url('https://localhost:44344/Husky.jpg'); background-size:cover; background-repeat: no-repeat; background-attachment: fixed;">
    <form id="form1" runat="server">
        <div class="auto-style13" style="color: #0066FF; font-weight: 700; font-size: xx-large; background-color: #FFFFCC; text-align: center;">
            歡迎來到茶水間</div>

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Lable_userShow" runat="server" style="background-color: #FFFFFF" Text="顯示使用者資料" CssClass="auto-style2"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Btn_order" runat="server" CssClass="auto-style2" Text="前往選購" OnClick="Btn_order_Click" />
                    <asp:Button ID="Btn_refresh" runat="server" CssClass="auto-style2" Text="清空表單" OnClick="Btn_refresh_Click" />
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="drinkList" runat="server" AutoPostBack="True" DataSourceID="drinkData" DataTextField="drink_name" DataValueField="drink_id" OnSelectedIndexChanged="drinkList_SelectedIndexChanged" CssClass="auto-style2">
                    </asp:DropDownList>
                    <asp:Label ID="label_drinkPrice" runat="server" style="background-color: #FFFFFF" Text="價格:X元" CssClass="auto-style2"></asp:Label>
                    <asp:Label ID="label_drinkQT" runat="server" style="background-color: #FFFFFF" Text="庫存:X個" CssClass="auto-style2"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <asp:DropDownList ID="cupList" runat="server" CssClass="auto-style2" Visible="False">
                    </asp:DropDownList>
                    <asp:Label ID="cupLB" runat="server" CssClass="auto-style4" Text="杯" Visible="False"></asp:Label>
                    <asp:DropDownList ID="iceList" runat="server" CssClass="auto-style2" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>少冰</asp:ListItem>
                        <asp:ListItem>小碎冰</asp:ListItem>
                        <asp:ListItem>完全去冰</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="sweetList" runat="server" CssClass="auto-style2" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>少糖</asp:ListItem>
                        <asp:ListItem>半糖</asp:ListItem>
                        <asp:ListItem>微糖</asp:ListItem>
                        <asp:ListItem>無糖</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="addDrinkBtn" runat="server" CssClass="auto-style2" Enabled="False" OnClick="addDrinkBtn_Click" Text="添加" Visible="False" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Image ID="Image_drink" runat="server" Height="400px" Width="700px" />
                </td>
                <td>
                    <asp:GridView ID="orderItemGridView1" runat="server" 
                        AutoGenerateColumns="False" CssClass="auto-style7" DataKeyNames="orderItem_id" 
                        DataSourceID="orderItemDataSource" AutoGenerateDeleteButton="True" 
                        AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="411px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="訂單編號" InsertVisible="False" 
                                SortExpression="orderItem_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderItem_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderItem_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="飲料編號" InsertVisible="False" 
                                SortExpression="drink_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("drink_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("drink_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="飲料名" SortExpression="drink_name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editDrinkNameDropDownList" runat="server" 
                                        DataSourceID="editDrinkNameSqlDataSource" DataTextField="drink_name" 
                                        DataValueField="drink_id" SelectedValue='<%# Bind("drink_id", "{0}") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="editDrinkNameSqlDataSource" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        SelectCommand="SELECT drink_id, drink_name FROM drinkData WHERE (drink_id &gt; 0)">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("drink_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="甜度" SortExpression="sweet">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editSweetList" runat="server" 
                                        SelectedValue='<%# Bind("sweet") %>'>
                                        <asp:ListItem>正常</asp:ListItem>
                                        <asp:ListItem>少糖</asp:ListItem>
                                        <asp:ListItem>半糖</asp:ListItem>
                                        <asp:ListItem>微糖</asp:ListItem>
                                        <asp:ListItem>無糖</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("sweet") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="冰塊" SortExpression="ice">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editIceList" runat="server" 
                                        SelectedValue='<%# Bind("ice") %>'>
                                        <asp:ListItem>正常</asp:ListItem>
                                        <asp:ListItem>少冰</asp:ListItem>
                                        <asp:ListItem>小碎冰</asp:ListItem>
                                        <asp:ListItem>完全去冰</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="數量" SortExpression="num">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Height="16px" 
                                        Text='<%# Bind("num") %>' Width="45px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("num") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="小計" SortExpression="subtotal">
                                <EditItemTemplate>
                                    <asp:Label ID="subTotalLabel" runat="server" Text='<%# Eval("subtotal") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="subTotalLabel" runat="server" Text='<%# Bind("subtotal") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="orderItemDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        InsertCommand="INSERT INTO order_itemData(drink_id, order_id, num, sweet, ice) VALUES (@drink_id, @order_id, @num, @sweet, @ice)" 
                        SelectCommand="SELECT order_itemData.orderItem_id, drinkData.drink_name, order_itemData.sweet, order_itemData.ice, order_itemData.num, order_itemData.num * drinkData.drink_price AS subtotal, drinkData.drink_id FROM drinkData INNER JOIN order_itemData ON drinkData.drink_id = order_itemData.drink_id WHERE (order_itemData.order_id = @order_id)"  
                        DeleteCommand="DELETE FROM order_itemData WHERE (orderItem_id = @orderItem_id)" 
                        UpdateCommand="UPDATE order_itemData SET num = @num, sweet = @sweet, ice = @ice, drink_id = @drink_id WHERE (orderItem_id = @orderItem_id)">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="orderItemGridView1" Name="orderItem_id" PropertyName="SelectedDataKey" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="drinkList" Name="drink_id" PropertyName="SelectedIndex" />
                            <asp:SessionParameter Name="order_id" SessionField="order_id" />
                            <asp:ControlParameter ControlID="cupList" Name="num" PropertyName="SelectedValue" Size="999" />
                            <asp:ControlParameter ControlID="sweetList" Name="sweet" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="iceList" Name="ice" PropertyName="SelectedValue" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="order_id" SessionField="order_id" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="orderItemGridView1" Name="num" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="orderItemGridView1" Name="sweet" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="orderItemGridView1" Name="ice" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="orderItemGridView1" Name="orderItem_id" PropertyName="SelectedDataKey" />
                            <asp:ControlParameter ControlID="orderItemGridView1" Name="drink_id" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <strong>
                    <asp:Label ID="totalLabel" runat="server" CssClass="auto-style8" Text="總價格: " 
                        Visible="False"></asp:Label>
                    </strong>
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="drinkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT drink_name, drink_id FROM [drinkData]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="drinkDataselect" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT drink_price, drink_qt FROM [drinkData] WHERE (drink_id = @drink_id)" InsertCommand="INSERT INTO orderData(order_time, order_phone) VALUES (GETDATE(), @user_phone)" >
            <InsertParameters>
                <asp:SessionParameter Name="user_phone" SessionField="phone" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="drinkList" Name="drink_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="drinkDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="drinkDataselect" Height="50px" Visible="False" Width="125px">
            <Fields>
                <asp:BoundField DataField="drink_price" HeaderText="drink_price" SortExpression="drink_price" />
                <asp:BoundField DataField="drink_qt" HeaderText="drink_qt" SortExpression="drink_qt" />
            </Fields>
        </asp:DetailsView>

    </form>
</body>
</html>
