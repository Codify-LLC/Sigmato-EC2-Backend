const { Schema } = require('mongoose');
const mongoose = require('mongoose');


const applicantSchema = new Schema({
	firstname: {
		type: String,
		required: true
	},
	middlename: {
		type: String,
		required: true
	},
	surname: {
		type: String,
		required: true
	},
	dateofbirth: {
		type: Date,
	},
	nationality: {
		type: String
	},
	maritalstatus: {
		type: String
	},
	visa: {
		type: String,
	},
	mobilenumber: {
		type: String
	},
	emailid: {
		type: String
	},
	currentaddress: {
		type: Map,
	},
	previousaddress: {
		type: Map,
	},
	occupation: {
		type: Map
	},
	dependents: {
		type: [Map]
	},
	outstandingdetails: {
		type: Map
	},
	documents: {
		type: Map
	}
});

const Applicant = mongoose.models.Applicant || mongoose.model('Applicant', applicantSchema);

module.exports = Applicant;
