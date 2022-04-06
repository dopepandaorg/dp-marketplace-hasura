alter table "public"."contest_entries_votes" add constraint "contest_entries_votes_contest_id_asset_id_voter_key" unique ("contest_id", "asset_id", "voter");
