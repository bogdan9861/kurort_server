-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_indications" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "light" BIGINT NOT NULL DEFAULT 0,
    "waterC" BIGINT NOT NULL DEFAULT 0,
    "waterH" BIGINT NOT NULL DEFAULT 0,
    "gas" BIGINT NOT NULL DEFAULT 0,
    "month" INTEGER NOT NULL,
    "userId" INTEGER,
    CONSTRAINT "indications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_indications" ("gas", "id", "light", "month", "userId", "waterC", "waterH") SELECT "gas", "id", "light", "month", "userId", "waterC", "waterH" FROM "indications";
DROP TABLE "indications";
ALTER TABLE "new_indications" RENAME TO "indications";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
