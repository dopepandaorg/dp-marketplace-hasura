alter table "public"."contests" add column "end_at" Timestamp
 not null default now();
