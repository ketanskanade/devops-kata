const express = require('express')
const cors = require('cors')
const movieQuote = require("popular-movie-quotes");

const app = express()
app.use(cors())

const port = 3000

app.get('/quote', (req, res) => {
  res.send(movieQuote.getSomeRandom(1))
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})