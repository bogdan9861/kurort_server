-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "indications" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "light" BIGINT NOT NULL,
    "waterC" BIGINT NOT NULL,
    "waterH" BIGINT NOT NULL,
    "gas" BIGINT NOT NULL,
    "date" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "users_phone_key" ON "users"("phone");
