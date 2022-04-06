alter table "public"."contest_entries_votes" drop constraint "contest_entries_votes_voter_fkey",
  add constraint "contest_entries_votes_voter_fkey"
  foreign key ("voter")
  references "public"."profiles"
  ("wallet") on update restrict on delete restrict;
