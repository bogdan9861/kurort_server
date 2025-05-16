const express = require("express");
const router = express.Router();

const { auth } = require("../middleware/auth");
const { create, getAll, getCompare } = require("../controllers/indications");

router.post("/", auth, create);
router.get("/", auth, getAll);
router.get("/compare/:month", auth, getCompare);

module.exports = router;
