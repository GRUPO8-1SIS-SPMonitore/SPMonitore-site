var user;
var pass;

function Cadastro(){
    var nome = nome-cad.value
    var numero = num-cad.value
    if(indexOf('@' && '.com' )){
        var email = email-cad.value
    }else{
        alert("Email inválido")
    }
    
    if(senha-cad.value == conf-senha.value){
        var senha = conf-senha.value
    }else{
        alert("As senhas estão diferentes!")
    }if(nome-cad.value == "" || email-cad.value == "" || num-cad == "" || senha-cad == "" || conf-senha == ""){
        alert("É necessário preencher todos os campos!")
    }else{
        alert("Cadastro realizado, faça seu login")
        window.location.href="login.html"
        user = email
        pass = senha
    }
}

function Login(){
    
}

