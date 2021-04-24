<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Maestra.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ClimaWS.Webclima.Formularios.Site.Home" %>
<%@ OutputCache Location="None" %>
<%@ Register TagPrefix="CCH" TagName="Home1" Src="~/UserControls/Site/Home.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CCH:Home1 ID="Home1" runat="server" />
</asp:Content>
