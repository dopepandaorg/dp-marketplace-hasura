BEGIN TRANSACTION;
ALTER TABLE "public"."participation_rewards" DROP CONSTRAINT "participation_rewards_pkey";

ALTER TABLE "public"."participation_rewards"
    ADD CONSTRAINT "participation_rewards_pkey" PRIMARY KEY ("id", "wallet", "type");
COMMIT TRANSACTION;
