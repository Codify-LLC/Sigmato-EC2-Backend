const express = require("express");
const router = express.Router();
const User = require('../Models/userModel')


//ADD USER
router.post('/add', async (req, res) => {
	const user = new User(req.body)
	try {
		const newUser = await user.save()
		res.status(200).json(newUser);
	} catch (err) {
		res.status(400).json({ message: err.message })
	}
})

//UPDATE USER
router.patch("/:id", async (req, res) => {
	try {
		const updatedUser = await User.findByIdAndpUdate(req.params.id, req.body, { new: true })
		res.status(200).json(updatedUser)
	} catch (err) {
		res.json({ message: err.message })
	}
})

//DELETE USER
router.delete("/:id", async (req, res) => {
	try {
		await User.findByIdAndDelete(req.params.id)
		res.status(200).json({ message: 'User Deleted' })
	} catch (err) {
		res.json({ message: err.message })
	}
})

module.exports = router;