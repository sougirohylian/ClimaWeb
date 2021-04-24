<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Climas.ascx.cs" Inherits="ClimaWS.Webclima.UserControls.Clima.Climas" %>
<div class="content">
            <!-- begin row -->
			<div class="row">
                <!-- begin col-12 -->
				<div class="col-lg-12">
                    <h2 class="form-signin-heading">
        Registro del Clima</h2>
                    <div runat="server" id="dvFormRegistro" class="form-group">
                        <div class="form-group" runat="server" id="dvIdClima" visible="false">
                            <div class="col-md-6">
                                <asp:Label runat="server" ID="lblIdClima" Text="Codigo:"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox runat="server" ID="txtIdClima" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <asp:Label runat="server" ID="lblGrados" Text="Grados:"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox runat="server" ID="txtGrados" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <asp:Label runat="server" ID="lblCiudad" Text="Ciudad:"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <asp:Label runat="server" ID="lblEstado" Text="Estado:" ></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlestado" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <asp:Button runat="server" ID="btnRegistrar" Text="Registrar" CssClass="btn btn-primary"
                            OnClick="btnRegistrar_Click"/>
                            <asp:Button runat="server" ID="btnActualizar" Text="Actualizar" CssClass="btn btn-primary"
                            OnClick="btnActualizar_Click" Visible="false"/>
                        </div>
                        <div class="col-md-4"></div>
                        
                    </div>
                    <div id="dvMessageErr" runat="server" visible="false" class="alert alert-danger">
        <strong>Atención!</strong>
        <asp:Label ID="lblMessage" runat="server" />
    </div>
                    <div id="dvMessageExt" runat="server" visible="false" class="alert alert-success">
        <strong>Atención!</strong>
        <asp:Label ID="lblMessageExt" runat="server" />
    </div>
                    </div>
                <!-- End col-12 -->
                </div>
            <!-- End row -->
            </div>