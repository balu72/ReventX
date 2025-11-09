-- ============================================================================
-- Splash25 Synthetic Data Generator (Schema-Matched Version)
-- Generates test data for 10,000 buyers and 5,000 sellers
-- Matches actual database schema from staging dump
-- ============================================================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================================
-- SECTION 0: CLEANUP EXISTING DATA
-- ============================================================================

DO $$
BEGIN
    TRUNCATE TABLE 
        access_log,
        accommodations,
        transportation,
        travel_plans,
        meetings,
        time_slots,
        stall_inventory,
        seller_target_markets,
        seller_attendees,
        seller_stall,
        seller_references,
        seller_financial_info,
        seller_business_info,
        seller_profiles,
        buyer_profile_interests,
        buyer_references,
        buyer_financial_info,
        buyer_business_info,
        buyer_profiles,
        invited_buyers,
        pending_buyers,
        domain_restrictions,
        users
    CASCADE;
    
    RAISE NOTICE 'Existing transaction data cleared. Starting synthetic data generation...';
END $$;

-- ============================================================================
-- SECTION 1: MASTER DATA
-- ============================================================================

-- Buyer Categories
INSERT INTO buyer_categories (id, name) VALUES
(1, 'Tour Operators'),
(2, 'Travel Agents'),
(3, 'Corporate Travel'),
(4, 'Online Travel Agencies'),
(5, 'DMCs'),
(6, 'MICE Organizers')
ON CONFLICT (id) DO NOTHING;

-- Interests
INSERT INTO interests (id, name) VALUES
(1, 'Beach Destinations'),
(2, 'Adventure Tourism'),
(3, 'Cultural Tours'),
(4, 'Wildlife & Nature'),
(5, 'Luxury Travel'),
(6, 'Budget Travel'),
(7, 'Wellness Tourism'),
(8, 'Religious Tourism'),
(9, 'MICE'),
(10, 'Cruise Tourism'),
(11, 'Eco Tourism'),
(12, 'Sports Tourism'),
(13, 'Medical Tourism')
ON CONFLICT (id) DO NOTHING;

-- Property Types
INSERT INTO property_types (id, name) VALUES
(1, 'Hotel'),
(2, 'Resort'),
(3, 'Homestay'),
(4, 'Guest House'),
(5, 'Hostel'),
(6, 'Apartment')
ON CONFLICT (id) DO NOTHING;

-- Stall Types
INSERT INTO stall_types (id, name, size_sqft) VALUES
(1, 'Small', 100),
(2, 'Medium', 200),
(3, 'Large', 300),
(4, 'Premium', 400),
(5, 'Corner', 250),
(6, 'Island', 500),
(7, 'Peninsula', 350),
(8, 'Double-Decker', 600),
(9, 'Standard', 150),
(10, 'VIP', 800)
ON CONFLICT (id) DO NOTHING;

-- Transport Types
INSERT INTO transport_types (transport_type_id, transport_type_name) VALUES
(1, 'Flight'),
(2, 'Train'),
(3, 'Bus'),
(4, 'Self Drive'),
(5, 'Taxi'),
(6, 'Private Vehicle'),
(7, 'Rental Car'),
(8, 'Shared Shuttle'),
(9, 'Metro'),
(10, 'Ferry')
ON CONFLICT (transport_type_id) DO NOTHING;

-- Host Properties
INSERT INTO host_properties (property_id, property_name, rooms_allotted, contact_person_name, contact_phone, contact_email, property_address) VALUES
(1, 'Grand Hotel', 150, 'John Manager', '+91-9876543210', 'john@grandhotel.com', '123 Downtown Street, Mumbai'),
(2, 'Beach Resort', 100, 'Sarah Manager', '+91-9876543211', 'sarah@beachresort.com', '456 Beachfront Road, Goa'),
(3, 'City Inn', 80, 'Mike Manager', '+91-9876543212', 'mike@cityinn.com', '789 City Center, Delhi'),
(4, 'Mountain Lodge', 60, 'Emma Manager', '+91-9876543213', 'emma@mountainlodge.com', '321 Hill Station, Shimla'),
(5, 'Budget Stay', 40, 'Tom Manager', '+91-9876543214', 'tom@budgetstay.com', '654 Airport Area, Bangalore')
ON CONFLICT (property_id) DO NOTHING;

