-- Splash25 Database Data Loading Script - COMPREHENSIVE VERSION
-- Complete mock data for all 28 tables in the consolidated schema
-- Generated on: 2025-06-03
-- Target Database: splash25_core_db
-- Compatible with: 01_create_schema.sql (28 tables)

-- Connect to database
\c splash25_core_db;

-- Disable foreign key checks during data loading
SET session_replication_role = replica;

-- =============================================================================
-- PHASE 1: CORE REFERENCE DATA
-- =============================================================================

-- Table: buyer_categories (6 records)
INSERT INTO buyer_categories (id, name, deposit_amount, entry_fee, accommodation_hosted, transfers_hosted, max_meetings, min_meetings, created_at) VALUES
    (1, 'Hosted', '5000.00', '0.00', TRUE, TRUE, 30, 5, '2025-06-03T03:10:00.000000'),
    (2, 'Pre-reg', '0.00', '500.00', FALSE, FALSE, 15, 0, '2025-06-03T03:10:00.000000'),
    (3, 'Media', '0.00', '0.00', FALSE, FALSE, 10, 0, '2025-06-03T03:10:00.000000'),
    (4, 'Blogger', '0.00', '0.00', TRUE, TRUE, 8, 0, '2025-06-03T03:10:00.000000'),
    (5, 'Government', '0.00', '0.00', TRUE, TRUE, 12, 0, '2025-06-03T03:10:00.000000'),
    (6, 'Student', '0.00', '0.00', FALSE, FALSE, 5, 0, '2025-06-03T03:10:00.000000');

-- Table: property_types (8 records)
INSERT INTO property_types (id, name, description, created_at) VALUES
    (1, 'Homestay', 'Traditional family-run accommodations', '2025-06-03T03:10:00.000000'),
    (2, 'Service Villa', 'Private villas with dedicated staff', '2025-06-03T03:10:00.000000'),
    (3, 'Budget Resort', 'Affordable resort accommodations', '2025-06-03T03:10:00.000000'),
    (4, 'Premium Resort', 'Luxury resort properties', '2025-06-03T03:10:00.000000'),
    (5, 'Boutique Hotel', 'Small, stylish hotels', '2025-06-03T03:10:00.000000'),
    (6, 'Eco Lodge', 'Environmentally sustainable accommodations', '2025-06-03T03:10:00.000000'),
    (7, 'Heritage Property', 'Historic buildings converted to hotels', '2025-06-03T03:10:00.000000'),
    (8, 'Not a property', 'Service providers and tour operators', '2025-06-03T03:10:00.000000');

-- Table: interests (18 records)
INSERT INTO interests (id, name, description, created_at) VALUES
    (1, 'Adventure', 'Outdoor activities and sports', '2025-06-03T03:10:00.000000'),
    (2, 'Agritourism', 'Farm visits and rural tourism', '2025-06-03T03:10:00.000000'),
    (3, 'Ayurveda', 'Traditional healing and wellness', '2025-06-03T03:10:00.000000'),
    (4, 'Culture', 'Local traditions and cultural experiences', '2025-06-03T03:10:00.000000'),
    (5, 'Family Holidays', 'Family-friendly activities', '2025-06-03T03:10:00.000000'),
    (6, 'Honeymoon', 'Romantic getaways', '2025-06-03T03:10:00.000000'),
    (7, 'MICE', 'Meetings, Incentives, Conferences, Events', '2025-06-03T03:10:00.000000'),
    (8, 'Nature', 'Wildlife viewing and nature photography', '2025-06-03T03:10:00.000000'),
    (9, 'Schools & Colleges', 'Educational tours', '2025-06-03T03:10:00.000000'),
    (10, 'Spiritual', 'Temple visits and spiritual journeys', '2025-06-03T03:10:00.000000'),
    (11, 'Wildlife', 'Safari experiences and conservation', '2025-06-03T03:10:00.000000'),
    (12, 'Yoga', 'Yoga retreats and meditation', '2025-06-03T03:10:00.000000'),
    (13, 'Sightseeing', 'Tourist attractions and guided tours', '2025-06-03T03:10:00.000000'),
    (14, 'Backpacking', 'Budget travel and hostels', '2025-06-03T03:10:00.000000'),
    (15, 'Luxury Travel', 'High-end accommodations', '2025-06-03T03:10:00.000000'),
    (16, 'Food Tourism', 'Culinary experiences', '2025-06-03T03:10:00.000000'),
    (17, 'Photography', 'Photography tours and workshops', '2025-06-03T03:10:00.000000'),
    (18, 'Wellness', 'Spa treatments and health retreats', '2025-06-03T03:10:00.000000');

