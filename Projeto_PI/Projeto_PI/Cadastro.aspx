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
            <form action="" name="form-ong" id="form-ong" class="form-horizontal col-md-4 col-md-offset-4">
                <div class="form-group">
                    <label for="nome" class="control-label col-md-4">Nome*</label>
                    <div class="col-md-8">
                        <input type="text" required="" class="form-control" name="nome" id="nome">
                    </div>
                </div>
                <div class="form-group">
                    <label for="razao-social" class="control-label col-md-4">Razão social*</label>
                    <div class="col-md-8">
                        <input type="text" required="" class="form-control" name="razao-social" id="razao-social">
                    </div>
                </div>
                <div class="form-group">
                    <label for="cnpj" class="control-label col-md-4">CNPJ*</label>
                    <div class="col-md-8">
                        <input type="text" required="" class="form-control" name="cnpj" id="cnpj">
                    </div>
                </div>
                <div class="form-group">
                    <label for="telefone" class="control-label col-md-4">Telefone</label>
                    <div class="col-md-8">
                        <input type="tel" class="form-control" name="telefone" id="telefone">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label for="cep" class="control-label col-md-4">CEP*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="cep" id="cep">
                    </div>
                </div>
                <div class="form-group">
                    <label for="estado" class="control-label col-md-4">Estado*</label>
                    <div class="col-md-8">
                        <select name="estado" id="estado" class="form-control">
                            <option value="">Selecione</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espirito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cidade" class="control-label col-md-4">Cidade*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="cidade" id="cidade">
                    </div>
                </div>
                <div class="form-group">
                    <label for="endereco" class="control-label col-md-4">Endereço*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="endereco" id="endereco">
                    </div>
                </div>
                <div class="form-group">
                    <label for="numero" class="control-label col-md-4">Numero*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="numero" id="numero">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bairro" class="control-label col-md-4">Bairro*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="bairro" id="bairro">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label for="email" class="control-label col-md-4">Email*</label>
                    <div class="col-md-8">
                        <input type="email" class="form-control" name="email" id="email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="senha" class="control-label col-md-4">Senha*</label>
                    <div class="col-md-8">
                        <input type="password" class="form-control" name="senha" id="senha">
                    </div>
                </div>
                <div class="form-group">
                    <label for="repetir-senha" class="control-label col-md-4">Repetir senha*</label>
                    <div class="col-md-8">
                        <input type="password" class="form-control" name="repetir-senha" id="repetir-senha">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label for="representante" class="control-label col-md-4">Representante*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="representante" id="representante">
                    </div>
                </div>
                <div class="form-group">
                    <label for="cargo" class="control-label col-md-4">Cargo*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="cargo" id="cargo">
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" value="Cadastrar" class="btn btn-block">
                </div>
            </form>
            <!--Form de usuarios doadores-->
            <form action="" name="form-doador" id="form-doador" class="form-horizontal col-md-4 col-md-offset-4">
                <div class="form-group">
                    <label for="nome" class="control-label col-md-4">Nome*</label>
                    <div class="col-md-8">
                        <input type="text" required="" class="form-control" name="nome" id="nome">
                    </div>
                </div>
                <div class="form-group">
                    <label for="cpf" class="control-label col-md-4">CPF*</label>
                    <div class="col-md-8">
                        <input type="text" required="" class="form-control" name="cnpj" id="cnpj">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label for="cep" class="control-label col-md-4">CEP*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="cep" id="cep">
                    </div>
                </div>
                <div class="form-group">
                    <label for="estado" class="control-label col-md-4">Estado*</label>
                    <div class="col-md-8">
                        <select name="estado" id="estado" class="form-control">
                            <option value="">Selecione</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espirito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cidade" class="control-label col-md-4">Cidade*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="cidade" id="cidade">
                    </div>
                </div>
                <div class="form-group">
                    <label for="endereco" class="control-label col-md-4">Endereço*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="endereco" id="endereco">
                    </div>
                </div>
                <div class="form-group">
                    <label for="numero" class="control-label col-md-4">Numero*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="numero" id="numero">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bairro" class="control-label col-md-4">Bairro*</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="bairro" id="bairro">
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label for="email" class="control-label col-md-4">Email*</label>
                    <div class="col-md-8">
                        <input type="email" class="form-control" name="email" id="email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="senha" class="control-label col-md-4">Senha*</label>
                    <div class="col-md-8">
                        <input type="password" class="form-control" name="senha" id="senha">
                    </div>
                </div>
                <div class="form-group">
                    <label for="repetir-senha" class="control-label col-md-4">Repetir senha*</label>
                    <div class="col-md-8">
                        <input type="password" class="form-control" name="repetir-senha" id="repetir-senha">
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" value="Cadastrar" class="btn btn-block">
                </div>
            </form>
        </div>
    </div>
</asp:Content>
