const express = require("express");
const router = express.Router();

const { auth } = require("../middleware/auth");
const {
  create,
  getAll,
  getCompare,
  remove,
} = require("../controllers/indications");

router.post("/", auth, create);
router.get("/", auth, getAll);
router.delete("/:id", auth, remove);
router.get("/compare/:month", auth, getCompare);

module.exports = router;
