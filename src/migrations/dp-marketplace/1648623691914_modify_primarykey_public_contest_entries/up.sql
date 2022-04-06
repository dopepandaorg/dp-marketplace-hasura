BEGIN TRANSACTION;
ALTER TABLE "public"."contest_entries" DROP CONSTRAINT "contest_entries_pkey";

ALTER TABLE "public"."contest_entries"
    ADD CONSTRAINT "contest_entries_pkey" PRIMARY KEY ("contest_id", "asset_id");
COMMIT TRANSACTION;
