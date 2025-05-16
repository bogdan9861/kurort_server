-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_indications" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "light" BIGINT NOT NULL,
    "waterC" BIGINT NOT NULL,
    "waterH" BIGINT NOT NULL,
    "gas" BIGINT NOT NULL,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_indications" ("date", "gas", "id", "light", "waterC", "waterH") SELECT "date", "gas", "id", "light", "waterC", "waterH" FROM "indications";
DROP TABLE "indications";
ALTER TABLE "new_indications" RENAME TO "indications";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
