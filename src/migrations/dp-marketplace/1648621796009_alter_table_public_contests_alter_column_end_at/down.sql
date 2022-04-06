alter table "public"."contests" alter column "end_at" set default now();
ALTER TABLE "public"."contests" ALTER COLUMN "end_at" TYPE timestamp without time zone;
