//Muda o formulario na pagina de cadastro
function trocaForm(tipo) {
    switch (tipo.id) {
        case "ong":
            document.getElementById("formDoador").style.display = 'none';
            document.getElementById("formOng").style.display = 'block';

            break;
        case "doador":
            document.getElementById("formOng").style.display = 'none';
            document.getElementById("formDoador").style.display = 'block';
            break;
    }
}