-- System Settings
INSERT INTO system_settings (id, key, value, description) VALUES
(1, 'event_name', 'Splash 2025', 'Event name'),
(2, 'event_start_date', '2025-01-15', 'Event start date'),
(3, 'event_end_date', '2025-01-17', 'Event end date'),
(4, 'registration_open', 'true', 'Registration status'),
(5, 'meeting_duration', '30', 'Default meeting duration in minutes'),
(6, 'max_meetings_per_buyer', '20', 'Maximum meetings per buyer'),
(7, 'max_meetings_per_seller', '30', 'Maximum meetings per seller'),
(8, 'meeting_buffer_time', '5', 'Buffer time between meetings in minutes'),
(9, 'event_location', 'Mumbai, India', 'Event location'),
(10, 'contact_email', 'info@splash2025.com', 'Contact email')
ON CONFLICT (id) DO NOTHING;

-- ============================================================================
-- SECTION 2: SYNTHETIC USER GENERATION
-- ============================================================================

-- Function to generate random Indian phone numbers
CREATE OR REPLACE FUNCTION generate_phone() RETURNS VARCHAR AS $$
BEGIN
    RETURN '+91-' || (6 + floor(random() * 4))::text || 
           (floor(random() * 1000000000))::text;
END;
$$ LANGUAGE plpgsql;

-- Function to generate random email
CREATE OR REPLACE FUNCTION generate_email(prefix TEXT, domain TEXT) RETURNS VARCHAR AS $$
BEGIN
    RETURN lower(prefix) || (floor(random() * 100000))::text || '@' || domain;
END;
$$ LANGUAGE plpgsql;

-- Generate 10,000 Buyers
DO $$
DECLARE
    buyer_count INTEGER := 10000;
    i INTEGER;
    user_id INTEGER;
    first_names TEXT[] := ARRAY['Amit', 'Priya', 'Rahul', 'Sneha', 'Vikram', 'Anjali', 'Rajesh', 'Pooja', 'Arjun', 'Kavita', 
                                  'Suresh', 'Meera', 'Anil', 'Deepa', 'Karan', 'Nisha', 'Ravi', 'Sonia', 'Manoj', 'Rina'];
    last_names TEXT[] := ARRAY['Sharma', 'Verma', 'Kumar', 'Singh', 'Patel', 'Gupta', 'Reddy', 'Joshi', 'Nair', 'Iyer',
                                'Mehta', 'Shah', 'Desai', 'Rao', 'Menon', 'Pillai', 'Kulkarni', 'Mishra', 'Pandey', 'Chauhan'];
    companies TEXT[] := ARRAY['Travels', 'Tours', 'Holidays', 'Vacations', 'Journeys', 'Adventures', 'Expeditions', 'Getaways', 'Trips', 'Excursions'];
    cities TEXT[] := ARRAY['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata', 'Pune', 'Ahmedabad', 'Jaipur', 'Lucknow'];
    states TEXT[] := ARRAY['Maharashtra', 'Delhi', 'Karnataka', 'Telangana', 'Tamil Nadu', 'West Bengal', 'Maharashtra', 'Gujarat', 'Rajasthan', 'Uttar Pradesh'];
    category_id INTEGER;
    first_name TEXT;
    last_name TEXT;
    email TEXT;
    phone TEXT;
    company TEXT;
    city TEXT;
    state TEXT;
