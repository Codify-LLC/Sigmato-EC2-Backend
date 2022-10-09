const { Schema } = require('mongoose');
const mongoose = require('mongoose');

const customerModel = new Schema({
	firstname: {
		type: String,
		required: true
	},
	lastname: {
		type: String,
		required: true
	},
	phonenumber: {
		type: String,
		required: true
	},
	photoURL: {
		type: String,
		requried: true
	},
	personalLoan: {
		type: Map
	},
	carLoan: {
		type: Map
	},
	storeCard: {
		type: Map
	}
});

const Customer = mongoose.model('Customer', customerModel);

module.exports = Customer;
