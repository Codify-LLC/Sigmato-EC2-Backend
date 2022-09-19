const { Schema } = require('mongoose');
const mongoose = require('mongoose');


const propertySchema = new Schema({
	bedroomumber: {
		type: String,
		required: true
	},
	garage: {
		type: String,
		required: true
	},
	property_type: {
		type: String
	},
	built_year: {
		type: String
	}
});

const Property = mongoose.models.Property || mongoose.model('Property', propertySchema);

module.exports = Property;