BEGIN
    FOR i IN 1..buyer_count LOOP
        -- Generate random buyer data
        first_name := first_names[1 + floor(random() * array_length(first_names, 1))];
        last_name := last_names[1 + floor(random() * array_length(last_names, 1))];
        email := generate_email(lower(first_name || last_name), 'buyer' || (i % 20 + 1)::text || '.com');
        phone := generate_phone();
        company := first_name || ' ' || companies[1 + floor(random() * array_length(companies, 1))];
        city := cities[1 + floor(random() * array_length(cities, 1))];
        state := states[1 + floor(random() * array_length(states, 1))];
        category_id := 1 + floor(random() * 6);
        
        -- Insert user
        INSERT INTO users (username, email, password_hash, role, is_verified, created_at)
        VALUES (
            lower(first_name || last_name || i::text),
            email,
            crypt('Password@123', gen_salt('bf')),
            'buyer',
            true,
            NOW() - (random() * interval '90 days')
        )
        RETURNING id INTO user_id;
        
        -- Insert buyer profile
        INSERT INTO buyer_profiles (
            id, first_name, last_name, email, mobile, company_name, designation,
            address, city, state, country, pincode, category_id,
            is_verified, created_at
        ) VALUES (
            user_id,
            first_name,
            last_name,
            email,
            phone,
            company,
            CASE floor(random() * 5)
                WHEN 0 THEN 'Director'
                WHEN 1 THEN 'Manager'
                WHEN 2 THEN 'Senior Executive'
                WHEN 3 THEN 'Executive'
                ELSE 'Consultant'
            END,
            (floor(random() * 500) + 1)::text || ', ' || 
            (ARRAY['MG Road', 'Park Street', 'Main Road', 'Station Road', 'Market Road'])[1 + floor(random() * 5)],
            city,
            state,
            'India',
            (110000 + floor(random() * 90000))::text,
            category_id,
            true,
            NOW() - (random() * interval '90 days')
        );
        
        -- Insert buyer business info
        INSERT INTO buyer_business_info (
            buyer_id, gst_number, pan_number, business_type, annual_turnover,
            years_in_business, number_of_employees, website, created_at
        ) VALUES (
            user_id,
            (floor(random() * 10))::text || 'ABCDE' || (floor(random() * 10000))::text || 'F1Z' || (floor(random() * 10))::text,
            'ABCDE' || (floor(random() * 10000))::text || 'F',
            CASE floor(random() * 4)
                WHEN 0 THEN 'Tour Operator'
                WHEN 1 THEN 'Travel Agent'
                WHEN 2 THEN 'DMC'
                ELSE 'OTA'
            END,
            (1000000 + floor(random() * 49000000))::numeric,
            (1 + floor(random() * 25))::integer,
            (5 + floor(random() * 195))::integer,
            'www.' || lower(replace(company, ' ', '')) || '.com',
            NOW() - (random() * interval '90 days')
        );
        
        -- Add random interests (1-5 interests per buyer)
        INSERT INTO buyer_profile_interests (buyer_profile_id, interest_id)
        SELECT user_id, interest_id
        FROM (
            SELECT DISTINCT (1 + floor(random() * 13))::integer as interest_id
            FROM generate_series(1, 1 + floor(random() * 5)::integer)
        ) interests;
        
    END LOOP;
    
    RAISE NOTICE '10,000 buyers created successfully';
END $$;

-- Generate 5,000 Sellers
DO $$
DECLARE
    seller_count INTEGER := 5000;
    i INTEGER;
    user_id INTEGER;
    property_names TEXT[] := ARRAY['Grand', 'Royal', 'Imperial', 'Paradise', 'Golden', 'Silver', 'Taj', 'Crown', 'Palace', 'Heritage'];
    property_suffixes TEXT[] := ARRAY['Hotel', 'Resort', 'Inn', 'Lodge', 'Suites', 'Palace', 'Retreat', 'Manor', 'Villa', 'Residency'];
    destinations TEXT[] := ARRAY['Goa', 'Kerala', 'Rajasthan', 'Himachal', 'Uttarakhand', 'Karnataka', 'Maharashtra', 'Tamil Nadu', 'Kashmir', 'Sikkim'];
    cities TEXT[] := ARRAY['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata', 'Pune', 'Ahmedabad', 'Jaipur', 'Lucknow'];
    states TEXT[] := ARRAY['Maharashtra', 'Delhi', 'Karnataka', 'Telangana', 'Tamil Nadu', 'West Bengal', 'Maharashtra', 'Gujarat', 'Rajasthan', 'Uttar Pradesh'];
    first_names TEXT[] := ARRAY['Amit', 'Priya', 'Rahul', 'Sneha', 'Vikram', 'Anjali', 'Rajesh', 'Pooja', 'Arjun', 'Kavita'];
    last_names TEXT[] := ARRAY['Sharma', 'Verma', 'Kumar', 'Singh', 'Patel', 'Gupta', 'Reddy', 'Joshi', 'Nair', 'Iyer'];
    property_name TEXT;
    destination TEXT;
    email TEXT;
    phone TEXT;
    city TEXT;
    state TEXT;
    first_name TEXT;
    last_name TEXT;
    property_type_id INTEGER;
