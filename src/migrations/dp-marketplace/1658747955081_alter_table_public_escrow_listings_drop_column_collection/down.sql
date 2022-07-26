alter table "public"."escrow_listings" alter column "collection" drop not null;
alter table "public"."escrow_listings" add column "collection" uuid;
