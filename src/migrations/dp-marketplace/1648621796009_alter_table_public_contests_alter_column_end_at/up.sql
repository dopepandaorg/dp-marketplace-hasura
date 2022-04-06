ALTER TABLE "public"."contests" ALTER COLUMN "end_at" TYPE timestamptz;
ALTER TABLE "public"."contests" ALTER COLUMN "end_at" drop default;