BEGIN
    FOR i IN 1..seller_count LOOP
        -- Generate random seller data
        first_name := first_names[1 + floor(random() * array_length(first_names, 1))];
        last_name := last_names[1 + floor(random() * array_length(last_names, 1))];
        property_name := property_names[1 + floor(random() * array_length(property_names, 1))] || ' ' ||
                        property_suffixes[1 + floor(random() * array_length(property_suffixes, 1))];
        destination := destinations[1 + floor(random() * array_length(destinations, 1))];
        email := generate_email(lower(replace(property_name, ' ', '')), 'hotel' || (i % 20 + 1)::text || '.com');
        phone := generate_phone();
        city := cities[1 + floor(random() * array_length(cities, 1))];
        state := states[1 + floor(random() * array_length(states, 1))];
        property_type_id := 1 + floor(random() * 6);
        
        -- Insert user
        INSERT INTO users (username, email, password_hash, role, is_verified, created_at)
        VALUES (
            lower(replace(property_name, ' ', '') || i::text),
            email,
            crypt('Password@123', gen_salt('bf')),
            'seller',
            true,
            NOW() - (random() * interval '90 days')
        )
        RETURNING id INTO user_id;
        
        -- Insert seller profile
        INSERT INTO seller_profiles (
            id, property_name, property_type_id, destination, contact_person_name,
            contact_person_email, contact_person_mobile, address, city, state, country,
            pincode, total_rooms, star_rating, established_year, description,
            is_verified, created_at
        ) VALUES (
            user_id,
            property_name,
            property_type_id,
            destination,
            first_name || ' ' || last_name,
            email,
            phone,
            (floor(random() * 500) + 1)::text || ', ' || destination || ' Road',
            city,
            state,
            'India',
            (110000 + floor(random() * 90000))::text,
            (10 + floor(random() * 490))::integer,
            (1 + floor(random() * 5))::integer,
            (1990 + floor(random() * 33))::integer,
            'Premium ' || property_name || ' located in ' || destination || ' offering world-class amenities and services.',
            true,
            NOW() - (random() * interval '90 days')
        );
        
        -- Insert seller business info
        INSERT INTO seller_business_info (
            seller_id, gst_number, pan_number, license_number, website,
            facebook, instagram, tripadvisor_rating, created_at
        ) VALUES (
            user_id,
            (floor(random() * 10))::text || 'ABCDE' || (floor(random() * 10000))::text || 'F1Z' || (floor(random() * 10))::text,
            'ABCDE' || (floor(random() * 10000))::text || 'F',
            'LIC-' || (floor(random() * 100000))::text,
            'www.' || lower(replace(property_name, ' ', '')) || destination || '.com',
            'facebook.com/' || lower(replace(property_name, ' ', '')),
            'instagram.com/' || lower(replace(property_name, ' ', '')),
            (3.0 + random() * 2.0)::numeric(3,1),
            NOW() - (random() * interval '90 days')
        );
        
        -- Add seller target markets (1-4 markets per seller)
        INSERT INTO seller_target_markets (seller_id, market_name)
        SELECT user_id, market
        FROM (
            SELECT DISTINCT 
                (ARRAY['Domestic', 'International', 'MICE', 'Leisure', 'Corporate', 'Luxury', 'Budget', 'Adventure'])[1 + floor(random() * 8)] as market
            FROM generate_series(1, 1 + floor(random() * 4)::integer)
        ) markets;
        
    END LOOP;
    
    RAISE NOTICE '5,000 sellers created successfully';
END $$;

-- ============================================================================
-- SECTION 3: STALL INVENTORY
-- ============================================================================

-- Generate stall inventory
INSERT INTO stall_inventory (stall_number, stall_type_id, allow_seller_selection, is_allocated, created_at)
SELECT 
    'S-' || LPAD(i::text, 4, '0'),
    (1 + floor(random() * 10))::integer,
    true,
    i <= 3000,  -- First 3000 stalls are allocated
    NOW() - (random() * interval '90 days')
FROM generate_series(1, 5000) i;

-- ============================================================================
-- SECTION 4: TIME SLOTS
-- ============================================================================

