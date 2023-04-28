const database = require('../database/connection');

class UptQuantidadeItens {
    uptItem(req, res) {
        let { idItem, itemNome, itemDescricao, itemQuantidade} = req.body;
        let itemStatus
        if(itemQuantidade > 0){
            itemStatus = "Em Estoque"
        }else{
            itemStatus = "Sem Estoque"
        }
        console.log(req.body)


        database.raw('CALL pUptQuantidadeItem(?, ?, ?, ?, ?)', [idItem ,itemNome, itemDescricao, itemQuantidade, itemStatus])
            .then(data => {
                res.json({
                    message: "Quantidade de itens atualizada com sucesso",
                    status: 200
                })
            })
            .catch((erro) => {
                console.error(erro);
            });


    }
}

module.exports = new UptQuantidadeItens();


