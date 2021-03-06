<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ComunesWeb/menu.Master" CodeBehind="MetCatalogo.aspx.vb" Inherits="TranscoldPruebasWeb2.MetCatalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" runat="server">
        <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">
                <div class="card card-default">
                    <div class="card-header ">


                        <div class="card-tools">
                            <b class="text-info">Catalogo de metrologia</b>
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                              <button onclick="return abrirModal('modal');" class="btn btn-success"> <span class="fa fa-plus"></span></button>

                        </div>

                    </div>
                    <asp:UpdatePanel ID="upPanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="card-body">


                                <div class="table-responsive text-sm">
                                    <asp:Repeater ID="repeaterMetCatalogo" DataSourceID="ODSBLL_Met_Catalogo" runat="server" OnItemCommand="repeaterMetCatalogo_ItemCommand">
                                       <HeaderTemplate>
                                           <table id="tt" class="table table-sm table-bordered">
                                               <thead class="bg-gradient-navy">
                                                   <tr>
                                                       <th></th>
                                                       <th>Tipo</th>
                                                       <th>Valor</th>
                                                   </tr>
                                               </thead>
                                               <tbody>
                                        
                                       </HeaderTemplate>
                                        <FooterTemplate>
                                            </tbody>
                                         </table>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("id") %>' CssClass="fa fa-edit"></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Eli"  OnClientClick="return confirm('¿Realmente desea eliminar el registro?')" CommandArgument='<%# Eval("id") %>' CssClass="fa fa-trash"></asp:LinkButton>
                                                </td>
                                                <td><%# Eval("tipo") %></td>
                                                  <td><%# Eval("valor") %></td>
                                                
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                    <asp:ObjectDataSource ID="ODSBLL_Met_Catalogo" runat="server" SelectMethod="consultar" TypeName="TranscoldPruebasWeb2.BLL.Met_Catalogo_BLL"></asp:ObjectDataSource>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lbtnGuardar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lbtnCancelar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="repeaterMetCatalogo" EventName="ItemCommand" />
                        </Triggers>
                    </asp:UpdatePanel>



                </div>
            </div>
        </section>
    </div>
    <asp:UpdatePanel ID="updatePanelCrud" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="modal fade" id="modal" name="modal" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:HiddenField ID="hfID" runat="server" />
                            <asp:HiddenField ID="hfQuery" runat="server" />

                            <asp:UpdatePanel ID="upCheck" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <small>Tipo</small>
                                    <asp:TextBox ID="tbTipo" runat="server" CssClass="form-control" MaxLength="210"></asp:TextBox>
                                    <small>Valor</small>
                                    <asp:TextBox ID="tbValor" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                                    

                                    <div class="modal-footer ">
                                        <div class="justify-content-md-end">
                                            <asp:LinkButton ID="lbtnGuardar" OnClick="lbtnGuardar_Click" runat="server" CssClass="fa fa-2x fa-save"></asp:LinkButton>
                                           &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:LinkButton ID="lbtnCancelar" OnClick="lbtnCancelar_Click" OnClientClick="cerrarModal('modal');" runat="server" CssClass="fa fa-2x fa-minus"></asp:LinkButton>
                                        </div>

                                    </div>

                                </ContentTemplate>

                                <Triggers>
                                </Triggers>

                            </asp:UpdatePanel>
                        </div>

                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
           
            <asp:AsyncPostBackTrigger ControlID="lbtnCancelar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="repeaterMetCatalogo" EventName="ItemCommand" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
