<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmManageUserDetails.aspx.cs" Inherits="project_trial_03.frmManageUserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2 class="display-4">User Account Records</h2>
    <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="customerId"  EnableViewState="false" DataSourceID="dsManageUserDetails">
        <Columns>
            <asp:BoundField DataField="customerId" HeaderText="ID
                " InsertVisible="False" ReadOnly="True" SortExpression="customerId" />
            <asp:TemplateField HeaderText="User ID" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="customerName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Bind("customerName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("customerName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender" SortExpression="customerGender">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditGender" CssClass="form-control" runat="server" DataSourceID="dsddlEditGender" DataTextField="gender" DataValueField="genderId" SelectedValue='<%# Bind("customerGender") %>'></asp:DropDownList>
                    <asp:SqlDataSource ID="dsddlEditGender" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM [tbl_Gender]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country" SortExpression="country">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditCountry" CssClass="form-control" runat="server" DataSourceID="dsddlEditCountry" DataTextField="countryName" DataValueField="countryId" SelectedValue='<%# Bind("country") %>'></asp:DropDownList>
                    <asp:SqlDataSource ID="dsddlEditCountry" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM [tbl_Country]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("countryName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact No." SortExpression="contactNo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("contactNo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("contactNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Age" SortExpression="age">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("age") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="accountPassword">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("accountPassword") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("accountPassword") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtnUpdate" CssClass="btn btn-outline-success btn-sm" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnUpdateCancel" CssClass="btn btn-outline-secondary btn-sm" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" CssClass="btn btn-outline-secondary btn-sm" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnSelect" CssClass="btn btn-outline-info btn-sm" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnDelete" CssClass="btn btn-outline-danger btn-sm" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="dsManageUserDetails" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_Customers] WHERE [customerId] = @customerId" InsertCommand="INSERT INTO [tbl_Customers] ([userId], [customerName], [customerGender], [country], [contactNo], [email], [age], [accountPassword]) VALUES (@userId, @customerName, @customerGender, @country, @contactNo, @email, @age, @accountPassword)" SelectCommand="SELECT cus.customerId,cus.userId,cus.customerName,cus.customerGender,gen.gender,cus.country,con.countryName,cus.contactNo,cus.email,cus.age,cus.accountPassword FROM tbl_Customers cus
INNER JOIN tbl_Gender gen ON cus.customerGender=gen.genderId
INNER JOIN tbl_Country con ON cus.country=con.countryId"
        UpdateCommand="UPDATE [tbl_Customers] SET [userId] = @userId, [customerName] = @customerName, [customerGender] = @customerGender, [country] = @country, [contactNo] = @contactNo, [email] = @email, [age] = @age, [accountPassword] = @accountPassword WHERE [customerId] = @customerId">
        <DeleteParameters>
            <asp:Parameter Name="customerId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="userId" Type="String" />
            <asp:Parameter Name="customerName" Type="String" />
            <asp:Parameter Name="customerGender" Type="Int32" />
            <asp:Parameter Name="country" Type="Int32" />
            <asp:Parameter Name="contactNo" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="accountPassword" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="userId" Type="String" />
            <asp:Parameter Name="customerName" Type="String" />
            <asp:Parameter Name="customerGender" Type="Int32" />
            <asp:Parameter Name="country" Type="Int32" />
            <asp:Parameter Name="contactNo" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="accountPassword" Type="String" />
            <asp:Parameter Name="customerId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
