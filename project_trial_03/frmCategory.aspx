<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCategory.aspx.cs" Inherits="project_trial_03.frmCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <%--Category--%>
            <div class="col-4">
                <h2>Add New Category</h2>
                <div class="row">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="categoryId" DataSourceID="objGetCategory" DefaultMode="Insert">
                                <EditItemTemplate>
                                    categoryId:
                        <asp:TextBox ID="categoryIdTextBox" runat="server" Text='<%# Bind("categoryId") %>' />
                                    <br />
                                    categoryName:
                        <asp:TextBox ID="categoryNameTextBox" runat="server" Text='<%# Bind("categoryName") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"><i class="fa fa-undo"></i></asp:LinkButton>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    Category:
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%#Bind("categoryName")%>' />
                                    <br />
                                    <div>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="categoryNameTextBox" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                    </div>
                                    <asp:LinkButton ID="InsertButton" CssClass="btn btn-outline-secondary btn sm" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-outline-secondary" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    categoryId:
                        <asp:Label ID="categoryIdLabel" runat="server" Text='<%# Bind("categoryId") %>' />
                                    <br />
                                    categoryName:
                        <asp:Label ID="categoryNameLabel" runat="server" Text='<%# Bind("categoryName") %>' />
                                    <br />

                                </ItemTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="objGetCategory" runat="server" DataObjectTypeName="project_trial_03.Models.Category" InsertMethod="Insert" SelectMethod="GetCategories" TypeName="project_trial_03.DAL.GetCategory"></asp:ObjectDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="row">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:GridView ID="GridView1" CssClass="table table-bordered mt-3" runat="server" AutoGenerateColumns="False" DataSourceID="dsManageCategory" EnableViewState="false" DataKeyNames="categoryId">
                                <Columns>
                                    <asp:BoundField DataField="categoryId" HeaderText="ID" SortExpression="categoryId" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="categoryName" HeaderText="CATEGORY" SortExpression="categoryName" />
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-info btn-sm fa fa-pencil" CausesValidation="True" CommandName="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-outline-secondary fa fa-undo"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" CssClass="btn btn-outline-info fa fa-edit" runat="server" CausesValidation="False" CommandName="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton4" CssClass="btn btn-outline-danger fa fa-remove" runat="server" CausesValidation="False" CommandName="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="dsManageCategory" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_Category] WHERE [categoryId] = @categoryId" InsertCommand="INSERT INTO [tbl_Category] ([categoryName]) VALUES (@categoryName)" SelectCommand="SELECT * FROM [tbl_Category]" UpdateCommand="UPDATE [tbl_Category] SET [categoryName] = @categoryName WHERE [categoryId] = @categoryId">
                                <DeleteParameters>
                                    <asp:Parameter Name="categoryId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="categoryName" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="categoryName" Type="String" />
                                    <asp:Parameter Name="categoryId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
