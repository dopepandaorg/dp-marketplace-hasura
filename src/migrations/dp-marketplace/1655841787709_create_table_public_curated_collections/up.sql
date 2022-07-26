CREATE TABLE "public"."curated_collections" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "collection" uuid NOT NULL, "selected_assets" jsonb NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("collection") REFERENCES "public"."collections"("id") ON UPDATE restrict ON DELETE restrict);
CREATE EXTENSION IF NOT EXISTS pgcrypto;
