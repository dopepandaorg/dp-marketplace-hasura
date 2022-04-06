alter table "public"."contest_entries_votes" add column "created_at" timestamptz
 null default now();
