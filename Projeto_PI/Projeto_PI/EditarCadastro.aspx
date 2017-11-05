<%@ Page Title="" Language="C#" MasterPageFile="~/MenuLogado.master" AutoEventWireup="true" CodeBehind="EditarCadastro.aspx.cs" Inherits="Projeto_PI.EditarCadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <h1 class="page-header text-center">Editar Cadastro</h1>
    <asp:Label ID="lblErro" runat="server" Text=""></asp:Label>
    <div id="form" class="form-horizontal col-md-4 col-md-offset-4">
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtNome">Nome:</asp:Label>
            <div class="col-md-8">
                <asp:TextBox ID="txtNome" onblur="tiraEspacoExcedente(this)" CssClass="form-control" runat="server" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>
        <div class="form-group" runat="server" id="fgRazaoSocial">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtRazaoSocial">Razão social</asp:Label>
            <div class="col-md-8">
                <asp:TextBox ID="txtRazaoSocial" onblur="tiraEspacoExcedente(this)" CssClass="form-control" runat="server" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group" runat="server" id="fgCPF">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCPF">CPF</asp:Label>
            <div class="col-md-8">
                <asp:TextBox ID="txtCPF" CssClass="form-control" runat="server" required="required" pattern="^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$" onblur="msgValidacaoCPF(this)" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group" runat="server" id="fgCNPJ">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCNPJ">CNPJ</asp:Label>
            <div class="col-md-8">
                <asp:TextBox ID="txtCNPJ" onblur="msgValidacaoCNPJ(this)" CssClass="form-control" runat="server" required="required" pattern="\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group" runat="server" id="fgTelefone">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtTelefone">Telefone</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtTelefone" CssClass="form-control" TextMode="Phone" required="required" pattern="\(\d{2}\)\d{4}-\d{4}" title="Digite no formato (nn)nnnn-nnnn" ClientIDMode="Static" />
            </div>
        </div>
        <hr>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCEP">CEP</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtCEP" CssClass="form-control" required="required" pattern="\d{5}-\d{3}" title="Digite um cep no formato nnnnn-nnn" onblur="getEndereco(this.value)" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="ddlEstado">Estado</asp:Label>
            <div class="col-md-8">
                <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control" ClientIDMode="Static">
                    <asp:ListItem Value="AC" Text="Acre" />
                    <asp:ListItem Value="AL" Text="Alagoas" />
                    <asp:ListItem Value="AM" Text="Amazonas" />
                    <asp:ListItem Value="AP" Text="Acre" />
                    <asp:ListItem Value="BA" Text="Bahia" />
                    <asp:ListItem Value="CE" Text="Ceará" />
                    <asp:ListItem Value="DF" Text="Distrito Federal" />
                    <asp:ListItem Value="ES" Text="Espírito Santo" />
                    <asp:ListItem Value="GO" Text="Goiás" />
                    <asp:ListItem Value="MA" Text="Maranhão" />
                    <asp:ListItem Value="MG" Text="Minas Gerais" />
                    <asp:ListItem Value="MS" Text="Mato Grosso do Sul" />
                    <asp:ListItem Value="MT" Text="Mato Grosso" />
                    <asp:ListItem Value="PA" Text="Pará" />
                    <asp:ListItem Value="PB" Text="Paraíba" />
                    <asp:ListItem Value="PE" Text="Pernambuco" />
                    <asp:ListItem Value="PI" Text="Piauí" />
                    <asp:ListItem Value="PR" Text="Paraná" />
                    <asp:ListItem Value="RJ" Text="Rio de Janeiro" />
                    <asp:ListItem Value="RN" Text="Rio Grande do Norte" />
                    <asp:ListItem Value="RO" Text="Rondônia" />
                    <asp:ListItem Value="RR" Text="Rorraima" />
                    <asp:ListItem Value="RS" Text="Rio Grande do Sul" />
                    <asp:ListItem Value="SC" Text="Santa Catarina" />
                    <asp:ListItem Value="SE" Text="Sergipe" />
                    <asp:ListItem Value="SP" Text="São Paulo" />
                    <asp:ListItem Value="TO" Text="Tocantins" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCidade">Cidade</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtCidade" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtEndereco">Endereço</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtEndereco" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas letras e pontos" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtNumero">Numero</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNumero" required="required" pattern="^[0-9]+$" title="Apenas numeros" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtBairro">Bairro</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtBairro" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas Letras" ClientIDMode="Static" />
            </div>
        </div>
        <hr>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtEmail">Email</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" required="required" pattern="^[a-zA-Z][0-9a-zA-Z\._-]+@([a-zA-Z0-9\.]+\.)[a-zA-A-09]+$" title="Digite um email valido" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtSenha">Senha</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtSenha" TextMode="Password" required="required" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtConfirmaSenha">Repetir Senha</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtConfirmaSenha" TextMode="Password" required="required" ClientIDMode="Static" />
            </div>
        </div>
        <hr>
        <div class="form-group" runat="server" id="fgRepresentante">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtRepresentante">Representante</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtRepresentante" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas Letras" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group" runat="server" id="fgCargo">
            <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCargo">Cargo</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtCargo" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas Letras" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <asp:Button runat="server" Text="Salvar Alteracoes" CssClass="btn btn-block" ID="btnEditaCadastro" ClientIDMode="Static" OnClick="btnEditaCadastro_Click" />
        </div>
    </div>
</asp:Content>
