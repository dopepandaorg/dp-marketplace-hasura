alter table "public"."contest_entries_votes" add column "updated_at" timestamptz
 null default now();
