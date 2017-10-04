<%@ Page Title="Cadastro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Projeto_PI.Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoPrincipal" runat="server">
    <div role="main" class="container-fluid">
        <div class="row">
            <h2 class="page-header text-center">Faça seu cadastro</h2>
            <div class="row col-md-4 col-md-offset-4">
                <span class="pull-left">Você é</span>
                <div class="btn-group pull-right" data-toggle="buttons">
                    <label for="ong" class="btn btn-default active">
                        <input type="radio" onchange="trocaForm(this)" name="tipo" id="ong" value="ong" checked>Ong</label>
                    <label for="doador" class="btn btn-default">
                        <input type="radio" onchange="trocaForm(this)" name="tipo" id="doador" value="doador">Doador</label>
                </div>
            </div>
            <asp:Label ID="lblErros" runat="server" Text="" Visible="False"></asp:Label>
            <div id="formOng" class="form-horizontal col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtNomeOng">Nome:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtNomeOng" onblur="tiraEspacoExcedente(this)" CssClass="form-control" runat="server" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ValidationGroup="FormgOng" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtRazaoSocial">Razão social</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtRazaoSocial" onblur="tiraEspacoExcedente(this)" CssClass="form-control" runat="server" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCNPJ">CNPJ</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtCNPJ" onblur="msgValidacaoCNPJ(this)"  CssClass="form-control" runat="server" required="required" pattern="\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtTelefone">Telefone</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="txtTelefone" CssClass="form-control" TextMode="Phone" required="required" pattern="\(\d{2}\)\d{4}-\d{4}" title="Digite no formato (nn)nnnn-nnnn" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCEPOng">CEP</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="txtCEPOng" CssClass="form-control" required="required" pattern="\d{5}-\d{3}" title="Digite um cep no formato nnnnn-nnn" onblur="getEndereco(this.value)" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="ddlEstadoOng">Estado</asp:Label>
                    <div class="col-md-8">
                        <asp:DropDownList runat="server" ID="ddlEstadoOng" CssClass="form-control" ValidationGroup="FormgOng" ClientIDMode="Static">
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
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCidadeOng">Cidade</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtCidadeOng" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtEnderecoOng">Endereço</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtEnderecoOng" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas letras e pontos" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtNumeroOng">Numero</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server"  CssClass="form-control" ID="txtNumeroOng" required="required" pattern="^[0-9]+$" title="Apenas numeros" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtBairroOng">Bairro</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtBairroOng" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas Letras" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtEmailOng">Email</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmailOng" TextMode="Email" required="required" pattern="^[a-zA-Z][0-9a-zA-Z\._-]+@([a-zA-Z0-9\.]+\.)[a-zA-A-09]+$" title="Digite um email valido" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server"  CssClass="control-label col-md-4" AssociatedControlID="txtSenhaOng">Senha</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtSenhaOng" TextMode="Password" required="required" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtConfirmaSenhaOng">Repetir Senha</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtConfirmaSenhaOng" TextMode="Password" required="required" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtRepresentante">Representante</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtRepresentante" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas Letras" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCargo">Cargo</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtCargo" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Apenas Letras" ValidationGroup="FormgOng" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Button runat="server" Text="Cadastrar" CssClass="btn btn-block" ID="btnCadastroOng" ValidationGroup="FormgOng" OnClick="btnCadastroOng_Click" ClientIDMode="Static"/>
                </div>
            </div>
            <!--Form de usuarios doadores-->
            <div id="formDoador" class="form-horizontal col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtNomeDoador">Nome:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtNomeDoador" CssClass="form-control" runat="server" onblur="tiraEspacoExcedente(this)" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ValidationGroup="FormgDoador" ClientIDMode="Static" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCPFDoador">CPF</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtCPFDoador" CssClass="form-control" runat="server" required="required" pattern="^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$" onblur="msgValidacaoCPF(this)" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCEPDoador">CEP</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="txtCEPDoador" CssClass="form-control" required="required" pattern="\d{5}-\d{3}" title="Digite um cep no formato nnnnn-nnn" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="ddlEstadoDoador">Estado</asp:Label>
                    <div class="col-md-8">
                        <asp:DropDownList runat="server" ID="ddlEstadoDoador" CssClass="form-control" ValidationGroup="FormgDoador" ClientIDMode="Static">
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
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtCidadeDoador">Cidade</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="txtCidadeDoador" onblur="tiraEspacoExcedente(this)" CssClass="form-control" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtEnderecoDoador">Endereço</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtEnderecoDoador" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\. ]+$" title="Digite apenas letras" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtNumeroDoador">Numero</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtNumeroDoador" required="" pattern="^[0-9]+$" title="Apenas numeros" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtBairroDoador">Bairro</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtBairroDoador" required="required" pattern="^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$" title="Digite apenas letras" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtEmailDoador">Email</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmailDoador" TextMode="Email" required="required" pattern="^[a-zA-Z][0-9a-zA-Z\._-]+@([a-zA-Z0-9\.]+\.)[a-zA-A-09]+$" title="Digite um email valido" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtSenhaDoador" ValidationGroup="FormgDoador">Senha</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtSenhaDoador" TextMode="Password" required="required" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="control-label col-md-4" AssociatedControlID="txtConfirmaSenhaDoador">Repetir Senha</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" onblur="tiraEspacoExcedente(this)" CssClass="form-control" ID="txtConfirmaSenhaDoador" TextMode="Password" required="required" ValidationGroup="FormgDoador" ClientIDMode="Static"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Button runat="server" Text="Cadastrar" CssClass="btn btn-block" ID="btnCadastraDoador" ValidationGroup="FormgDoador" OnClick="btnCadastraDoador_Click" ClientIDMode="Static"/>
                </div>
            </div>
        </div>
        <script>
            $("#formDoador :input").attr("disabled", "true");
        </script>
    </div>
</asp:Content>
