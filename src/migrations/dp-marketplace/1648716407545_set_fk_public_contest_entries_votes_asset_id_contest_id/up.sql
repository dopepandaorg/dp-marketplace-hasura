alter table "public"."contest_entries_votes"
  add constraint "contest_entries_votes_asset_id_contest_id_fkey"
  foreign key ("asset_id", "contest_id")
  references "public"."contest_entries"
  ("asset_id", "contest_id") on update restrict on delete restrict;
