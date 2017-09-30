//Muda o formulario na pagina de cadastro
//em $(#<formID> input> coloco todos os input do form que esta com display none como disabled pois apesar de o form não esta visivel ele ainda faz parte do form geral(form runat=server), então se eu não desativar os inputs que estão invisiveis o submit não ira acontecer pois todos os campos devem estar preenchidos(vide atributo 'required'). 
function trocaForm(tipo) {
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
//cria mascaras para os campos
jQuery(function ($) {
    $("#txtCNPJ").mask("99.999.999/9999-99");
    $("#txtTelefone").mask("(99)9999-9999");
    $("#txtCEPOng, #txtCEPDoador").mask("99999-999");
    $("#txtCPFDoador").mask("999.999.999-99");
});