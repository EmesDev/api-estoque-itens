const connection = require('../database/connection')
const express = require('express')
const router =  express.Router()
const InsItemNovoController = require('../controllers/insItemNovo.controller')
const uptQuantidadeItensController = require('../controllers/uptQuantidadeItens.controller')
const selTodosItenscontroller = require('../controllers/selTodosItenscontroller')
const selQuatidadeEstoqueController = require('../controllers/selQuatidadeEstoque.controller')
const selQuatidadeStatusController = require('../controllers/selQuatidadeStatus.controller')
const delEstoqueItemController = require('../controllers/delEstoqueItem.controller')

router.post('/novoItem', InsItemNovoController.novoItem)

router.post('/uptItem', uptQuantidadeItensController.uptItem)

router.get('/selItens', selTodosItenscontroller.selTodosItens)

router.get('/selQtEstoque', selQuatidadeEstoqueController.selQtEstoque)

router.get('/selQtStatus', selQuatidadeStatusController.selQtStatus)

router.post('/delItem', delEstoqueItemController.delItem)






module.exports = router

