<%@ Page Title="Resultados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Busca.aspx.cs" Inherits="Projeto_PI.Busca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="container-fluid" role="main">
        <h1 class="page-header text-center">Resultados da busca</h1>
        <section class="container-fluid" id="resultados-ong">
            <h2 class="text-center">Ongs</h2>
            <div class="row">
                <div class="col-md-4">
                    <img src="imagens/org.png" class="img-rounded" alt="">
                </div>
                <div class="col-md-8 panel panel-default">
                    <div class="panel-heading">
                        <h3>Nome ong</h3>
                    </div>
                    <div class="panel-body">
                        <p>Descricao da ong</p>
                    </div>
                    <div class="panel-footer">
                        rodape
                    </div>
                </div>
            </div>
        </section>
        <section class="container-fluid" id="resultados-projetos">
            <h2 class="text-center">Projetos</h2>
            <div class="row">
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
        </section>
    </div>
</asp:Content>
