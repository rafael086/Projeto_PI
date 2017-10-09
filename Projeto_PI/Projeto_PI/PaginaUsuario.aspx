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
        <section runat="server" id="sectionProjetos">
            <h2 class="text-center page-header">Seus projetos</h2>
            <div class="row">
                <%foreach (var item in usuario.Projetos)
                    {
                %>
                <div class="col-md-6">
                    <div class="col-md-4">
                        <img src="imagens/<%Response.Write(item.Imagens.nome); %>" class="img-rounded" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3><%Response.Write(item.nome); %></h3>
                        </div>
                        <div class="panel-body">
                            <p><%Response.Write(item.descricao); %></p>
                        </div>
                        <div class="panel-footer">
                            rodape
                        </div>
                    </div>
                </div>
                <%  } %>
            </div>
        </section>
        <section runat="server" id="sectionVoluntarios">
            <h2 class="text-center page-header">Area dos voluntarios</h2>
            <div class="media col-md-6 col-md-offset-3">
                <div class="media-left">
                    <img src="imagens/man.png" alt="" class="media-object">
                </div>
                <div class="media-body">
                    <h3 class="media-heading">Nome</h3>
                    <p>quero ser um voluntario</p>
                    <a href="#" class="pull-right">aprovar</a>
                </div>
            </div>
        </section>
    </div>
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
                            <asp:Button ID="btnSalvar" runat="server" CssClass="btn btn-block" Text="Salvar" OnClick="btnSalvar_Click" ClientIDMode="Static"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
