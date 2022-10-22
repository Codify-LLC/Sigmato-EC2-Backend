const express = require('express')
const mongoose = require('mongoose');
const cors = require('cors');
const app = express()
const port = 5500
const customerRouter = require('./Routes/customer')
const applicationRouter = require('./Routes/application')
const propertyRouter = require('./Routes/property');
const userRouter = require('./Routes/user');

require('dotenv').config()
app.use(cors())
var bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))
var MongoClient = require('mongodb').MongoClient

// parse application/json
app.use(express.json())
app.use(bodyParser.json())

// mongoose.connect(`${process.env.MONGODB_URI}`, { useNewUrlParser: true, ssl: true, sslValidate: false }, (err) => {
// 	console.log(err)
// });
// MongoClient.connect(
// 	`${process.env.MONGODB_URI}`, {
// 	useNewUrlParser: true
// },
// 	function (err, client) {
// 		console.log(err + " , " + client);
// 	});

mongoose.connect("mongodb+srv://admin:0XPhAeQulUcLKVLR@cluster0.nregswh.mongodb.net/?retryWrites=true&w=majority", { useNewUrlParser: true })
// mongoose.connect("mongodb://localhost:27017/freedom", { useNewUrlParser: true })
	.then(() => console.log("Connected to db"))
	.catch((err) => console.log(err))

app.use("/customer", customerRouter)
app.use("/application", applicationRouter)
app.use("/property", propertyRouter)
app.use("/user", userRouter)

app.get('/', (req, res) => {
	res.send('Hello World!')
})

app.listen(port, () => {
	console.log(`Freedom app listening on port ${port}`)
})
