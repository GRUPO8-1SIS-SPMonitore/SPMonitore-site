var database = require("../database/config");

function buscarUltimasMedidas(idDados, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas} count(
        chave) as presenca,   
                        datahora,
                        CONVERT(varchar, datahora, 108) as datahora_grafico
                    from dados
                    where fk_sensor = ${idDados}
                    order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        sum(chave) as chave,
                        datahora,
                        DATE_FORMAT(datahora,'%H:%i:%s') as Hora
                    from medidas
                    where fkSensor = 500
                    group by Hora
                    order by idDados desc limit ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idDados) {
    console.log('dentro do buscarMedidasTempoReal')

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        CONVERT(varchar, datahora, 108) as datahora_grafico, 
                        fk_sensor 
                        from dados where fk_sensor = ${idDados} 
                    order by id desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        count(chave) as chave, 
                        DATE_FORMAT(datahora,'%H:%i') as Hora, 
                        fkSensor 
                        from medidas where fkSensor = 500 and chave = 1
                        group by Hora
                        order by Hora`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
