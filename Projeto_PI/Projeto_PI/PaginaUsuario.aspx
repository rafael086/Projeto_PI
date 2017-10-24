<%@ Page Title="Nome Ong" Language="C#" MasterPageFile="~/MenuLogado.master" AutoEventWireup="true" CodeBehind="PaginaUsuario.aspx.cs" Inherits="Projeto_PI.PaginaOng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <!-- Esta pagina foi configurada para que possa ser usada tanto para os usuarios ONGS quanto para os DOADORES-->
    <!--a div destaque-usuario vai ser usada para os dois tipos de usuarios-->
    <div id="destaque-usuario" class="jumbotron row">
        <div class="col-md-3">
            <asp:Image ID="imgPerfil" CssClass="img-thumbnail" runat="server"></asp:Image>
        </div>
        <div class="col-md-9">
            <h1 runat="server" id="hNomeUsuario"></h1>
            <p runat="server" id="pTextoComplementar"></p>
        </div>
        <a href="#" runat="server" onclick="configuraAlteracoesPerfil()" id="aEditarPerfil" data-toggle="modal" data-target="#modalAlteracoes">Editar</a>
    </div>
    <div class="container-fluid" role="main">
        <!-- a section voluntariar vai ser visivel para ong e doadores, porem apenas para ongs que ela vai fazer parte do conteudo da pagina-->
        <section runat="server" id="sectionVoluntariar">
            <h2 class="text-center page-header">Quer ser um voluntario?</h2>
            <table class="table">
                <caption class="caption text-center">
                    <h3>Endereco</h3>
                </caption>
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Telefone</th>
                        <th>Cep</th>
                        <th>Numero</th>
                        <th>Rua</th>
                        <th>Bairro</th>
                        <th>Cidade</th>
                        <th>Estado</th>
                        <th>Representante</th>
                        <th>Cargo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><% Response.Write(ong.email); %></td>
                        <td><% Response.Write(ong.telefone); %></td>
                        <td><% Response.Write(ong.Enderecos.cep); %></td>
                        <td><% Response.Write(ong.Enderecos.numero); %></td>
                        <td><% Response.Write(ong.Enderecos.rua); %></td>
                        <td><% Response.Write(ong.Enderecos.bairro); %></td>
                        <td><% Response.Write(ong.Enderecos.cidade); %></td>
                        <td><% Response.Write(ong.Enderecos.estado); %></td>
                        <td><% Response.Write(ong.representante); %></td>
                        <td><% Response.Write(ong.cargo); %></td>
                    </tr>
                </tbody>
            </table>
            <a href="#" id="aVoluntariar" runat="server" class="btn btn-block btn-success">Voluntariar-se</a>
            <a href="#" id="aDesvoluntariar" runat="server" class="btn btn-block btn-danger">Você ja se voluntariou, clique para remover a solicitação</a>
        </section>
        <!--a section sobre tambem vai ser usada tanto para ongs quanto sobre doadores-->
        <section id="sobre">
            <h2 class="text-center page-header">Sobre </h2>
            <div class="row">
                <%
                    foreach (var item in usuario.Sobre.Where(s => s.idImagem == null))
                    {
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3><% Response.Write(item.titulo); %></h3>
                    </div>
                    <div class="body">
                        <p>
                            <% Response.Write(item.texto); %>
                        </p>
                        <%if (Session["usuario"] != null && Session["usuario"].ToString() == Request["usuario"].ToString())
                            { %>
                        <a onclick="configuraAlteracoesSobre(<% Response.Write(string.Format("{0},'{1}','{2}'", item.id, item.titulo, item.texto)); %>)" href="#" class="btn btn-default pull-right" data-toggle="modal" data-target="#modalAlteracoes">Editar</a>
                        <%} %>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <%} %>
                <button runat="server" onclick="configuraAlteracoesAddSobre()" data-toggle="modal" data-target="#modalAlteracoes" id="btnAddConteudoSobre" type="button" class="btn btn-default pull-right">
                    <span class="glyphicon glyphicon-plus"></span>Adicionar conteudo
                </button>
            </div>
        </section>
        <!--A section pessoal vai ser usada so por ongs-->
        <section runat="server" id="sectionPessoal">
            <h2 class="text-center page-header">Pessoal</h2>
            <div class="row">
                <%foreach (var item in usuario.Sobre.Where(s => s.idImagem != null))
                    {
                %>
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-md-4">
                        <img src="Upload Imagens/<% Response.Write(item.Imagens.nome); %>" class="img-circle" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3><% Response.Write(item.titulo); %></h3>
                        </div>
                        <div class="panel-body">
                            <p><%Response.Write(item.texto);%></p>
                            <%if (Session["usuario"] != null && Session["usuario"].ToString() == Request["usuario"].ToString())
                                { %><a href="#" onclick="configuraAlteracoesPessoal(<% Response.Write(string.Format("{0},'{1}','{2}'", item.id, item.titulo, item.texto)); %>)" data-toggle="modal" data-target="#modalAlteracoes" class="btn btn-default pull-right">Editar</a><% } %>
                        </div>
                    </div>
                </div>
                <%  } %>
                <button runat="server" onclick="configuraAlteracoesAddPessoal()" data-toggle="modal" data-target="#modalAlteracoes" id="btnAddConteudoPessoal" type="button" class="btn btn-default pull-right">
                    <span class="glyphicon glyphicon-plus"></span>Adicionar conteudo
                </button>
            </div>
        </section>
        <!--A section projetos é usada por ongs e doadores-->
        <section runat="server" id="sectionProjetos">
            <h2 class="text-center page-header">Seus projetos</h2>
            <div class="row">
                <%foreach (var projeto in usuario.Projetos.OrderByDescending(p => p.id))
                    {%>
                <div class="col-md-6">
                    <div class="col-md-4">
                        <img src="Upload Imagens/<%Response.Write(projeto.Imagens.nome); %>" class="img-rounded" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3><a href="PaginaProjeto.aspx?projeto=<%Response.Write(projeto.id);%>"><%Response.Write(projeto.nome); %></a></h3>
                        </div>
                        <div class="panel-body">
                            <p><%Response.Write(projeto.descricao); %></p>
                        </div>
                        <div class="panel-footer">
                            <% if (projeto.tipo.TrimEnd() == "Doação")
                                {%>
                            <div class="progress col-md-9">
                                <div class="progress-bar progress-bar-success" role="progressbar" <% Response.Write(projeto.EscreveProgresso()); %>>
                                    <% Response.Write(projeto.ProgressoProjeto() + "%"); %>
                                </div>
                            </div>
                            <span class="col-md-3"><% Response.Write(projeto.Apoios.Count); %> Apoios</span>
                            <%}
                                else
                                { %>
                            <span class="col-md-6">Apoiado por <% Response.Write(projeto.Apoios.Count); %> pessoas</span>
                            <span class="col-md-6">Meta: <%Response.Write(projeto.meta); %></span>
                            <%} %>
                        </div>
                    </div>
                </div>
                <%  } %>
            </div>
        </section>
        <!--A section historico é usada apenas por doadores-->
        <section id="sectionHistoricoDoacoes" runat="server">
            <h2 class="text-center page-header">Historico de apoios</h2>
            <div class="row">
                <%foreach (var projeto in doador.Apoios.Where(a => a.idDoador == usuario.id).Select(a => a.Projetos)){%>
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-md-4">
                        <img src="Upload Imagens/<%Response.Write(projeto.Imagens.nome); %>" class="img-rounded" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3><a href="PaginaProjeto.aspx?projeto=<%Response.Write(projeto.id);%>"><%Response.Write(projeto.nome); %></a></h3>
                        </div>
                        <div class="panel-body">
                            <p><%Response.Write(projeto.descricao); %></p>
                        </div>
                        <div class="panel-footer">
                            <% if (projeto.tipo.TrimEnd() == "Doação")
                                {%>
                            <div class="progress col-md-9">
                                <div class="progress-bar progress-bar-success" role="progressbar" <% Response.Write(projeto.EscreveProgresso()); %>>
                                    <% Response.Write(projeto.ProgressoProjeto() + "%"); %>
                                </div>
                            </div>
                            <span class="col-md-3"><% Response.Write(projeto.Apoios.Count); %> Apoios</span>
                            <%}
                                else
                                { %>
                            <span class="col-md-6">Apoiado por <% Response.Write(projeto.Apoios.Count); %> pessoas</span>
                            <span class="col-md-6">Meta: <%Response.Write(projeto.meta); %></span>
                            <%} %>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
        </section>
        <!--A section voluntarios é usada apenas por ongs-->
        <section runat="server" id="sectionVoluntarios">
            <h2 class="text-center page-header">Area dos voluntarios</h2>
            <%foreach (var voluntario in ong.Voluntarios.Where(v => v.situacao.Trim() == "Em aguardo"))
                {%>
            <div class="media col-md-6 col-md-offset-3">
                <div class="media-left">
                    <img src="Upload Imagens/<% Response.Write(voluntario.Doadores.Imagens.nome); %>" alt="" class="media-object">
                </div>
                <div class="media-body">
                    <h3 class="media-heading"><% Response.Write(voluntario.Doadores.nome);%></h3>
                    <p>quer ser um voluntario</p>
                    <%
                        string parametros = string.Format("'{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}'", voluntario.idDoador, voluntario.Doadores.email, voluntario.Doadores.Enderecos.cep, voluntario.Doadores.Enderecos.numero, voluntario.Doadores.Enderecos.rua, voluntario.Doadores.Enderecos.bairro, voluntario.Doadores.Enderecos.cidade, voluntario.Doadores.Enderecos.estado);
                    %>
                    <a href="#" onclick="configuraModalVoluntario(<%Response.Write(parametros); %>)" class="pull-right btn btn-default" data-toggle="modal" data-target="#modalDetalhesVoluntarios">+ Detalhes</a>
                </div>
                <hr />
            </div>
            <%} %>
        </section>
    </div>
    <!--a modal de detalhes do voluntario é visivel apenas para ongs-->
    <div id="modalDetalhesVoluntarios" class="modal fade" runat="server" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Detalhes do voluntario</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" runat="server" id="hiddenVoluntario" value="" />
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Cep</th>
                                <th>Numero</th>
                                <th>Rua</th>
                                <th>Bairro</th>
                                <th>Cidade</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-md-6 ">
                            <button id="btnConfirmaVoluntario" class="btn btn-block btn-success" runat="server">Confirmar voluntario</button>
                        </div>
                        <div class="col-md-6">
                            <button id="btnRejeitaVoluntario" class="btn btn-block btn-danger" runat="server">Rejeitar voluntario</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--A modal de alteracoes é usada por ongs e daodores-->
    <div runat="server" id="modalAlteracoes" class="modal fade" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Editar perfil</h4>
                    <asp:Label ID="lblErro" CssClass="text-danger" runat="server"></asp:Label>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group" id="fg1">
                            <asp:Label ID="lblImagem" AssociatedControlID="fuImagem" CssClass="control-label col-md-2" runat="server">Foto</asp:Label>
                            <div class="col-md-10">
                                <asp:FileUpload CssClass="form-control" ID="fuImagem" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblNome" AssociatedControlID="txtNome" CssClass="control-label col-md-2" runat="server">Nome</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtNome" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Apenas letras" required="" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblFrase" AssociatedControlID="txtFrase" CssClass="control-label col-md-2" runat="server">Frase</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtFrase" onblur="tiraEspacoExcedente(this)" CssClass="form-control" TextMode="MultiLine" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                        <input type="hidden" runat="server" id="hiddenAlteracao" value="" />
                        <input type="hidden" runat="server" id="hiddenAcao" value="" />
                        <div class="form-group">
                            <asp:Button ID="btnSalvar" runat="server" CssClass="btn btn-success btn-block" Text="Salvar" OnClick="btnSalvar_Click" ClientIDMode="Static"></asp:Button>
                            <a href="#" runat="server" id="aExcluir" class="btn btn-danger btn-block">Excluir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
