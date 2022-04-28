CREATE TABLE "public"."escrow_listings" ("id" UUID NOT NULL DEFAULT gen_random_uuid(), "asset_id" bigint NOT NULL, "creator" text NOT NULL, "seller" text NOT NULL, "sale_qty" integer NOT NULL, "sale_price" bigint NOT NULL, "sale_royalty" integer NOT NULL, "sale_fee" integer NOT NULL, "application_version" integer NOT NULL, "application_id" integer NOT NULL, "application_address" text NOT NULL, "is_verified" boolean NOT NULL, "status" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_escrow_listings_updated_at"
BEFORE UPDATE ON "public"."escrow_listings"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_escrow_listings_updated_at" ON "public"."escrow_listings" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
