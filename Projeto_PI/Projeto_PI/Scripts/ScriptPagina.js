//Muda o formulario na pagina de cadastro
function trocaForm(tipo) {
    switch (tipo.id) {
        case "ong":
            document.getElementById("form-doador").style.display = 'none';
            document.getElementById("form-ong").style.display = 'block';

            break;
        case "doador":
            document.getElementById("form-ong").style.display = 'none';
            document.getElementById("form-doador").style.display = 'block';
            break;
    }
}