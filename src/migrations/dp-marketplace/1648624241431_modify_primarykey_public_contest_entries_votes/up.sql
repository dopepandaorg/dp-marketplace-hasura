BEGIN TRANSACTION;
ALTER TABLE "public"."contest_entries_votes" DROP CONSTRAINT "contest_entries_votes_pkey";

ALTER TABLE "public"."contest_entries_votes"
    ADD CONSTRAINT "contest_entries_votes_pkey" PRIMARY KEY ("contest_id", "voter");
COMMIT TRANSACTION;
