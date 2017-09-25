<%@ Page Title="Nome Ong" Language="C#" MasterPageFile="~/MenuLogado.master" AutoEventWireup="true" CodeBehind="PaginaOng.aspx.cs" Inherits="Projeto_PI.PaginaOng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div id="destaque-usuario" class="jumbotron row">
        <div class="col-md-3">
            <img src="imagens/org.png" alt="" class="img-thumbnail">
        </div>
        <div class="col-md-9">
            <h1>O nome</h1>
            <p>Um textinho</p>
        </div>
    </div>
    <div class="container-fluid" role="main">
        <section id="sobre">
            <h2 class="text-center page-header">Sobre a ong</h2>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>Quem somos</h3>
                    </div>
                    <div class="body">
                        <p>
                            blabla blablablablablabla blablav blablablabla blablablablablabla blablablabla blablablabla blablablablablabla blablablablablablablabla blablablabla blablablablablabla blablablablablabla blablablablablablablabla blablablablablabla blablablablablabla blablablablablabla blablablablablabla blablablablablabla blablablablablablablabla blablablablablablablablablabla blablablablablabla blablablabla blablablablablabla
                        </p>
                        <a href="#">
                            <button class="btn btn-default pull-right">Editar</button></a>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <button type="button" class="btn btn-default pull-right">
                    <span class="glyphicon glyphicon-plus"></span>Adicionar conteudo
                </button>
            </div>
        </section>
        <section id="pessoal">
            <h2 class="text-center page-header">Pessoal</h2>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-md-4">
                        <img src="imagens/man.png" class="img-circle" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3>Nome</h3>
                        </div>
                        <div class="panel-body">
                            <p>blabla blablablablablabla blablav blablablabla blablablablablabla blablablabla blablablabla blablablablablabla blablablablablablablabla blablablabla blablablablablabla blablablablablabla blablablablablablablabla blablablablablabla blablablablablabla blablablablablabla blablablablablabla blablablablablabla blablablablablablablabla blablablablablablablablablabla blablablablablabla blablablabla blablablablablabla</p>
                            <a href="#">
                                <button class="btn btn-default pull-right">Editar</button></a>
                        </div>
                    </div>
                    <button type="button" class="btn btn-default pull-right">
                        <span class="glyphicon glyphicon-plus"></span>Adicionar conteudo
                    </button>

                </div>
            </div>
        </section>
        <section id="projetos">
            <h2 class="text-center page-header">Seus projetos</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="col-md-4">
                        <img src="imagens/projeto.png" class="img-rounded" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3>Nome projeto</h3>
                        </div>
                        <div class="panel-body">
                            <p>Descricao do projeto</p>
                        </div>
                        <div class="panel-footer">
                            rodape
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="col-md-4">
                        <img src="imagens/projeto.png" class="img-rounded" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3>Nome projeto</h3>
                        </div>
                        <div class="panel-body">
                            <p>Descricao do projeto</p>
                        </div>
                        <div class="panel-footer">
                            rodape
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="voluntarios">
            <h2 class="text-center page-header">Area dos voluntarios</h2>
            <div class="media col-md-6 col-md-offset-3">
                <div class="media-left">
                    <img src="imagens/man.png" alt="" class="media-object">
                </div>
                <div class="media-body">
                    <h3 class="media-heading">Nome</h3>
                    <p>quero ser um voluntario</p>
                    <a href="" class="pull-right">aprovar</a>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
