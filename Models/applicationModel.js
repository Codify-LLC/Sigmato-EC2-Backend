const { Schema } = require('mongoose');
const mongoose = require('mongoose');
const moment = require('moment');


const handleDate = () => {
	const dateObj = new Date();
	console.log(dateObj)
	return moment(dateObj).format("MMM, DD, YYYY")
}
const applicationSchema = new Schema({
	customer: {
		type: Schema.Types.ObjectId,
		ref: "Customer"
		// ObjectId of customer
	},
	interestedIn: {
		type: String,
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
	},
	documents: {
		type: Map
	},
	status: {
		type: String,
		default: "New Lead"
	},
	timeStamp: {
		type: String,
		default: handleDate
	},
	originator: {
		type: String
	},
	postcode: {
		type: String
	},
	relationshipManager: {
		type: String
	},
	processOfficer: {
		type: String
	}
});


const Application = mongoose.model('Application', applicationSchema);

module.exports = Application;
