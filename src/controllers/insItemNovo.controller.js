const database = require('../database/connection');

class InsItemNovoController {
    novoItem(req, res) {
        let {  itemNome, ItemDescricao, itemQuantidade } = req.body;

        console.log( itemNome, ItemDescricao, itemQuantidade)

        database.raw('CALL insItem(?, ?, ?)', [itemNome, ItemDescricao, itemQuantidade])
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


