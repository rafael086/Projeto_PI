<%@ Page Title="Nome Projeto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaginaProjeto.aspx.cs" Inherits="Projeto_PI.PaginaProjeto" %>
<asp:Content ID="Principal" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="jumbotron" id="destaque-projeto">
        <h2 runat="server" id="h2NomeProjeto" class="page-header text-center">Nome do projeto</h2>
        <h3 runat="server" id="h3Status" class="page-header text-center text-success">Projeto finalizado</h3>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <asp:Image runat="server" ID="imgProjeto"></asp:Image>
            </div>
        </div>
    </div>
    <div role="main" class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <nav>
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#sobre" data-toggle="tab">Sobre</a></li>
                        <li><a href="#apoiadores" data-toggle="tab">Apoiadores</a></li>
                        <li><a href="#comentarios" data-toggle="tab">Comentarios</a></li>
                    </ul>
                </nav>

                <div class="tab-content">
                    <div id="sobre" class="tab-pane fade in active">
                        <p id="pDescricao" class="text-justify" runat="server"></p>
                    </div>
                    <div id="apoiadores" class="tab-pane fade tab">
                        <%foreach (var item in projeto.Apoios)
                            { %>
                        <div class="row center-block" style="width: 50%; height: 100px;">
                            <div class="media col-md-12">
                                <div class="media-left col-md-4">
                                    <img style="width: 100%; height: 100px" src="Upload Imagens/<%Response.Write(item.Doadores.Usuarios.Imagens.nome); %>" alt="" class="media-object"/>
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading"><a href="PaginaUsuario.aspx?usuario=<% Response.Write(item.Doadores.id); %>"><%Response.Write(item.Doadores.Usuarios.nome); %></a></h3>
                                    <p><%Response.Write(item.Doadores.Usuarios.frase); %></p>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <%} %>
                    </div>
                    <div id="comentarios" class="tab-pane fade tab">
                        <div id="formComentario" class="row form-horizontal" runat="server">
                            <h4>Comente este projeto</h4>
                            <div class="form-group">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" onclick="" CssClass="form-control" ID="txtComentario" TextMode="MultiLine" placeholder="Digite um comentario..." required=""></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnEnviarComentario" CssClass="btn btn-block col-md-2" runat="server" Text="Enviar" OnClick="btnEnviarComentario_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <%foreach (var item in projeto.Comentarios.OrderByDescending(c => c.id))
                            {%>
                        <div class="row">
                            <div class="media col-md-12">
                                <div class="media-left col-md-4">
                                    <img style="width: 100%; height: 100px" src="Upload Imagens/<%Response.Write(item.Usuarios.Imagens.nome); %>" alt="" class="media-object"/>
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading"><a href="PaginaUsuario.aspx?usuario=<% Response.Write(item.idUsuario); %>"><%Response.Write(item.Usuarios.nome); %></a></h3>
                                    <p><%Response.Write(item.comentario); %></p>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <%} %>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <span runat="server" id="spanArrecadado" class="col-md-12"></span>
                <span runat="server" id="spanApoios" class="col-md-12"></span>
                <span runat="server" id="spanMeta" class="col-md-12"></span>
                <a href="#" runat="server" id="aApoiar" onclick="ativaFormApoio()" data-toggle="modal" class="btn btn-default">Apoiar o projeto</a>
                <a href="#" runat="server" id="aApoiado" class="btn btn-success">Apoiado</a>
                <asp:Label ID="lblErro" CssClass="col-md-12" Visible="false" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2" id="divConfiguraProjeto" runat="server">
                <a href="NovoProjeto.aspx?acao=editar&projeto=<% Response.Write(projeto.id);%>" class="btn btn-block btn-default ">Alterar Projeto</a>
                <button runat="server" type="button" id="btnFinalizarProjeto" class="btn btn-block btn-success">Finalizar projeto</button>
                <button runat="server" type="button" id="btnExcluir" class="btn btn-block btn-danger">Excluir projeto</button>
            </div>
        </div>
        <div runat="server" id="modalApoio" class="modal fade" onclick="ativaFormComentario()">
            <div class="modal-md modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title text-center">Confirmar Apoio</h3>
                    </div>
                    <div class="modal-body">
                        <div id="formApoio" class="form-horizontal">
                            <div class="form-group">
                                <asp:Label runat="server" CssClass="control-label col-md-3" Text="Cartão de credito" AssociatedControlID="txtCartaoCredito"></asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtCartaoCredito" disabled="true" required="" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" CssClass="control-label col-md-3" Text="Valor" AssociatedControlID="txtValor"></asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtValor" disabled="true" runat="server" CssClass="form-control" required="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnApoiar" CssClass="btn btn-block" runat="server" Text="Apoiar" OnClick="btnApoiar_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
