alter table "public"."collections_analytics_1d" drop constraint "collections_analytics_1d_ts_key";
alter table "public"."collections_analytics_1d" add constraint "collections_analytics_1d_collection_ts_key" unique ("collection", "ts");
