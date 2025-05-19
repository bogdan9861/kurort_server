const express = require("express");
const router = express.Router();

const { auth } = require("../middleware/auth");
const { create, getAll, remove } = require("../controllers/requests");

router.post("/", create);
router.get("/", getAll);
router.delete("/:id", remove);

module.exports = router;
