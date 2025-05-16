/*
  Warnings:

  - You are about to alter the column `gas` on the `indications` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `light` on the `indications` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `waterC` on the `indications` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `waterH` on the `indications` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.

*/
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
    "userId" INTEGER,
    CONSTRAINT "indications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_indications" ("gas", "id", "light", "month", "userId", "waterC", "waterH") SELECT "gas", "id", "light", "month", "userId", "waterC", "waterH" FROM "indications";
DROP TABLE "indications";
ALTER TABLE "new_indications" RENAME TO "indications";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
