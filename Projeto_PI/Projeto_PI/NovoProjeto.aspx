<%@ Page Title="Novo projeto" Language="C#" MasterPageFile="~/MenuLogado.master" AutoEventWireup="true" CodeBehind="NovoProjeto.aspx.cs" Inherits="Projeto_PI.NovoProjeto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="container-fluid" role="main">
        <div class="row">
            <h2 class="page-header text-center">Cadastre um novo projeto</h2>
            <div runat="server" id="opcProjeto" class="row col-md-4 col-md-offset-4">
                <span class="pull-left">Tipo do projeto</span>
                <div class="btn-group pull-right" data-toggle="buttons">
                    <label for="doacao" class="btn btn-default active" onclick="$('#txtMeta').mask('000.000.000.000.000,00', { reverse: true });">
                        <input runat="server" type="radio" name="tipo" id="radioDoacao" value="doacao" checked>Doação
                    </label>
                    <label for="acao" class="btn btn-default" onclick="$('#txtMeta').unmask()">
                        <input runat="server" type="radio" name="tipo" id="radioAcao" value="acao">Ação
                    </label>
                </div>
            </div>
            <div id="form-novo-projeto" class="form-horizontal col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:Label ID="lblNome" AssociatedControlID="txtNomeProjeto" runat="server" CssClass="control-label col-md-4" Text="Nome"></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtNomeProjeto" required="" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDescricao" CssClass="control-label col-md-4" AssociatedControlID="txtDescricaoProjeto" runat="server" Text="Descrição"></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDescricaoProjeto" required="" CssClass="form-control" TextMode="MultiLine" Columns="10" Rows="5" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblBanner" Text="Banner" AssociatedControlID="fuBanner" CssClass="control-label col-md-4" runat="server" />
                    <div class="col-md-8">
                        <asp:FileUpload ID="fuBanner" required="" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label Text="Meta" ID="lblMeta" AssociatedControlID="txtMeta" CssClass="control-label col-md-4" runat="server" />
                    <div class="col-md-8">
                        <asp:TextBox ID="txtMeta" required="" CssClass="form-control" runat="server" ClientIDMode="Static" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnIniciarProjeto" Text="Iniciar projeto" CssClass="btn btn-block" runat="server" OnClick="btnIniciarProjeto_Click" />
                    <asp:Button ID="btnEditarProjeto" runat="server" Text="Salvar alteracoes" CssClass="btn btn-block" OnClick="btnEditarProjeto_Click" Visible="false"></asp:Button>
                </div>
            </div>
        </div>
        <script>
            <% if (projeto != null && projeto.tipo.TrimEnd() == "Doação")
            {%>
            jQuery(function ($) {
                $("#txtMeta").mask("000.000.000.000.000,00", { reverse: true });
            });
            <%}
            else if (Request["acao"].ToString() == "criar" && doador == null){ %>
            jQuery(function ($) {
                $("#txtMeta").mask("000.000.000.000.000,00", { reverse: true });
            });
            <%} %>
        </script>
    </div>
</asp:Content>
