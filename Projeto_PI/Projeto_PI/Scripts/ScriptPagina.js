//=================================SCRIPTS DA PAGINA DE CADASTRO=================================================\\
//Muda o formulario na pagina de cadastro 
function trocaForm(tipo) {
    //em $(#<formID> input> coloco todos os input do form que esta com display none como disabled pois apesar de o form não esta visivel ele ainda faz parte do form geral(form runat=server), então se eu não desativar os inputs que estão invisiveis o submit não ira acontecer pois todos os campos devem estar preenchidos(vide atributo 'required').
    switch (tipo.id) {
        case "ong":
            document.getElementById("formDoador").style.display = 'none';
            document.getElementById("formOng").style.display = 'block';
            $("#formDoador :input").attr("disabled", "true");
            $("#formOng :input").removeAttr("disabled");
            break;
        case "doador":
            document.getElementById("formOng").style.display = 'none';
            document.getElementById("formDoador").style.display = 'block';
            $("#formOng :input").attr("disabled", "true");
            $("#formDoador :input").removeAttr("disabled");
            break;
    }
}


//cria mascaras para os inputs
//https://plugins.jquery.com/mask/
jQuery(function ($) {
    $("#txtCNPJ").mask("99.999.999/9999-99");
    $("#txtTelefone").mask("(99)9999-9999");
    $("#txtCEPOng, #txtCEPDoador").mask("99999-999");
    $("#txtCPFDoador").mask("999.999.999-99");
});
//remove os espacos excedentes dos inputs
function tiraEspacoExcedente(input) {
    input.value = input.value.trim();
    input.value = input.value.replace(/\s{2,}/g, " ");
}

//os metodos abaixo chamam os metodos que verificam se o cpf/cnpj é valido e configura a msg que é exibida para o usuario no input 
function msgValidacaoCNPJ(cnpj){
    if (!validarCNPJ(cnpj.value)) {
        cnpj.setCustomValidity("O CNPJ informado não é valido");
    } else {
        cnpj.setCustomValidity("");
    }
}
function msgValidacaoCPF(cpf) {
    if (!validarCPF(cpf.value)) {
        cpf.setCustomValidity("O CPF informado não é valido");
    } else {
        cpf.setCustomValidity("");
    }
}
//funcao para validar o cnpj
//http://www.geradorcnpj.com/javascript-validar-cnpj.htm
function validarCNPJ(cnpj) {

    cnpj = cnpj.replace(/[^\d]+/g, '');

    if (cnpj == '') return false;

    if (cnpj.length != 14)
        return false;

    // Elimina CNPJs invalidos conhecidos
    if (cnpj === "00000000000000" ||
        cnpj === "11111111111111" ||
        cnpj === "22222222222222" ||
        cnpj === "33333333333333" ||
        cnpj === "44444444444444" ||
        cnpj === "55555555555555" ||
        cnpj === "66666666666666" ||
        cnpj === "77777777777777" ||
        cnpj === "88888888888888" ||
        cnpj === "99999999999999")
        return false;

    // Valida DVs
    tamanho = cnpj.length - 2;
    numeros = cnpj.substring(0, tamanho);
    digitos = cnpj.substring(tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(0))
        return false;

    tamanho = tamanho + 1;
    numeros = cnpj.substring(0, tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(1))
        return false;
    return true;
}
//funcao para validar cpf
//http://www.geradorcpf.com/javascript-validar-cpf.htm
function validarCPF(cpf) {
    cpf = cpf.replace(/[^\d]+/g, '');
    if (cpf == '') return false;
    // Elimina CPFs invalidos conhecidos    
    if (cpf.length != 11 ||
        cpf === "00000000000" ||
        cpf === "11111111111" ||
        cpf === "22222222222" ||
        cpf === "33333333333" ||
        cpf === "44444444444" ||
        cpf === "55555555555" ||
        cpf === "66666666666" ||
        cpf === "77777777777" ||
        cpf === "88888888888" ||
        cpf === "99999999999")
        return false;
    // Valida 1o digito 
    add = 0;
    for (i = 0; i < 9; i++)
        add += parseInt(cpf.charAt(i)) * (10 - i);
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(9)))
        return false;
    // Valida 2o digito 
    add = 0;
    for (i = 0; i < 10; i++)
        add += parseInt(cpf.charAt(i)) * (11 - i);
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(10)))
        return false;
    return true;
}