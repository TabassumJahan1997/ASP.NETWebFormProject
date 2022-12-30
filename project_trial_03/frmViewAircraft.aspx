<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmViewAircraft.aspx.cs" Inherits="project_trial_03.frmViewAircraft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <h2 class="display-4">All Aircrafts</h2>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="aircraftId" DataSourceID="dsAllAircrafts" OnRowCommand="GridView1_RowCommand">
                    <Columns>

                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="aircraftId">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("aircraftId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("aircraftId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SL NO." SortExpression="slNo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("slNo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("slNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CATEGORY" SortExpression="category">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("categoryName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CONDITION" SortExpression="aircraftCondition">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("aircraftCondition") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("condition") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MANUFACTURER" SortExpression="manufacturedBy">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("manufactureredBy") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("mfName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRODUCTION" SortExpression="productionDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("productionDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("productionDate","{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="IS AVAILABLE?" SortExpression="isAvailable">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isAvailable") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isAvailable") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PICTURE" SortExpression="picUrl">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("picUrl") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" Width="70px" Height="70px" ImageUrl='<%#Bind("picUrl","~/AircraftImages/{0}") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CssClass="btn btn-outline-success" CommandName="Select" CommandArgument='<%#Container.DataItemIndex %>' Text="View"></asp:LinkButton>
                                <%--<%if (Request.IsAuthenticated) 
                                    {
                                %>
                                    <asp:LinkButton ID="lbtnSaveForLater" runat="server" CausesValidation="False" CssClass="btn btn-outline-success" CommandName="Insert" Text="Save For Later"></asp:LinkButton>
                                <%
                                    } 
                                %>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="dsAllAircrafts" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT a.aircraftId,a.slNo,a.category,c.categoryName,a.aircraftCondition,con.condition,a.manufacturedBy,m.mfName,a.productionDate,a.UnitPrice,a.isAvailable,a.picUrl FROM tbl_Aircrafts a INNER JOIN tbl_Category c ON a.category=c.categoryId INNER JOIN tbl_AircraftCondition con ON a.aircraftCondition=con.conditionId INNER JOIN tbl_Manufacturer m ON a.manufacturedBy= m.mfId"></asp:SqlDataSource>

            </div>
        </div>
    </div>
    <div>
        <div class="row mt-3 mx-auto">
            <div class="col-md-5 card card-body mx-auto">
                <h2 class="display-4">Aircraft Details</h2>
                <asp:DetailsView ID="DetailsView1" CssClass="table table-bordered table-sm" runat="server" AutoGenerateRows="False" DataKeyNames="aircraftId" DataSourceID="SqlDataSource1">
                    <Fields>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="aircraftId">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("aircraftId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("aircraftId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SL No." SortExpression="slNo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("slNo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("slNo") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("slNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CATEGORY" SortExpression="category">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("categoryName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CONDITION" SortExpression="aircraftCondition">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("aircraftCondition") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("aircraftCondition") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("condition") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MANUFACTURER" SortExpression="manufacturedBy">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("manufacturedBy") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("manufacturedBy") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("mfName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRODUCTION DATE" SortExpression="productionDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("productionDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("productionDate") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("productionDate","{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IS AVAILABLE?" SortExpression="isAvailable">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isAvailable") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isAvailable") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isAvailable") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IMAGE" SortExpression="picUrl">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("picUrl") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("picUrl") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" Width="300px" Height="250px" ImageUrl='<%#Bind("picUrl","~/AircraftImages/{0}") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UNIT PRICE" SortExpression="UnitPrice">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT a.aircraftId,a.slNo,a.category,c.categoryName,a.aircraftCondition,con.condition,a.manufacturedBy,m.mfName,a.productionDate,a.UnitPrice,a.isAvailable,a.picUrl FROM tbl_Aircrafts a INNER JOIN tbl_Category c ON a.category=c.categoryId INNER JOIN tbl_AircraftCondition con ON a.aircraftCondition=con.conditionId INNER JOIN tbl_Manufacturer m ON a.manufacturedBy= m.mfId WHERE ([aircraftId] = @aircraftId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="aircraftId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            <%if (Request.IsAuthenticated)
                {
            %>
            <div class="col-md-5 card card-body mx-auto">

                <div class="row mb-1">
                    <div class="col">
                        <asp:Label ID="Label13" runat="server" Text="Id"></asp:Label>
                        <asp:TextBox ID="txtId" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Label ID="Label7" runat="server" Text="Sl No"></asp:Label>
                        <asp:TextBox ID="txtSlNo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Label ID="Label8" runat="server" Text="Category"></asp:Label>
                        <asp:TextBox ID="txtCategory" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Label ID="Label9" runat="server" Text="Condition"></asp:Label>
                        <asp:TextBox ID="txtCondition" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Label ID="Label10" runat="server" Text="Manufacturer"></asp:Label>
                        <asp:TextBox ID="txtManufacturer" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Label ID="Label11" runat="server" Text="Production Date"></asp:Label>
                        <asp:TextBox ID="txtProductionDate" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Label ID="Label12" runat="server" Text="Unit Price"></asp:Label>
                        <asp:TextBox ID="txtUnitPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Image ID="Image3" runat="server" />
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col">
                        <asp:Button ID="btnConfirmOrder" runat="server" Text="Place Order" CssClass="btn btn-outline-success" />
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
