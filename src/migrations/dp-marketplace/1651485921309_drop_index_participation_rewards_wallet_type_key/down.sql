CREATE  INDEX "participation_rewards_wallet_type_key" on
  "public"."participation_rewards" using brin ("type", "wallet");
