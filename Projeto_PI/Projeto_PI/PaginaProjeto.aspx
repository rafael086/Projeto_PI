<%@ Page Title="Nome Projeto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaginaProjeto.aspx.cs" Inherits="Projeto_PI.PaginaProjeto" %>

<asp:Content ID="Principal" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="jumbotron" id="destaque-projeto">
        <h2 runat="server" id="h2NomeProjeto" class="page-header text-center">Nome do projeto</h2>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <asp:Image runat="server" ID="imgProjeto"></asp:Image>
            </div>
        </div>
    </div>
    <div role="main" class="container-fluid">
        <div class="col-md-8 col-md-offset-2">
            <nav>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#sobre" data-toggle="tab">Sobre</a></li>
                    <li><a href="" data-toggle="tab">Apoiadores</a></li>
                    <li><a href="" data-toggle="tab">Comentarios</a></li>
                </ul>
            </nav>
            <%//CONFIGURAR A FUNCIONALIDADE DE DOACAO A PROJETOS MAS PRIMEIRO CONFIGURAR O QUE FOR POSSIVEL NESSA PAGINA %>
            <div class="tab-content">
                <div id="sobre" class="tab-fade fade in active">
                    <p id="pDescricao" runat="server"></p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
