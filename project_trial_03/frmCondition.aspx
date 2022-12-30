<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCondition.aspx.cs" Inherits="project_trial_03.frmCondition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <%--Aircraft Condition--%>
            <div class="col-4">
                <h2>Add Aircraft Condition</h2>
                <div class="row">
                    <asp:FormView ID="FormView2" runat="server" DataSourceID="objdsGetAircraftCondition" DefaultMode="Insert">
                        <EditItemTemplate>
                            Condition Id:
                        <asp:TextBox ID="conditionIdTextBox" runat="server" Text='<%# Bind("conditionId") %>' />
                            <br />
                            Condition:
                        <asp:TextBox ID="conditionTextBox" runat="server" Text='<%# Bind("condition") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Condition:
                        <asp:TextBox ID="TextBox1" CssClass="form-control mb-2" runat="server" Text='<%# Bind("condition") %>' />
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Insert a type." ControlToValidate="typeNameTextBox" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-outline-secondary" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-outline-secondary" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            typeId:
                        <asp:Label ID="typeIdLabel" runat="server" Text='<%# Bind("conditionId") %>' />
                            <br />
                            typeName:
                        <asp:Label ID="typeNameLabel" runat="server" Text='<%# Bind("condition") %>' />
                            <br />
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="objdsGetAircraftCondition" runat="server" DataObjectTypeName="project_trial_03.Models.AircraftCondition" InsertMethod="Insert" SelectMethod="GetCondition" TypeName="project_trial_03.DAL.GetCondition"></asp:ObjectDataSource>
                </div>
                <div class="row">
                    <asp:GridView ID="GridView2" CssClass="table table-bordered mt-3" runat="server" AutoGenerateColumns="False" DataKeyNames="conditionId" EnableViewState="false" DataSourceID="dsAircraftCondition">
                        <Columns>
                            <asp:BoundField DataField="conditionId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="conditionId" />
                            <asp:BoundField DataField="condition" HeaderText="CONDITION" SortExpression="condition" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-info fa fa-pencil" runat="server" CausesValidation="True" CommandName="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-secondary btn-sm fa fa-undo" runat="server" CausesValidation="False" CommandName="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton3" CssClass="btn btn-outline-info fa fa-edit" runat="server" CausesValidation="False" CommandName="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton4" CssClass="btn btn-outline-danger fa fa-remove" runat="server" CausesValidation="False" CommandName="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="dsAircraftCondition" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_AircraftCondition] WHERE [conditionId] = @conditionId" InsertCommand="INSERT INTO [tbl_AircraftCondition] ([condition]) VALUES (@condition)" SelectCommand="SELECT * FROM [tbl_AircraftCondition]" UpdateCommand="UPDATE [tbl_AircraftCondition] SET [condition] = @condition WHERE [conditionId] = @conditionId">
                        <DeleteParameters>
                            <asp:Parameter Name="conditionId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="condition" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="condition" Type="String" />
                            <asp:Parameter Name="conditionId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
