<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Maestra.Master" AutoEventWireup="true" CodeBehind="Climas.aspx.cs" Inherits="ClimaWS.Webclima.Formularios.Clima.Climas" %>
<%@ OutputCache Location="None" %>
<%@ Register TagPrefix="CCC" TagName="Climas1" Src="~/UserControls/Clima/Climas.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CCC:Climas1 ID="Climas1" runat="server" />
</asp:Content>