-- Table: stall_types (10 records)
INSERT INTO stall_types (id, name, price, attendees, max_meetings_per_attendee, min_meetings_per_attendee, size, saleable, inclusions, created_at) VALUES
    (1, 'Standard Stall', '25000.00', 2, 30, 5, '2m x 2m', TRUE, 'Basic branding, meeting space, chairs, power', '2025-06-03T03:10:00.000000'),
    (2, 'Standard Corner', '27500.00', 2, 30, 5, '2m x 2m', TRUE, 'Corner location, table, chairs, power, WiFi', '2025-06-03T03:10:00.000000'),
    (3, 'Premium Stall', '40000.00', 4, 30, 8, '4m x 2m', TRUE, 'Premium branding, table, chairs, power, WiFi', '2025-06-03T03:10:00.000000'),
    (4, 'Premium Corner', '44000.00', 4, 30, 8, '4m x 2m', TRUE, 'Corner premium branding, table, chairs, power, WiFi', '2025-06-03T03:10:00.000000'),
    (5, 'Tablespace', '12000.00', 1, 20, 3, '1.5m x 1m', TRUE, 'Table space, chairs, power supply', '2025-06-03T03:10:00.000000'),
    (6, 'WTO Standard Stall', '20000.00', 2, 25, 5, '2m x 2m', FALSE, 'WTO standard setup', '2025-06-03T03:10:00.000000'),
    (7, 'FOC Std Stall', '0.00', 2, 15, 0, '2m x 2m', FALSE, 'Free of charge standard stall', '2025-06-03T03:10:00.000000'),
    (8, 'Sponsor Stall', '0.00', 2, 20, 0, '2m x 2m', FALSE, 'Sponsor stall with basic setup', '2025-06-03T03:10:00.000000'),
    (9, 'VIP Pavilion', '75000.00', 6, 40, 15, '6m x 4m', TRUE, 'VIP location, private room, refreshments, staff', '2025-06-03T03:10:00.000000'),
    (10, 'Startup Corner', '15000.00', 2, 25, 3, '2m x 1.5m', TRUE, 'Startup-friendly location, basic setup', '2025-06-03T03:10:00.000000');

-- Table: domain_restrictions (8 records)
INSERT INTO domain_restrictions (id, domain, is_enabled, created_at) VALUES
    (1, 'gmail.com', TRUE, '2025-06-03T03:10:00.000000'),
    (2, 'yahoo.com', TRUE, '2025-06-03T03:10:00.000000'),
    (3, 'outlook.com', TRUE, '2025-06-03T03:10:00.000000'),
    (4, 'hotmail.com', TRUE, '2025-06-03T03:10:00.000000'),
    (5, 'company.com', FALSE, '2025-06-03T03:10:00.000000'),
    (6, 'spam-domain.com', FALSE, '2025-06-03T03:10:00.000000'),
    (7, 'keralatourism.org', TRUE, '2025-06-03T03:10:00.000000'),
    (8, 'incredibleindia.org', TRUE, '2025-06-03T03:10:00.000000');

