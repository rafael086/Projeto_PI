//Muda o formulario na pagina de cadastro
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