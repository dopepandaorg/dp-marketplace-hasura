alter table "public"."participation_rewards" drop constraint "participation_rewards_pkey";
alter table "public"."participation_rewards"
    add constraint "participation_rewards_pkey"
    primary key ("id");
