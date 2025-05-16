const { prisma } = require("../prisma/prisma.client");
const { prices } = require("../variables/variables");

const create = async (req, res) => {
  try {
    const { gas, light, waterC, waterH } = req.body;

    const isExist = await prisma.indications.findFirst({
      where: {
        userId: req.user.id,
        month: new Date().getMonth() + 1,
      },
    });

    if (isExist) {
      return res
        .status(400)
        .json({ message: "Вы уже совершали платёж в этом месяце" });
    }

    const currentPrices = {
      total_price: 0,
    };

    for (el in req.body) {
      currentPrices[el + "_price"] = +req.body[el] * prices[el];
    }

    for (el in currentPrices) {
      currentPrices.total_price += currentPrices[el];
    }

    const indication = await prisma.indications.create({
      data: {
        gas: +gas || 0,
        light: +light || 0,
        waterC: +waterC || 0,
        waterH: +waterH || 0,
        userId: req.user.id || 0,
        month: new Date().getMonth() + 1,

        ...currentPrices,
      },
    });

    res.status(201).json(indication);
  } catch (error) {
    console.log(error);

    res.status(500).json({ message: "Unknown server error" });
  }
};

const getAll = async (req, res) => {
  try {
    const indications = await prisma.indications.findMany({
      where: {
        userId: req.user.id,
      },
    });

    res.status(200).json(indications);
  } catch (error) {
    res.status(500).json({ message: "Unknown server error" });
  }
};

const getCompare = async (req, res) => {
  try {
    const { month } = req.body;

    if (!month) {
      return res.status(400).json({ message: "All fields are required" });
    }

    const compareMonth = await prisma.indications.findFirst({
      where: {
        userId: req.user.id,
        month: +month,
      },
    });

    const thisMonthIndications = await prisma.indications.findFirst({
      where: {
        userId: req.user.id,
        month: new Date().getMonth() + 1,
      },
    });

    res.status(200).json({
      gas: compareMonth.gas - thisMonthIndications.gas,
      light: compareMonth.light - thisMonthIndications.light,
      waterC: compareMonth.waterC - thisMonthIndications.waterC,
      waterH: compareMonth.waterH - thisMonthIndications.waterH,

      gas_price: compareMonth.gas_price - thisMonthIndications.gas_price,
      light_price: compareMonth.light_price - thisMonthIndications.light_price,
      waterC_price:
        compareMonth.waterC_price - thisMonthIndications.waterC_price,
      waterH_price:
        compareMonth.waterH_price - thisMonthIndications.waterH_price,
    });
  } catch (error) {
    res.status(500).json({ message: "Unknown server error" });
  }
};

module.exports = {
  create,
  getAll,
  getCompare,
  getCompare,
};
