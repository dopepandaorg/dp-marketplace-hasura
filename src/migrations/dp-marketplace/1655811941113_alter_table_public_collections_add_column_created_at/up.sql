alter table "public"."collections" add column "created_at" timestamptz
 not null default now();
