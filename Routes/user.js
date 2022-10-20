const express = require("express");
const router = express.Router();
const User = require('../Models/usersModel')
const bcrypt = require('bcrypt');


router.post('/create', async (req, res) => {
	const hashedPassword = await bcrypt.hash(req.body.password, 10);
	const finalUserObj = req.body;
	finalUserObj.password = hashedPassword
	const user = new User(finalUserObj)
	try {
		const newUser = await user.save()
		res.status(200).json(newUser);
	} catch (err) {
		res.status(400).json({ message: err.message })
	}
})

router.post('/login', async (req, res) => {
	const user = await User.findOne({email: req.body.email})
	if (!user) {
		return res.status(404).send("Cannot find user!");
	} else {
		if (await bcrypt.compare(req.body.password, user.password)) {
			res.send(user)
		}else{
			res.send("Not allowed")
		}
	}
})

module.exports = router;