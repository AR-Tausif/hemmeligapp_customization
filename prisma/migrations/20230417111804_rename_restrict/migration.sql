/*
  Warnings:

  - You are about to drop the column `whitelist_organization_email` on the `Settings` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Settings" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "disable_users" BOOLEAN NOT NULL DEFAULT false,
    "disable_user_account_creation" BOOLEAN NOT NULL DEFAULT false,
    "read_only" BOOLEAN NOT NULL DEFAULT false,
    "disable_file_upload" BOOLEAN NOT NULL DEFAULT false,
    "restrict_organization_email" TEXT NOT NULL DEFAULT ''
);
INSERT INTO "new_Settings" ("disable_file_upload", "disable_user_account_creation", "disable_users", "id", "read_only") SELECT "disable_file_upload", "disable_user_account_creation", "disable_users", "id", "read_only" FROM "Settings";
DROP TABLE "Settings";
ALTER TABLE "new_Settings" RENAME TO "Settings";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
