<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmManufacturer.aspx.cs" Inherits="project_trial_03.frmManufacturer" %>

<%@ Register Src="~/ucAddManufacturer.ascx" TagPrefix="uc1" TagName="ucAddManufacturer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <uc1:ucAddManufacturer runat="server" ID="ucAddManufacturer" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
