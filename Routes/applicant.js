const express = require("express");
const Applicant = require("../Models/applicantModel");
const router = express.Router();


//ADD APPLICANT
router.post('/add', async (req, res) => {
	const applicant = new Applicant(req.body);
	// console.log(applicant);
	console.log(req.body);
	try {
		const newApplicant = await applicant.save()
		console.log(newApplicant);
		res.status(200).json(newApplicant);
		console.log(newApplicant);
	} catch (err) {
		res.status(400).json({ message: err.message })
	}
})

//GET APPLICANT
router.get("/:id", async (req, res) => {
	try {
		const getApplicant = await Applicant.findById(req.params.id)
		console.log(getApplicant);
		res.status(200).json(getApplicant)
	} catch (err) {
		res.json({ message: err.message })
	}
})

//UPDATE APPLICANT
router.patch("/:id", async (req, res) => {
	try {
		const updatedApplicant = await Applicant.findByIdAndUpdate(req.params.id, req.body, { new: true })
		console.log("UPDATED APPLICANT")
		console.log(updatedApplicant)
		res.status(200).json(updatedApplicant)
	} catch (err) {
		res.json({ message: err.message })
	}
})

//DELETE APPLICANT
router.delete("/:id", async (req, res) => {
	try {
		await Applicant.findByIdAndDelete(req.params.id)
		res.status(200).json({ message: 'Applicant Deleted' })
	} catch (err) {
		res.json({ message: err.message })
	}
})

module.exports = router;