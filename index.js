const express = require('express')
const mongoose = require('mongoose');
const cors = require('cors');
const app = express()
const port = 5500
const userRouter = require('./Routes/user')
const applicantRouter = require('./Routes/applicant')
const propertyRouter = require('./Routes/property')
require('dotenv').config()
app.use(cors())
var bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())
// ${process.env.MONGODB_URI}


// mongoose.connect('mongodb://localhost:27017/freedom', { }, () => {
// 	console.log('Connected To Database!');
// });
// 'mongodb://127.0.0.1:27017/freedom' `${process.env.MONGODB_URI}`
mongoose.connect('mongodb+srv://admin:0XPhAeQulUcLKVLR@cluster0.nregswh.mongodb.net/?retryWrites=true&w=majority', {useNewUrlParser: true, useUnifiedTopology: true,})
	.then(() => console.log('Connected to Database'))
	.catch((err) => console.log(err))

app.use("/user", userRouter)
app.use("/property", propertyRouter)
app.use("/applicant", applicantRouter)

app.get('/', (req, res) => {
	res.send('Hello World!')
})

app.listen(port, () => {
	console.log(`Freedom app listening on port ${port}`)
})