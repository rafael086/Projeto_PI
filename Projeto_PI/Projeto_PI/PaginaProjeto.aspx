<%@ Page Title="Nome Projeto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaginaProjeto.aspx.cs" Inherits="Projeto_PI.PaginaProjeto" %>

<asp:Content ID="Principal" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="jumbotron" id="destaque-projeto">
        <h2 class="page-header text-center">Nome do projeto</h2>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <img src="imagens/projeto.png" alt="" />
            </div>
        </div>
    </div>
    <div role="main" class="container-fluid">
        <div class="col-md-8 col-md-offset-2">
            <nav>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="" data-toggle="tab">Sobre</a></li>
                    <li><a href="" data-toggle="tab">Apoiadores</a></li>
                    <li><a href="" data-toggle="tab">Comentarios</a></li>
                </ul>
            </nav>
            <p>bla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla bla</p>
        </div>
    </div>
</asp:Content>
