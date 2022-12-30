<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmLogIn.aspx.cs" Inherits="project_trial_03.frmLogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card mt-5">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <%--login headline--%>
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h2><i class="fa fa-user m-1"></i>Log In</h2>
                                            <hr />
                                        </center>
                                    </div>
                                </div>

                                <%--panel for failed message--%>
                                <div class="row">
                                    <div class="col">
                                        <asp:Panel ID="Panel1" CssClass="alert alert-warning alert-dismissible" Visible="false" runat="server">
                                            <h4>LogIn Failed !!</h4>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your username." ControlToValidate="txtUserName" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <%--password--%>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" CssClass="ml-2" runat="server" Text="Password"></asp:Label>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your Password." ControlToValidate="txtPassword" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>


                                <%--log in button--%>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <center>
                                                <asp:Button ID="btnLogIn" CssClass="btn btn-outline-info btn-lg" runat="server" Text="Log In" OnClick="btnLogIn_Click" />

                                            </center>
                                        </div>
                                    </div>
                                </div>

                                <%--ajax--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="col-2 mx-auto mt-3">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                <ProgressTemplate>
                                    <img src="GIFs/giphy.gif" width="70" height="70" />
                                    <%--<img src="GIFs/Quarter-Circle-Loading-Image-1.gif" height="70" width="100"/>--%>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
