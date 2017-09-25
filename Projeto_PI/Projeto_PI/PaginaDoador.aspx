<%@ Page Title="Nome do Usuario" Language="C#" MasterPageFile="~/MenuLogado.master" AutoEventWireup="true" CodeBehind="PaginaDoador.aspx.cs" Inherits="Projeto_PI.PaginaDoador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="jumbotron row" id="destaque-usuario">
        <div class="col-md-3">
            <img src="imagens/man.png" alt="" class="img-thumbnail">
        </div>
        <div class="col-md-9">
            <h1>O nome</h1>
            <p>Um textinho</p>
        </div>
    </div>
    <div class="container-fluid" role="main">
        <section id="sobre">
            <h2 class="text-center page-header">Sobre a mim</h2>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>Eu</h3>
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
        <section id="historico">
            <h2 class="text-center page-header">Historico de apoios</h2>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-md-4">
                        <img src="imagens/org.png" class="img-rounded" alt="">
                    </div>
                    <div class="col-md-8 panel panel-default">
                        <div class="panel-heading">
                            <h3>Nome </h3>
                        </div>
                        <div class="panel-body">
                            <p>Descricao</p>
                        </div>
                        <div class="panel-footer">
                            rodape
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
