const database = require('../database/connection');

class SelQuatidadeEstoque {
    selQtEstoque(req, res) {
        let { quantidade, idItem } = req.body;

        console.log(quantidade, idItem)

        database.raw('CALL pSelQuatidadeEstoque()')
        .then((data)=>{
            console.log(data)
            res.json(data[0][0])
        })
    .catch((erro) => {
        console.error(erro);
        res.status(500).json({ erro: 'Ocorreu um erro ao executar a procedure selQuantidadeEstoque.' });

    });
    }
}

module.exports = new SelQuatidadeEstoque();


