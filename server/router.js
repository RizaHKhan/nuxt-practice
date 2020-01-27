const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
  console.log('accessed root')
  res.send()
})

module.exports = router
