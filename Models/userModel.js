const { Schema } = require('mongoose');
const mongoose = require('mongoose');

const userSchema = new Schema({
	firstname: {
		type: String,
		required: false
	},
	lastname: {
		type: String,
		required: false
	},
	phonenumber: {
		type: String,
		required: true
	},
	photoURL: {
		type: String,
		requried: false
	},
	applicant1: {
		type: Schema.Types.ObjectId,
		ref: 'Applicant',
	},
	applicant2: {
		type: Schema.Types.ObjectId,
		ref: 'Applicant'
	},
	propertyType: {
		type: String,
	},
	flat_apartment: {
		type: String
	},
	housing_building_name: {
		type: String
	},
	street: {
		type: String
	},
	city: {
		type: String,
	},
	postcode: {
		type: String
	},
	mortgagebalance: {
		type: String
	},
	remainingterm: {
		type: String
	},
	approximate_property_value: {
		type: String
	},
	mortgage_lender: {
		type: String
	},
	mortgage_account_number: {
		type: String
	},
	repayment_type: {
		type: String
	},
	expected_monthly_rental_income: {
		type: String
	},
	equity_release: {
		type: Boolean
	},
	amount_required_released: {
		type: String
	},
	property: {
		type: [Schema.Types.ObjectId]
	}
});

const User = mongoose.models.User || mongoose.model('User', userSchema);

module.exports = User;
