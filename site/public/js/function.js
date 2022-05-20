function cadastro(){

    if(nome_input.value.length >= 3){
        var nome = nome_input.value
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
    
    if(email_input.value.indexOf('@') > 0 && email_input.value.indexOf('.com') > 0){
        var email = email_input.value
    }else{
        alert("Email inválido")
        return limparCampo()
    }
    
    if(senha_input.value == confirmacao_senha_input.value){
        var senha = confirmacao_senha_input.value
    }else{
        alert("As senhas estão diferentes!")
        return limparCampo()
    }if(nome_input.value == "" || email_input.value == "" || num_cad == "" || senha_input == "" || confirmacao_senha_input == ""){
        alert("É necessário preencher todos os campos!")
        return limparCampo()
    }else{
        alert("Cadastro realizado, faça seu login")
        location="login.html"
    }
}

/* function login(){
    var user = user_log.value
    var pass = pass_log.value
    if(user == 'teste@gmail.com' && pass == '1234'){
       location ="dashboard_tempo_real.html"
    }else{
        alert('Usuário ou senha incorretos')
        return
    }
}*/

function limparCampo(){
    nome_input.value = "" 
    email_input.value = "" 
    num_cad.value = "" 
    senha_input.value = "" 
    confirmacao_senha_input.value = ""
}

                                   