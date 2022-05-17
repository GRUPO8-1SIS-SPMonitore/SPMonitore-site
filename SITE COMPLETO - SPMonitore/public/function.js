function cadastro(){

    if(nome_cad.value.length >= 3){
        var nome = nome_cad.value
    }else{
        alert('Nome muito curto!')
        return limparCampo()
    }
        if(num_cad.value.length == 11 ||  num_cad.value.length == 13){
        var numero = num_cad.value
    }else{
        alert('Número inválido')
        return limparCampo()
    }
    
    if(email_cad.value.indexOf('@') > 0 && email_cad.value.indexOf('.com') > 0){
        var email = email_cad.value
    }else{
        alert("Email inválido")
        return limparCampo()
    }
    
    if(senha_cad.value == conf_senha.value){
        var senha = conf_senha.value
    }else{
        alert("As senhas estão diferentes!")
        return limparCampo()
    }if(nome_cad.value == "" || email_cad.value == "" || num_cad == "" || senha_cad == "" || conf_senha == ""){
        alert("É necessário preencher todos os campos!")
        return limparCampo()
    }else{
        alert("Cadastro realizado, faça seu login")
        location="login.html"
    }
}

function login(){
    var user = user_log.value
    var pass = pass_log.value
    if(user == 'teste@gmail.com' && pass == '1234'){
       location ="dashboard_tempo_real.html"
    }else{
        alert('Usuário ou senha incorretos')
        return
    }
}

function limparCampo(){
    nome_cad.value = "" 
    email_cad.value = "" 
    num_cad.value = "" 
    senha_cad.value = "" 
    conf_senha.value = ""
}

                                   