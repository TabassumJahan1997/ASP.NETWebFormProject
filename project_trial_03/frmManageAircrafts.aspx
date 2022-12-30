<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmManageAircrafts.aspx.cs" Inherits="project_trial_03.frmManageAircrafts" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container-fluid ml-2 mr-2">


        <div class="row">
            <%--Aircrafts--%>
            <%--add aircraft with listview--%>
            <div class="row">
                <div class="col-11 m-2">
                    <h2 class="display-4 mb-2">Add Aircraft Info</h2>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="AircraftListViewSqlDataSource"
                        ItemPlaceholderID="ItemPlaceholder"
                        InsertItemPosition="LastItem"
                        DataKeyNames="aircraftId"
                        OnItemInserting="ListView1_ItemInserting"
                        OnItemUpdating="ListView1_ItemUpdating">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("aircraftId") %></td>
                                <td><%# Eval("slNo") %></td>
                                <td><%# Eval("categoryName") %></td>
                                <td><%# Eval("condition") %></td>
                                <td><%# Eval("mfName") %></td>
                                <td><%# Eval("productionDate","{0:yyyy-MM-dd}")  %></td>
                                <td><%# Eval("UnitPrice")  %></td>
                                <td>
                                    <asp:CheckBox ID="chkIsAvailable" Checked='<%#Eval("isAvailable") %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Image ID="imgAircraftPicture" Width="60px" Height="60px" ImageUrl='<%#Eval("picUrl","~/AircraftImages/{0}") %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-outline-secondary btn-sm" Text="Edit" CausesValidation="false" />
                                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-outline-danger btn-sm" Text="Delete" CausesValidation="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <tr>
                                <%--id--%>
                                <td>
                                    <asp:Label ID="lblAircraftId" CssClass="form-control" runat="server" Text='<%#Bind("aircraftId") %>'></asp:Label>
                                </td>

                                <%--slno--%>
                                <td>
                                    <asp:TextBox ID="txtEditSlNo" CssClass="form-control" Text='<%#Bind("slNo") %>' runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEditSlNo" runat="server" ErrorMessage="SlNo is Required!" ForeColor="#cc0000" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>

                                <%--category--%>
                                <td>
                                    <asp:DropDownList ID="ddlEditCategory" CssClass="form-control" runat="server" SelectedValue='<%#Bind("category") %>' DataSourceID="dsEditCategory" DataTextField="categoryName" DataValueField="categoryId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsEditCategory" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_Category"></asp:SqlDataSource>
                                </td>

                                <%--condition--%>
                                <td>
                                    <asp:DropDownList ID="ddlEditCondition" CssClass="form-control" runat="server" SelectedValue='<%#Bind("aircraftCondition") %>' DataSourceID="dsEditCondition" DataTextField="condition" DataValueField="conditionId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsEditCondition" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_AircraftCondition"></asp:SqlDataSource>
                                </td>

                                <%--manufacturer--%>
                                <td>
                                    <asp:DropDownList ID="ddlEditManufacturer" CssClass="form-control" runat="server" SelectedValue='<%#Bind("manufacturedBy") %>' DataSourceID="dsEditManufacturer" DataTextField="mfName" DataValueField="mfId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsEditManufacturer" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_Manufacturer"></asp:SqlDataSource>
                                </td>

                                <%--production date--%>
                                <td>
                                    <asp:TextBox ID="txtEditDate" CssClass="form-control" TextMode="Date" Text='<%#Bind("productionDate","{0:yyyy-MM-dd}") %>' runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtEditDate" runat="server" ErrorMessage="Production Date is Required!" ForeColor="#cc0000" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtEditDate" ErrorMessage="Invalid Date!" ForeColor="#cc0000" Display="Dynamic" Operator="DataTypeCheck" SetFocusOnError="true" ></asp:CompareValidator>
                                </td>

                                <%--unit price--%>
                                <td>
                                    <asp:TextBox ID="txtEditUnitPrice" CssClass="form-control" Text='<%#Bind("UnitPrice") %>' runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtEditUnitPrice" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Unit Price is Required!" ForeColor="#cc0000"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Unit Price can't be 0 or negative number!" ForeColor="#cc0000" SetFocusOnError="true" ControlToValidate="txtEditUnitPrice" ValueToCompare="0" Operator="GreaterThan"></asp:CompareValidator>
                                </td>

                                <%--is available--%>
                                <td>
                                    <asp:CheckBox ID="chkEditIsAvailable" Checked='<%#Bind("isAvailable") %>' runat="server" />
                                </td>

                                <%--picture--%>
                                <td>
                                    <asp:FileUpload ID="fuEditAircraftPicture" runat="server" />
                                    <asp:HiddenField ID="HiddenField1" Value='<%#Bind("picUrl") %>' runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Picture is Required!" ControlToValidate="fuEditAircraftPicture" SetFocusOnError="true" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-outline-primary btn-sm" Text="Update" CausesValidation="false" />
                                    <asp:Button ID="btnUpdateCancel" runat="server" CommandName="Cancel" CssClass="btn btn-outline-danger btn-sm" Text="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <tr>
                                <%--id--%>
                                <td>Not Required</td>

                                <%--slno--%>
                                <td>
                                    <asp:TextBox ID="txtInsertSlNo" CssClass="form-control" Text='<%#Bind("slNo") %>' runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="SlNo is Required!" ForeColor="#cc0000" ControlToValidate="txtInsertSlNo" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                                </td>

                                <%--category--%>
                                <td>
                                    <asp:DropDownList ID="ddlInsertCategory" CssClass="form-control" runat="server" SelectedValue='<%#Bind("category") %>' DataSourceID="dsInsertCategory" DataTextField="categoryName" DataValueField="categoryId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsInsertCategory" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_Category"></asp:SqlDataSource>
                                </td>

                                <%--condition--%>
                                <td>
                                    <asp:DropDownList ID="ddlInsertCondition" CssClass="form-control" runat="server" SelectedValue='<%#Bind("aircraftCondition") %>' DataSourceID="dsInsertCondition" DataTextField="condition" DataValueField="conditionId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsInsertCondition" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_AircraftCondition"></asp:SqlDataSource>
                                </td>

                                <%--manufacturer--%>
                                <td>
                                    <asp:DropDownList ID="ddlInsertManufacturer" CssClass="form-control" runat="server" SelectedValue='<%#Bind("manufacturedBy") %>' DataSourceID="dsInsertManufacturer" DataTextField="mfName" DataValueField="mfId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsInsertManufacturer" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT * FROM tbl_Manufacturer"></asp:SqlDataSource>
                                </td>

                                <%--production date--%>
                                <td>
                                    <asp:TextBox ID="txtInsertDate" CssClass="form-control" TextMode="Date" Text='<%#Bind("productionDate") %>' runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtInsertDate" ErrorMessage="Invalid Date!" ForeColor="#cc0000" Display="Dynamic" Operator="DataTypeCheck" SetFocusOnError="true" ></asp:CompareValidator>
                                </td>

                                <%--unit price--%>
                                <td>
                                    <asp:TextBox ID="txtInsertUnitPrice" CssClass="form-control" Text='<%#Bind("UnitPrice") %>' runat="server"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtInsertUnitPrice" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Unit Price is Required!" ForeColor="#cc0000"></asp:RequiredFieldValidator>

                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Unit Price can't be 0 or negative number!" ForeColor="#cc0000" SetFocusOnError="true" ControlToValidate="txtInsertUnitPrice" ValueToCompare="0" Operator="GreaterThan"></asp:CompareValidator>
                                </td>

                                <%--is available--%>
                                <td>
                                    <asp:CheckBox ID="chkInsertIsAvailable" Checked='<%#Bind("isAvailable") %>' runat="server" />
                                </td>

                                <%--picture--%>
                                <td>
                                    <asp:FileUpload ID="fuInsertAircraftPicture" runat="server" />
                                    <asp:HiddenField ID="HiddenField1" Value='<%#Bind("picUrl") %>' runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Picture is Required!" ControlToValidate="fuInsertAircraftPicture" SetFocusOnError="true" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Button ID="btnInsert" runat="server" CommandName="Insert" CssClass="btn btn-outline-primary btn-sm" Text="Insert" CausesValidation="false" />
                                    <asp:Button ID="btnInsertCancel" runat="server" CommandName="Cancel" CssClass="btn btn-outline-secondary btn-sm" Text="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <LayoutTemplate>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Sl No.</th>
                                        <th>CATEGORY</th>
                                        <th>CONDITION</th>
                                        <th>MANUFACTURER</th>
                                        <th>PRODUCTION DATE</th>
                                        <th>UNIT PRICE</th>
                                        <th>IS AVAILABLE?</th>
                                        <th>PICTURE</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="ItemPlaceholder" runat="server">
                                </tbody>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="AircraftListViewSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" SelectCommand="SELECT a.aircraftId,a.slNo,a.category,c.categoryName,a.aircraftCondition,con.condition,a.manufacturedBy,m.mfName,a.productionDate,a.UnitPrice,a.isAvailable,a.picUrl FROM tbl_Aircrafts a INNER JOIN tbl_Category c ON a.category=c.categoryId INNER JOIN tbl_AircraftCondition con ON a.aircraftCondition=con.conditionId INNER JOIN tbl_Manufacturer m ON a.manufacturedBy= m.mfId" InsertCommand="INSERT INTO [tbl_Aircrafts] (slNo,category,aircraftCondition,manufacturedBy,productionDate,UnitPrice,isAvailable,picUrl) VALUES (@slNo,@category,@aircraftCondition,@manufacturedBy,@productionDate,@UnitPrice,@isAvailable,@picUrl)" UpdateCommand="UPDATE [tbl_Aircrafts] SET slNo=@slNo,category=@category,aircraftCondition=@aircraftCondition,manufacturedBy=@manufacturedBy,productionDate=@productionDate,UnitPrice=@UnitPrice,isAvailable=@isAvailable,picUrl=@picUrl WHERE aircraftId = @aircraftId" DeleteCommand="DELETE FROM tbl_Aircrafts WHERE aircraftId = @aircraftId">
                        <DeleteParameters>
                            <asp:Parameter Name="aircraftId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="slNo" Type="String" />
                            <asp:Parameter Name="category" Type="Int32" />
                            <asp:Parameter Name="aircraftCondition" Type="Int32" />
                            <asp:Parameter Name="manufacturedBy" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="productionDate" />
                            <asp:Parameter Name="UnitPrice" Type="Decimal" />
                            <asp:Parameter Name="isAvailable" Type="Boolean" />
                            <asp:Parameter Name="picUrl" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="slNo" Type="String" />
                            <asp:Parameter Name="category" Type="Int32" />
                            <asp:Parameter Name="aircraftCondition" Type="Int32" />
                            <asp:Parameter Name="manufacturedBy" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="productionDate" />
                            <asp:Parameter Name="UnitPrice" Type="Decimal" />
                            <asp:Parameter Name="isAvailable" Type="Boolean" />
                            <asp:Parameter Name="picUrl" Type="String" />
                            <asp:Parameter Name="aircraftId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>

        <div class="row mt-3 col-7 mx-auto">
            <h3 class="display-4 ml-4">Add Aircraft Specification</h3>
            <div class="col">
                <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="specId" DataSourceID="dsAircraftSpecification" DefaultMode="Insert">
                    <Fields>
                        <asp:TemplateField HeaderText="Spec ID" InsertVisible="False" SortExpression="specId">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("specId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("specId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Aircraft SlNo." SortExpression="aircraftId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("aircraftId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlInsertAircraftSlNo" CssClass="form-control" runat="server" DataSourceID="ddlAircraftSlNoInsert" DataTextField="slNo" DataValueField="aircraftId" SelectedValue='<%#Bind("aircraftId") %>'></asp:DropDownList>
                                <asp:SqlDataSource ID="ddlAircraftSlNoInsert" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_Aircrafts] WHERE [aircraftId] = @aircraftId" InsertCommand="INSERT INTO [tbl_Aircrafts] ([slNo]) VALUES (@slNo)" SelectCommand="SELECT [aircraftId], [slNo] FROM [tbl_Aircrafts]" UpdateCommand="UPDATE [tbl_Aircrafts] SET [slNo] = @slNo WHERE [aircraftId] = @aircraftId">
                                    <DeleteParameters>
                                        <asp:Parameter Name="aircraftId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="slNo" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="slNo" Type="String" />
                                        <asp:Parameter Name="aircraftId" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("aircraftId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No of Seat" SortExpression="noOfSeat">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNoOfSeat" CssClass="form-control" TextMode="Number" runat="server" Text='<%# Bind("noOfSeat") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertNoOfSeat" CssClass="form-control" TextMode="Number" runat="server" Text='<%# Bind("noOfSeat") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("noOfSeat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Flight Rule" SortExpression="flightRule">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("flightRule") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlInsertFlightRule" CssClass="form-control" runat="server" DataSourceID="ddlFlightRuleInsert" DataTextField="flRule" DataValueField="flRuleId" SelectedValue='<%#Bind("flightRule") %>'></asp:DropDownList>
                                <asp:SqlDataSource ID="ddlFlightRuleInsert" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_FlightRule] WHERE [flRuleId] = @flRuleId" InsertCommand="INSERT INTO [tbl_FlightRule] ([flRule]) VALUES (@flRule)" SelectCommand="SELECT * FROM [tbl_FlightRule]" UpdateCommand="UPDATE [tbl_FlightRule] SET [flRule] = @flRule WHERE [flRuleId] = @flRuleId">
                                    <DeleteParameters>
                                        <asp:Parameter Name="flRuleId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="flRule" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="flRule" Type="String" />
                                        <asp:Parameter Name="flRuleId" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("flightRule") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Engine" SortExpression="engine">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("engine") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertEngine" CssClass="form-control" runat="server" Text='<%# Bind("engine") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("engine") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AdsBEquiped?" SortExpression="adsBEquiped">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("adsBEquiped") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("adsBEquiped") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("adsBEquiped") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="lbtnInsert" CssClass="btn btn-outline-success" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtnInsertCancel" CssClass="btn btn-outline-secondary" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="dsAircraftSpecification" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_Specification] WHERE [specId] = @specId" InsertCommand="INSERT INTO [tbl_Specification] ([aircraftId], [noOfSeat], [flightRule], [engine], [adsBEquiped]) VALUES (@aircraftId, @noOfSeat, @flightRule, @engine, @adsBEquiped)" SelectCommand="SELECT s.specId,s.aircraftId,s.noOfSeat,s.flightRule,fr.flRule,s.engine,s.adsBEquiped,a.slNo FROM tbl_Specification s INNER JOIN tbl_Aircrafts a ON s.aircraftId=a.aircraftId INNER JOIN tbl_FlightRule fr ON s.flightRule = fr.flRuleId" UpdateCommand="UPDATE [tbl_Specification] SET [aircraftId] = @aircraftId, [noOfSeat] = @noOfSeat, [flightRule] = @flightRule, [engine] = @engine, [adsBEquiped] = @adsBEquiped WHERE [specId] = @specId">
                    <DeleteParameters>
                        <asp:Parameter Name="specId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="aircraftId" Type="Int32" />
                        <asp:Parameter Name="noOfSeat" Type="Int32" />
                        <asp:Parameter Name="flightRule" Type="Int32" />
                        <asp:Parameter Name="engine" Type="String" />
                        <asp:Parameter Name="adsBEquiped" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="aircraftId" Type="Int32" />
                        <asp:Parameter Name="noOfSeat" Type="Int32" />
                        <asp:Parameter Name="flightRule" Type="Int32" />
                        <asp:Parameter Name="engine" Type="String" />
                        <asp:Parameter Name="adsBEquiped" Type="Boolean" />
                        <asp:Parameter Name="specId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>

    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
