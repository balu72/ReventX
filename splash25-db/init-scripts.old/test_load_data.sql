-- test_load_data.sql
-- Test Script for verifying data load of Splash25 DB

\echo '--- Starting Data Load Verification ---'

-- Preloaded tables from the backup (expected counts are based on 02_load_data_backup.sql)

\echo 'Testing buyer_categories (expected: 6)'
SELECT 'buyer_categories' AS table_name, COUNT(*) AS row_count FROM buyer_categories;

\echo 'Testing property_types (expected: 5)'
SELECT 'property_types' AS table_name, COUNT(*) AS row_count FROM property_types;

\echo 'Testing interests (expected: 13)'
SELECT 'interests' AS table_name, COUNT(*) AS row_count FROM interests;

\echo 'Testing stall_types (expected: 8)'
SELECT 'stall_types' AS table_name, COUNT(*) AS row_count FROM stall_types;

\echo 'Testing domain_restrictions (expected: 4)'
SELECT 'domain_restrictions' AS table_name, COUNT(*) AS row_count FROM domain_restrictions;

\echo 'Testing system_settings (expected: 5)'
SELECT 'system_settings' AS table_name, COUNT(*) AS row_count FROM system_settings;

\echo 'Testing migration_log (expected: 5)'
SELECT 'migration_log' AS table_name, COUNT(*) AS row_count FROM migration_log;

\echo 'Testing users (expected: 10)'
SELECT 'users' AS table_name, COUNT(*) AS row_count FROM users;

\echo 'Testing buyer_profiles (expected: 5)'
SELECT 'buyer_profiles' AS table_name, COUNT(*) AS row_count FROM buyer_profiles;

\echo 'Testing seller_profiles (expected: 4)'
SELECT 'seller_profiles' AS table_name, COUNT(*) AS row_count FROM seller_profiles;

\echo 'Testing stalls (expected: 4)'
SELECT 'stalls' AS table_name, COUNT(*) AS row_count FROM stalls;

\echo 'Testing stall_inventory (expected: 7)'
SELECT 'stall_inventory' AS table_name, COUNT(*) AS row_count FROM stall_inventory;

-- Mock data inserted for the remaining tables (each expected to have 1 row)

\echo 'Testing travel_plans (expected: 1)'
SELECT 'travel_plans' AS table_name, COUNT(*) AS row_count FROM travel_plans;

\echo 'Testing accommodations (expected: 1)'
SELECT 'accommodations' AS table_name, COUNT(*) AS row_count FROM accommodations;

\echo 'Testing buyer_business_info (expected: 1)'
SELECT 'buyer_business_info' AS table_name, COUNT(*) AS row_count FROM buyer_business_info;

\echo 'Testing buyer_financial_info (expected: 1)'
SELECT 'buyer_financial_info' AS table_name, COUNT(*) AS row_count FROM buyer_financial_info;

\echo 'Testing buyer_profile_interests (expected: 1)'
SELECT 'buyer_profile_interests' AS table_name, COUNT(*) AS row_count FROM buyer_profile_interests;

\echo 'Testing buyer_references (expected: 1)'
SELECT 'buyer_references' AS table_name, COUNT(*) AS row_count FROM buyer_references;

\echo 'Testing ground_transportation (expected: 1)'
SELECT 'ground_transportation' AS table_name, COUNT(*) AS row_count FROM ground_transportation;

\echo 'Testing invited_buyers (expected: 1)'
SELECT 'invited_buyers' AS table_name, COUNT(*) AS row_count FROM invited_buyers;

\echo 'Testing listings (expected: 1)'
SELECT 'listings' AS table_name, COUNT(*) AS row_count FROM listings;

\echo 'Testing listing_dates (expected: 1)'
SELECT 'listing_dates' AS table_name, COUNT(*) AS row_count FROM listing_dates;

\echo 'Testing seller_attendees (expected: 1)'
SELECT 'seller_attendees' AS table_name, COUNT(*) AS row_count FROM seller_attendees;

\echo 'Testing time_slots (expected: 1)'
SELECT 'time_slots' AS table_name, COUNT(*) AS row_count FROM time_slots;

\echo 'Testing meetings (expected: 1)'
SELECT 'meetings' AS table_name, COUNT(*) AS row_count FROM meetings;

\echo 'Testing migration_mapping_buyers (expected: 1)'
SELECT 'migration_mapping_buyers' AS table_name, COUNT(*) AS row_count FROM migration_mapping_buyers;

\echo 'Testing migration_mapping_sellers (expected: 1)'
SELECT 'migration_mapping_sellers' AS table_name, COUNT(*) AS row_count FROM migration_mapping_sellers;

\echo 'Testing pending_buyers (expected: 1)'
SELECT 'pending_buyers' AS table_name, COUNT(*) AS row_count FROM pending_buyers;

\echo 'Testing seller_business_info (expected: 1)'
SELECT 'seller_business_info' AS table_name, COUNT(*) AS row_count FROM seller_business_info;

\echo 'Testing seller_financial_info (expected: 1)'
SELECT 'seller_financial_info' AS table_name, COUNT(*) AS row_count FROM seller_financial_info;

\echo 'Testing seller_references (expected: 1)'
SELECT 'seller_references' AS table_name, COUNT(*) AS row_count FROM seller_references;

\echo 'Testing seller_target_markets (expected: 1)'
SELECT 'seller_target_markets' AS table_name, COUNT(*) AS row_count FROM seller_target_markets;

\echo 'Testing transportation (expected: 1)'
SELECT 'transportation' AS table_name, COUNT(*) AS row_count FROM transportation;

\echo '--- Data Load Verification Completed ---';
