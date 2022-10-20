const { Schema } = require('mongoose');
const mongoose = require('mongoose');

const userModel = new Schema({
	email: {
		type: String,
		required: true,
		unique: true
	},
	password: {
		type: String,
		required: true
	}
});

const User = mongoose.model('Users', userModel);

module.exports = User;
