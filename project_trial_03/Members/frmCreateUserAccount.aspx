<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCreateUserAccount.aspx.cs" Inherits="project_trial_03.frmCreateUserAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card mt-5">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <%--<img src="Images/RegisterUser.png" />--%>
                                </center>
                            </div>
                        </div>

                    
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2 class="display-4">Create Account</h2>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <%--Validation Summary--%>
                        <div class="row">
                            <div class="col">
                                <asp:Panel ID="Panel2" CssClass="alert alert-warning alert-dismissible" Visible="false" runat="server">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#ECAAB6" ForeColor="#CC0000" HeaderText="ERROR!!" ShowMessageBox="True" ShowModelStateErrors="False" />
                                </asp:Panel>
                            </div>
                        </div>

                        <%--failed create account panel--%>
                        <div class="row">
                            <div class="col">
                                <asp:Panel ID="Panel1" CssClass="alert alert-warning alert-dismissible" Visible="false" runat="server">
                                    <h4>Sorry! Couldn't create account</h4>
                                    <p>Please try again..</p>
                                </asp:Panel>
                            </div>
                        </div>

                        <%--user name--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label1" CssClass="ml-2" runat="server" Text="User Name"></asp:Label>
                                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--RequiredFieldValidator--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name is Required!" ControlToValidate="txtUserName" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True">Please Enter Your Name.</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <%--Gender--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label2" CssClass="ml-2" runat="server" Text="Gender"></asp:Label>
                                    <asp:DropDownList ID="ddlGender" DataSourceID="dsddlGender" DataTextField="gender" DataValueField="genderId" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsddlGender" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_Gender">

                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <%--Country--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label3" CssClass="ml-2" runat="server" Text="Country"></asp:Label>
                                    <asp:DropDownList ID="ddlCountry" DataSourceID="dsddlCountry" DataTextField="countryName" DataValueField="countryId" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsddlCountry" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_Country">
                                        
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <%--Contact No--%>
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label4" CssClass="ml-2" runat="server" Text="Contact No."></asp:Label>
                                    <asp:TextBox ID="txtContactNo" TextMode="Phone" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--CustomValidator--%>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Contact No Must Contain 11 Numbers." ControlToValidate="txtContactNo" Display="Dynamic" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True" ValidateEmptyText="True" ViewStateMode="Enabled">Please Enter a Valid Phone Number.</asp:CustomValidator>
                                </div>
                            </div>
                        </div>

                        <%--Email--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label5" CssClass="ml-2" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--RegularExpressionValidator--%>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Expression." ControlToValidate="txtEmail" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please Enter A Valid Email.</asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <%--Age--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label6" CssClass="ml-2" runat="server" Text="Age"></asp:Label>
                                    <asp:TextBox ID="txtAge" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--RangeValidator--%>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age is not within range." ControlToValidate="txtAge" Display="Dynamic" ForeColor="#CC0000" MaximumValue="70" MinimumValue="25" SetFocusOnError="True">Your age must be 25 or above.</asp:RangeValidator>
                                </div>
                            </div>
                        </div>

                        <%--Date of Birth--%>
                        <%--<div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label7" CssClass="ml-2" runat="server" Text="Date of Birth"></asp:Label>
                                    <asp:TextBox ID="txtDateOfBirth" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--CompareValidatorValidator--%>
                                    <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Invalid Date ." ControlToValidate="txtDateOfBirth" Display="Dynamic" ForeColor="#CC0000" Operator="DataTypeCheck" SetFocusOnError="True">Please Enter A Valid Date.</asp:CompareValidator> 
                                </div>
                            </div>
                        </div>--%>

                        <%--Password--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label8" CssClass="ml-2" runat="server" Text="Account Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--CustomValidator--%>
                                </div>
                            </div>
                        </div>

                        <%--Confirm Password--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label9" CssClass="ml-2" runat="server" Text="Confirm Account Password"></asp:Label>
                                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--CompareValidator--%>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Must Match with the Account Password ." ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True">Please retype the account password.</asp:CompareValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="btnCreate" CssClass="btn btn-outline-info btn-lg" runat="server" Text="Create" OnClick="btnCreate_Click"/>
                                </center>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <%--<div class="col-md-6" >
                    <asp:DetailsView ID="DetailsView1" CssClass="table table-bordered" runat="server" AutoGenerateRows="False" DataKeyNames="customerId" DataSourceID="dsCustomerDetails">
                        <Fields>
                            <asp:BoundField DataField="customerId" HeaderText="customerId" InsertVisible="False" ReadOnly="True" SortExpression="customerId" />
                            <asp:BoundField DataField="userId" HeaderText="userId" SortExpression="userId" />
                            <asp:BoundField DataField="customerName" HeaderText="customerName" SortExpression="customerName" />
                            <asp:BoundField DataField="g.gender" HeaderText="gender" SortExpression="gender" />
                            <asp:BoundField DataField="countryName" HeaderText="country" SortExpression="country" />
                            <asp:BoundField DataField="contactNo" HeaderText="contactNo" SortExpression="contactNo" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="dsCustomerDetails" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_Customers] WHERE [customerId] = @customerId" InsertCommand="INSERT INTO [tbl_Customers] ([userId], [customerName], [gender], [country], [contactNo]) VALUES (@userId, @customerName, @gender, @country, @contactNo)" SelectCommand="SELECT c.customerId,c.customerName,c.userId,c.gender,g.gender,c.country,cn.countryName,c.contactNo FROM tbl_Customers c INNER JOIN tbl_Gender g ON c.gender=g.genderId INNER JOIN tbl_Country cn ON c.country = cn.countryId" UpdateCommand="UPDATE [tbl_Customers] SET [userId] = @userId, [customerName] = @customerName, [gender] = @gender, [country] = @country, [contactNo] = @contactNo WHERE [customerId] = @customerId">
                        <DeleteParameters>
                            <asp:Parameter Name="customerId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="userId" Type="String" />
                            <asp:Parameter Name="customerName" Type="String" />
                            <asp:Parameter Name="gender" Type="Int32" />
                            <asp:Parameter Name="country" Type="Int32" />
                            <asp:Parameter Name="contactNo" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="userId" Type="String" />
                            <asp:Parameter Name="customerName" Type="String" />
                            <asp:Parameter Name="gender" Type="Int32" />
                            <asp:Parameter Name="country" Type="Int32" />
                            <asp:Parameter Name="contactNo" Type="String" />
                            <asp:Parameter Name="customerId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        //function IsValidPhoneNumber(source,args) {
        //    var phoneNumber = /^\d{10}$/;
        //    if (txtContactNo.value.match(phoneNumber)) {
        //        return true;
        //    }
        //    else {
        //        return false;
        //    }
        //}
    </script>
</asp:Content>
