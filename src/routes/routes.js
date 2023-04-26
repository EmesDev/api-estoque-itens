const connection = require('../database/connection')
const express = require('express')
const router =  express.Router()
const InsItemNovoController = require('../controllers/insItemNovo.controller')
const uptQuantidadeItensController = require('../controllers/uptQuantidadeItens.controller')
const selTodosItenscontroller = require('../controllers/selTodosItenscontroller')

router.post('/novoItem', InsItemNovoController.novoItem)

router.post('/uptItem', uptQuantidadeItensController.uptItem)

router.get('/selItens', selTodosItenscontroller.selTodosItens)



module.exports = router