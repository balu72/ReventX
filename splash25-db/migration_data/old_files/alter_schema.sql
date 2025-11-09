-- Alter seller_profiles table to increase varchar field lengths
ALTER TABLE seller_profiles ALTER COLUMN seller_type TYPE VARCHAR(200);
ALTER TABLE seller_profiles ALTER COLUMN target_market TYPE VARCHAR(200);

-- Alter seller_business_info table to use bigint for year fields to handle larger values
ALTER TABLE seller_business_info ALTER COLUMN start_year TYPE BIGINT;
ALTER TABLE seller_business_info ALTER COLUMN previous_business_year TYPE BIGINT;
