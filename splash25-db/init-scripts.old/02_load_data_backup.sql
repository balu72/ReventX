-- Splash25 Database Data Loading Script - CLEAN VERSION
-- Updated to match the consolidated schema structure
-- Generated on: 2025-06-02
-- Target Database: splash25_core_db
-- Compatible with: 01_create_schema.sql (33 tables)

-- Connect to database
\c splash25_core_db;

-- Disable foreign key checks during data loading
SET session_replication_role = replica;

-- Table: buyer_categories (6 records)
INSERT INTO buyer_categories (id, name, deposit_amount, entry_fee, accommodation_hosted, transfers_hosted, max_meetings, min_meetings, created_at) VALUES
    (1, 'Hosted', '5000.00', '0.00', TRUE, TRUE, 30, 0, '2025-06-02T05:27:33.810811'),
    (2, 'Pre-reg', '0.00', '500.00', FALSE, FALSE, 0, 0, '2025-06-02T05:27:33.810811'),
    (3, 'Media', '0.00', '0.00', FALSE, FALSE, 0, 0, '2025-06-02T05:27:33.810811'),
    (4, 'Blogger', '0.00', '0.00', TRUE, TRUE, 0, 0, '2025-06-02T05:27:33.810811'),
    (5, 'Government', '0.00', '0.00', TRUE, TRUE, 0, 0, '2025-06-02T05:27:33.810811'),
    (6, 'Student', '0.00', '0.00', FALSE, FALSE, 0, 0, '2025-06-02T05:27:33.810811');

-- Table: property_types (5 records)
INSERT INTO property_types (id, name, description, created_at) VALUES
    (1, 'Homestay', NULL, '2025-06-02T05:27:33.811149'),
    (2, 'Service Villa', NULL, '2025-06-02T05:27:33.811149'),
    (3, 'Budget Resort', NULL, '2025-06-02T05:27:33.811149'),
    (4, 'Premium Resort', NULL, '2025-06-02T05:27:33.811149'),
    (5, 'Not a property', NULL, '2025-06-02T05:27:33.811149');

-- Table: interests (13 records)
INSERT INTO interests (id, name, description, created_at) VALUES
    (1, 'Adventure', NULL, '2025-06-02T05:27:33.810465'),
    (2, 'Agritourism', NULL, '2025-06-02T05:27:33.810465'),
    (3, 'Ayurveda', NULL, '2025-06-02T05:27:33.810465'),
    (4, 'Culture', NULL, '2025-06-02T05:27:33.810465'),
    (5, 'Family Holidays', NULL, '2025-06-02T05:27:33.810465'),
    (6, 'Honeymoon', NULL, '2025-06-02T05:27:33.810465'),
    (7, 'MICE', NULL, '2025-06-02T05:27:33.810465'),
    (8, 'Nature', NULL, '2025-06-02T05:27:33.810465'),
    (9, 'Schools & Colleges', NULL, '2025-06-02T05:27:33.810465'),
    (10, 'Spiritual', NULL, '2025-06-02T05:27:33.810465'),
    (11, 'Wildlife', NULL, '2025-06-02T05:27:33.810465'),
    (12, 'Yoga', NULL, '2025-06-02T05:27:33.810465'),
    (13, 'Sightseeing', NULL, '2025-06-02T05:27:33.810465');

-- Table: stall_types (8 records)
INSERT INTO stall_types (id, name, price, attendees, max_meetings_per_attendee, min_meetings_per_attendee, size, saleable, inclusions, created_at) VALUES
    (1, 'Standard Stall', '25000.00', 2, 30, 0, '2m x 2m', TRUE, 'Standard location, basic branding, meeting space, chairs, power supply', '2025-06-02T05:27:33.811451'),
    (2, 'Standard Corner', '27500.00', 2, 30, 0, '2m x 2m', TRUE, 'Corner location, meeting table, chairs, power supply, WiFi', '2025-06-02T05:27:33.811451'),
    (3, 'Premium Stall', '40000.00', 4, 30, 0, '4m x 2m', TRUE, 'Premium branding, meeting table, chairs, power supply, WiFi', '2025-06-02T05:27:33.811451'),
    (4, 'Premium Corner', '44000.00', 4, 30, 0, '4m x 2m', TRUE, 'Corner location, premium branding, meeting table, chairs, power supply, WiFi', '2025-06-02T05:27:33.811451'),
    (5, 'Tablespace', '12000.00', 1, 30, 0, '1.5m x 1m', TRUE, 'Table space, chairs, power supply', '2025-06-02T05:27:33.811451'),
    (6, 'WTO Standard Stall', '20000.00', 2, 30, 0, '2m x 2m', FALSE, 'Standard location, basic branding, meeting space, chairs, power supply', '2025-06-02T05:27:33.811451'),
    (7, 'FOC Std Stall', '0.00', 2, 0, 0, '2m x 2m', FALSE, 'Standard location, basic branding, meeting space, chairs, power supply', '2025-06-02T05:27:33.811451'),
    (8, 'Sponsor Stall', '0.00', 2, 0, 0, '2m x 2m', FALSE, 'Stall for Sponsor, meeting space, chairs, power supply', '2025-06-02T05:27:33.811451');

