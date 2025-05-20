const { prisma } = require("../prisma/prisma.client");

const create = async (req, res) => {
  try {
    const { name, phone, text } = req.body;

    const requset = await prisma.requests.create({
      data: {
        name,
        phone,
        text: text || "",
      },
    });

    res.status(201).json(requset);
  } catch (error) {
    res.status(500).json({ message: "Unknown server error" });
  }
};

const getAll = async (req, res) => {
  try {
    const request = await prisma.requests.findMany();

    res.status(200).json(request);
  } catch (error) {
    res.status(500).json({ message: "Unknown server error" });
  }
};

const remove = async (req, res) => {
  try {
    const { id } = req.params;

    const request = await prisma.requests.delete({
      where: {
        id,
      },
    });

    res.status(200).json({ status: "success" });
  } catch (error) {
    console.log(error);

    res.status(500).json({ message: "Unknown server error" });
  }
};

module.exports = {
  create,
  getAll,
  remove,
};
