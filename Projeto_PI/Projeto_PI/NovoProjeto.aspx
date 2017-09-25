<%@ Page Title="Novo projeto" Language="C#" MasterPageFile="~/MenuLogado.master" AutoEventWireup="true" CodeBehind="NovoProjeto.aspx.cs" Inherits="Projeto_PI.NovoProjeto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="container-fluid" role="main">
        <div class="row">
            <h2 class="page-header text-center">Cadastre um novo projeto</h2>
            <div class="row col-md-4 col-md-offset-4">
                <span class="pull-left">Tipo do projeto</span>
                <div class="btn-group pull-right" data-toggle="buttons">
                    <label for="doacao" class="btn btn-default active">
                        <input type="radio" onchange="trocaForm(this)" name="tipo" id="doacao" value="doacao" checked>Doação
                    </label>
                    <label for="acao" class="btn btn-default">
                        <input type="radio" onchange="trocaForm(this)" name="tipo" id="acao" value="acao">Ação
                    </label>
                </div>
            </div>
            <form action="" name="form-novo-projeto" id="form-novo-projeto" class="form-horizontal col-md-4 col-md-offset-4">
                <div class="form-group">
                    <label for="nome" class="control-label col-md-4">Nome</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="nome" id="nome">
                    </div>
                </div>
                <div class="form-group">
                    <label for="descricao" class="control-label col-md-4">Descrição</label>
                    <div class="col-md-8">
                        <textarea name="descricao" class="form-control" id="descricao" cols="10" rows="2"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="banner" class="control-label col-md-4">Banner</label>
                    <div class="col-md-8">
                        <input type="file" class="form-control" name="banner" id="banner">
                    </div>
                </div>
                <div class="form-group">
                    <label for="meta" class="control-label col-md-4">Meta</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="meta" id="meta">
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" value="Cadastrar" class="btn btn-block">
                </div>
            </form>
        </div>
    </div>
</asp:Content>
