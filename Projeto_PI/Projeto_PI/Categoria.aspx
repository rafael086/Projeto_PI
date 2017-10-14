<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="Projeto_PI.Categoria" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div role="main" class="container-fluid">
        <h2 runat="server" id="h2Titulo" class="page-header text-center"></h2>
        <div class="row" id="destaque">    
            <div class="col-md-6">
                <%string link = (Request["tipo"].ToString() == PROJETOS) ? "PaginaProjeto.aspx?projeto=" : "PaginaUsuario.aspx?usuario=";%>
                <img src="Upload Imagens/<% Response.Write(resultados.First().Imagem); %>" class="img-rounded" alt="">
            </div>

            <div class="col-md-6 panel panel-default">
                <div class="panel-heading">
                    <h3><a href="<% Response.Write(link + resultados.First().Id); %>"><%Response.Write(resultados.First().Nome);%></a></h3>
                </div>
                <div class="panel-body">
                    <p><% Response.Write(resultados.First().Descricao); resultados.RemoveAt(0); %></p>
                </div>
                <div class="panel-footer">
                    rodape
                </div>
            </div>
        </div>
        <div class="row" id="grupo">
            <% foreach (var item in resultados)
                {%>
            <div class="col-md-6">
                <div class="col-md-4">
                    <img src="Upload Imagens/<%Response.Write(item.Imagem); %>" class="img-rounded" alt="">
                </div>
                <div class="col-md-8 panel panel-default">
                    <div class="panel-heading">
                        <h3><a href="<% Response.Write(link+item.Id);%>"><%Response.Write(item.Nome); %></a></h3>
                    </div>
                    <div class="panel-body">
                        <p><%Response.Write(item.Descricao); %></p>
                    </div>
                    <div class="panel-footer">
                        rodape
                    </div>
                </div>
            </div>
            <%} %>
        </div>
        <% if (Convert.ToInt32(Request["pagina"]) > 1){%>
        <a href="Categoria.aspx?tipo=<%Response.Write(Request["tipo"].ToString());%>&pagina=<%Response.Write(Convert.ToInt32(Request["pagina"]) - 1);%>">anterior</a>
        <%} %>
        <% if (Convert.ToInt32(Request["pagina"]) != ultimo) {%>
        <a href="Categoria.aspx?tipo=<%Response.Write(Request["tipo"].ToString());%>&pagina=<%Response.Write(Convert.ToInt32(Request["pagina"]) + 1);%>">Proximo</a>
        <%} %>
    </div>
</asp:Content>
