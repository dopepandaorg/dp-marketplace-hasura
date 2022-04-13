alter table "public"."contests" add column "voting_start_at" timestamptz
 not null default now();
