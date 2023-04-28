const database = require('../database/connection');

class SelQuatidadeStatus {
    selQtStatus(req, res) {
        let { statusColuna } = req.body;


        database.raw('CALL pSelQuatidadeStatus()')
        .then((data)=>{
            res.json(data[0][0])
        })
    .catch((erro) => {
        console.error(erro);
        res.status(500).json({ erro: 'Ocorreu um erro ao executar a procedure pSelQuatidadeStatus.' });

    });
    }
}

module.exports = new SelQuatidadeStatus();


