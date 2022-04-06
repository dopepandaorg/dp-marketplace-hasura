alter table "public"."contest_entries_votes" drop constraint "contest_entries_votes_pkey";
alter table "public"."contest_entries_votes"
    add constraint "contest_entries_votes_pkey"
    primary key ("contest_id", "asset_id", "voter");