-- Generate time slots for sellers (each seller gets slots for event dates)
DO $$
DECLARE
    seller_rec RECORD;
    slot_date DATE;
    slot_hour INTEGER;
    slot_minute INTEGER;
BEGIN
    FOR seller_rec IN 
        SELECT id FROM users WHERE role = 'seller' LIMIT 5000
    LOOP
        -- Create time slots for Jan 15-17, 2025 (9 AM to 6 PM)
        FOR slot_date IN 
            SELECT generate_series('2025-01-15'::date, '2025-01-17'::date, '1 day')::date
        LOOP
            FOR slot_hour IN 9..17 LOOP
                FOR slot_minute IN 0..30 BY 30 LOOP
                    IF NOT (slot_hour = 17 AND slot_minute = 30) THEN
                        INSERT INTO time_slots (user_id, start_time, end_time, is_available, created_at)
                        VALUES (
                            seller_rec.id,
                            (slot_date + (slot_hour || ' hours')::interval + (slot_minute || ' minutes')::interval),
                            (slot_date + (slot_hour || ' hours')::interval + ((slot_minute + 30) || ' minutes')::interval),
                            true,
                            NOW()
                        );
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
    END LOOP;
    
    RAISE NOTICE 'Time slots created for sellers';
END $$;

-- ============================================================================
-- SECTION 5: MEETINGS
-- ============================================================================

-- Generate sample meetings (~10,000 meetings)
DO $$
DECLARE
    i INTEGER;
    buyer_id INTEGER;
    seller_id INTEGER;
    meeting_date DATE;
    meeting_time TIME;
    timeslot_id INTEGER;
BEGIN
    FOR i IN 1..10000 LOOP
        -- Select random buyer and seller
        SELECT id INTO buyer_id FROM users WHERE role = 'buyer' ORDER BY random() LIMIT 1;
        SELECT id INTO seller_id FROM users WHERE role = 'seller' ORDER BY random() LIMIT 1;
        
        -- Random meeting date and time
        meeting_date := ('2025-01-' || (15 + floor(random() * 3))::text)::date;
        meeting_time := ('09:00:00'::time + (floor(random() * 17) * interval '30 minutes'));
        
        -- Find a time slot
        SELECT id INTO timeslot_id 
        FROM time_slots 
        WHERE user_id = seller_id 
          AND DATE(start_time) = meeting_date 
          AND start_time::time = meeting_time
          AND is_available = true
        LIMIT 1;
        
        IF timeslot_id IS NOT NULL THEN
            INSERT INTO meetings (
                buyer_id, seller_id, time_slot_id, meeting_date, meeting_time,
                status, notes, created_at
            ) VALUES (
                buyer_id,
                seller_id,
                timeslot_id,
                meeting_date,
                meeting_time,
                (ARRAY['scheduled', 'confirmed', 'completed', 'cancelled'])[1 + floor(random() * 4)],
                CASE WHEN random() > 0.7 THEN 'Interested in ' || (ARRAY['packages', 'rates', 'availability', 'contracts', 'special offers'])[1 + floor(random() * 5)] ELSE NULL END,
                NOW() - (random() * interval '30 days')
            );
            
            -- Mark time slot as unavailable
            UPDATE time_slots SET is_available = false WHERE id = timeslot_id;
        END IF;
    END LOOP;
    
    RAISE NOTICE 'Meetings created successfully';
END $$;

-- ============================================================================
-- SECTION 6: TRAVEL PLANS
-- ============================================================================

-- Generate travel plans for buyers (60% of buyers)
INSERT INTO travel_plans (
    user_id, event_name, event_start_date, event_end_date, venue, status, created_at
)
SELECT 
    id,
    'Splash 2025',
    '2025-01-15'::date,
    '2025-01-17'::date,
    'Mumbai, India',
    (ARRAY['confirmed', 'pending', 'completed'])[1 + floor(random() * 3)],
    NOW() - (random() * interval '60 days')
FROM users 
WHERE role = 'buyer' AND random() < 0.6;

