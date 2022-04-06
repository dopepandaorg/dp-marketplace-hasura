alter table "public"."contest_entries_votes"
  add constraint "contest_entries_votes_voter_fkey"
  foreign key ("voter")
  references "public"."profiles"
  ("wallet") on update no action on delete no action;
