const express = require("express");
const ApplicantionModel = require("../Models/applicationModel");
const router = express.Router();


//ADD APPLICANT
router.get('/:id', async (req, res) => {
	try {
		const applicants = await ApplicantionModel.find({customer: req.params.id})
		res.status(200).json(applicants);
	} catch (err) {
		res.status(400).json({ message: err.message })
	}
})

router.post("/add", async (req, res) => {
	const newApplicant = new ApplicantionModel(req.body)
	try {
		const newApplicantFinal = await newApplicant.save()
		res.status(200).json(newApplicantFinal);
	} catch (err) {
		res.status(400).json({ message: err.message })
	}
})

//UPDATE APPLICANT
router.patch("/:id", async (req, res) => {
	try {
		const updatedApplicant = await ApplicantionModel.findByIdAndpUdate(req.params.id, req.body, { new: true })
		res.status(200).json(updatedApplicant)
	} catch (err) {
		res.json({ message: err.message })
	}
})

//DELETE APPLICANT
router.delete("/:id", async (req, res) => {
	try {
		await ApplicantionModel.findByIdAndDelete(req.params.id)
		res.status(200).json({ message: 'Applicant Deleted' })
	} catch (err) {
		res.json({ message: err.message })
	}
})

module.exports = router;