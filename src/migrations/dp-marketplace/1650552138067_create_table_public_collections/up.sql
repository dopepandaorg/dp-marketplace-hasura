CREATE TABLE "public"."collections" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "title" text NOT NULL, "description" text NOT NULL, "thumbnail_cid" text NOT NULL, "creator" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
