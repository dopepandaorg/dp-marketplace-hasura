comment on column "public"."contest_entries"."created_at_round" is E'A collection of contest entries';
alter table "public"."contest_entries" alter column "created_at_round" drop not null;
alter table "public"."contest_entries" add column "created_at_round" text;
