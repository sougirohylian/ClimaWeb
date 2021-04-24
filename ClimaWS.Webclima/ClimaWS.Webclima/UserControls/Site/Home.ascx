<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home.ascx.cs" Inherits="ClimaWS.Webclima.UserControls.Site.Home" %>

<div class="content">
            <!-- begin row -->
			<div class="row">
                <!-- begin col-12 -->
				<div class="col-lg-12">

                    <h2 class="form-signin-heading">
        Bienvenido a la Aplicación del Clima</h2>
                    <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
        <strong>Error!</strong>
        <asp:Label ID="lblMessage" runat="server" />
    </div>
                    <div class="row">
                      <h4>Listado de Climas</h4>
                        <asp:GridView ID="gvClimas" runat="server" AllowPaging="True" AllowSorting="True"
                                                AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="4"
                                                Font-Names="Calibri" Font-Size="Small" ForeColor="#333333" GridLines="Vertical"
                                                DataKeyNames="IdClima"
                                                HeaderStyle-CssClass="gridViewHeader" HorizontalAlign="Center" 
                                                Font-Bold="False"  ShowHeaderWhenEmpty="True"
                            OnRowCommand="gvClimas_RowCommand"
                                                >
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:BoundField DataField="IdClima" HeaderText="Código" InsertVisible="False"
                                                        ReadOnly="True" SortExpression="IdClima">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="grados" HeaderText="Grados" SortExpression="Grados" HtmlEncode="False"
                                                        HtmlEncodeFormatString="False">
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="IdCiudad" HeaderText="Ciudad" SortExpression="IdCiudad"
                                                        />
                                                   
                                                    <asp:BoundField DataField="FechaCreacion" DataFormatString="{0:d}" HeaderText="Fecha de Creación" SortExpression="FechaRegistro">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                   
                                                    <asp:TemplateField HeaderText="Acción" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                                CommandArgument="<%# Container.DataItemIndex %>" ImageUrl="~/Imagenes/Icons/edit.png" Text="Seleccionar"
                                                                
                                                                ToolTip="Editar" />
                                                            <asp:ImageButton ID="btnImgEliminarObjetivo" runat="server" CausesValidation="False"
                                                                 CommandArgument="<%# Container.DataItemIndex %>"
                                                                ImageUrl="~/Imagenes/Icons/delete.png" Text="Eliminar" CommandName="Eliminar" ToolTip="Eliminar"
                                                                data-toggle="modal" data-target="#exampleModal"
                                                                />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                </Columns>
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#002649" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#002649" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                
                                            </asp:GridView>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <asp:Button runat="server" ID="btnAdd" Text="Nuevo" CssClass="btn btn-primary"
                            OnClick="btnAdd_Click"/>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                    </div>
                <!-- End col-12 -->
                </div>
            <!-- End row -->
            </div>


