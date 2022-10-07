const { Schema } = require('mongoose');
const mongoose = require('mongoose');

const userSchema = new Schema({
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

const User = mongoose.models.User || mongoose.model('Customer', userSchema);

module.exports = User;
