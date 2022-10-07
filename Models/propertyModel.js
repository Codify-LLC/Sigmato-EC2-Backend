const { Schema } = require('mongoose');
const mongoose = require('mongoose');

const PropertySchema = new Schema({
	customerId: {
		type: Schema.Types.ObjectId,
		ref: "Customer",
	},
	propertyType: {
		type: String,
		required: true
	},
	propertyDetails: {
		type: Map,
	},
});

const Property = mongoose.models.Property || mongoose.model('Property', PropertySchema);

module.exports = Property;