-- Table: domain_restrictions (sample data)
INSERT INTO domain_restrictions (id, domain, is_enabled, created_at) VALUES
    (1, 'gmail.com', TRUE, '2025-06-02T05:27:33.810000'),
    (2, 'yahoo.com', TRUE, '2025-06-02T05:27:33.810000'),
    (3, 'outlook.com', TRUE, '2025-06-02T05:27:33.810000'),
    (4, 'company.com', FALSE, '2025-06-02T05:27:33.810000');

-- Table: system_settings (sample data)
INSERT INTO system_settings (id, key, value, description, created_at, updated_at) VALUES
    (1, 'app_version', '2.0.0', 'Current application version', '2025-06-02T05:27:33.810000', '2025-06-02T05:27:33.810000'),
    (2, 'maintenance_mode', 'false', 'Application maintenance mode status', '2025-06-02T05:27:33.810000', '2025-06-02T05:27:33.810000'),
    (3, 'max_meetings_per_day', '8', 'Maximum meetings allowed per day', '2025-06-02T05:27:33.810000', '2025-06-02T05:27:33.810000'),
    (4, 'event_start_date', '2025-12-01', 'Event start date', '2025-06-02T05:27:33.810000', '2025-06-02T05:27:33.810000'),
    (5, 'event_end_date', '2025-12-03', 'Event end date', '2025-06-02T05:27:33.810000', '2025-06-02T05:27:33.810000');

-- Table: migration_log (5 records)
INSERT INTO migration_log (id, step_name, status, message, started_at, completed_at, duration_seconds) VALUES
    (1, 'schema_consolidation', 'completed', 'Database schema consolidated from 53 to 33 tables', '2025-06-02T05:27:33.646505', '2025-06-02T05:27:33.689347', 43),
    (2, 'transportation_types_merge', 'completed', 'Transportation types migration merged into main schema', '2025-06-02T05:27:33.703202', '2025-06-02T05:27:33.742034', 39),
    (3, 'data_consolidation', 'completed', 'Legacy data consolidated into new table structure', '2025-06-02T05:27:33.756310', '2025-06-02T05:27:33.766056', 10),
    (4, 'model_synchronization', 'completed', 'Python models synchronized with clean schema', '2025-06-02T05:27:33.779968', '2025-06-02T05:27:33.826856', 47),
    (5, 'clean_deployment', 'completed', 'Clean schema deployed successfully', '2025-06-02T05:27:33.840834', '2025-06-02T05:27:33.850000', 10);

