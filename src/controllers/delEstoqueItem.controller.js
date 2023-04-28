const database = require('../database/connection');

class DelEstoqueItem {
    delItem(req, res) {
        let {idItem} = req.body;



        database.raw('CALL pDelEstoqueItem(?)', [idItem])
            .then(data=>{
                    res.json({
                        message:"Item deletado com sucesso", 
                        status:200
                    })
                })
            .catch((erro) => {
                console.error(erro);
            });

  

    }
}

module.exports = new DelEstoqueItem();


