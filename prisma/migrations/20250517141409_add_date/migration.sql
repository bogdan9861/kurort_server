-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_indications" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "light" INTEGER NOT NULL,
    "waterC" INTEGER NOT NULL,
    "waterH" INTEGER NOT NULL,
    "gas" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "light_price" INTEGER,
    "waterC_price" INTEGER,
    "waterH_price" INTEGER,
    "gas_price" INTEGER,
    "total_price" INTEGER,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER,
    CONSTRAINT "indications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_indications" ("gas", "gas_price", "id", "light", "light_price", "month", "total_price", "userId", "waterC", "waterC_price", "waterH", "waterH_price") SELECT "gas", "gas_price", "id", "light", "light_price", "month", "total_price", "userId", "waterC", "waterC_price", "waterH", "waterH_price" FROM "indications";
DROP TABLE "indications";
ALTER TABLE "new_indications" RENAME TO "indications";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
