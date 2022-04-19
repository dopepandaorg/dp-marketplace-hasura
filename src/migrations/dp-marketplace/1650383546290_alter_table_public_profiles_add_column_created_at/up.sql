alter table "public"."profiles" add column "created_at" timestamptz
 null default now();
