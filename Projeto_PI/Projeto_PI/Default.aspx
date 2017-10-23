<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Projeto_PI.Default" %>
<asp:Content ID="Jumbotron" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div class="jumbotron">
        <div class="page-header">
            <h1 class="text-center">Apoie uma ong ou um projeto</h1>
        </div>
    </div>
    <div role="main" class="container-fluid">
            <section id="ongs" class="row">
        		<h2 class="page-header text-center">Ongs</h2>
                <% foreach (var ong in ongs)
                    { %>
            	<div class="col-md-4">
            		<figure class="thumbnail">
            			<img src="Upload Imagens/<% Response.Write(ong.Usuarios.Imagens.nome); %>" alt="">
            			<figcaption class="caption"><a href="PaginaUsuario.aspx?usuario=<% Response.Write(ong.id); %>"><% Response.Write(ong.Usuarios.nome); %></a></figcaption>
            		</figure>
            	</div>
                <%} %>
            </section>
            <section id="projetos" class="row">
        		<h2 class="text-center page-header">Projetos</h2>
                <%foreach (var projeto in projetos){%>
            	<div class="col-md-4">
            		<figure class="thumbnail">
            			<img src="Upload Imagens/<% Response.Write(projeto.Imagens.nome); %>" alt="">
            			<figcaption class="caption"><a href="PaginaProjeto.aspx?projeto=<% Response.Write(projeto.id);%>"><% Response.Write(projeto.nome);%></a></figcaption>
            		</figure>
            	</div>
            	<%} %>
            </section>
        </div>
</asp:Content>

