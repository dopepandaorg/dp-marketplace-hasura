alter table "public"."contests" add column "start_at" timestamptz
 not null default now();
