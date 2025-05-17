const express = require("express");
const router = express.Router();

const fileMiddleware = require("../middleware/file");
const { auth } = require("../middleware/auth");
const { register, login, current, edit } = require("../controllers/users");

router.post("/register", register);
router.post("/login", login);
router.put("/", auth, edit);
router.get("/", auth, current);

module.exports = router;
