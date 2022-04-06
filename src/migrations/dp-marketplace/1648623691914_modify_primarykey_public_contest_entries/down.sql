alter table "public"."contest_entries" drop constraint "contest_entries_pkey";
alter table "public"."contest_entries"
    add constraint "contest_entries_pkey"
    primary key ("id");
