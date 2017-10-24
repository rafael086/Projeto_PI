<%@ Page Title="Resultados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Busca.aspx.cs" Inherits="Projeto_PI.Busca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="container-fluid" role="main">
        <h1 id="h1TituloBusca" runat="server" class="page-header text-center">Resultados da busca para </h1>
        <section class="container-fluid" id="resultados-ong">
            <%if (ongs.Count != 0)
                {%>
            <h2 class="text-center">Ongs</h2>
            <%}
            foreach (var ong in ongs)
            {%>
            <div class="row">
                <div class="col-md-4">
                    <img src="Upload Imagens/<% Response.Write(ong.Imagens.nome);%>" class="img-rounded" alt="">
                </div>
                <div class="col-md-8 panel panel-default">
                    <div class="panel-heading">
                        <h3><a href="PaginaUsuario.aspx?usuario=<%Response.Write(ong.id);%>"><% Response.Write(ong.nome);%></a></h3>
                    </div>
                    <div class="panel-body">
                        <p><% Response.Write(ong.frase);%></p>
                    </div>
                    <div class="panel-footer">
                        <span class="col-md-12">Projetos criados: <% Response.Write(ong.Projetos.Count);%></span>
                    </div>
                </div>
            </div>
            <%} %>
        </section>
        <section class="container-fluid" id="resultados-projetos">
            <%if (projetos.Count != 0)
                {%>
            <h2 class="text-center">Projetos</h2>
            <%}
                foreach (var projeto in projetos)
                {%>
            <div class="row">
                <div class="col-md-4">
                    <img src="Upload Imagens/<% Response.Write(projeto.Imagens.nome);%>" class="img-rounded" alt="">
                </div>
                <div class="col-md-8 panel panel-default">
                    <div class="panel-heading">
                        <h3><a href="PaginaProjeto.aspx?projeto=<%Response.Write(projeto.id); %>"><% Response.Write(projeto.nome);%></a></h3>
                    </div>
                    <div class="panel-body">
                        <p><% Response.Write(projeto.descricao);%></p>
                    </div>
                    <div class="panel-footer">
                    <%if (projeto.tipo.TrimEnd() == "Doação"){%>
                        <div class="progress col-md-9">
                            <div class="progress-bar progress-bar-success" role="progressbar" <%Response.Write(projeto.EscreveProgresso());%>>
                                <% Response.Write(projeto.ProgressoProjeto() + "%"); %>
                            </div>
                        </div>
                        <span class="col-md-3"><% Response.Write(projeto.Apoios.Count); %> Apoios</span>
                    <%}else { %>
                        <span class="col-md-6">Apoiado por <% Response.Write(projeto.Apoios.Count); %> pessoas</span>
                        <span class="col-md-6">Meta: <%Response.Write(projeto.meta); %></span>
                    <%} %>
                    </div>
                </div>
            </div>
            <%} %>
        </section>
    </div>
</asp:Content>
