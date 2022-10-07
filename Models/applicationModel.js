const { Schema } = require('mongoose');
const mongoose = require('mongoose');

const applicantSchema = new Schema({
	customer: {
		type: Schema.Types.ObjectId,
		ref: "Customer"
		// ObjectId of customer
	},
	applicant1: {
		type: Map,
		required: true
		//map contains dependents, current address, previous address, occupation, outstandings, documents
	},
	applicant2: {
		type: Map
		//map contains current address, previous address, occupation, outstandings, documents
	}, 
	property: {
		type: Map
		// contains the text fields data from UI
	}
});

const Applicant = mongoose.models.Applicant || mongoose.model('Application', applicantSchema);

module.exports = Applicant;
