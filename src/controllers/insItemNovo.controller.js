const database = require('../database/connection');

class InsItemNovoController {
    novoItem(req, res) {
        let {  itemNome, itemDescricao, itemQuantidade} = req.body;
        let itemStatus
        if(itemQuantidade > 0){
            itemStatus = "Em Estoque"
        }else{
            itemStatus = "Sem Estoque"
        }


        database.raw('CALL pInsEstoqueItem(?, ?, ?, ?)', [itemNome, itemDescricao, itemQuantidade, itemStatus])
            .then(data=>{
                    res.json({
                        message:"Item criado com sucesso", 
                        status:200
                    })
                })
            .catch((erro) => {
                console.error(erro);
            });

  

    }
}

module.exports = new InsItemNovoController();


