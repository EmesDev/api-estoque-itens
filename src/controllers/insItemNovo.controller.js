const database = require('../database/connection');

class InsItemNovoController {
    novoItem(req, res) {
        let {  itemNome, ItemDescricao, itemQuantidade} = req.body;
        let itemStatus
        if(itemQuantidade > 0){
            itemStatus = "Em Estoque"
        }else{
            itemStatus = "Sem Estoque"
        }

        console.log( itemNome, ItemDescricao, itemQuantidade, itemStatus)

        database.raw('CALL insItem(?, ?, ?, ?)', [itemNome, ItemDescricao, itemQuantidade, itemStatus])
            .then(data=>{
                    console.log(data)
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


