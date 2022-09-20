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
		type: String,
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
		type: Object,
	},
	previousaddress: {
		type: Object,
	},
	occupation: {
		type: Object
	},
	dependents: {
		type: [Object]
	},
	outstandingdetails: {
		type: Object
	},
	documents: {
		type: Object
	},
	user: {
		type: Schema.Types.ObjectId,
		ref: 'User',
		required: true,
	},
});

const Applicant = mongoose.models.Applicant || mongoose.model('Applicant', applicantSchema);

module.exports = Applicant;
