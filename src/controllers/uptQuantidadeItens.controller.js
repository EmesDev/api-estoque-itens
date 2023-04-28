const database = require('../database/connection');

class UptQuantidadeItens {
    uptItem(req, res) {
        let { quantidade, idItem } = req.body;


        database.raw('CALL pUptQuantidadeItem(?, ?)', [quantidade, idItem])
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


