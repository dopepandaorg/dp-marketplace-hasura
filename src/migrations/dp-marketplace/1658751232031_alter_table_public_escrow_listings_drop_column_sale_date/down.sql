alter table "public"."escrow_listings" alter column "sale_date" drop not null;
alter table "public"."escrow_listings" add column "sale_date" timestamp;
