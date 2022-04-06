alter table "public"."contest_entries"
  add constraint "contest_entries_creator_fkey"
  foreign key ("creator")
  references "public"."profiles"
  ("wallet") on update restrict on delete restrict;