-- Table: users (10 records - simplified for essential functionality)
INSERT INTO users (id, username, email, password_hash, role, created_at, business_name, is_verified) VALUES
    (1, 'rajesh.kumar', 'rajesh.kumar@wanderlust.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-02T05:27:33.842751', 'Wanderlust Travels', TRUE),
    (2, 'priya.sharma', 'priya.sharma@dreamtravel.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-02T05:27:33.842751', 'Dream Travel Solutions', TRUE),
    (3, 'amit.patel', 'amit.patel@explorindia.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-02T05:27:33.842751', 'Explor India Tours', TRUE),
    (4, 'sunita.reddy', 'sunita.reddy@southtours.co.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-02T05:27:33.842751', 'South India Tours', TRUE),
    (5, 'kavya.nair', 'kavya.nair@keralatours.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-02T05:27:33.842751', 'Kerala Tours', TRUE),
    (11, 'suresh.nair', 'suresh.nair@backwaterbliss.com', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-02T05:27:33.847847', 'Backwater Bliss Resort', TRUE),
    (12, 'lakshmi.pillai', 'lakshmi.pillai@spicegardenretreat.com', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-02T05:27:33.847847', 'Spice Garden Retreat', TRUE),
    (13, 'ravi.kumar', 'ravi.kumar@coconutgrovehomestay.in', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-02T05:27:33.847847', 'Coconut Grove Homestay', TRUE),
    (14, 'meera.menon', 'meera.menon@mistymountainresort.com', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-02T05:27:33.847847', 'Misty Mountain Resort', TRUE),
    (15, 'admin', 'admin@splash25.com', '$2b$12$dummy.hash.for.testing.only', 'admin', '2025-06-02T05:27:33.847847', NULL, TRUE);

-- Table: buyer_profiles (5 records - consolidated data with country field)
INSERT INTO buyer_profiles (id, user_id, name, organization, designation, operator_type, 
    salutation, first_name, last_name, email, mobile, gst, website,
    address, city, state, pincode, country,
    year_of_starting_business, property_interest_1, property_interest_2, 
    selling_wayanad, sell_wayanad, category_id, vip, status, created_at) VALUES
    (1, 1, 'Rajesh Kumar', 'Wanderlust Travels', 'CEO', 'Tour Operator',
     'Mr.', 'Rajesh', 'Kumar', 'rajesh.kumar@wanderlust.com', '+91-9876543210', '29ABCDE1234F1Z5', 'www.wanderlust.com',
     '123 MG Road', 'Bangalore', 'Karnataka', '560001', 'India',
     2015, 'Luxury Resorts', 'Adventure Activities', TRUE, TRUE, 1, TRUE, 'confirmed', '2025-06-02T05:27:33.843778'),
    (2, 2, 'Priya Sharma', 'Dream Travel Solutions', 'Director', 'Travel Agent',
     'Ms.', 'Priya', 'Sharma', 'priya.sharma@dreamtravel.in', '+91-9876543211', '19FGHIJ5678K2L6', 'www.dreamtravel.in',
     '456 Park Street', 'Kolkata', 'West Bengal', '700016', 'India',
     2012, 'Heritage Hotels', 'Cultural Experiences', TRUE, TRUE, 1, TRUE, 'confirmed', '2025-06-02T05:27:33.843778'),
    (3, 3, 'Amit Patel', 'Explor India Tours', 'Managing Director', 'DMC',
     'Mr.', 'Amit', 'Patel', 'amit.patel@explorindia.com', '+91-9876543212', '27MNOPQ9012R3S7', 'www.explorindia.com',
     '789 FC Road', 'Pune', 'Maharashtra', '411005', 'India',
     2018, 'Eco Resorts', 'Wildlife Lodges', TRUE, TRUE, 2, FALSE, 'confirmed', '2025-06-02T05:27:33.843778'),
    (4, 4, 'Sunita Reddy', 'South India Tours', 'Founder', 'Tour Operator',
     'Mrs.', 'Sunita', 'Reddy', 'sunita.reddy@southtours.co.in', '+91-9876543213', '36TUVWX3456Y4Z8', 'www.southtours.co.in',
     '321 Jubilee Hills', 'Hyderabad', 'Telangana', '500033', 'India',
     2010, 'Beach Resorts', 'Backwater Stays', TRUE, TRUE, 2, FALSE, 'confirmed', '2025-06-02T05:27:33.843778'),
    (5, 5, 'Kavya Nair', 'Kerala Tours', 'Operations Head', 'DMC',
     'Ms.', 'Kavya', 'Nair', 'kavya.nair@keralatours.in', '+91-9876543215', '32HIJKL2345M6N0', 'www.keralatours.in',
     '987 Marine Drive', 'Kochi', 'Kerala', '682031', 'India',
     2014, 'Homestays', 'Houseboat Stays', TRUE, TRUE, 3, FALSE, 'confirmed', '2025-06-02T05:27:33.843778');

-- Table: seller_profiles (4 records - consolidated data with country field)
INSERT INTO seller_profiles (id, user_id, business_name, description,
    salutation, first_name, last_name, designation, contact_email, contact_phone, mobile,
    start_year, number_of_rooms, previous_business, previous_business_year,
    address, city, state, pincode, country, website,
    property_type_id, status, assn_member, is_verified, gst, created_at) VALUES
    (1, 11, 'Backwater Bliss Resort', 'Luxury backwater resort in Kumarakom',
     'Mr.', 'Suresh', 'Nair', 'General Manager', 'suresh.nair@backwaterbliss.com', '+91-9447123456', '+91-9447123456',
     2010, 25, FALSE, 2008,
     'Kumarakom Lake Side, Kumarakom, Kerala, 686563, India', 'Kumarakom', 'Kerala', '686563', 'India', 'www.backwaterbliss.com',
     1, 'active', TRUE, TRUE, '32ABCDE1234F1Z5', '2025-06-02T05:27:33.848301'),
    (2, 12, 'Spice Garden Retreat', 'Eco-friendly retreat in spice plantations',
     'Ms.', 'Lakshmi', 'Pillai', 'Resort Manager', 'lakshmi.pillai@spicegardenretreat.com', '+91-9447123457', '+91-9447123457',
     2015, 18, FALSE, 2012,
     'Thekkady Hills, Thekkady, Kerala, 685536, India', 'Thekkady', 'Kerala', '685536', 'India', 'www.spicegardenretreat.com',
     1, 'active', TRUE, TRUE, '32FGHIJ5678K2L6', '2025-06-02T05:27:33.848301'),
    (3, 13, 'Coconut Grove Homestay', 'Traditional Kerala homestay experience',
     'Mr.', 'Ravi', 'Kumar', 'Owner', 'ravi.kumar@coconutgrovehomestay.in', '+91-9447123458', '+91-9447123458',
     2018, 8, TRUE, 2016,
     'Alleppey Backwaters, Alleppey, Kerala, 688001, India', 'Alleppey', 'Kerala', '688001', 'India', 'www.coconutgrovehomestay.in',
     3, 'active', FALSE, TRUE, '32MNOPQ9012R3S7', '2025-06-02T05:27:33.848301'),
    (4, 14, 'Misty Mountain Resort', 'Hill station resort with panoramic views',
     'Mrs.', 'Meera', 'Menon', 'Operations Head', 'meera.menon@mistymountainresort.com', '+91-9447123459', '+91-9447123459',
     2012, 30, TRUE, 2010,
     'Munnar Hills, Munnar, Kerala, 685612, India', 'Munnar', 'Kerala', '685612', 'India', 'www.mistymountainresort.com',
     1, 'active', TRUE, TRUE, '32TUVWX3456Y4Z8', '2025-06-02T05:27:33.848301');

-- Table: stalls (sample data with is_allocated field)
INSERT INTO stalls (id, seller_id, stall_type_id, number, allocated_stall_number, fascia_name, is_allocated, created_at) VALUES
    (1, 11, 1, 'S001', 'S001', 'Backwater Bliss Resort', TRUE, '2025-06-02T05:27:33.850000'),
    (2, 12, 2, 'S002', 'S002', 'Spice Garden Retreat', TRUE, '2025-06-02T05:27:33.850000'),
    (3, 13, 3, 'S003', 'S003', 'Coconut Grove Homestay', TRUE, '2025-06-02T05:27:33.850000'),
    (4, 14, 1, 'S004', 'S004', 'Misty Mountain Resort', TRUE, '2025-06-02T05:27:33.850000');

-- Table: stall_inventory (sample data)
INSERT INTO stall_inventory (id, stall_number, stall_type_id, is_allocated, created_at) VALUES
    (1, 'S001', 1, TRUE, '2025-06-02T05:27:33.850000'),
    (2, 'S002', 2, TRUE, '2025-06-02T05:27:33.850000'),
    (3, 'S003', 3, TRUE, '2025-06-02T05:27:33.850000'),
    (4, 'S004', 1, TRUE, '2025-06-02T05:27:33.850000'),
    (5, 'S005', 1, FALSE, '2025-06-02T05:27:33.850000'),
    (6, 'S006', 2, FALSE, '2025-06-02T05:27:33.850000'),
    (7, 'S007', 3, FALSE, '2025-06-02T05:27:33.850000');

-- Re-enable foreign key checks
SET session_replication_role = DEFAULT;

-- Update sequences to current max values
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('buyer_profiles_id_seq', (SELECT MAX(id) FROM buyer_profiles));
SELECT setval('seller_profiles_id_seq', (SELECT MAX(id) FROM seller_profiles));
SELECT setval('buyer_categories_id_seq', (SELECT MAX(id) FROM buyer_categories));
SELECT setval('property_types_id_seq', (SELECT MAX(id) FROM property_types));
SELECT setval('interests_id_seq', (SELECT MAX(id) FROM interests));
SELECT setval('stall_types_id_seq', (SELECT MAX(id) FROM stall_types));
SELECT setval('stalls_id_seq', (SELECT MAX(id) FROM stalls));
SELECT setval('stall_inventory_id_seq', (SELECT MAX(id) FROM stall_inventory));
SELECT setval('migration_log_id_seq', (SELECT MAX(id) FROM migration_log));
SELECT setval('system_settings_id_seq', (SELECT MAX(id) FROM system_settings));
SELECT setval('domain_restrictions_id_seq', (SELECT MAX(id) FROM domain_restrictions));

-- Data loading completed successfully
-- Schema: 33 tables with consolidated structure
-- Data: Essential records for all core tables
-- Status: Ready for application use
