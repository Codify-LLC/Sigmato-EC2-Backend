const express = require('express')
const mongoose = require('mongoose');
const cors = require('cors');
const app = express()
const port = 5500
const customerRouter = require('./Routes/customer')
const applicantionRouter = require('./Routes/application')
const propertyRouter = require('./Routes/property');

require('dotenv').config()
app.use(cors())
var bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))
var MongoClient = require('mongodb').MongoClient

// parse application/json
app.use(bodyParser.json())

// mongoose.connect(`${process.env.MONGODB_URI}`, { useNewUrlParser: true, ssl: true, sslValidate: false }, (err) => {
// 	console.log(err)
// });
MongoClient.connect(
	`${process.env.MONGODB_URI}`, {
	useNewUrlParser: true
},
	function (err, client) {
		console.log(err + " , " + client);
	});

app.use("/customer", customerRouter)
app.use("/applicantion", applicantionRouter)
app.use("/property", propertyRouter)

app.get('/', (req, res) => {
	res.send('Hello World!')
})

app.listen(port, () => {
	console.log(`Freedom app listening on port ${port}`)
})