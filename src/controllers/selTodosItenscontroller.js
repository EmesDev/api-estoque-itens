const database = require('../database/connection');

class SelTodosItens {
    selTodosItens(req, res) {

        database.raw('CALL pSelTodosItens()')
            .then((data)=>{
                    console.log(data)
                    res.json(data[0][0])
                })
            .catch((erro) => {
                console.error(erro);
                res.status(500).json({ erro: 'Ocorreu um erro ao executar a procedure selItenss.' });

            });

    }
}

module.exports = new SelTodosItens();