-- Generate transportation details
INSERT INTO transportation (
    travel_plan_id, type, 
    outbound_carrier, outbound_number, outbound_departure_location, 
    outbound_departure_datetime, outbound_arrival_location, outbound_arrival_datetime,
    outbound_booking_reference,
    return_carrier, return_number, return_departure_location,
    return_departure_datetime, return_arrival_location, return_arrival_datetime,
    return_booking_reference
)
SELECT 
    tp.id,
    (ARRAY['Flight', 'Train', 'Bus'])[1 + floor(random() * 3)],
    CASE floor(random() * 5)
        WHEN 0 THEN 'Air India'
        WHEN 1 THEN 'IndiGo'
        WHEN 2 THEN 'SpiceJet'
        WHEN 3 THEN 'Vistara'
        ELSE 'Indian Railways'
    END,
    'FL' || (floor(random() * 9000) + 1000)::text,
    (ARRAY['Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata'])[1 + floor(random() * 5)],
    '2025-01-14 ' || ((6 + floor(random() * 12))::text || ':00:00'),
    'Mumbai',
    '2025-01-14 ' || ((10 + floor(random() * 12))::text || ':00:00'),
    'BKG-' || (floor(random() * 1000000))::text,
    CASE floor(random() * 5)
        WHEN 0 THEN 'Air India'
        WHEN 1 THEN 'IndiGo'
        WHEN 2 THEN 'SpiceJet'
        WHEN 3 THEN 'Vistara'
        ELSE 'Indian Railways'
    END,
    'FL' || (floor(random() * 9000) + 1000)::text,
    'Mumbai',
    '2025-01-18 ' || ((6 + floor(random() * 12))::text || ':00:00'),
    (ARRAY['Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata'])[1 + floor(random() * 5)],
    '2025-01-18 ' || ((10 + floor(random() * 12))::text || ':00:00'),
    'BKG-' || (floor(random() * 1000000))::text
FROM travel_plans tp;

-- Generate accommodation bookings
INSERT INTO accommodations (
    travel_plan_id, host_property_id, buyer_id,
    check_in_datetime, check_out_datetime,
    room_type, booking_reference, created_at
)
SELECT 
    tp.id,
    (1 + floor(random() * 5))::integer,
    tp.user_id,
    '2025-01-14 14:00:00'::timestamp,
    '2025-01-18 11:00:00'::timestamp,
    (ARRAY['Standard', 'Deluxe', 'Suite', 'Executive', 'Premium'])[1 + floor(random() * 5)],
    'ROOM-' || (floor(random() * 1000000))::text,
    NOW() - (random() * interval '60 days')
FROM travel_plans tp;

-- ============================================================================
-- SECTION 7: CLEANUP
-- ============================================================================

-- Drop temporary functions
DROP FUNCTION IF EXISTS generate_phone();
DROP FUNCTION IF EXISTS generate_email(TEXT, TEXT);

-- Update sequences
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('buyer_profiles_id_seq', (SELECT MAX(id) FROM buyer_profiles));
SELECT setval('seller_profiles_id_seq', (SELECT MAX(id) FROM seller_profiles));
SELECT setval('meetings_id_seq', (SELECT MAX(id) FROM meetings));
SELECT setval('time_slots_id_seq', (SELECT MAX(id) FROM time_slots));
SELECT setval('stall_inventory_id_seq', (SELECT MAX(id) FROM stall_inventory));
SELECT setval('travel_plans_id_seq', (SELECT MAX(id) FROM travel_plans));

-- ============================================================================
-- SUMMARY
-- ============================================================================

DO $$
DECLARE
    buyer_count INTEGER;
    seller_count INTEGER;
    meeting_count INTEGER;
    timeslot_count INTEGER;
    travel_plan_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO buyer_count FROM users WHERE role = 'buyer';
    SELECT COUNT(*) INTO seller_count FROM users WHERE role = 'seller';
    SELECT COUNT(*) INTO meeting_count FROM meetings;
    SELECT COUNT(*) INTO timeslot_count FROM time_slots;
    SELECT COUNT(*) INTO travel_plan_count FROM travel_plans;
    
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Synthetic Data Generation Complete!';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Buyers Created: %', buyer_count;
    RAISE NOTICE 'Sellers Created: %', seller_count;
    RAISE NOTICE 'Meetings Created: %', meeting_count;
    RAISE NOTICE 'Time Slots Created: %', timeslot_count;
    RAISE NOTICE 'Travel Plans Created: %', travel_plan_count;
    RAISE NOTICE 'Stalls Created: 5000';
    RAISE NOTICE '========================================';
END $$;
