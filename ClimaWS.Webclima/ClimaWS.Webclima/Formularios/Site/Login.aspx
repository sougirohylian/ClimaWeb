<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ClimaWS.Webclima.Formularios.Site.Login" %>
<%@ OutputCache Location="None" %>
<%@ Register TagPrefix="CCL" TagName="Login2" Src="~/UserControls/Site/Login.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CCL:Login2 ID="Login2" runat="server" />
</asp:Content>
