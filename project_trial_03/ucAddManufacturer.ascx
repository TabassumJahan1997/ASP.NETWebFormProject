<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAddManufacturer.ascx.cs" Inherits="project_trial_03.ucAddManufacturer" %>
<%--Manufacturer--%>
       
            <div class="col-4 mx-auto">
                <h2>Add Manufacturer</h2>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:FormView ID="FormView3" runat="server" DataKeyNames="mfId" DataSourceID="objdsAddManufacturer" DefaultMode="Insert">
                    <EditItemTemplate>
                        mfId:
                        <asp:TextBox ID="mfIdTextBox" runat="server" Text='<%# Bind("mfId") %>' />
                        <br />
                        mfName:
                        <asp:TextBox ID="mfNameTextBox" runat="server" Text='<%# Bind("mfName") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Manufacturer Name:
                        <asp:TextBox ID="mfNameTextBox" CssClass="form-control mb-2" runat="server" Text='<%# Bind("mfName") %>' />
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Insert Manufacturer name." ControlToValidate="mfNameTextBox" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                        <br />
                        
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"  CssClass="btn btn-outline-secondary" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"  CssClass="btn btn-outline-secondary" Text="Cancel" />
                        
                    </InsertItemTemplate>
                    <ItemTemplate>
                        mfId:
                        <asp:Label ID="mfIdLabel" runat="server" Text='<%# Bind("mfId") %>' />
                        <br />
                        mfName:
                        <asp:Label ID="mfNameLabel" runat="server" Text='<%# Bind("mfName") %>' />
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="objdsAddManufacturer" runat="server" DataObjectTypeName="project_trial_03.Models.Manufacturer" InsertMethod="Insert" SelectMethod="GetManufacturers" TypeName="project_trial_03.DAL.GetManufacturer"></asp:ObjectDataSource>
                <div class="row">
                <asp:GridView ID="GridView3" CssClass="table table-bordered mt-3" runat="server" AutoGenerateColumns="False" DataKeyNames="mfId" DataSourceID="dsManageManufacturers" EnableViewState="false">
                    <Columns>
                        <asp:BoundField DataField="mfId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="mfId" />
                        <asp:BoundField DataField="mfName" HeaderText="MANUFACTURER" SortExpression="mfName" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-outline-info fa fa-pencil"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-outline-secondary fa fa-undo"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-outline-info fa fa-edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-outline-danger fa fa-remove"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsManageManufacturers" runat="server" ConnectionString="<%$ ConnectionStrings:AircraftDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_Manufacturer] WHERE [mfId] = @mfId" InsertCommand="INSERT INTO [tbl_Manufacturer] ([mfName]) VALUES (@mfName)" SelectCommand="SELECT * FROM [tbl_Manufacturer]" UpdateCommand="UPDATE [tbl_Manufacturer] SET [mfName] = @mfName WHERE [mfId] = @mfId">
                    <DeleteParameters>
                        <asp:Parameter Name="mfId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="mfName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="mfName" Type="String" />
                        <asp:Parameter Name="mfId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