-- Table: system_settings (15 records)
INSERT INTO system_settings (id, key, value, description, created_at, updated_at) VALUES
    (1, 'app_version', '2.1.0', 'Current application version', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (2, 'maintenance_mode', 'false', 'Application maintenance mode status', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (3, 'max_meetings_per_day', '8', 'Maximum meetings allowed per day', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (4, 'event_start_date', '2025-12-01', 'Event start date', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (5, 'event_end_date', '2025-12-03', 'Event end date', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (6, 'registration_deadline', '2025-11-15', 'Last date for registration', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (7, 'meeting_duration', '30', 'Default meeting duration in minutes', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (8, 'venue_name', 'Wayanad Convention Center', 'Event venue name', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (9, 'venue_address', 'Kalpetta, Wayanad, Kerala 673121', 'Event venue address', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (10, 'contact_email', 'info@splash25.com', 'Primary contact email', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (11, 'contact_phone', '+91-9447-SPLASH', 'Primary contact phone', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (12, 'early_bird_discount', '15', 'Early bird discount percentage', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (13, 'max_seller_attendees_per_day', '230', 'Maximum seller attendees per day', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (14, 'max_buyer_meetings_per_day', '30', 'Maximum buyer meetings per day', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000'),
    (15, 'travel_plans_enabled', 'true', 'Enable/disable travel plans functionality', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:00.000000');

-- Table: migration_log (8 records)
INSERT INTO migration_log (id, step_name, status, message, started_at, completed_at, duration_seconds) VALUES
    (1, 'schema_consolidation', 'completed', 'Database schema consolidated from 53 to 28 tables', '2025-06-03T03:10:00.000000', '2025-06-03T03:10:15.000000', 15),
    (2, 'transportation_types_merge', 'completed', 'Transportation types migration merged', '2025-06-03T03:10:15.000000', '2025-06-03T03:10:25.000000', 10),
    (3, 'data_consolidation', 'completed', 'Legacy data consolidated', '2025-06-03T03:10:25.000000', '2025-06-03T03:10:35.000000', 10),
    (4, 'model_synchronization', 'completed', 'Python models synchronized', '2025-06-03T03:10:35.000000', '2025-06-03T03:10:50.000000', 15),
    (5, 'clean_deployment', 'completed', 'Clean schema deployed successfully', '2025-06-03T03:10:50.000000', '2025-06-03T03:11:00.000000', 10),
    (6, 'comprehensive_data_load', 'completed', 'Comprehensive mock data loaded', '2025-06-03T03:11:00.000000', '2025-06-03T03:12:00.000000', 60),
    (7, 'foreign_key_validation', 'completed', 'All foreign key relationships validated', '2025-06-03T03:12:00.000000', '2025-06-03T03:12:10.000000', 10),
    (8, 'sequence_update', 'completed', 'All sequence values updated', '2025-06-03T03:12:10.000000', '2025-06-03T03:12:15.000000', 5);

-- =============================================================================
-- PHASE 2: USER MANAGEMENT & AUTHENTICATION
-- =============================================================================

-- Table: users (25 records)
INSERT INTO users (id, username, email, password_hash, role, created_at, business_name, business_description, is_verified) VALUES
    -- Buyers (15 records)
    (1, 'rajesh.kumar', 'rajesh.kumar@wanderlust.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Wanderlust Travels', 'Premium travel experiences', TRUE),
    (2, 'priya.sharma', 'priya.sharma@dreamtravel.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Dream Travel Solutions', 'Customized travel packages', TRUE),
    (3, 'amit.patel', 'amit.patel@explorindia.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Explor India Tours', 'Authentic Indian experiences', TRUE),
    (4, 'sunita.reddy', 'sunita.reddy@southtours.co.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'South India Tours', 'South Indian destinations', TRUE),
    (5, 'kavya.nair', 'kavya.nair@keralatours.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Kerala Tours', 'Kerala travel specialists', TRUE),
    (6, 'vikram.singh', 'vikram.singh@adventuretours.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Adventure Tours India', 'Adventure and outdoor experiences', TRUE),
    (7, 'anita.gupta', 'anita.gupta@luxurytravel.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Luxury Travel Concierge', 'Bespoke luxury travel', TRUE),
    (8, 'rohit.mehta', 'rohit.mehta@corporatetravel.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Corporate Travel Solutions', 'Business travel and MICE', TRUE),
    (9, 'deepika.joshi', 'deepika.joshi@familyholidays.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Family Holidays India', 'Family-friendly travel', TRUE),
    (10, 'arjun.krishna', 'arjun.krishna@backpackersindia.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Backpackers India', 'Budget travel for explorers', TRUE),
    (11, 'meera.iyer', 'meera.iyer@spiritualjourney.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Spiritual Journey Tours', 'Pilgrimage and spiritual travel', TRUE),
    (12, 'karthik.rao', 'karthik.rao@ecotourism.co.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Eco Tourism India', 'Sustainable and responsible travel', TRUE),
    (13, 'pooja.agarwal', 'pooja.agarwal@weddingtravel.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Wedding Travel Planners', 'Destination weddings', TRUE),
    (14, 'sanjay.verma', 'sanjay.verma@heritagetours.com', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Heritage Tours India', 'Cultural heritage tours', TRUE),
    (15, 'ritu.malhotra', 'ritu.malhotra@wellnesstravel.in', '$2b$12$dummy.hash.for.testing.only', 'buyer', '2025-06-03T03:10:00.000000', 'Wellness Travel India', 'Health and wellness tours', TRUE),
    
    -- Sellers (8 records)
    (21, 'suresh.nair', 'suresh.nair@backwaterbliss.com', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Backwater Bliss Resort', 'Luxury backwater resort', TRUE),
    (22, 'lakshmi.pillai', 'lakshmi.pillai@spicegardenretreat.com', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Spice Garden Retreat', 'Eco-friendly spice plantation retreat', TRUE),
    (23, 'ravi.kumar', 'ravi.kumar@coconutgrovehomestay.in', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Coconut Grove Homestay', 'Traditional Kerala homestay', TRUE),
    (24, 'meera.menon', 'meera.menon@mistymountainresort.com', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Misty Mountain Resort', 'Hill station resort', TRUE),
    (25, 'thomas.joseph', 'thomas.joseph@wildlifesanctuary.in', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Wildlife Sanctuary Lodge', 'Eco-lodge near wildlife sanctuary', TRUE),
    (26, 'priya.nambiar', 'priya.nambiar@ayurvedaretreat.com', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Ayurveda Wellness Retreat', 'Authentic Ayurvedic treatments', TRUE),
    (27, 'rajesh.varma', 'rajesh.varma@heritagepalace.in', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Heritage Palace Hotel', 'Restored heritage property', TRUE),
    (28, 'sarah.thomas', 'sarah.thomas@adventurecamp.co.in', '$2b$12$dummy.hash.for.testing.only', 'seller', '2025-06-03T03:10:00.000000', 'Adventure Camp Wayanad', 'Outdoor adventure activities', TRUE),
    
    -- Admins (2 records)
    (31, 'admin', 'admin@splash25.com', '$2b$12$dummy.hash.for.testing.only', 'admin', '2025-06-03T03:10:00.000000', NULL, NULL, TRUE),
    (32, 'super.admin', 'superadmin@splash25.com', '$2b$12$dummy.hash.for.testing.only', 'admin', '2025-06-03T03:10:00.000000', NULL, NULL, TRUE);

-- =============================================================================
-- PHASE 3: BUYER ECOSYSTEM
-- =============================================================================

-- Table: buyer_profiles (15 records)
INSERT INTO buyer_profiles (id, user_id, name, organization, designation, operator_type, 
    salutation, first_name, last_name, email, mobile, gst, website, instagram,
    address, city, state, pincode, country,
    year_of_starting_business, start_year, property_interest_1, property_interest_2, 
    selling_wayanad, sell_wayanad, sell_wayanad_year, since_when,
    previous_visit, previous_stay_property, why_visit,
    interests, properties_of_interest, bio,
    category_id, vip, status, created_at) VALUES
    (1, 1, 'Rajesh Kumar', 'Wanderlust Travels', 'CEO', 'Tour Operator', 'Mr.', 'Rajesh', 'Kumar', 'rajesh.kumar@wanderlust.com', '+91-9876543210', '29ABCDE1234F1Z5', 'www.wanderlust.com', '@wanderlustindia', '123 MG Road, Bangalore', 'Bangalore', 'Karnataka', '560001', 'India', 2015, 2015, 'Luxury Resorts', 'Adventure Activities', TRUE, TRUE, 2020, 2020, TRUE, 'Backwater Bliss Resort', 'Expanding portfolio', '["Adventure", "Luxury Travel"]', '["Premium Resort"]', 'Travel entrepreneur', 1, TRUE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (2, 2, 'Priya Sharma', 'Dream Travel Solutions', 'MD', 'Travel Agent', 'Ms.', 'Priya', 'Sharma', 'priya.sharma@dreamtravel.in', '+91-9876543211', '19FGHIJ5678K2L6', 'www.dreamtravel.in', '@dreamtravelindia', '456 Park Street, Kolkata', 'Kolkata', 'West Bengal', '700016', 'India', 2012, 2012, 'Heritage Hotels', 'Cultural Experiences', TRUE, TRUE, 2018, 2018, TRUE, 'Heritage Palace Hotel', 'Cultural tourism specialist', '["Culture", "Heritage"]', '["Heritage Property"]', 'Cultural tourism expert', 1, TRUE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (3, 3, 'Amit Patel', 'Explor India Tours', 'MD', 'DMC', 'Mr.', 'Amit', 'Patel', 'amit.patel@explorindia.com', '+91-9876543212', '27MNOPQ9012R3S7', 'www.explorindia.com', '@explorindia', '789 FC Road, Pune', 'Pune', 'Maharashtra', '411005', 'India', 2018, 2018, 'Eco Resorts', 'Wildlife Lodges', TRUE, TRUE, 2022, 2022, FALSE, NULL, 'Eco-tourism opportunities', '["Eco Tourism", "Wildlife"]', '["Eco Lodge"]', 'Sustainable tourism advocate', 2, FALSE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (4, 4, 'Sunita Reddy', 'South India Tours', 'CEO', 'Tour Operator', 'Mrs.', 'Sunita', 'Reddy', 'sunita.reddy@southtours.co.in', '+91-9876543213', '36TUVWX3456Y4Z8', 'www.southtours.co.in', '@southindiatours', '321 Jubilee Hills, Hyderabad', 'Hyderabad', 'Telangana', '500033', 'India', 2010, 2010, 'Beach Resorts', 'Backwater Stays', TRUE, TRUE, 2015, 2015, TRUE, 'Coconut Grove Homestay', 'South India expansion', '["Family Holidays", "Culture"]', '["Homestay"]', 'South India expert', 2, FALSE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (5, 5, 'Kavya Nair', 'Kerala Tours', 'Operations Head', 'DMC', 'Ms.', 'Kavya', 'Nair', 'kavya.nair@keralatours.in', '+91-9876543215', '32HIJKL2345M6N0', 'www.keralatours.in', '@keralatours', '987 Marine Drive, Kochi', 'Kochi', 'Kerala', '682031', 'India', 2014, 2014, 'Homestays', 'Houseboat Stays', TRUE, TRUE, 2019, 2019, TRUE, 'Spice Garden Retreat', 'Local partnerships', '["Agritourism", "Culture"]', '["Homestay"]', 'Kerala native expert', 3, FALSE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (6, 6, 'Vikram Singh', 'Adventure Tours India', 'Founder', 'Adventure Operator', 'Mr.', 'Vikram', 'Singh', 'vikram.singh@adventuretours.com', '+91-9876543216', '07PQRST7890U5V1', 'www.adventuretours.com', '@adventuretoursindia', '654 Connaught Place, Delhi', 'New Delhi', 'Delhi', '110001', 'India', 2016, 2016, 'Adventure Camps', 'Trekking Lodges', FALSE, FALSE, NULL, NULL, FALSE, NULL, 'Adventure opportunities', '["Adventure", "Nature"]', '["Eco Lodge"]', 'Adventure specialist', 2, FALSE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (7, 7, 'Anita Gupta', 'Luxury Travel Concierge', 'CEO', 'Luxury Specialist', 'Ms.', 'Anita', 'Gupta', 'anita.gupta@luxurytravel.in', '+91-9876543217', '09WXYZ12345A6B2', 'www.luxurytravel.in', '@luxurytravelindia', '321 Altamount Road, Mumbai', 'Mumbai', 'Maharashtra', '400006', 'India', 2013, 2013, 'Luxury Resorts', 'Private Villas', TRUE, TRUE, 2017, 2017, TRUE, 'Misty Mountain Resort', 'Luxury experiences', '["Luxury Travel", "Wellness"]', '["Premium Resort"]', 'Luxury curator', 1, TRUE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (8, 8, 'Rohit Mehta', 'Corporate Travel Solutions', 'Director', 'Corporate Agent', 'Mr.', 'Rohit', 'Mehta', 'rohit.mehta@corporatetravel.com', '+91-9876543218', '11CDEFG6789H7I3', 'www.corporatetravel.com', '@corporatetravelindia', '789 Cyber City, Gurgaon', 'Gurgaon', 'Haryana', '122002', 'India', 2011, 2011, 'Conference Venues', 'Corporate Retreats', FALSE, FALSE, NULL, NULL, FALSE, NULL, 'Corporate venues', '["MICE", "Corporate Events"]', '["Premium Resort"]', 'MICE specialist', 2, FALSE, 'confirmed', '2025-06-03T03:10:00.000000'),
    (9, 9, 'Deepika Joshi', 'Family Holidays India', 'CEO', 'Family Specialist', 'Mrs.', 'Deepika', 'Joshi', 'deepika.joshi@familyholidays.in', '+91-9876543219', '20IJKLM3456N8O4', 'www.familyholidays.in', '@familyholidaysindia', '456 Koregaon Park, Pune', 'Pune', 'Maharashtra', '411001', 'India', 2017, 2017, 'Family Resorts', 'Kid-Friendly Properties', TRUE, TRUE, 2021, 2021, TRUE, 'Coconut Grove Homestay', 'Family experiences', '["Family Holidays", "Culture"]', '["Homestay"]', 'Family vacation expert', 2, FALSE,
