/*
  Warnings:

  - You are about to drop the column `date` on the `indications` table. All the data in the column will be lost.
  - Added the required column `month` to the `indications` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_indications" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "light" BIGINT NOT NULL,
    "waterC" BIGINT NOT NULL,
    "waterH" BIGINT NOT NULL,
    "gas" BIGINT NOT NULL,
    "month" INTEGER NOT NULL,
    "userId" INTEGER,
    CONSTRAINT "indications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_indications" ("gas", "id", "light", "userId", "waterC", "waterH") SELECT "gas", "id", "light", "userId", "waterC", "waterH" FROM "indications";
DROP TABLE "indications";
ALTER TABLE "new_indications" RENAME TO "indications";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
