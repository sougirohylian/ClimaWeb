<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="ClimaWS.Webclima.UserControls.Site.Login" %>

<div class="content">
            <!-- begin row -->
			<div class="row">
                <!-- begin col-12 -->
				<div class="col-lg-12">
<div class="row">
    <div style="max-width: 400px;">
    <h2 class="form-signin-heading">
        Login</h2>
        <div class="form-group">
                            <div class="col-md-6">           
             <label for="txtUsername">
        Usuario</label>
            </div>
            <div class="col-md-6"> 
    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Ingresar Usuario"
        required />
                </div>
        </div>
   
    <br />
       <div class="form-group">
                            <div class="col-md-6">                                     
            <label for="txtPassword">
        Contraseña</label>
           </div>
           <div class="col-md-6"> 
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"
        placeholder="Ingresar Contraseña" required />
               </div>
        </div>
    
    <div class="form-group">
        <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click"  Class="btn btn-primary" />
    </div>
    
    <br />
    <br />
    <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
        <strong>Error!</strong>
        <asp:Label ID="lblMessage" runat="server" />
    </div>
</div>
</div>
                    </div>
                <!-- End col-12 -->
                </div>
            <!-- End row -->
            </div>