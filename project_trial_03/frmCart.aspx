<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCart.aspx.cs" Inherits="project_trial_03.frmCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <h2 class="display-4">Cart Details</h2>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="cartNo" DataSourceID="dsUserCart">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="cartNo" HeaderText="cartNo" InsertVisible="False" ReadOnly="True" SortExpression="cartNo" />
                        <asp:BoundField DataField="userId" HeaderText="userId" SortExpression="userId" />
                        <asp:BoundField DataField="aircraftId" HeaderText="aircraftId" SortExpression="aircraftId" />
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                        <asp:BoundField DataField="unitPrice" HeaderText="unitPrice" SortExpression="unitPrice" />
                        <asp:BoundField DataField="picUrl" HeaderText="picUrl" SortExpression="picUrl" />
                        <asp:BoundField DataField="totalPrice" HeaderText="totalPrice" ReadOnly="True" SortExpression="totalPrice" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsUserCart" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_Cart] WHERE [cartNo] = @cartNo" InsertCommand="INSERT INTO [tbl_Cart] ([userId], [aircraftId], [quantity], [unitPrice], [picUrl], [totalPrice]) VALUES (@userId, @aircraftId, @quantity, @unitPrice, @picUrl, @totalPrice)" SelectCommand="SELECT * FROM [tbl_Cart]" UpdateCommand="UPDATE [tbl_Cart] SET [userId] = @userId, [aircraftId] = @aircraftId, [quantity] = @quantity, [unitPrice] = @unitPrice, [picUrl] = @picUrl, [totalPrice] = @totalPrice WHERE [cartNo] = @cartNo">
                    <DeleteParameters>
                        <asp:Parameter Name="cartNo" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="userId" Type="String" />
                        <asp:Parameter Name="aircraftId" Type="Int32" />
                        <asp:Parameter Name="quantity" Type="Int32" />
                        <asp:Parameter Name="unitPrice" Type="Decimal" />
                        <asp:Parameter Name="picUrl" Type="String" />
                        <asp:Parameter Name="totalPrice" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="userId" Type="String" />
                        <asp:Parameter Name="aircraftId" Type="Int32" />
                        <asp:Parameter Name="quantity" Type="Int32" />
                        <asp:Parameter Name="unitPrice" Type="Decimal" />
                        <asp:Parameter Name="picUrl" Type="String" />
                        <asp:Parameter Name="totalPrice" Type="Decimal" />
                        <asp:Parameter Name="cartNo" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
