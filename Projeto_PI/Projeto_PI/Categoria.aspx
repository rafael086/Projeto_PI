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
                    <p><% Response.Write(resultados.First().Descricao);%></p>
                </div>
                <div class="panel-footer">
                    <% if (Request["tipo"].ToString() == PROJETOS && resultados.First().Tipo == "Doação"){%>
                    <div class="progress col-md-9">
                        <div class="progress-bar progress-bar-success" role="progressbar" <% Response.Write(resultados.First().Estilo); %>>
                            <% Response.Write(resultados.First().Progresso + "%"); %>
                        </div>
                    </div>
                    <span class="col-md-3"><% Response.Write(resultados.First().Apoios); %> Apoios</span>
                    <%}else if (Request["tipo"].ToString() == PROJETOS && resultados.First().Tipo == "Ação"){ %>
                    <span class="col-md-6">Apoiado por <% Response.Write(resultados.First().Apoios); %> pessoas</span>
                    <span class="col-md-6">Meta: <%Response.Write(resultados.First().Meta); %></span>
                    <%}
                    else
                    { %>
                    <span class="col-md-12">Projetos criados: <% Response.Write(resultados.First().Projetos); %> </span>
                    <%}
                        resultados.RemoveAt(0); %>
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
                        <h3><a href="<% Response.Write(link + item.Id);%>"><%Response.Write(item.Nome); %></a></h3>
                    </div>
                    <div class="panel-body">
                        <p><%Response.Write(item.Descricao); %></p>
                    </div>
                    <div class="panel-footer">
                        <% if (Request["tipo"].ToString() == PROJETOS && item.Tipo == "Doação")
                            {%>
                        <div class="progress col-md-9">
                            <div class="progress-bar progress-bar-success" role="progressbar" <% Response.Write(item.Estilo);%>>
                                <% Response.Write(item.Progresso + "%"); %>
                            </div>
                        </div>
                        <span class="col-md-3"><% Response.Write(item.Apoios); %> Apoios</span>
                        <%}
                            else if (Request["tipo"].ToString() == PROJETOS && item.Tipo == "Ação")
                            { %>
                        <span class="col-md-6">Apoiado por <% Response.Write(item.Apoios); %> pessoas</span>
                        <span class="col-md-6">Meta: <%Response.Write(item.Meta); %></span>
                        <%}
                        else
                        { %>
                        <span class="col-md-12">Projetos criados <% Response.Write(item.Projetos); %> </span>
                        <%}%>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
        <% if (Convert.ToInt32(Request["pagina"]) > 1)
            {%>
        <a href="Categoria.aspx?tipo=<%Response.Write(Request["tipo"].ToString());%>&pagina=<%Response.Write(Convert.ToInt32(Request["pagina"]) - 1);%>">anterior</a>
        <%} %>
        <% if (Convert.ToInt32(Request["pagina"]) != ultimo)
            {%>
        <a href="Categoria.aspx?tipo=<%Response.Write(Request["tipo"].ToString());%>&pagina=<%Response.Write(Convert.ToInt32(Request["pagina"]) + 1);%>">Proximo</a>
        <%} %>
    </div>
</asp:Content>
