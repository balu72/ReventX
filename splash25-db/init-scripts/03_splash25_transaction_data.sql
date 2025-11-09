--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.users VALUES (1, 'rajesh.kumar', 'rajesh.kumar@wanderlust.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Wanderlust Travels Pvt Ltd', NULL, true);
INSERT INTO public.users VALUES (2, 'priya.sharma', 'priya.sharma@dreamtravel.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Dream Travel Solutions', NULL, true);
INSERT INTO public.users VALUES (3, 'amit.patel', 'amit.patel@explorindia.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Explor India Tours', NULL, true);
INSERT INTO public.users VALUES (4, 'sunita.reddy', 'sunita.reddy@southtours.co.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'South India Tours & Travels', NULL, true);
INSERT INTO public.users VALUES (5, 'vikram.singh', 'vikram.singh@royaljourney.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Royal Journey Travels', NULL, false);
INSERT INTO public.users VALUES (6, 'kavya.nair', 'kavya.nair@keralatours.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Kerala Tours & Holidays', NULL, true);
INSERT INTO public.users VALUES (7, 'arjun.menon', 'arjun.menon@backwaters.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Backwaters Kerala Pvt Ltd', NULL, true);
INSERT INTO public.users VALUES (8, 'deepika.iyer', 'deepika.iyer@spiceroute.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Spice Route Travels', NULL, false);
INSERT INTO public.users VALUES (9, 'rohit.gupta', 'rohit.gupta@hillstation.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Hill Station Holidays', NULL, true);
INSERT INTO public.users VALUES (10, 'ananya.das', 'ananya.das@bengaltours.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'buyer', '2025-05-26 05:27:33.842751', 'Bengal Tours & Travels', NULL, true);
INSERT INTO public.users VALUES (11, 'suresh.nair', 'suresh.nair@backwaterbliss.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Backwater Bliss Resort', NULL, true);
INSERT INTO public.users VALUES (12, 'lakshmi.pillai', 'lakshmi.pillai@spicegardenretreat.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Spice Garden Retreat', NULL, true);
INSERT INTO public.users VALUES (13, 'ravi.kumar', 'ravi.kumar@coconutgrovehomestay.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Coconut Grove Homestay', NULL, true);
INSERT INTO public.users VALUES (14, 'meera.menon', 'meera.menon@mistymountainresort.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Misty Mountain Resort', NULL, true);
INSERT INTO public.users VALUES (15, 'ayush.sharma', 'ayush.sharma@ayurvedawellness.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Ayurveda Wellness Center', NULL, true);
INSERT INTO public.users VALUES (16, 'krishnan.nambiar', 'krishnan.nambiar@heritagehouseboat.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Heritage Houseboat', NULL, true);
INSERT INTO public.users VALUES (17, 'priya.varma', 'priya.varma@cliffedgeresort.in', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Cliff Edge Resort', NULL, true);
INSERT INTO public.users VALUES (18, 'arun.thampi', 'arun.thampi@teaestatevilla.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Tea Estate Villa', NULL, true);
INSERT INTO public.users VALUES (19, 'geetha.raj', 'geetha.raj@wayanadwildresort.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Wayanad Wild Resort', NULL, true);
INSERT INTO public.users VALUES (20, 'vinod.das', 'vinod.das@beachparadisehotel.com', '$2b$12$dummy.hash.for.migration.testing.only.replace.in.production', 'seller', '2025-05-26 05:27:33.847847', 'Beach Paradise Hotel', NULL, true);
INSERT INTO public.users VALUES (34, 'debug_user_1748240249', 'debug_1748240249@test.com', '$2b$12$dummy.hash.for.testing.purposes.only', 'buyer', '2025-05-26 06:17:29.029554', NULL, NULL, false);
INSERT INTO public.users VALUES (35, 'admin', 'admin@splash25.com', '$2b$12$ut.xBuSLdq6y7vPAwx6vret2swJRBzWDdCmmXeMEVfh5LnhM1tuuS', 'admin', '2025-06-01 11:53:14.944683', NULL, NULL, false);
INSERT INTO public.users VALUES (36, 'buyer', 'buyer@example.com', '$2b$12$RV.EsFYD/M6iIxZ5u8Mb8eq/EfzWNNWJDuy1xNpMyotUxTm/2LLXO', 'buyer', '2025-06-01 11:53:15.176664', NULL, NULL, false);
INSERT INTO public.users VALUES (37, 'seller', 'seller@example.com', '$2b$12$5tj11DR4vBz8DTyUschAkuo6sdPVGxve/DUHifFdyQ7ERFvmTd/Ae', 'seller', '2025-06-01 11:53:15.38538', NULL, NULL, false);
INSERT INTO public.users VALUES (38, 'test_seller', 'test_seller@example.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'seller', '2025-06-01 12:18:23.955092', NULL, NULL, true);
INSERT INTO public.users VALUES (39, 'testadmin', 'admin@test.com', '$2b$12$gnCicXQ42vMhGN1Zpay2L.kS0B8e7CGaNj9HBWiTdWme8jq27Lv4O', 'seller', '2025-06-02 06:19:20.930059', 'Test Admin Business', '', false);
INSERT INTO public.users VALUES (40, 'testseller', 'seller@test.com', '$2b$12$VwXF.uyCWRY3H3nKaHrrbeliAt79oaTMf8aamb5mLwJNM6xMgzZba', 'seller', '2025-06-02 06:19:21.365511', 'Test Seller Business', '', false);
INSERT INTO public.users VALUES (41, 'testbuyer', 'buyer@test.com', '$2b$12$cdaQOZo2wSExSTAnA6Il0OnYuuhMwvEoRLHPiRPd5mTR3EjlpSmRO', 'buyer', '2025-06-02 06:19:21.840246', NULL, NULL, false);
INSERT INTO public.users VALUES (42, 'testuser_1748847378326', 'test_1748847378326@example.com', '$2b$12$udJewKOxFWcZ2I8pzz19DOJOfoWc/yGXdDhwKnzUunzZUQ1nm3r/a', 'buyer', '2025-06-02 06:56:18.56044', NULL, NULL, false);
INSERT INTO public.users VALUES (43, 'balu', 'gbalu72@gmail.com', '$2b$12$jnFP7RecwN4Pc6FpYCWtF.FD8wZbRnW.tFOd5Mas9pqGVqI7nbmIi', 'buyer', '2025-06-02 07:33:01.282103', NULL, NULL, false);
INSERT INTO public.users VALUES (44, 'test_buyer', 'test_buyer@gmail.com', '$2b$12$eRboqLfhNiJzFWgIPJAKM.nCLD6g3ZVewp.uafDdpZ1c/2ESXhldK', 'buyer', '2025-06-04 03:55:53.101174', NULL, NULL, false);
INSERT INTO public.users VALUES (45, 'test_seller_new', 'test_seller_new@gmail.com', '$2b$12$Ss0GAgNB6N6BU68kA2cPluFlqxQzsR3NtEkYRqYUuVmLN4845M0Ym', 'seller', '2025-06-06 06:55:59.983935', 'test_seller_new business', 'test_seller_new', false);
INSERT INTO public.users VALUES (46, 'newseller', 'newseller@test.com', '$2b$12$dummy.hash.for.testing', 'seller', '2025-06-06 07:20:11.995547', 'New Test Business', 'A brand new test business description', false);
INSERT INTO public.users VALUES (47, 'new_seller_one', 'new_seller_one@gmail.com', '$2b$12$Nr5ey/6xOGuu3nZV2xR7huuRn71gvK4uiPnYRgv4OWFoVgilrGQ46', 'seller', '2025-06-06 07:24:02.891837', 'new_seller_one', 'new_seller_one', false);
INSERT INTO public.users VALUES (48, 'test_meeting_buyer', 'test_meeting_buyer@gmail.com', '$2b$12$9Xqo3ATlNCdyR7t7ONTWj.iIc/2hOvzCBBDnpEuNtd2wQQhJf6Dwm', 'buyer', '2025-06-06 13:46:40.568816', NULL, NULL, false);
INSERT INTO public.users VALUES (49, 'test_meeting_seller', 'test_meeting_seller@gmail.com', '$2b$12$cFKD.6oIKvS/hy1fvLtN3.ghAqXsJsMN1j48tOlXTqwJ9.3SL2n3u', 'seller', '2025-06-06 13:47:25.334646', 'test_meeting_seller', 'test_meeting_seller', false);
INSERT INTO public.users VALUES (50, 'newadmin2025', 'newadmin2025@example.com', '$2b$12$Y13gr7Wv0EQOgYffYwhFvO8SkfX52Ku1MYDatkgDdd4LT6hLn8pGK', 'admin', '2025-06-08 16:25:13.520392', NULL, NULL, false);
INSERT INTO public.users VALUES (51, 'frontendtest', 'frontendtest@example.com', '$2b$12$xWGekfCywvS0EmCJKr0pJefqeZ1IFuuGRoVTlhBcBJc6B6BVMI7Em', 'admin', '2025-06-08 16:29:44.783594', NULL, NULL, false);
INSERT INTO public.users VALUES (52, 'test_admin123', 'test_admin123@gmail.com', '$2b$12$NZ6kaOGopifewMt1XEl4Kug7YEjO4HJOxLnp/CmNk.6mpkXYF9c3e', 'admin', '2025-06-08 16:57:13.804376', NULL, NULL, false);
INSERT INTO public.users VALUES (53, 'test_balu_admin', 'test_balu_admin@gmail.com', '$2b$12$EhgLZ3U3o3Kkrf0VSM8cRuldPQzFpvyiEpFA2durzPHu1Hyae5Bma', 'admin', '2025-06-08 17:00:53.781877', NULL, NULL, false);


--
-- Data for Name: travel_plans; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.travel_plans VALUES (1, 36, 'Wayanad Splash 2025', '2025-07-11', '2025-07-13', 'Wayanad Tourism organization', 'Planned', '2025-06-06 05:59:30.803528');
INSERT INTO public.travel_plans VALUES (2, 48, 'Wayanad Splash 2025', '2025-07-11', '2025-07-13', 'Wayanad Tourism organization', 'Planned', '2025-06-06 13:49:47.082784');
INSERT INTO public.travel_plans VALUES (3, 1, 'Splash25 Event', '2025-06-25', '2025-06-28', 'Wayanad, Kerala', 'active', '2025-06-21 11:37:25.029124');
INSERT INTO public.travel_plans VALUES (4, 2, 'Splash25 Event', '2025-06-25', '2025-06-28', 'Wayanad, Kerala', 'active', '2025-06-21 12:22:21.683475');
INSERT INTO public.travel_plans VALUES (5, 3, 'Splash25 Event', '2025-06-25', '2025-06-28', 'Wayanad, Kerala', 'active', '2025-06-21 15:16:18.267926');
INSERT INTO public.travel_plans VALUES (6, 9, 'Splash25 Event', '2025-06-25', '2025-06-28', 'Wayanad, Kerala', 'active', '2025-06-21 16:29:22.351926');


--
-- Data for Name: accommodations; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.accommodations VALUES (5, 3, '2025-06-21 15:00:00', '2025-06-23 11:00:00', 'single', '', 'VIP', 1, 1, '2025-06-21 12:09:14.105852', '2025-06-21 12:09:14.105853');
INSERT INTO public.accommodations VALUES (6, 1, '2025-06-22 15:00:00', '2025-06-25 11:00:00', 'shared', '', 'local', 1, 36, '2025-06-21 12:10:17.00823', '2025-06-21 12:10:17.00823');
INSERT INTO public.accommodations VALUES (7, 4, '2025-06-22 15:00:00', '2025-06-25 11:00:00', 'shared', '', 'local3', 1, 2, '2025-06-21 12:22:21.689607', '2025-06-21 12:22:21.689609');
INSERT INTO public.accommodations VALUES (8, 6, '2025-06-22 15:00:00', '2025-06-27 11:00:00', 'single', '', 'VIP', 1, 9, '2025-06-21 16:29:22.356304', '2025-06-21 16:29:22.356305');


--
-- Data for Name: buyer_category; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_category VALUES (1, 'Hosted', 5000.00, 0.00, true, true, 30, 0);
INSERT INTO public.buyer_category VALUES (2, 'Pre-reg', 0.00, 500.00, false, false, 0, 0);
INSERT INTO public.buyer_category VALUES (3, 'Media', 0.00, 0.00, false, false, 0, 0);
INSERT INTO public.buyer_category VALUES (4, 'Blogger', 0.00, 0.00, true, true, 0, 0);
INSERT INTO public.buyer_category VALUES (5, 'Government', 0.00, 0.00, true, true, 0, 0);
INSERT INTO public.buyer_category VALUES (6, 'Student', 0.00, 0.00, false, false, 0, 0);


--
-- Data for Name: buyer; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer VALUES (1, 'Mr.', 'Rajesh', 'Kumar', 'CEO', 'rajesh.kumar@wanderlust.com', 1, 'Confirmed', true);
INSERT INTO public.buyer VALUES (2, 'Ms.', 'Priya', 'Sharma', 'Director', 'priya.sharma@dreamtravel.in', 1, 'Confirmed', true);
INSERT INTO public.buyer VALUES (3, 'Mr.', 'Amit', 'Patel', 'Managing Director', 'amit.patel@explorindia.com', 2, 'Confirmed', false);
INSERT INTO public.buyer VALUES (4, 'Mrs.', 'Sunita', 'Reddy', 'Founder', 'sunita.reddy@southtours.co.in', 2, 'Confirmed', false);
INSERT INTO public.buyer VALUES (5, 'Mr.', 'Vikram', 'Singh', 'General Manager', 'vikram.singh@royaljourney.com', 2, 'Pending', false);
INSERT INTO public.buyer VALUES (6, 'Ms.', 'Kavya', 'Nair', 'Operations Head', 'kavya.nair@keralatours.in', 3, 'Confirmed', false);
INSERT INTO public.buyer VALUES (7, 'Mr.', 'Arjun', 'Menon', 'Director', 'arjun.menon@backwaters.com', 3, 'Confirmed', false);
INSERT INTO public.buyer VALUES (8, 'Mrs.', 'Deepika', 'Iyer', 'CEO', 'deepika.iyer@spiceroute.in', 3, 'Pending', false);
INSERT INTO public.buyer VALUES (9, 'Mr.', 'Rohit', 'Gupta', 'Manager', 'rohit.gupta@hillstation.com', 4, 'Confirmed', false);
INSERT INTO public.buyer VALUES (10, 'Ms.', 'Ananya', 'Das', 'Travel Consultant', 'ananya.das@bengaltours.in', 4, 'Confirmed', false);


--
-- Data for Name: buyer_business; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_business VALUES (1, 2015, 'Tour Operator', 'Luxury Resorts', 'Adventure Activities', true, 2020);
INSERT INTO public.buyer_business VALUES (2, 2012, 'Travel Agent', 'Heritage Hotels', 'Cultural Experiences', true, 2018);
INSERT INTO public.buyer_business VALUES (3, 2018, 'DMC', 'Eco Resorts', 'Wildlife Lodges', true, 2021);
INSERT INTO public.buyer_business VALUES (4, 2010, 'Tour Operator', 'Beach Resorts', 'Backwater Stays', true, 2016);
INSERT INTO public.buyer_business VALUES (5, 2020, 'Travel Agent', 'Boutique Hotels', 'Wellness Centers', false, NULL);
INSERT INTO public.buyer_business VALUES (6, 2014, 'DMC', 'Homestays', 'Houseboat Stays', true, 2019);
INSERT INTO public.buyer_business VALUES (7, 2016, 'Tour Operator', 'Backwater Resorts', 'Ayurveda Centers', true, 2020);
INSERT INTO public.buyer_business VALUES (8, 2013, 'Travel Agent', 'Cultural Properties', 'Spice Plantations', true, 2017);
INSERT INTO public.buyer_business VALUES (9, 2019, 'DMC', 'Hill Stations', 'Adventure Camps', false, NULL);
INSERT INTO public.buyer_business VALUES (10, 2011, 'Travel Agent', 'Budget Hotels', 'Local Experiences', true, 2015);


--
-- Data for Name: buyer_profiles; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_profiles VALUES (2, 2, 'Priya Sharma', 'Dream Travel Solutions', 'Director', 'Travel Agent', NULL, '["Budget Resort", "Service Villa"]', 'India', 'West Bengal', 'Kolkata', '456 Park Street', '+91-9876543211', 'www.dreamtravel.in', '@dreamtravel_official', 2012, true, 2018, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 1, 'Ms.', 'Priya', 'Sharma', true, 'confirmed', '19FGHIJ5678K2L6', '700016');
INSERT INTO public.buyer_profiles VALUES (3, 3, 'Amit Patel', 'Explor India Tours', 'Managing Director', 'DMC', NULL, '["Homestay"]', 'India', 'Maharashtra', 'Pune', '789 FC Road', '+91-9876543212', 'www.explorindia.com', '@explorindia', 2018, true, 2021, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 2, 'Mr.', 'Amit', 'Patel', false, 'confirmed', '27MNOPQ9012R3S7', '411005');
INSERT INTO public.buyer_profiles VALUES (4, 4, 'Sunita Reddy', 'South India Tours & Travels', 'Founder', 'Tour Operator', NULL, '["Premium Resort"]', 'India', 'Telangana', 'Hyderabad', '321 Jubilee Hills', '+91-9876543213', 'www.southtours.co.in', '@southtours', 2010, true, 2016, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 2, 'Mrs.', 'Sunita', 'Reddy', false, 'confirmed', '36TUVWX3456Y4Z8', '500033');
INSERT INTO public.buyer_profiles VALUES (5, 5, 'Vikram Singh', 'Royal Journey Travels', 'General Manager', 'Travel Agent', NULL, '["Service Villa", "Homestay"]', 'India', 'Delhi', 'Delhi', '654 Civil Lines', '+91-9876543214', 'www.royaljourney.com', '@royaljourney', 2020, false, NULL, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 2, 'Mr.', 'Vikram', 'Singh', false, 'pending', '07ABCDE7890F5G9', '110054');
INSERT INTO public.buyer_profiles VALUES (6, 6, 'Kavya Nair', 'Kerala Tours & Holidays', 'Operations Head', 'DMC', NULL, '["Budget Resort", "Homestay"]', 'India', 'Kerala', 'Kochi', '987 Marine Drive', '+91-9876543215', 'www.keralatours.in', '@keralatours', 2014, true, 2019, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 3, 'Ms.', 'Kavya', 'Nair', false, 'confirmed', '32HIJKL2345M6N0', '682031');
INSERT INTO public.buyer_profiles VALUES (7, 7, 'Arjun Menon', 'Backwaters Kerala Pvt Ltd', 'Director', 'Tour Operator', NULL, '["Budget Resort"]', 'India', 'Kerala', 'Kottayam', '147 Boat Club Road', '+91-9876543216', 'www.backwaters.com', '@backwaters_kerala', 2016, true, 2020, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 3, 'Mr.', 'Arjun', 'Menon', false, 'confirmed', '32OPQRS6789T7U1', '686001');
INSERT INTO public.buyer_profiles VALUES (8, 8, 'Deepika Iyer', 'Spice Route Travels', 'CEO', 'Travel Agent', NULL, '["Homestay", "Service Villa"]', 'India', 'Tamil Nadu', 'Chennai', '258 Anna Salai', '+91-9876543217', 'www.spiceroute.in', '@spiceroute', 2013, true, 2017, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 3, 'Mrs.', 'Deepika', 'Iyer', false, 'pending', '33VWXYZ0123A8B2', '600002');
INSERT INTO public.buyer_profiles VALUES (9, 9, 'Rohit Gupta', 'Hill Station Holidays', 'Manager', 'DMC', NULL, '["Premium Resort"]', 'India', 'Himachal Pradesh', 'Shimla', '369 Mall Road', '+91-9876543218', 'www.hillstation.com', '@hillstation', 2019, false, NULL, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 4, 'Mr.', 'Rohit', 'Gupta', false, 'confirmed', '02CDEFG4567H9I3', '171001');
INSERT INTO public.buyer_profiles VALUES (10, 10, 'Ananya Das', 'Bengal Tours & Travels', 'Travel Consultant', 'Travel Agent', NULL, '["Homestay"]', 'India', 'West Bengal', 'Kolkata', '741 Salt Lake', '+91-9876543219', 'www.bengaltours.in', '@bengaltours', 2011, true, 2015, NULL, NULL, '2025-05-26 05:27:33.843778', NULL, 4, 'Ms.', 'Ananya', 'Das', false, 'confirmed', '19JKLMN8901O0P4', '700064');
INSERT INTO public.buyer_profiles VALUES (34, 34, 'Debug Test User', 'Debug Org', NULL, NULL, NULL, '["Budget Resort", "Premium Resort"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, '2025-05-26 06:17:29.051716', NULL, NULL, 'Dr.', 'Debug', 'User', true, 'active', 'GST123456789', '123456');
INSERT INTO public.buyer_profiles VALUES (35, 41, 'Test Buyer', 'Test Organization', 'Manager', 'Tour Operator', '[]', '["Service Villa"]', 'India', 'Kerala', 'Kochi', NULL, '+919876543210', NULL, NULL, NULL, false, NULL, NULL, NULL, '2025-06-02 06:19:22.096358', NULL, NULL, NULL, NULL, NULL, false, 'pending', NULL, NULL);
INSERT INTO public.buyer_profiles VALUES (36, 36, 'Balu', 'Pillai', 'Manager', 'Tour Operator', '["Photography", "Wellness", "Cultural Tours", "Nature", "Wildlife"]', '["Service Villa", "Budget Resort"]', 'India', 'Karnataka', 'Bangalore', '1022 D Block AECS Layout', NULL, NULL, NULL, 2023, false, NULL, 'dfskHDLKFHSdl''jhf''ls', NULL, '2025-06-04 07:40:04.36092', NULL, NULL, NULL, NULL, NULL, false, 'pending', NULL, NULL);
INSERT INTO public.buyer_profiles VALUES (37, 48, 'Test', 'Meeting Buyer', 'Manager', 'Travel Agent', '["Yoga"]', '["Homestay", "Luxury Hotel"]', 'India', '', '', '', '', 'https://www.test_meeting_seller.com', '', NULL, false, NULL, '', NULL, '2025-06-06 13:50:39.845148', '2025-06-09 08:45:14.652282', NULL, NULL, NULL, NULL, false, 'pending', '', NULL);
INSERT INTO public.buyer_profiles VALUES (1, 1, 'Rajesh Kumar', 'Wanderlust Travels Pvt Ltd', 'CEO', 'Tour Operator', '["Adventure", "Agritourism"]', '["Premium Resort", "Homestay"]', 'India', '', 'Bangalore', '123 MG Road', '+91-9876543210', 'www.wanderlust.com', '@wanderlust_travels', 2015, true, 2020, '', NULL, '2025-05-26 05:27:33.843778', '2025-06-16 13:07:57.513263', 3, 'Mr.', 'Rajesh', 'Kumar', true, 'confirmed', '29ABCDE1234F1Z5', '560001');


--
-- Data for Name: buyer_business_info; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_business_info VALUES (1, 1, 2015, 'Luxury Resorts', 'Adventure Activities', true, 2020, true, 'Taj Kumarakom Resort', 'Expand luxury portfolio in Kerala', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (2, 2, 2012, 'Heritage Hotels', 'Cultural Experiences', true, 2018, false, NULL, 'Explore new destinations for cultural tours', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (3, 3, 2018, 'Eco Resorts', 'Wildlife Lodges', true, 2021, true, 'Spice Village Thekkady', 'Source eco-friendly properties', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (4, 4, 2010, 'Beach Resorts', 'Backwater Stays', true, 2016, true, 'Backwater Ripples Kumarakom', 'Strengthen South India network', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (5, 5, 2020, 'Boutique Hotels', 'Wellness Centers', false, NULL, false, NULL, 'Enter Kerala market for wellness tourism', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (6, 6, 2014, 'Homestays', 'Houseboat Stays', true, 2019, true, 'Coconut Lagoon', 'Expand homestay network', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (7, 7, 2016, 'Backwater Resorts', 'Ayurveda Centers', true, 2020, true, 'Kumarakom Lake Resort', 'Add premium backwater properties', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (8, 8, 2013, 'Cultural Properties', 'Spice Plantations', true, 2017, false, NULL, 'Develop cultural tourism packages', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (9, 9, 2019, 'Hill Stations', 'Adventure Camps', false, NULL, false, NULL, 'Explore hill station properties', '2025-05-26 05:27:33.845434');
INSERT INTO public.buyer_business_info VALUES (10, 10, 2011, 'Budget Hotels', 'Local Experiences', true, 2015, true, 'Local Homestay Alleppey', 'Budget-friendly options for clients', '2025-05-26 05:27:33.845434');


--
-- Data for Name: buyer_demographic; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_demographic VALUES (1, '+91-9876543210', '123 MG Road', 'Bangalore', 'Karnataka', '560001', 'India', '@wanderlust_travels', 'Wanderlust Travels Pvt Ltd', '29ABCDE1234F1Z5', 'www.wanderlust.com');
INSERT INTO public.buyer_demographic VALUES (2, '+91-9876543211', '456 Park Street', 'Kolkata', 'West Bengal', '700016', 'India', '@dreamtravel_official', 'Dream Travel Solutions', '19FGHIJ5678K2L6', 'www.dreamtravel.in');
INSERT INTO public.buyer_demographic VALUES (3, '+91-9876543212', '789 FC Road', 'Pune', 'Maharashtra', '411005', 'India', '@explorindia', 'Explor India Tours', '27MNOPQ9012R3S7', 'www.explorindia.com');
INSERT INTO public.buyer_demographic VALUES (4, '+91-9876543213', '321 Jubilee Hills', 'Hyderabad', 'Telangana', '500033', 'India', '@southtours', 'South India Tours & Travels', '36TUVWX3456Y4Z8', 'www.southtours.co.in');
INSERT INTO public.buyer_demographic VALUES (5, '+91-9876543214', '654 Civil Lines', 'Delhi', 'Delhi', '110054', 'India', '@royaljourney', 'Royal Journey Travels', '07ABCDE7890F5G9', 'www.royaljourney.com');
INSERT INTO public.buyer_demographic VALUES (6, '+91-9876543215', '987 Marine Drive', 'Kochi', 'Kerala', '682031', 'India', '@keralatours', 'Kerala Tours & Holidays', '32HIJKL2345M6N0', 'www.keralatours.in');
INSERT INTO public.buyer_demographic VALUES (7, '+91-9876543216', '147 Boat Club Road', 'Kottayam', 'Kerala', '686001', 'India', '@backwaters_kerala', 'Backwaters Kerala Pvt Ltd', '32OPQRS6789T7U1', 'www.backwaters.com');
INSERT INTO public.buyer_demographic VALUES (8, '+91-9876543217', '258 Anna Salai', 'Chennai', 'Tamil Nadu', '600002', 'India', '@spiceroute', 'Spice Route Travels', '33VWXYZ0123A8B2', 'www.spiceroute.in');
INSERT INTO public.buyer_demographic VALUES (9, '+91-9876543218', '369 Mall Road', 'Shimla', 'Himachal Pradesh', '171001', 'India', '@hillstation', 'Hill Station Holidays', '02CDEFG4567H9I3', 'www.hillstation.com');
INSERT INTO public.buyer_demographic VALUES (10, '+91-9876543219', '741 Salt Lake', 'Kolkata', 'West Bengal', '700064', 'India', '@bengaltours', 'Bengal Tours & Travels', '19JKLMN8901O0P4', 'www.bengaltours.in');


--
-- Data for Name: buyer_financial; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_financial VALUES (1, true, true);
INSERT INTO public.buyer_financial VALUES (2, true, true);
INSERT INTO public.buyer_financial VALUES (3, true, true);
INSERT INTO public.buyer_financial VALUES (4, true, true);
INSERT INTO public.buyer_financial VALUES (5, false, true);
INSERT INTO public.buyer_financial VALUES (6, true, true);
INSERT INTO public.buyer_financial VALUES (7, true, true);
INSERT INTO public.buyer_financial VALUES (8, false, false);
INSERT INTO public.buyer_financial VALUES (9, true, true);
INSERT INTO public.buyer_financial VALUES (10, true, true);


--
-- Data for Name: buyer_financial_info; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_financial_info VALUES (1, 1, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (2, 2, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (3, 3, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (4, 4, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (5, 5, false, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (6, 6, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (7, 7, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (8, 8, false, false, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (9, 9, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');
INSERT INTO public.buyer_financial_info VALUES (10, 10, true, true, NULL, NULL, NULL, '2025-05-26 05:27:33.844801');


--
-- Data for Name: interest; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.interest VALUES (1, 'Adventure');
INSERT INTO public.interest VALUES (2, 'Agritourism');
INSERT INTO public.interest VALUES (3, 'Ayurveda');
INSERT INTO public.interest VALUES (4, 'Culture');
INSERT INTO public.interest VALUES (5, 'Family Holidays');
INSERT INTO public.interest VALUES (6, 'Honeymoon');
INSERT INTO public.interest VALUES (7, 'MICE');
INSERT INTO public.interest VALUES (8, 'Nature');
INSERT INTO public.interest VALUES (9, 'Schools & Colleges');
INSERT INTO public.interest VALUES (10, 'Spiritual');
INSERT INTO public.interest VALUES (11, 'Wildlife');
INSERT INTO public.interest VALUES (12, 'Yoga');
INSERT INTO public.interest VALUES (13, 'Sightseeing');


--
-- Data for Name: buyer_interest; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_interest VALUES (1, 1, 2);
INSERT INTO public.buyer_interest VALUES (2, 1, 1);
INSERT INTO public.buyer_interest VALUES (3, 2, 5);
INSERT INTO public.buyer_interest VALUES (4, 2, 9);
INSERT INTO public.buyer_interest VALUES (5, 3, 3);
INSERT INTO public.buyer_interest VALUES (6, 3, 8);
INSERT INTO public.buyer_interest VALUES (7, 4, 6);
INSERT INTO public.buyer_interest VALUES (8, 4, 3);
INSERT INTO public.buyer_interest VALUES (9, 5, 4);
INSERT INTO public.buyer_interest VALUES (10, 5, 2);
INSERT INTO public.buyer_interest VALUES (11, 6, 11);
INSERT INTO public.buyer_interest VALUES (12, 6, 3);
INSERT INTO public.buyer_interest VALUES (13, 7, 6);
INSERT INTO public.buyer_interest VALUES (14, 7, 4);
INSERT INTO public.buyer_interest VALUES (15, 8, 5);
INSERT INTO public.buyer_interest VALUES (16, 8, 10);
INSERT INTO public.buyer_interest VALUES (17, 9, 7);
INSERT INTO public.buyer_interest VALUES (18, 9, 1);
INSERT INTO public.buyer_interest VALUES (19, 10, 12);
INSERT INTO public.buyer_interest VALUES (20, 10, 11);


--
-- Data for Name: buyer_misc; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_misc VALUES (1, true, 'Taj Kumarakom Resort', 'Expand luxury portfolio in Kerala');
INSERT INTO public.buyer_misc VALUES (2, false, NULL, 'Explore new destinations for cultural tours');
INSERT INTO public.buyer_misc VALUES (3, true, 'Spice Village Thekkady', 'Source eco-friendly properties');
INSERT INTO public.buyer_misc VALUES (4, true, 'Backwater Ripples Kumarakom', 'Strengthen South India network');
INSERT INTO public.buyer_misc VALUES (5, false, NULL, 'Enter Kerala market for wellness tourism');
INSERT INTO public.buyer_misc VALUES (6, true, 'Coconut Lagoon', 'Expand homestay network');
INSERT INTO public.buyer_misc VALUES (7, true, 'Kumarakom Lake Resort', 'Add premium backwater properties');
INSERT INTO public.buyer_misc VALUES (8, false, NULL, 'Develop cultural tourism packages');
INSERT INTO public.buyer_misc VALUES (9, false, NULL, 'Explore hill station properties');
INSERT INTO public.buyer_misc VALUES (10, true, 'Local Homestay Alleppey', 'Budget-friendly options for clients');


--
-- Data for Name: buyer_profile_interests; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_profile_interests VALUES (1, 1, 2, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (2, 1, 1, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (3, 2, 5, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (4, 2, 9, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (5, 3, 3, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (6, 3, 8, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (7, 4, 6, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (8, 4, 3, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (9, 5, 4, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (10, 5, 2, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (11, 6, 11, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (12, 6, 3, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (13, 7, 6, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (14, 7, 4, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (15, 8, 5, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (16, 8, 10, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (17, 9, 7, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (18, 9, 1, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (19, 10, 12, '2025-05-26 05:27:33.846516');
INSERT INTO public.buyer_profile_interests VALUES (20, 10, 11, '2025-05-26 05:27:33.846516');


--
-- Data for Name: buyer_reference; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_reference VALUES (1, 'Kerala Tourism Board', 'Thiruvananthapuram, Kerala', 'IATO Delhi', 'New Delhi');
INSERT INTO public.buyer_reference VALUES (2, 'West Bengal Tourism', 'Kolkata, West Bengal', 'TAAI Mumbai', 'Mumbai, Maharashtra');
INSERT INTO public.buyer_reference VALUES (3, 'Maharashtra Tourism', 'Mumbai, Maharashtra', 'ADTOI Pune', 'Pune, Maharashtra');
INSERT INTO public.buyer_reference VALUES (4, 'Telangana Tourism', 'Hyderabad, Telangana', 'SITA Travels', 'Chennai, Tamil Nadu');
INSERT INTO public.buyer_reference VALUES (5, 'Delhi Tourism', 'New Delhi', 'Cox & Kings', 'Mumbai, Maharashtra');
INSERT INTO public.buyer_reference VALUES (6, 'Kochi Tourism', 'Kochi, Kerala', 'KTDC', 'Thiruvananthapuram, Kerala');
INSERT INTO public.buyer_reference VALUES (7, 'Kumarakom Tourism', 'Kottayam, Kerala', 'DTPC Kottayam', 'Kottayam, Kerala');
INSERT INTO public.buyer_reference VALUES (8, 'Tamil Nadu Tourism', 'Chennai, Tamil Nadu', 'TTDC', 'Chennai, Tamil Nadu');
INSERT INTO public.buyer_reference VALUES (9, 'Himachal Tourism', 'Shimla, Himachal Pradesh', 'HPTDC', 'Shimla, Himachal Pradesh');
INSERT INTO public.buyer_reference VALUES (10, 'WBTDC', 'Kolkata, West Bengal', 'Travel Agents Association', 'Kolkata, West Bengal');


--
-- Data for Name: buyer_references; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_references VALUES (1, 1, 'Kerala Tourism Board', 'Thiruvananthapuram, Kerala', 'IATO Delhi', 'New Delhi', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (2, 2, 'West Bengal Tourism', 'Kolkata, West Bengal', 'TAAI Mumbai', 'Mumbai, Maharashtra', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (3, 3, 'Maharashtra Tourism', 'Mumbai, Maharashtra', 'ADTOI Pune', 'Pune, Maharashtra', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (4, 4, 'Telangana Tourism', 'Hyderabad, Telangana', 'SITA Travels', 'Chennai, Tamil Nadu', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (5, 5, 'Delhi Tourism', 'New Delhi', 'Cox & Kings', 'Mumbai, Maharashtra', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (6, 6, 'Kochi Tourism', 'Kochi, Kerala', 'KTDC', 'Thiruvananthapuram, Kerala', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (7, 7, 'Kumarakom Tourism', 'Kottayam, Kerala', 'DTPC Kottayam', 'Kottayam, Kerala', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (8, 8, 'Tamil Nadu Tourism', 'Chennai, Tamil Nadu', 'TTDC', 'Chennai, Tamil Nadu', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (9, 9, 'Himachal Tourism', 'Shimla, Himachal Pradesh', 'HPTDC', 'Shimla, Himachal Pradesh', '2025-05-26 05:27:33.846031');
INSERT INTO public.buyer_references VALUES (10, 10, 'WBTDC', 'Kolkata, West Bengal', 'Travel Agents Association', 'Kolkata, West Bengal', '2025-05-26 05:27:33.846031');


--
-- Data for Name: ground_transportation; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.ground_transportation VALUES (1, 5, 'Kochi', '2025-06-22 15:15:00', 6, '127320737', 'kothezham', '2025-06-24 15:15:00', 4, 'sdadasdsa');
INSERT INTO public.ground_transportation VALUES (2, 1, 'Kochi', '2025-06-22 17:16:00', 8, '78943-49', 'kothezham', '2025-06-25 17:16:00', 4, 'sdadasdsa');


--
-- Data for Name: invited_buyers; Type: TABLE DATA; Schema: public; Owner: splash25user
--



--
-- Data for Name: listings; Type: TABLE DATA; Schema: public; Owner: splash25user
--



--
-- Data for Name: listing_dates; Type: TABLE DATA; Schema: public; Owner: splash25user
--



--
-- Data for Name: seller_profiles; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_profiles VALUES (1, 11, 'Backwater Bliss Resort', 'Migrated from customer database', 'Resort', NULL, NULL, 'www.backwaterbliss.com', 'suresh.nair@backwaterbliss.com', '+91-9447123456', 'Kumarakom Lake Side, Kumarakom, Kerala, 686563, India', true, '2025-05-26 05:27:33.848301', NULL, '32ABCDE1234F1Z5', '686563', '@backwaterbliss', 'active', true, 1, 'Kerala', 'India', '[]', '/seller/11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (2, 12, 'Spice Garden Retreat', 'Migrated from customer database', 'Retreat', NULL, NULL, 'www.spicegardenretreat.com', 'lakshmi.pillai@spicegardenretreat.com', '+91-9447123457', 'Thekkady Hills, Thekkady, Kerala, 685536, India', true, '2025-05-26 05:27:33.848301', NULL, '32FGHIJ5678K2L6', '685536', '@spicegarden', 'active', true, 1, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (3, 13, 'Coconut Grove Homestay', 'Migrated from customer database', 'Homestay', NULL, NULL, 'www.coconutgrovehomestay.in', 'ravi.kumar@coconutgrovehomestay.in', '+91-9447123458', 'Alleppey Backwaters, Alleppey, Kerala, 688001, India', true, '2025-05-26 05:27:33.848301', NULL, '32MNOPQ9012R3S7', '688001', '@coconutgrove', 'active', false, 3, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (4, 14, 'Misty Mountain Resort', 'Migrated from customer database', 'Resort', NULL, NULL, 'www.mistymountainresort.com', 'meera.menon@mistymountainresort.com', '+91-9447123459', 'Munnar Hills, Munnar, Kerala, 685612, India', true, '2025-05-26 05:27:33.848301', NULL, '32TUVWX3456Y4Z8', '685612', '@mistymountain', 'active', true, 1, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (5, 15, 'Ayurveda Wellness Center', 'Migrated from customer database', 'Wellness Center', NULL, NULL, 'www.ayurvedawellness.in', 'ayush.sharma@ayurvedawellness.in', '+91-9447123460', 'Kovalam Beach, Kovalam, Kerala, 695527, India', true, '2025-05-26 05:27:33.848301', NULL, '32ABCDE7890F5G9', '695527', '@ayurvedawellness', 'active', true, 1, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (6, 16, 'Heritage Houseboat', 'Migrated from customer database', 'Houseboat', NULL, NULL, 'www.heritagehouseboat.com', 'krishnan.nambiar@heritagehouseboat.com', '+91-9447123461', 'Alleppey Canals, Alleppey, Kerala, 688012, India', true, '2025-05-26 05:27:33.848301', NULL, '32HIJKL2345M6N0', '688012', '@heritagehouseboat', 'active', false, 5, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (7, 17, 'Cliff Edge Resort', 'Migrated from customer database', 'Resort', NULL, NULL, 'www.cliffedgeresort.in', 'priya.varma@cliffedgeresort.in', '+91-9447123462', 'Varkala Cliffs, Varkala, Kerala, 695141, India', true, '2025-05-26 05:27:33.848301', NULL, '32OPQRS6789T7U1', '695141', '@cliffedge', 'active', true, 1, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (8, 18, 'Tea Estate Villa', 'Migrated from customer database', 'Villa', NULL, NULL, 'www.teaestatevilla.com', 'arun.thampi@teaestatevilla.com', '+91-9447123463', 'Munnar Tea Gardens, Munnar, Kerala, 685565, India', true, '2025-05-26 05:27:33.848301', NULL, '32VWXYZ0123A8B2', '685565', '@teaestate', 'active', false, 5, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (9, 19, 'Wayanad Wild Resort', 'Migrated from customer database', 'Resort', NULL, NULL, 'www.wayanadwildresort.com', 'geetha.raj@wayanadwildresort.com', '+91-9447123464', 'Wayanad Forest, Wayanad, Kerala, 673121, India', true, '2025-05-26 05:27:33.848301', NULL, '32CDEFG4567H9I3', '673121', '@wayanadwild', 'active', true, 1, 'Kerala', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (13, 46, 'New Test Business', 'A brand new test business description', NULL, NULL, NULL, NULL, 'newseller@test.com', NULL, NULL, false, '2025-06-06 07:20:38.860183', NULL, NULL, NULL, NULL, 'active', false, NULL, NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (14, 47, 'new_seller_one', 'new_seller_one
new_seller_one
new_seller_one', 'Resort', 'Luxury', NULL, 'http://www.new_seller_one.com', 'new_seller_one@gmail.com', '', '', false, '2025-06-06 07:24:16.44743', '2025-06-06 07:25:18.638294', NULL, NULL, NULL, 'active', false, NULL, NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (15, 49, 'test_meeting_seller', 'test_meeting_seller', NULL, NULL, NULL, NULL, 'test_meeting_seller@gmail.com', NULL, NULL, false, '2025-06-06 13:47:43.65877', NULL, NULL, NULL, NULL, 'active', false, NULL, NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (10, 20, 'Beach Paradise Hotel', 'Migrated from customer database', 'Hotel', '', NULL, 'www.beachparadisehotel.com', 'vinod.das@beachparadisehotel.com', '+91-9447123465', 'Kovalam Beach Road, Kovalam, Kerala, 695527, India', true, '2025-05-26 05:27:33.848301', '2025-06-09 09:19:30.202329', '32JKLMN0123O4P5', '695527', '@beachparadise', 'active', true, 2, 'Haryana', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (11, 40, 'Test Business', 'A test business for API testing', 'Resort', 'Luxury', NULL, '', 'contact@testbusiness.com', '+1234567890', '123 Test Street, Test City', false, '2025-06-02 06:28:52.878034', '2025-06-09 09:19:49.942165', '', NULL, NULL, 'active', false, NULL, 'Jharkhand', 'India', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.seller_profiles VALUES (12, 37, 'Balu''s Father''s property', 'Fixing bugs', 'Wellness Center', 'Luxury', NULL, 'http://www.balu.com', 'gbalu@gmail.com', '', 'dsadasd', true, '2025-06-04 07:37:16.42748', '2025-06-18 17:06:01.617351', '', NULL, NULL, 'active', false, NULL, 'Gujarat', 'India', '[{"id": "2af9ee66-c800-4210-b177-37159c96b699", "url": "https://mbcloud.muddyboots.in/MBCloud/index.php/s/iB2WXSRFHzBq79k/download", "size": 9277, "filename": "IMG1.jpeg", "mime_type": "image/jpeg", "uploaded_at": "2025-06-18T09:15:41.608412"}, {"id": "7130183c-14bc-4fef-b82d-7ac3e60db427", "url": "https://mbcloud.muddyboots.in/MBCloud/index.php/s/nfQLWECGk9cTmcP/download", "size": 10423, "filename": "IMG2.jpeg", "mime_type": "image/jpeg", "uploaded_at": "2025-06-18T09:15:46.248184"}, {"id": "1f8cff07-42ce-488a-b971-37c524909c02", "url": "https://mbcloud.muddyboots.in/MBCloud/index.php/s/f24W9tNJ7dqA62Y/download", "size": 7082, "filename": "IMG3.jpeg", "mime_type": "image/jpeg", "uploaded_at": "2025-06-18T09:15:50.110134"}]', '/seller/37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: seller_attendees; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_attendees VALUES (1, 1, 1, 'Suresh Nair', 'General Manager', 'suresh.nair@backwaterbliss.com', '+91-9447123456', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (2, 1, 2, 'Radha Krishnan', 'Sales Manager', 'radha.krishnan@backwaterbliss.com', '+91-9447123466', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (3, 2, 1, 'Lakshmi Pillai', 'Resort Manager', 'lakshmi.pillai@spicegardenretreat.com', '+91-9447123457', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (4, 2, 2, 'Mohan Kumar', 'Marketing Head', 'mohan.kumar@spicegardenretreat.com', '+91-9447123467', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (5, 3, 1, 'Ravi Kumar', 'Owner', 'ravi.kumar@coconutgrovehomestay.in', '+91-9447123458', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (6, 3, 2, 'Sita Devi', 'Co-owner', 'sita.devi@coconutgrovehomestay.in', '+91-9447123468', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (7, 4, 1, 'Meera Menon', 'Operations Head', 'meera.menon@mistymountainresort.com', '+91-9447123459', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (8, 4, 2, 'Rajesh Nair', 'Guest Relations', 'rajesh.nair@mistymountainresort.com', '+91-9447123469', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (9, 5, 1, 'Dr. Ayush Sharma', 'Director', 'ayush.sharma@ayurvedawellness.in', '+91-9447123460', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (10, 5, 2, 'Priya Menon', 'Wellness Coordinator', 'priya.menon@ayurvedawellness.in', '+91-9447123470', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (11, 6, 1, 'Krishnan Nambiar', 'Captain', 'krishnan.nambiar@heritagehouseboat.com', '+91-9447123461', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (12, 6, 2, 'Unni Krishnan', 'Boat Manager', 'unni.krishnan@heritagehouseboat.com', '+91-9447123471', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (13, 7, 1, 'Priya Varma', 'Resort Director', 'priya.varma@cliffedgeresort.in', '+91-9447123462', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (14, 7, 2, 'Anil Kumar', 'Operations Manager', 'anil.kumar@cliffedgeresort.in', '+91-9447123472', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (15, 8, 1, 'Arun Thampi', 'Estate Manager', 'arun.thampi@teaestatevilla.com', '+91-9447123463', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (16, 8, 2, 'Deepa Nair', 'Guest Services', 'deepa.nair@teaestatevilla.com', '+91-9447123473', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (17, 9, 1, 'Geetha Raj', 'Wildlife Guide', 'geetha.raj@wayanadwildresort.com', '+91-9447123464', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (18, 9, 2, 'Babu Antony', 'Nature Guide', 'babu.antony@wayanadwildresort.com', '+91-9447123474', false, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (19, 10, 1, 'Vinod Das', 'Hotel Manager', 'vinod.das@beachparadisehotel.com', '+91-9447123465', true, '2025-05-26 05:27:33.849085');
INSERT INTO public.seller_attendees VALUES (20, 10, 2, 'Suma Nair', 'Front Office Manager', 'suma.nair@beachparadisehotel.com', '+91-9447123475', false, '2025-05-26 05:27:33.849085');


--
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: splash25user
--
/*
INSERT INTO public.time_slots VALUES (2, 12, '2025-06-15 11:00:00', '2025-06-15 12:00:00', false, 2, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (4, 14, '2025-06-15 15:30:00', '2025-06-15 16:30:00', false, 4, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (6, 16, '2025-06-16 11:30:00', '2025-06-16 12:30:00', false, 6, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (7, 17, '2025-06-16 13:00:00', '2025-06-16 14:00:00', false, 7, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (9, 19, '2025-06-17 10:30:00', '2025-06-17 11:30:00', false, 9, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (11, 13, '2025-06-17 14:30:00', '2025-06-17 15:30:00', false, 11, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (13, 17, '2025-06-18 09:00:00', '2025-06-18 10:00:00', false, 13, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (15, 11, '2025-06-18 15:00:00', '2025-06-18 16:00:00', false, 15, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (18, 37, '2025-06-19 14:00:00', '2025-06-19 15:00:00', false, 18, '2025-06-01 11:59:02.38133');
INSERT INTO public.time_slots VALUES (19, 11, '2025-06-19 16:00:00', '2025-06-19 17:00:00', false, 19, '2025-06-01 11:59:02.38133');
INSERT INTO public.time_slots VALUES (30, 11, '2025-06-02 13:30:00', '2025-06-02 14:00:00', false, NULL, '2025-06-01 12:42:15.393433');
INSERT INTO public.time_slots VALUES (109, 12, '2025-06-02 13:00:00', '2025-06-02 13:30:00', false, NULL, '2025-06-01 12:42:15.498771');
INSERT INTO public.time_slots VALUES (31, 11, '2025-06-02 14:00:00', '2025-06-02 14:30:00', false, NULL, '2025-06-01 12:42:15.394611');
INSERT INTO public.time_slots VALUES (111, 12, '2025-06-02 14:00:00', '2025-06-02 14:30:00', false, NULL, '2025-06-01 12:42:15.501202');
INSERT INTO public.time_slots VALUES (32, 11, '2025-06-02 14:30:00', '2025-06-02 15:00:00', false, NULL, '2025-06-01 12:42:15.397887');
INSERT INTO public.time_slots VALUES (112, 12, '2025-06-02 14:30:00', '2025-06-02 15:00:00', false, NULL, '2025-06-01 12:42:15.502392');
INSERT INTO public.time_slots VALUES (33, 11, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.398919');
INSERT INTO public.time_slots VALUES (34, 11, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.39985');
INSERT INTO public.time_slots VALUES (35, 11, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.400895');
INSERT INTO public.time_slots VALUES (36, 11, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.401975');
INSERT INTO public.time_slots VALUES (37, 11, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.403058');
INSERT INTO public.time_slots VALUES (38, 11, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.404296');
INSERT INTO public.time_slots VALUES (39, 11, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.405671');
INSERT INTO public.time_slots VALUES (40, 11, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.406752');
INSERT INTO public.time_slots VALUES (41, 11, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.407893');
INSERT INTO public.time_slots VALUES (42, 11, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.409285');
INSERT INTO public.time_slots VALUES (43, 11, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:15.410325');
INSERT INTO public.time_slots VALUES (44, 11, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:15.411792');
INSERT INTO public.time_slots VALUES (45, 11, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:15.413078');
INSERT INTO public.time_slots VALUES (46, 11, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:15.414638');
INSERT INTO public.time_slots VALUES (47, 11, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:15.415727');
INSERT INTO public.time_slots VALUES (48, 11, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:15.41677');
INSERT INTO public.time_slots VALUES (49, 11, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:15.417843');
INSERT INTO public.time_slots VALUES (50, 11, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:15.418863');
INSERT INTO public.time_slots VALUES (51, 11, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:15.419914');
INSERT INTO public.time_slots VALUES (52, 11, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:15.420944');
INSERT INTO public.time_slots VALUES (53, 11, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:15.421856');
INSERT INTO public.time_slots VALUES (54, 11, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:15.422888');
INSERT INTO public.time_slots VALUES (55, 11, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:15.423802');
INSERT INTO public.time_slots VALUES (56, 11, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:15.424841');
INSERT INTO public.time_slots VALUES (57, 11, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:15.42579');
INSERT INTO public.time_slots VALUES (58, 11, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:15.42675');
INSERT INTO public.time_slots VALUES (59, 11, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:15.427757');
INSERT INTO public.time_slots VALUES (60, 11, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:15.428781');
INSERT INTO public.time_slots VALUES (61, 11, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:15.429722');
INSERT INTO public.time_slots VALUES (62, 11, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:15.430728');
INSERT INTO public.time_slots VALUES (63, 11, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:15.431893');
INSERT INTO public.time_slots VALUES (64, 11, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:15.432927');
INSERT INTO public.time_slots VALUES (65, 11, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:15.433939');
INSERT INTO public.time_slots VALUES (66, 11, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:15.434915');
INSERT INTO public.time_slots VALUES (67, 11, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:15.435896');
INSERT INTO public.time_slots VALUES (68, 11, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:15.436896');
INSERT INTO public.time_slots VALUES (69, 11, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:15.43786');
INSERT INTO public.time_slots VALUES (70, 11, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:15.438859');
INSERT INTO public.time_slots VALUES (71, 11, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:15.439947');
INSERT INTO public.time_slots VALUES (72, 11, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:15.440884');
INSERT INTO public.time_slots VALUES (73, 11, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:15.44185');
INSERT INTO public.time_slots VALUES (74, 11, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:15.442877');
INSERT INTO public.time_slots VALUES (75, 11, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:15.443869');
INSERT INTO public.time_slots VALUES (76, 11, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:15.444806');
INSERT INTO public.time_slots VALUES (77, 11, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:15.445733');
INSERT INTO public.time_slots VALUES (78, 11, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:15.446559');
INSERT INTO public.time_slots VALUES (79, 11, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:15.44762');
INSERT INTO public.time_slots VALUES (80, 11, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:15.448638');
INSERT INTO public.time_slots VALUES (81, 11, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:15.449549');
INSERT INTO public.time_slots VALUES (82, 11, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:15.450494');
INSERT INTO public.time_slots VALUES (83, 11, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:15.451421');
INSERT INTO public.time_slots VALUES (84, 11, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:15.45227');
INSERT INTO public.time_slots VALUES (85, 11, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:15.453318');
INSERT INTO public.time_slots VALUES (86, 11, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:15.455034');
INSERT INTO public.time_slots VALUES (87, 11, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:15.456119');
INSERT INTO public.time_slots VALUES (88, 11, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:15.457107');
INSERT INTO public.time_slots VALUES (89, 11, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:15.457951');
INSERT INTO public.time_slots VALUES (90, 11, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:15.458947');
INSERT INTO public.time_slots VALUES (91, 11, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:15.459954');
INSERT INTO public.time_slots VALUES (92, 11, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:15.460883');
INSERT INTO public.time_slots VALUES (93, 11, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:15.461734');
INSERT INTO public.time_slots VALUES (94, 11, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:15.462882');
INSERT INTO public.time_slots VALUES (95, 11, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:15.463849');
INSERT INTO public.time_slots VALUES (96, 11, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:15.464926');
INSERT INTO public.time_slots VALUES (97, 11, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:15.465898');
INSERT INTO public.time_slots VALUES (98, 11, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:15.4668');
INSERT INTO public.time_slots VALUES (99, 11, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:15.467779');
INSERT INTO public.time_slots VALUES (100, 11, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:15.468713');
INSERT INTO public.time_slots VALUES (182, 13, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:15.576619');
INSERT INTO public.time_slots VALUES (308, 14, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:15.705793');
INSERT INTO public.time_slots VALUES (1, 11, '2025-06-15 10:00:00', '2025-06-15 11:00:00', true, NULL, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (3, 13, '2025-06-15 14:00:00', '2025-06-15 15:00:00', true, NULL, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (5, 15, '2025-06-16 09:30:00', '2025-06-16 10:30:00', true, NULL, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (8, 18, '2025-06-16 16:00:00', '2025-06-16 17:00:00', true, NULL, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (113, 12, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.503576');
INSERT INTO public.time_slots VALUES (114, 12, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.504775');
INSERT INTO public.time_slots VALUES (115, 12, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.505792');
INSERT INTO public.time_slots VALUES (116, 12, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.506809');
INSERT INTO public.time_slots VALUES (117, 12, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.508041');
INSERT INTO public.time_slots VALUES (118, 12, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.509093');
INSERT INTO public.time_slots VALUES (26, 11, '2025-06-02 11:30:00', '2025-06-02 12:00:00', false, NULL, '2025-06-01 12:42:15.38786');
INSERT INTO public.time_slots VALUES (105, 12, '2025-06-02 11:00:00', '2025-06-02 11:30:00', false, NULL, '2025-06-01 12:42:15.490932');
INSERT INTO public.time_slots VALUES (27, 11, '2025-06-02 12:00:00', '2025-06-02 12:30:00', false, NULL, '2025-06-01 12:42:15.389059');
INSERT INTO public.time_slots VALUES (107, 12, '2025-06-02 12:00:00', '2025-06-02 12:30:00', false, NULL, '2025-06-01 12:42:15.494918');
INSERT INTO public.time_slots VALUES (28, 11, '2025-06-02 12:30:00', '2025-06-02 13:00:00', false, NULL, '2025-06-01 12:42:15.390183');
INSERT INTO public.time_slots VALUES (108, 12, '2025-06-02 12:30:00', '2025-06-02 13:00:00', false, NULL, '2025-06-01 12:42:15.497405');
INSERT INTO public.time_slots VALUES (119, 12, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.510245');
INSERT INTO public.time_slots VALUES (120, 12, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.511883');
INSERT INTO public.time_slots VALUES (121, 12, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.514065');
INSERT INTO public.time_slots VALUES (122, 12, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.515327');
INSERT INTO public.time_slots VALUES (123, 12, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:15.516449');
INSERT INTO public.time_slots VALUES (124, 12, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:15.517543');
INSERT INTO public.time_slots VALUES (125, 12, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:15.518651');
INSERT INTO public.time_slots VALUES (126, 12, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:15.519644');
INSERT INTO public.time_slots VALUES (127, 12, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:15.52065');
INSERT INTO public.time_slots VALUES (128, 12, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:15.521612');
INSERT INTO public.time_slots VALUES (129, 12, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:15.52281');
INSERT INTO public.time_slots VALUES (130, 12, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:15.524069');
INSERT INTO public.time_slots VALUES (131, 12, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:15.525104');
INSERT INTO public.time_slots VALUES (132, 12, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:15.526188');
INSERT INTO public.time_slots VALUES (133, 12, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:15.527104');
INSERT INTO public.time_slots VALUES (134, 12, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:15.528105');
INSERT INTO public.time_slots VALUES (135, 12, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:15.529161');
INSERT INTO public.time_slots VALUES (136, 12, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:15.530075');
INSERT INTO public.time_slots VALUES (137, 12, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:15.531213');
INSERT INTO public.time_slots VALUES (138, 12, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:15.532291');
INSERT INTO public.time_slots VALUES (139, 12, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:15.533317');
INSERT INTO public.time_slots VALUES (140, 12, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:15.534215');
INSERT INTO public.time_slots VALUES (141, 12, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:15.535264');
INSERT INTO public.time_slots VALUES (142, 12, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:15.536345');
INSERT INTO public.time_slots VALUES (143, 12, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:15.537265');
INSERT INTO public.time_slots VALUES (144, 12, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:15.538391');
INSERT INTO public.time_slots VALUES (145, 12, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:15.539414');
INSERT INTO public.time_slots VALUES (146, 12, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:15.540414');
INSERT INTO public.time_slots VALUES (147, 12, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:15.541477');
INSERT INTO public.time_slots VALUES (148, 12, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:15.542446');
INSERT INTO public.time_slots VALUES (149, 12, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:15.543425');
INSERT INTO public.time_slots VALUES (150, 12, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:15.544796');
INSERT INTO public.time_slots VALUES (151, 12, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:15.5461');
INSERT INTO public.time_slots VALUES (152, 12, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:15.54707');
INSERT INTO public.time_slots VALUES (153, 12, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:15.548084');
INSERT INTO public.time_slots VALUES (154, 12, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:15.549168');
INSERT INTO public.time_slots VALUES (155, 12, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:15.550272');
INSERT INTO public.time_slots VALUES (156, 12, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:15.551244');
INSERT INTO public.time_slots VALUES (157, 12, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:15.552382');
INSERT INTO public.time_slots VALUES (158, 12, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:15.553246');
INSERT INTO public.time_slots VALUES (159, 12, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:15.554414');
INSERT INTO public.time_slots VALUES (160, 12, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:15.55531');
INSERT INTO public.time_slots VALUES (161, 12, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:15.556341');
INSERT INTO public.time_slots VALUES (162, 12, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:15.557229');
INSERT INTO public.time_slots VALUES (163, 12, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:15.558075');
INSERT INTO public.time_slots VALUES (164, 12, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:15.559062');
INSERT INTO public.time_slots VALUES (165, 12, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:15.560012');
INSERT INTO public.time_slots VALUES (166, 12, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:15.560915');
INSERT INTO public.time_slots VALUES (167, 12, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:15.561893');
INSERT INTO public.time_slots VALUES (168, 12, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:15.562859');
INSERT INTO public.time_slots VALUES (169, 12, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:15.563886');
INSERT INTO public.time_slots VALUES (170, 12, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:15.564818');
INSERT INTO public.time_slots VALUES (171, 12, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:15.565767');
INSERT INTO public.time_slots VALUES (172, 12, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:15.566597');
INSERT INTO public.time_slots VALUES (173, 12, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:15.567552');
INSERT INTO public.time_slots VALUES (174, 12, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:15.568585');
INSERT INTO public.time_slots VALUES (175, 12, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:15.569508');
INSERT INTO public.time_slots VALUES (176, 12, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:15.570501');
INSERT INTO public.time_slots VALUES (177, 12, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:15.571578');
INSERT INTO public.time_slots VALUES (178, 12, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:15.572543');
INSERT INTO public.time_slots VALUES (179, 12, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:15.573502');
INSERT INTO public.time_slots VALUES (180, 12, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:15.574536');
INSERT INTO public.time_slots VALUES (181, 13, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:15.57568');
INSERT INTO public.time_slots VALUES (183, 13, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:15.577417');
INSERT INTO public.time_slots VALUES (184, 13, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:15.578264');
INSERT INTO public.time_slots VALUES (185, 13, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:15.579367');
INSERT INTO public.time_slots VALUES (186, 13, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:15.580277');
INSERT INTO public.time_slots VALUES (187, 13, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:15.581392');
INSERT INTO public.time_slots VALUES (188, 13, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:15.583317');
INSERT INTO public.time_slots VALUES (189, 13, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:15.58457');
INSERT INTO public.time_slots VALUES (190, 13, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:15.585636');
INSERT INTO public.time_slots VALUES (191, 13, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:15.586651');
INSERT INTO public.time_slots VALUES (192, 13, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:15.587649');
INSERT INTO public.time_slots VALUES (193, 13, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.588603');
INSERT INTO public.time_slots VALUES (194, 13, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.589581');
INSERT INTO public.time_slots VALUES (195, 13, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.590541');
INSERT INTO public.time_slots VALUES (196, 13, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.591378');
INSERT INTO public.time_slots VALUES (197, 13, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.592365');
INSERT INTO public.time_slots VALUES (198, 13, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.593432');
INSERT INTO public.time_slots VALUES (199, 13, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.594388');
INSERT INTO public.time_slots VALUES (200, 13, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.595296');
INSERT INTO public.time_slots VALUES (201, 13, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.596264');
INSERT INTO public.time_slots VALUES (202, 13, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.597195');
INSERT INTO public.time_slots VALUES (203, 13, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:15.598177');
INSERT INTO public.time_slots VALUES (204, 13, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:15.599242');
INSERT INTO public.time_slots VALUES (205, 13, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:15.600132');
INSERT INTO public.time_slots VALUES (206, 13, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:15.601163');
INSERT INTO public.time_slots VALUES (207, 13, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:15.602141');
INSERT INTO public.time_slots VALUES (208, 13, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:15.603073');
INSERT INTO public.time_slots VALUES (209, 13, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:15.60412');
INSERT INTO public.time_slots VALUES (210, 13, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:15.605164');
INSERT INTO public.time_slots VALUES (211, 13, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:15.606235');
INSERT INTO public.time_slots VALUES (212, 13, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:15.607129');
INSERT INTO public.time_slots VALUES (213, 13, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:15.607961');
INSERT INTO public.time_slots VALUES (214, 13, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:15.608983');
INSERT INTO public.time_slots VALUES (215, 13, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:15.609973');
INSERT INTO public.time_slots VALUES (216, 13, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:15.61098');
INSERT INTO public.time_slots VALUES (217, 13, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:15.611853');
INSERT INTO public.time_slots VALUES (218, 13, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:15.612826');
INSERT INTO public.time_slots VALUES (219, 13, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:15.613895');
INSERT INTO public.time_slots VALUES (220, 13, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:15.61504');
INSERT INTO public.time_slots VALUES (221, 13, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:15.616371');
INSERT INTO public.time_slots VALUES (222, 13, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:15.61744');
INSERT INTO public.time_slots VALUES (223, 13, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:15.618341');
INSERT INTO public.time_slots VALUES (224, 13, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:15.619393');
INSERT INTO public.time_slots VALUES (225, 13, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:15.620283');
INSERT INTO public.time_slots VALUES (226, 13, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:15.621134');
INSERT INTO public.time_slots VALUES (227, 13, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:15.621925');
INSERT INTO public.time_slots VALUES (228, 13, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:15.623048');
INSERT INTO public.time_slots VALUES (229, 13, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:15.624148');
INSERT INTO public.time_slots VALUES (230, 13, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:15.62517');
INSERT INTO public.time_slots VALUES (231, 13, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:15.62619');
INSERT INTO public.time_slots VALUES (232, 13, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:15.627166');
INSERT INTO public.time_slots VALUES (233, 13, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:15.628094');
INSERT INTO public.time_slots VALUES (234, 13, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:15.629082');
INSERT INTO public.time_slots VALUES (235, 13, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:15.630046');
INSERT INTO public.time_slots VALUES (236, 13, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:15.631003');
INSERT INTO public.time_slots VALUES (237, 13, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:15.631943');
INSERT INTO public.time_slots VALUES (238, 13, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:15.632984');
INSERT INTO public.time_slots VALUES (239, 13, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:15.63385');
INSERT INTO public.time_slots VALUES (240, 13, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:15.634689');
INSERT INTO public.time_slots VALUES (241, 13, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:15.635849');
INSERT INTO public.time_slots VALUES (242, 13, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:15.636797');
INSERT INTO public.time_slots VALUES (243, 13, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:15.637817');
INSERT INTO public.time_slots VALUES (244, 13, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:15.638801');
INSERT INTO public.time_slots VALUES (245, 13, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:15.639641');
INSERT INTO public.time_slots VALUES (246, 13, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:15.640732');
INSERT INTO public.time_slots VALUES (247, 13, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:15.641857');
INSERT INTO public.time_slots VALUES (248, 13, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:15.642982');
INSERT INTO public.time_slots VALUES (249, 13, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:15.644068');
INSERT INTO public.time_slots VALUES (250, 13, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:15.645026');
INSERT INTO public.time_slots VALUES (251, 13, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:15.645961');
INSERT INTO public.time_slots VALUES (252, 13, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:15.64685');
INSERT INTO public.time_slots VALUES (253, 13, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:15.647823');
INSERT INTO public.time_slots VALUES (254, 13, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:15.648895');
INSERT INTO public.time_slots VALUES (255, 13, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:15.650254');
INSERT INTO public.time_slots VALUES (256, 13, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:15.651522');
INSERT INTO public.time_slots VALUES (257, 13, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:15.652651');
INSERT INTO public.time_slots VALUES (258, 13, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:15.653987');
INSERT INTO public.time_slots VALUES (259, 13, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:15.655073');
INSERT INTO public.time_slots VALUES (260, 13, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:15.656038');
INSERT INTO public.time_slots VALUES (261, 14, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:15.656999');
INSERT INTO public.time_slots VALUES (262, 14, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:15.658062');
INSERT INTO public.time_slots VALUES (263, 14, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:15.659179');
INSERT INTO public.time_slots VALUES (264, 14, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:15.660549');
INSERT INTO public.time_slots VALUES (265, 14, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:15.661607');
INSERT INTO public.time_slots VALUES (266, 14, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:15.662618');
INSERT INTO public.time_slots VALUES (267, 14, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:15.663585');
INSERT INTO public.time_slots VALUES (268, 14, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:15.664667');
INSERT INTO public.time_slots VALUES (269, 14, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:15.66566');
INSERT INTO public.time_slots VALUES (270, 14, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:15.666625');
INSERT INTO public.time_slots VALUES (271, 14, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:15.667494');
INSERT INTO public.time_slots VALUES (272, 14, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:15.668501');
INSERT INTO public.time_slots VALUES (273, 14, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.669466');
INSERT INTO public.time_slots VALUES (274, 14, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.670511');
INSERT INTO public.time_slots VALUES (275, 14, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.671576');
INSERT INTO public.time_slots VALUES (276, 14, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.672903');
INSERT INTO public.time_slots VALUES (277, 14, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.674204');
INSERT INTO public.time_slots VALUES (278, 14, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.675239');
INSERT INTO public.time_slots VALUES (279, 14, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.676206');
INSERT INTO public.time_slots VALUES (280, 14, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.677134');
INSERT INTO public.time_slots VALUES (281, 14, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.678143');
INSERT INTO public.time_slots VALUES (282, 14, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.679106');
INSERT INTO public.time_slots VALUES (283, 14, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:15.680098');
INSERT INTO public.time_slots VALUES (284, 14, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:15.681078');
INSERT INTO public.time_slots VALUES (285, 14, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:15.682936');
INSERT INTO public.time_slots VALUES (286, 14, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:15.684145');
INSERT INTO public.time_slots VALUES (287, 14, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:15.685222');
INSERT INTO public.time_slots VALUES (288, 14, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:15.686228');
INSERT INTO public.time_slots VALUES (289, 14, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:15.687211');
INSERT INTO public.time_slots VALUES (290, 14, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:15.688223');
INSERT INTO public.time_slots VALUES (291, 14, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:15.689284');
INSERT INTO public.time_slots VALUES (292, 14, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:15.690268');
INSERT INTO public.time_slots VALUES (293, 14, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:15.691322');
INSERT INTO public.time_slots VALUES (294, 14, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:15.692295');
INSERT INTO public.time_slots VALUES (295, 14, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:15.693502');
INSERT INTO public.time_slots VALUES (296, 14, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:15.694466');
INSERT INTO public.time_slots VALUES (297, 14, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:15.695533');
INSERT INTO public.time_slots VALUES (298, 14, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:15.696484');
INSERT INTO public.time_slots VALUES (299, 14, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:15.69741');
INSERT INTO public.time_slots VALUES (300, 14, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:15.698406');
INSERT INTO public.time_slots VALUES (301, 14, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:15.699327');
INSERT INTO public.time_slots VALUES (302, 14, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:15.700184');
INSERT INTO public.time_slots VALUES (303, 14, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:15.701086');
INSERT INTO public.time_slots VALUES (304, 14, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:15.702091');
INSERT INTO public.time_slots VALUES (305, 14, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:15.70302');
INSERT INTO public.time_slots VALUES (306, 14, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:15.70387');
INSERT INTO public.time_slots VALUES (307, 14, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:15.704694');
INSERT INTO public.time_slots VALUES (309, 14, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:15.706748');
INSERT INTO public.time_slots VALUES (310, 14, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:15.707769');
INSERT INTO public.time_slots VALUES (311, 14, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:15.708725');
INSERT INTO public.time_slots VALUES (312, 14, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:15.709717');
INSERT INTO public.time_slots VALUES (313, 14, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:15.710732');
INSERT INTO public.time_slots VALUES (314, 14, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:15.711849');
INSERT INTO public.time_slots VALUES (315, 14, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:15.713071');
INSERT INTO public.time_slots VALUES (316, 14, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:15.714238');
INSERT INTO public.time_slots VALUES (317, 14, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:15.715208');
INSERT INTO public.time_slots VALUES (318, 14, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:15.716044');
INSERT INTO public.time_slots VALUES (319, 14, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:15.717014');
INSERT INTO public.time_slots VALUES (320, 14, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:15.719034');
INSERT INTO public.time_slots VALUES (321, 14, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:15.719996');
INSERT INTO public.time_slots VALUES (322, 14, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:15.720924');
INSERT INTO public.time_slots VALUES (323, 14, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:15.721774');
INSERT INTO public.time_slots VALUES (324, 14, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:15.722676');
INSERT INTO public.time_slots VALUES (325, 14, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:15.72365');
INSERT INTO public.time_slots VALUES (326, 14, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:15.7245');
INSERT INTO public.time_slots VALUES (327, 14, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:15.725712');
INSERT INTO public.time_slots VALUES (328, 14, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:15.726594');
INSERT INTO public.time_slots VALUES (329, 14, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:15.727583');
INSERT INTO public.time_slots VALUES (330, 14, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:15.728628');
INSERT INTO public.time_slots VALUES (331, 14, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:15.729598');
INSERT INTO public.time_slots VALUES (332, 14, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:15.730651');
INSERT INTO public.time_slots VALUES (333, 14, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:15.731634');
INSERT INTO public.time_slots VALUES (334, 14, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:15.732583');
INSERT INTO public.time_slots VALUES (335, 14, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:15.733468');
INSERT INTO public.time_slots VALUES (336, 14, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:15.734506');
INSERT INTO public.time_slots VALUES (337, 14, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:15.735638');
INSERT INTO public.time_slots VALUES (338, 14, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:15.736608');
INSERT INTO public.time_slots VALUES (339, 14, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:15.737529');
INSERT INTO public.time_slots VALUES (340, 14, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:15.738497');
INSERT INTO public.time_slots VALUES (341, 15, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:15.739369');
INSERT INTO public.time_slots VALUES (342, 15, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:15.74048');
INSERT INTO public.time_slots VALUES (343, 15, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:15.74134');
INSERT INTO public.time_slots VALUES (344, 15, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:15.742402');
INSERT INTO public.time_slots VALUES (345, 15, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:15.743388');
INSERT INTO public.time_slots VALUES (346, 15, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:15.744269');
INSERT INTO public.time_slots VALUES (347, 15, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:15.745183');
INSERT INTO public.time_slots VALUES (348, 15, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:15.746051');
INSERT INTO public.time_slots VALUES (349, 15, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:15.746992');
INSERT INTO public.time_slots VALUES (350, 15, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:15.747921');
INSERT INTO public.time_slots VALUES (351, 15, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:15.748922');
INSERT INTO public.time_slots VALUES (352, 15, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:15.749905');
INSERT INTO public.time_slots VALUES (353, 15, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.750844');
INSERT INTO public.time_slots VALUES (354, 15, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.751778');
INSERT INTO public.time_slots VALUES (355, 15, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.752915');
INSERT INTO public.time_slots VALUES (356, 15, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.754579');
INSERT INTO public.time_slots VALUES (357, 15, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.755476');
INSERT INTO public.time_slots VALUES (358, 15, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.756496');
INSERT INTO public.time_slots VALUES (359, 15, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.757429');
INSERT INTO public.time_slots VALUES (360, 15, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.758486');
INSERT INTO public.time_slots VALUES (361, 15, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.759338');
INSERT INTO public.time_slots VALUES (362, 15, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.760332');
INSERT INTO public.time_slots VALUES (363, 15, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:15.761247');
INSERT INTO public.time_slots VALUES (364, 15, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:15.762099');
INSERT INTO public.time_slots VALUES (365, 15, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:15.76296');
INSERT INTO public.time_slots VALUES (366, 15, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:15.76402');
INSERT INTO public.time_slots VALUES (367, 15, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:15.764935');
INSERT INTO public.time_slots VALUES (368, 15, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:15.765837');
INSERT INTO public.time_slots VALUES (369, 15, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:15.766832');
INSERT INTO public.time_slots VALUES (370, 15, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:15.767874');
INSERT INTO public.time_slots VALUES (371, 15, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:15.768992');
INSERT INTO public.time_slots VALUES (372, 15, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:15.770086');
INSERT INTO public.time_slots VALUES (373, 15, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:15.7715');
INSERT INTO public.time_slots VALUES (374, 15, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:15.772604');
INSERT INTO public.time_slots VALUES (375, 15, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:15.773824');
INSERT INTO public.time_slots VALUES (376, 15, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:15.774933');
INSERT INTO public.time_slots VALUES (377, 15, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:15.776005');
INSERT INTO public.time_slots VALUES (378, 15, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:15.776994');
INSERT INTO public.time_slots VALUES (379, 15, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:15.778101');
INSERT INTO public.time_slots VALUES (380, 15, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:15.779116');
INSERT INTO public.time_slots VALUES (381, 15, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:15.780024');
INSERT INTO public.time_slots VALUES (382, 15, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:15.780942');
INSERT INTO public.time_slots VALUES (383, 15, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:15.781814');
INSERT INTO public.time_slots VALUES (384, 15, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:15.783025');
INSERT INTO public.time_slots VALUES (385, 15, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:15.783969');
INSERT INTO public.time_slots VALUES (386, 15, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:15.785897');
INSERT INTO public.time_slots VALUES (387, 15, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:15.787119');
INSERT INTO public.time_slots VALUES (388, 15, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:15.788228');
INSERT INTO public.time_slots VALUES (389, 15, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:15.789095');
INSERT INTO public.time_slots VALUES (390, 15, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:15.790089');
INSERT INTO public.time_slots VALUES (391, 15, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:15.791159');
INSERT INTO public.time_slots VALUES (392, 15, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:15.792237');
INSERT INTO public.time_slots VALUES (393, 15, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:15.793271');
INSERT INTO public.time_slots VALUES (394, 15, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:15.7942');
INSERT INTO public.time_slots VALUES (395, 15, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:15.795187');
INSERT INTO public.time_slots VALUES (396, 15, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:15.796173');
INSERT INTO public.time_slots VALUES (397, 15, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:15.797113');
INSERT INTO public.time_slots VALUES (398, 15, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:15.798152');
INSERT INTO public.time_slots VALUES (399, 15, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:15.799213');
INSERT INTO public.time_slots VALUES (400, 15, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:15.800333');
INSERT INTO public.time_slots VALUES (401, 15, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:15.801335');
INSERT INTO public.time_slots VALUES (402, 15, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:15.802372');
INSERT INTO public.time_slots VALUES (403, 15, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:15.803436');
INSERT INTO public.time_slots VALUES (404, 15, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:15.80434');
INSERT INTO public.time_slots VALUES (405, 15, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:15.805158');
INSERT INTO public.time_slots VALUES (406, 15, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:15.806121');
INSERT INTO public.time_slots VALUES (407, 15, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:15.806938');
INSERT INTO public.time_slots VALUES (408, 15, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:15.80789');
INSERT INTO public.time_slots VALUES (409, 15, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:15.809187');
INSERT INTO public.time_slots VALUES (410, 15, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:15.810128');
INSERT INTO public.time_slots VALUES (411, 15, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:15.810957');
INSERT INTO public.time_slots VALUES (412, 15, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:15.811881');
INSERT INTO public.time_slots VALUES (413, 15, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:15.812783');
INSERT INTO public.time_slots VALUES (414, 15, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:15.813845');
INSERT INTO public.time_slots VALUES (415, 15, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:15.814785');
INSERT INTO public.time_slots VALUES (416, 15, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:15.815797');
INSERT INTO public.time_slots VALUES (417, 15, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:15.816629');
INSERT INTO public.time_slots VALUES (418, 15, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:15.818764');
INSERT INTO public.time_slots VALUES (419, 15, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:15.819692');
INSERT INTO public.time_slots VALUES (420, 15, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:15.820526');
INSERT INTO public.time_slots VALUES (421, 16, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:15.821602');
INSERT INTO public.time_slots VALUES (422, 16, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:15.822804');
INSERT INTO public.time_slots VALUES (423, 16, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:15.823797');
INSERT INTO public.time_slots VALUES (424, 16, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:15.824586');
INSERT INTO public.time_slots VALUES (425, 16, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:15.825481');
INSERT INTO public.time_slots VALUES (426, 16, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:15.826437');
INSERT INTO public.time_slots VALUES (427, 16, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:15.827309');
INSERT INTO public.time_slots VALUES (428, 16, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:15.828253');
INSERT INTO public.time_slots VALUES (429, 16, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:15.829157');
INSERT INTO public.time_slots VALUES (430, 16, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:15.830032');
INSERT INTO public.time_slots VALUES (431, 16, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:15.831015');
INSERT INTO public.time_slots VALUES (432, 16, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:15.831975');
INSERT INTO public.time_slots VALUES (433, 16, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.833007');
INSERT INTO public.time_slots VALUES (434, 16, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.833866');
INSERT INTO public.time_slots VALUES (435, 16, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.83469');
INSERT INTO public.time_slots VALUES (436, 16, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.835659');
INSERT INTO public.time_slots VALUES (437, 16, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.83666');
INSERT INTO public.time_slots VALUES (438, 16, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.837667');
INSERT INTO public.time_slots VALUES (439, 16, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.838543');
INSERT INTO public.time_slots VALUES (440, 16, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.839403');
INSERT INTO public.time_slots VALUES (441, 16, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.840369');
INSERT INTO public.time_slots VALUES (442, 16, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.841455');
INSERT INTO public.time_slots VALUES (443, 16, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:15.842606');
INSERT INTO public.time_slots VALUES (444, 16, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:15.843635');
INSERT INTO public.time_slots VALUES (445, 16, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:15.844568');
INSERT INTO public.time_slots VALUES (446, 16, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:15.845526');
INSERT INTO public.time_slots VALUES (447, 16, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:15.846548');
INSERT INTO public.time_slots VALUES (448, 16, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:15.847544');
INSERT INTO public.time_slots VALUES (449, 16, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:15.848467');
INSERT INTO public.time_slots VALUES (450, 16, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:15.849286');
INSERT INTO public.time_slots VALUES (451, 16, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:15.850581');
INSERT INTO public.time_slots VALUES (452, 16, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:15.851493');
INSERT INTO public.time_slots VALUES (453, 16, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:15.852933');
INSERT INTO public.time_slots VALUES (454, 16, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:15.854163');
INSERT INTO public.time_slots VALUES (455, 16, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:15.855242');
INSERT INTO public.time_slots VALUES (456, 16, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:15.856144');
INSERT INTO public.time_slots VALUES (457, 16, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:15.856951');
INSERT INTO public.time_slots VALUES (458, 16, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:15.857745');
INSERT INTO public.time_slots VALUES (459, 16, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:15.858765');
INSERT INTO public.time_slots VALUES (460, 16, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:15.859691');
INSERT INTO public.time_slots VALUES (461, 16, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:15.860713');
INSERT INTO public.time_slots VALUES (462, 16, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:15.861655');
INSERT INTO public.time_slots VALUES (463, 16, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:15.862647');
INSERT INTO public.time_slots VALUES (464, 16, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:15.863606');
INSERT INTO public.time_slots VALUES (465, 16, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:15.86463');
INSERT INTO public.time_slots VALUES (466, 16, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:15.865664');
INSERT INTO public.time_slots VALUES (467, 16, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:15.866593');
INSERT INTO public.time_slots VALUES (468, 16, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:15.867538');
INSERT INTO public.time_slots VALUES (469, 16, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:15.868402');
INSERT INTO public.time_slots VALUES (470, 16, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:15.869466');
INSERT INTO public.time_slots VALUES (471, 16, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:15.870338');
INSERT INTO public.time_slots VALUES (472, 16, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:15.871189');
INSERT INTO public.time_slots VALUES (473, 16, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:15.872257');
INSERT INTO public.time_slots VALUES (474, 16, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:15.873254');
INSERT INTO public.time_slots VALUES (475, 16, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:15.874237');
INSERT INTO public.time_slots VALUES (476, 16, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:15.875137');
INSERT INTO public.time_slots VALUES (477, 16, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:15.876118');
INSERT INTO public.time_slots VALUES (478, 16, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:15.876998');
INSERT INTO public.time_slots VALUES (479, 16, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:15.878102');
INSERT INTO public.time_slots VALUES (480, 16, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:15.879053');
INSERT INTO public.time_slots VALUES (481, 16, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:15.88');
INSERT INTO public.time_slots VALUES (482, 16, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:15.88083');
INSERT INTO public.time_slots VALUES (483, 16, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:15.881687');
INSERT INTO public.time_slots VALUES (484, 16, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:15.882668');
INSERT INTO public.time_slots VALUES (485, 16, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:15.883609');
INSERT INTO public.time_slots VALUES (486, 16, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:15.884678');
INSERT INTO public.time_slots VALUES (487, 16, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:15.885702');
INSERT INTO public.time_slots VALUES (488, 16, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:15.886509');
INSERT INTO public.time_slots VALUES (489, 16, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:15.887934');
INSERT INTO public.time_slots VALUES (490, 16, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:15.888958');
INSERT INTO public.time_slots VALUES (491, 16, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:15.889943');
INSERT INTO public.time_slots VALUES (492, 16, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:15.89099');
INSERT INTO public.time_slots VALUES (493, 16, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:15.892097');
INSERT INTO public.time_slots VALUES (494, 16, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:15.893179');
INSERT INTO public.time_slots VALUES (495, 16, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:15.894153');
INSERT INTO public.time_slots VALUES (496, 16, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:15.895098');
INSERT INTO public.time_slots VALUES (497, 16, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:15.896073');
INSERT INTO public.time_slots VALUES (498, 16, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:15.897075');
INSERT INTO public.time_slots VALUES (499, 16, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:15.898046');
INSERT INTO public.time_slots VALUES (500, 16, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:15.89911');
INSERT INTO public.time_slots VALUES (502, 17, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:15.901028');
INSERT INTO public.time_slots VALUES (503, 17, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:15.901879');
INSERT INTO public.time_slots VALUES (504, 17, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:15.902951');
INSERT INTO public.time_slots VALUES (505, 17, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:15.904069');
INSERT INTO public.time_slots VALUES (506, 17, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:15.904972');
INSERT INTO public.time_slots VALUES (507, 17, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:15.905959');
INSERT INTO public.time_slots VALUES (508, 17, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:15.906952');
INSERT INTO public.time_slots VALUES (509, 17, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:15.90841');
INSERT INTO public.time_slots VALUES (510, 17, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:15.909463');
INSERT INTO public.time_slots VALUES (511, 17, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:15.910402');
INSERT INTO public.time_slots VALUES (512, 17, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:15.911392');
INSERT INTO public.time_slots VALUES (513, 17, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.912416');
INSERT INTO public.time_slots VALUES (514, 17, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.913259');
INSERT INTO public.time_slots VALUES (515, 17, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.914116');
INSERT INTO public.time_slots VALUES (516, 17, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.915128');
INSERT INTO public.time_slots VALUES (517, 17, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.916058');
INSERT INTO public.time_slots VALUES (518, 17, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.916899');
INSERT INTO public.time_slots VALUES (519, 17, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.917782');
INSERT INTO public.time_slots VALUES (520, 17, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.918769');
INSERT INTO public.time_slots VALUES (521, 17, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.919724');
INSERT INTO public.time_slots VALUES (522, 17, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.920649');
INSERT INTO public.time_slots VALUES (523, 17, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:15.921432');
INSERT INTO public.time_slots VALUES (524, 17, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:15.923161');
INSERT INTO public.time_slots VALUES (525, 17, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:15.924325');
INSERT INTO public.time_slots VALUES (526, 17, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:15.92534');
INSERT INTO public.time_slots VALUES (527, 17, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:15.926369');
INSERT INTO public.time_slots VALUES (528, 17, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:15.927205');
INSERT INTO public.time_slots VALUES (529, 17, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:15.928206');
INSERT INTO public.time_slots VALUES (530, 17, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:15.92928');
INSERT INTO public.time_slots VALUES (531, 17, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:15.930164');
INSERT INTO public.time_slots VALUES (532, 17, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:15.931136');
INSERT INTO public.time_slots VALUES (533, 17, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:15.93216');
INSERT INTO public.time_slots VALUES (534, 17, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:15.933429');
INSERT INTO public.time_slots VALUES (535, 17, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:15.934272');
INSERT INTO public.time_slots VALUES (536, 17, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:15.935228');
INSERT INTO public.time_slots VALUES (537, 17, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:15.93604');
INSERT INTO public.time_slots VALUES (538, 17, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:15.936837');
INSERT INTO public.time_slots VALUES (539, 17, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:15.937834');
INSERT INTO public.time_slots VALUES (540, 17, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:15.938929');
INSERT INTO public.time_slots VALUES (541, 17, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:15.939954');
INSERT INTO public.time_slots VALUES (542, 17, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:15.94101');
INSERT INTO public.time_slots VALUES (543, 17, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:15.941987');
INSERT INTO public.time_slots VALUES (544, 17, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:15.942884');
INSERT INTO public.time_slots VALUES (545, 17, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:15.943729');
INSERT INTO public.time_slots VALUES (546, 17, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:15.944714');
INSERT INTO public.time_slots VALUES (547, 17, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:15.945713');
INSERT INTO public.time_slots VALUES (548, 17, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:15.946616');
INSERT INTO public.time_slots VALUES (549, 17, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:15.947508');
INSERT INTO public.time_slots VALUES (550, 17, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:15.948415');
INSERT INTO public.time_slots VALUES (551, 17, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:15.949306');
INSERT INTO public.time_slots VALUES (552, 17, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:15.950262');
INSERT INTO public.time_slots VALUES (553, 17, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:15.95122');
INSERT INTO public.time_slots VALUES (554, 17, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:15.952164');
INSERT INTO public.time_slots VALUES (555, 17, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:15.953128');
INSERT INTO public.time_slots VALUES (556, 17, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:15.954069');
INSERT INTO public.time_slots VALUES (557, 17, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:15.954854');
INSERT INTO public.time_slots VALUES (558, 17, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:15.955781');
INSERT INTO public.time_slots VALUES (559, 17, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:15.956737');
INSERT INTO public.time_slots VALUES (560, 17, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:15.958385');
INSERT INTO public.time_slots VALUES (561, 17, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:15.959438');
INSERT INTO public.time_slots VALUES (562, 17, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:15.960444');
INSERT INTO public.time_slots VALUES (563, 17, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:15.961407');
INSERT INTO public.time_slots VALUES (564, 17, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:15.96232');
INSERT INTO public.time_slots VALUES (565, 17, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:15.963245');
INSERT INTO public.time_slots VALUES (566, 17, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:15.964303');
INSERT INTO public.time_slots VALUES (567, 17, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:15.965139');
INSERT INTO public.time_slots VALUES (568, 17, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:15.966191');
INSERT INTO public.time_slots VALUES (569, 17, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:15.96708');
INSERT INTO public.time_slots VALUES (570, 17, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:15.968027');
INSERT INTO public.time_slots VALUES (571, 17, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:15.968999');
INSERT INTO public.time_slots VALUES (572, 17, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:15.969948');
INSERT INTO public.time_slots VALUES (573, 17, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:15.970939');
INSERT INTO public.time_slots VALUES (574, 17, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:15.971955');
INSERT INTO public.time_slots VALUES (575, 17, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:15.97299');
INSERT INTO public.time_slots VALUES (576, 17, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:15.974046');
INSERT INTO public.time_slots VALUES (577, 17, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:15.974987');
INSERT INTO public.time_slots VALUES (578, 17, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:15.975939');
INSERT INTO public.time_slots VALUES (579, 17, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:15.976721');
INSERT INTO public.time_slots VALUES (580, 17, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:15.97766');
INSERT INTO public.time_slots VALUES (581, 18, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:15.978591');
INSERT INTO public.time_slots VALUES (582, 18, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:15.979505');
INSERT INTO public.time_slots VALUES (583, 18, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:15.980406');
INSERT INTO public.time_slots VALUES (584, 18, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:15.981278');
INSERT INTO public.time_slots VALUES (585, 18, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:15.982376');
INSERT INTO public.time_slots VALUES (586, 18, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:15.983281');
INSERT INTO public.time_slots VALUES (587, 18, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:15.984402');
INSERT INTO public.time_slots VALUES (588, 18, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:15.985315');
INSERT INTO public.time_slots VALUES (589, 18, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:15.98634');
INSERT INTO public.time_slots VALUES (590, 18, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:15.987176');
INSERT INTO public.time_slots VALUES (591, 18, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:15.988225');
INSERT INTO public.time_slots VALUES (592, 18, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:15.989153');
INSERT INTO public.time_slots VALUES (593, 18, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:15.990065');
INSERT INTO public.time_slots VALUES (594, 18, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:15.990951');
INSERT INTO public.time_slots VALUES (595, 18, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:15.991931');
INSERT INTO public.time_slots VALUES (596, 18, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:15.992847');
INSERT INTO public.time_slots VALUES (597, 18, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:15.993857');
INSERT INTO public.time_slots VALUES (598, 18, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:15.995174');
INSERT INTO public.time_slots VALUES (599, 18, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:15.996108');
INSERT INTO public.time_slots VALUES (600, 18, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:15.997143');
INSERT INTO public.time_slots VALUES (601, 18, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:15.998078');
INSERT INTO public.time_slots VALUES (602, 18, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:15.998971');
INSERT INTO public.time_slots VALUES (603, 18, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:16.00327');
INSERT INTO public.time_slots VALUES (604, 18, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:16.011243');
INSERT INTO public.time_slots VALUES (605, 18, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:16.01631');
INSERT INTO public.time_slots VALUES (606, 18, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:16.017632');
INSERT INTO public.time_slots VALUES (607, 18, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:16.019608');
INSERT INTO public.time_slots VALUES (608, 18, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:16.021205');
INSERT INTO public.time_slots VALUES (609, 18, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:16.022647');
INSERT INTO public.time_slots VALUES (610, 18, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:16.023818');
INSERT INTO public.time_slots VALUES (611, 18, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:16.024849');
INSERT INTO public.time_slots VALUES (612, 18, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:16.02585');
INSERT INTO public.time_slots VALUES (613, 18, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:16.026784');
INSERT INTO public.time_slots VALUES (614, 18, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:16.028047');
INSERT INTO public.time_slots VALUES (615, 18, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:16.029172');
INSERT INTO public.time_slots VALUES (616, 18, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:16.030195');
INSERT INTO public.time_slots VALUES (617, 18, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:16.031439');
INSERT INTO public.time_slots VALUES (618, 18, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:16.032381');
INSERT INTO public.time_slots VALUES (619, 18, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:16.033244');
INSERT INTO public.time_slots VALUES (620, 18, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:16.034441');
INSERT INTO public.time_slots VALUES (621, 18, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:16.035438');
INSERT INTO public.time_slots VALUES (622, 18, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:16.036471');
INSERT INTO public.time_slots VALUES (623, 18, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:16.03749');
INSERT INTO public.time_slots VALUES (624, 18, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:16.038415');
INSERT INTO public.time_slots VALUES (625, 18, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:16.039394');
INSERT INTO public.time_slots VALUES (626, 18, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:16.040319');
INSERT INTO public.time_slots VALUES (627, 18, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:16.041223');
INSERT INTO public.time_slots VALUES (628, 18, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:16.042346');
INSERT INTO public.time_slots VALUES (629, 18, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:16.043449');
INSERT INTO public.time_slots VALUES (630, 18, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:16.044536');
INSERT INTO public.time_slots VALUES (631, 18, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:16.045678');
INSERT INTO public.time_slots VALUES (632, 18, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:16.046684');
INSERT INTO public.time_slots VALUES (633, 18, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:16.047723');
INSERT INTO public.time_slots VALUES (634, 18, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:16.048692');
INSERT INTO public.time_slots VALUES (635, 18, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:16.04964');
INSERT INTO public.time_slots VALUES (636, 18, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:16.050827');
INSERT INTO public.time_slots VALUES (637, 18, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:16.051907');
INSERT INTO public.time_slots VALUES (638, 18, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:16.052966');
INSERT INTO public.time_slots VALUES (639, 18, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:16.054034');
INSERT INTO public.time_slots VALUES (640, 18, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:16.055105');
INSERT INTO public.time_slots VALUES (641, 18, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:16.056039');
INSERT INTO public.time_slots VALUES (642, 18, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:16.057116');
INSERT INTO public.time_slots VALUES (643, 18, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:16.058201');
INSERT INTO public.time_slots VALUES (644, 18, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:16.059172');
INSERT INTO public.time_slots VALUES (645, 18, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:16.06014');
INSERT INTO public.time_slots VALUES (646, 18, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:16.061024');
INSERT INTO public.time_slots VALUES (647, 18, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:16.062202');
INSERT INTO public.time_slots VALUES (648, 18, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:16.063194');
INSERT INTO public.time_slots VALUES (649, 18, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:16.064274');
INSERT INTO public.time_slots VALUES (650, 18, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:16.06526');
INSERT INTO public.time_slots VALUES (651, 18, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:16.066238');
INSERT INTO public.time_slots VALUES (652, 18, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:16.067113');
INSERT INTO public.time_slots VALUES (653, 18, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:16.068014');
INSERT INTO public.time_slots VALUES (654, 18, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:16.069005');
INSERT INTO public.time_slots VALUES (655, 18, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:16.069981');
INSERT INTO public.time_slots VALUES (656, 18, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:16.070873');
INSERT INTO public.time_slots VALUES (657, 18, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:16.071914');
INSERT INTO public.time_slots VALUES (658, 18, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:16.072913');
INSERT INTO public.time_slots VALUES (659, 18, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:16.073957');
INSERT INTO public.time_slots VALUES (660, 18, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:16.074896');
INSERT INTO public.time_slots VALUES (661, 19, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:16.075887');
INSERT INTO public.time_slots VALUES (662, 19, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:16.076932');
INSERT INTO public.time_slots VALUES (663, 19, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:16.077774');
INSERT INTO public.time_slots VALUES (664, 19, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:16.078857');
INSERT INTO public.time_slots VALUES (665, 19, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:16.079869');
INSERT INTO public.time_slots VALUES (666, 19, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:16.080755');
INSERT INTO public.time_slots VALUES (667, 19, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:16.081639');
INSERT INTO public.time_slots VALUES (668, 19, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:16.082624');
INSERT INTO public.time_slots VALUES (669, 19, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:16.083754');
INSERT INTO public.time_slots VALUES (670, 19, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:16.084819');
INSERT INTO public.time_slots VALUES (671, 19, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:16.085914');
INSERT INTO public.time_slots VALUES (672, 19, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:16.086871');
INSERT INTO public.time_slots VALUES (673, 19, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:16.087751');
INSERT INTO public.time_slots VALUES (674, 19, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:16.088692');
INSERT INTO public.time_slots VALUES (675, 19, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:16.089609');
INSERT INTO public.time_slots VALUES (676, 19, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:16.090542');
INSERT INTO public.time_slots VALUES (677, 19, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:16.091462');
INSERT INTO public.time_slots VALUES (678, 19, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:16.092453');
INSERT INTO public.time_slots VALUES (679, 19, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:16.093541');
INSERT INTO public.time_slots VALUES (680, 19, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:16.0944');
INSERT INTO public.time_slots VALUES (681, 19, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:16.095363');
INSERT INTO public.time_slots VALUES (682, 19, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:16.09627');
INSERT INTO public.time_slots VALUES (683, 19, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:16.098024');
INSERT INTO public.time_slots VALUES (684, 19, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:16.099025');
INSERT INTO public.time_slots VALUES (685, 19, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:16.099991');
INSERT INTO public.time_slots VALUES (686, 19, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:16.101034');
INSERT INTO public.time_slots VALUES (687, 19, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:16.101973');
INSERT INTO public.time_slots VALUES (688, 19, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:16.102964');
INSERT INTO public.time_slots VALUES (689, 19, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:16.104054');
INSERT INTO public.time_slots VALUES (690, 19, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:16.105016');
INSERT INTO public.time_slots VALUES (691, 19, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:16.105858');
INSERT INTO public.time_slots VALUES (692, 19, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:16.106832');
INSERT INTO public.time_slots VALUES (693, 19, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:16.107967');
INSERT INTO public.time_slots VALUES (694, 19, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:16.108986');
INSERT INTO public.time_slots VALUES (695, 19, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:16.109857');
INSERT INTO public.time_slots VALUES (696, 19, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:16.110866');
INSERT INTO public.time_slots VALUES (697, 19, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:16.111762');
INSERT INTO public.time_slots VALUES (698, 19, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:16.112717');
INSERT INTO public.time_slots VALUES (699, 19, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:16.113791');
INSERT INTO public.time_slots VALUES (700, 19, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:16.114848');
INSERT INTO public.time_slots VALUES (701, 19, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:16.115783');
INSERT INTO public.time_slots VALUES (702, 19, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:16.116735');
INSERT INTO public.time_slots VALUES (703, 19, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:16.117732');
INSERT INTO public.time_slots VALUES (704, 19, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:16.118641');
INSERT INTO public.time_slots VALUES (705, 19, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:16.119547');
INSERT INTO public.time_slots VALUES (706, 19, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:16.120475');
INSERT INTO public.time_slots VALUES (707, 19, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:16.1214');
INSERT INTO public.time_slots VALUES (708, 19, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:16.122375');
INSERT INTO public.time_slots VALUES (709, 19, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:16.123576');
INSERT INTO public.time_slots VALUES (710, 19, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:16.124533');
INSERT INTO public.time_slots VALUES (711, 19, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:16.125492');
INSERT INTO public.time_slots VALUES (712, 19, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:16.126413');
INSERT INTO public.time_slots VALUES (713, 19, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:16.127265');
INSERT INTO public.time_slots VALUES (714, 19, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:16.128282');
INSERT INTO public.time_slots VALUES (715, 19, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:16.129229');
INSERT INTO public.time_slots VALUES (716, 19, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:16.13009');
INSERT INTO public.time_slots VALUES (717, 19, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:16.130927');
INSERT INTO public.time_slots VALUES (718, 19, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:16.131979');
INSERT INTO public.time_slots VALUES (719, 19, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:16.133171');
INSERT INTO public.time_slots VALUES (720, 19, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:16.13406');
INSERT INTO public.time_slots VALUES (721, 19, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:16.135041');
INSERT INTO public.time_slots VALUES (722, 19, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:16.135977');
INSERT INTO public.time_slots VALUES (723, 19, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:16.1369');
INSERT INTO public.time_slots VALUES (724, 19, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:16.137859');
INSERT INTO public.time_slots VALUES (725, 19, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:16.138718');
INSERT INTO public.time_slots VALUES (726, 19, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:16.139652');
INSERT INTO public.time_slots VALUES (727, 19, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:16.140522');
INSERT INTO public.time_slots VALUES (728, 19, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:16.141325');
INSERT INTO public.time_slots VALUES (729, 19, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:16.142173');
INSERT INTO public.time_slots VALUES (730, 19, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:16.143178');
INSERT INTO public.time_slots VALUES (731, 19, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:16.144166');
INSERT INTO public.time_slots VALUES (732, 19, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:16.145171');
INSERT INTO public.time_slots VALUES (733, 19, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:16.14617');
INSERT INTO public.time_slots VALUES (734, 19, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:16.147151');
INSERT INTO public.time_slots VALUES (735, 19, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:16.147979');
INSERT INTO public.time_slots VALUES (736, 19, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:16.148977');
INSERT INTO public.time_slots VALUES (737, 19, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:16.15003');
INSERT INTO public.time_slots VALUES (738, 19, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:16.151081');
INSERT INTO public.time_slots VALUES (739, 19, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:16.152051');
INSERT INTO public.time_slots VALUES (740, 19, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:16.152996');
INSERT INTO public.time_slots VALUES (741, 20, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:16.153932');
INSERT INTO public.time_slots VALUES (742, 20, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:16.154946');
INSERT INTO public.time_slots VALUES (743, 20, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:16.155856');
INSERT INTO public.time_slots VALUES (744, 20, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:16.156826');
INSERT INTO public.time_slots VALUES (745, 20, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:16.157658');
INSERT INTO public.time_slots VALUES (746, 20, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:16.158492');
INSERT INTO public.time_slots VALUES (747, 20, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:16.159516');
INSERT INTO public.time_slots VALUES (748, 20, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:16.160463');
INSERT INTO public.time_slots VALUES (749, 20, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:16.161489');
INSERT INTO public.time_slots VALUES (750, 20, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:16.162448');
INSERT INTO public.time_slots VALUES (751, 20, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:16.163378');
INSERT INTO public.time_slots VALUES (752, 20, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:16.164188');
INSERT INTO public.time_slots VALUES (753, 20, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:16.165185');
INSERT INTO public.time_slots VALUES (754, 20, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:16.166184');
INSERT INTO public.time_slots VALUES (755, 20, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:16.167076');
INSERT INTO public.time_slots VALUES (756, 20, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:16.168029');
INSERT INTO public.time_slots VALUES (757, 20, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:16.169074');
INSERT INTO public.time_slots VALUES (758, 20, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:16.169957');
INSERT INTO public.time_slots VALUES (759, 20, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:16.170862');
INSERT INTO public.time_slots VALUES (760, 20, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:16.171761');
INSERT INTO public.time_slots VALUES (761, 20, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:16.172885');
INSERT INTO public.time_slots VALUES (762, 20, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:16.173898');
INSERT INTO public.time_slots VALUES (763, 20, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:16.174888');
INSERT INTO public.time_slots VALUES (764, 20, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:16.175789');
INSERT INTO public.time_slots VALUES (765, 20, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:16.176628');
INSERT INTO public.time_slots VALUES (766, 20, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:16.177547');
INSERT INTO public.time_slots VALUES (767, 20, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:16.178502');
INSERT INTO public.time_slots VALUES (768, 20, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:16.179499');
INSERT INTO public.time_slots VALUES (769, 20, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:16.180406');
INSERT INTO public.time_slots VALUES (770, 20, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:16.181259');
INSERT INTO public.time_slots VALUES (771, 20, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:16.182251');
INSERT INTO public.time_slots VALUES (772, 20, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:16.183391');
INSERT INTO public.time_slots VALUES (773, 20, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:16.184415');
INSERT INTO public.time_slots VALUES (774, 20, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:16.185501');
INSERT INTO public.time_slots VALUES (775, 20, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:16.186493');
INSERT INTO public.time_slots VALUES (776, 20, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:16.187411');
INSERT INTO public.time_slots VALUES (777, 20, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:16.188241');
INSERT INTO public.time_slots VALUES (778, 20, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:16.189179');
INSERT INTO public.time_slots VALUES (779, 20, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:16.190131');
INSERT INTO public.time_slots VALUES (780, 20, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:16.190953');
INSERT INTO public.time_slots VALUES (781, 20, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:16.191885');
INSERT INTO public.time_slots VALUES (782, 20, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:16.192845');
INSERT INTO public.time_slots VALUES (783, 20, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:16.193824');
INSERT INTO public.time_slots VALUES (784, 20, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:16.194741');
INSERT INTO public.time_slots VALUES (785, 20, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:16.195722');
INSERT INTO public.time_slots VALUES (786, 20, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:16.196639');
INSERT INTO public.time_slots VALUES (787, 20, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:16.197565');
INSERT INTO public.time_slots VALUES (788, 20, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:16.198451');
INSERT INTO public.time_slots VALUES (789, 20, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:16.199734');
INSERT INTO public.time_slots VALUES (790, 20, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:16.200796');
INSERT INTO public.time_slots VALUES (791, 20, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:16.201811');
INSERT INTO public.time_slots VALUES (792, 20, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:16.202887');
INSERT INTO public.time_slots VALUES (793, 20, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:16.203849');
INSERT INTO public.time_slots VALUES (794, 20, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:16.204781');
INSERT INTO public.time_slots VALUES (795, 20, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:16.205768');
INSERT INTO public.time_slots VALUES (796, 20, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:16.206716');
INSERT INTO public.time_slots VALUES (797, 20, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:16.207771');
INSERT INTO public.time_slots VALUES (798, 20, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:16.208761');
INSERT INTO public.time_slots VALUES (799, 20, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:16.209698');
INSERT INTO public.time_slots VALUES (800, 20, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:16.210612');
INSERT INTO public.time_slots VALUES (801, 20, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:16.211591');
INSERT INTO public.time_slots VALUES (802, 20, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:16.212622');
INSERT INTO public.time_slots VALUES (803, 20, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:16.213663');
INSERT INTO public.time_slots VALUES (804, 20, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:16.214761');
INSERT INTO public.time_slots VALUES (805, 20, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:16.215754');
INSERT INTO public.time_slots VALUES (806, 20, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:16.216685');
INSERT INTO public.time_slots VALUES (807, 20, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:16.217656');
INSERT INTO public.time_slots VALUES (808, 20, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:16.218685');
INSERT INTO public.time_slots VALUES (809, 20, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:16.219579');
INSERT INTO public.time_slots VALUES (810, 20, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:16.220392');
INSERT INTO public.time_slots VALUES (811, 20, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:16.221219');
INSERT INTO public.time_slots VALUES (812, 20, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:16.222224');
INSERT INTO public.time_slots VALUES (813, 20, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:16.223312');
INSERT INTO public.time_slots VALUES (814, 20, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:16.22423');
INSERT INTO public.time_slots VALUES (815, 20, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:16.225052');
INSERT INTO public.time_slots VALUES (816, 20, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:16.226028');
INSERT INTO public.time_slots VALUES (817, 20, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:16.226992');
INSERT INTO public.time_slots VALUES (818, 20, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:16.227932');
INSERT INTO public.time_slots VALUES (819, 20, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:16.228893');
INSERT INTO public.time_slots VALUES (820, 20, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:16.229795');
INSERT INTO public.time_slots VALUES (821, 37, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:16.230612');
INSERT INTO public.time_slots VALUES (822, 37, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:16.23161');
INSERT INTO public.time_slots VALUES (823, 37, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:16.232526');
INSERT INTO public.time_slots VALUES (824, 37, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:16.233473');
INSERT INTO public.time_slots VALUES (825, 37, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:16.234435');
INSERT INTO public.time_slots VALUES (826, 37, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:16.235389');
INSERT INTO public.time_slots VALUES (827, 37, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:16.23633');
INSERT INTO public.time_slots VALUES (828, 37, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:16.237132');
INSERT INTO public.time_slots VALUES (829, 37, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:16.237942');
INSERT INTO public.time_slots VALUES (830, 37, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:16.238766');
INSERT INTO public.time_slots VALUES (831, 37, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:16.239655');
INSERT INTO public.time_slots VALUES (832, 37, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:16.240652');
INSERT INTO public.time_slots VALUES (833, 37, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:16.241495');
INSERT INTO public.time_slots VALUES (834, 37, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:16.242588');
INSERT INTO public.time_slots VALUES (835, 37, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:16.243523');
INSERT INTO public.time_slots VALUES (836, 37, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:16.244513');
INSERT INTO public.time_slots VALUES (837, 37, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:16.245405');
INSERT INTO public.time_slots VALUES (838, 37, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:16.246276');
INSERT INTO public.time_slots VALUES (839, 37, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:16.247195');
INSERT INTO public.time_slots VALUES (840, 37, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:16.248173');
INSERT INTO public.time_slots VALUES (841, 37, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:16.249189');
INSERT INTO public.time_slots VALUES (842, 37, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:16.25013');
INSERT INTO public.time_slots VALUES (843, 37, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:16.250959');
INSERT INTO public.time_slots VALUES (844, 37, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:16.252017');
INSERT INTO public.time_slots VALUES (845, 37, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:16.253046');
INSERT INTO public.time_slots VALUES (846, 37, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:16.253969');
INSERT INTO public.time_slots VALUES (847, 37, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:16.254904');
INSERT INTO public.time_slots VALUES (848, 37, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:16.255868');
INSERT INTO public.time_slots VALUES (849, 37, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:16.256814');
INSERT INTO public.time_slots VALUES (850, 37, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:16.257717');
INSERT INTO public.time_slots VALUES (851, 37, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:16.25867');
INSERT INTO public.time_slots VALUES (852, 37, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:16.259556');
INSERT INTO public.time_slots VALUES (853, 37, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:16.260471');
INSERT INTO public.time_slots VALUES (854, 37, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:16.261361');
INSERT INTO public.time_slots VALUES (855, 37, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:16.262287');
INSERT INTO public.time_slots VALUES (856, 37, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:16.263417');
INSERT INTO public.time_slots VALUES (857, 37, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:16.264337');
INSERT INTO public.time_slots VALUES (858, 37, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:16.2652');
INSERT INTO public.time_slots VALUES (859, 37, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:16.266007');
INSERT INTO public.time_slots VALUES (860, 37, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:16.266925');
INSERT INTO public.time_slots VALUES (861, 37, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:16.2679');
INSERT INTO public.time_slots VALUES (862, 37, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:16.268908');
INSERT INTO public.time_slots VALUES (863, 37, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:16.269836');
INSERT INTO public.time_slots VALUES (864, 37, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:16.270872');
INSERT INTO public.time_slots VALUES (865, 37, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:16.272108');
INSERT INTO public.time_slots VALUES (866, 37, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:16.273105');
INSERT INTO public.time_slots VALUES (867, 37, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:16.274213');
INSERT INTO public.time_slots VALUES (868, 37, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:16.275361');
INSERT INTO public.time_slots VALUES (869, 37, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:16.276371');
INSERT INTO public.time_slots VALUES (870, 37, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:16.277309');
INSERT INTO public.time_slots VALUES (871, 37, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:16.278233');
INSERT INTO public.time_slots VALUES (872, 37, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:16.279204');
INSERT INTO public.time_slots VALUES (873, 37, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:16.280183');
INSERT INTO public.time_slots VALUES (874, 37, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:16.281048');
INSERT INTO public.time_slots VALUES (875, 37, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:16.282096');
INSERT INTO public.time_slots VALUES (876, 37, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:16.283219');
INSERT INTO public.time_slots VALUES (877, 37, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:16.284326');
INSERT INTO public.time_slots VALUES (878, 37, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:16.285334');
INSERT INTO public.time_slots VALUES (879, 37, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:16.286372');
INSERT INTO public.time_slots VALUES (880, 37, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:16.287285');
INSERT INTO public.time_slots VALUES (881, 37, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:16.288296');
INSERT INTO public.time_slots VALUES (882, 37, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:16.289296');
INSERT INTO public.time_slots VALUES (883, 37, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:16.290235');
INSERT INTO public.time_slots VALUES (884, 37, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:16.291168');
INSERT INTO public.time_slots VALUES (885, 37, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:16.292197');
INSERT INTO public.time_slots VALUES (886, 37, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:16.293248');
INSERT INTO public.time_slots VALUES (887, 37, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:16.294259');
INSERT INTO public.time_slots VALUES (888, 37, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:16.295251');
INSERT INTO public.time_slots VALUES (889, 37, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:16.296236');
INSERT INTO public.time_slots VALUES (890, 37, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:16.297385');
INSERT INTO public.time_slots VALUES (891, 37, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:16.298319');
INSERT INTO public.time_slots VALUES (892, 37, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:16.299492');
INSERT INTO public.time_slots VALUES (893, 37, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:16.30105');
INSERT INTO public.time_slots VALUES (894, 37, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:16.302418');
INSERT INTO public.time_slots VALUES (895, 37, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:16.303393');
INSERT INTO public.time_slots VALUES (896, 37, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:16.304409');
INSERT INTO public.time_slots VALUES (897, 37, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:16.305302');
INSERT INTO public.time_slots VALUES (898, 37, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:16.306399');
INSERT INTO public.time_slots VALUES (899, 37, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:16.30747');
INSERT INTO public.time_slots VALUES (900, 37, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:16.308632');
INSERT INTO public.time_slots VALUES (901, 38, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:16.309718');
INSERT INTO public.time_slots VALUES (902, 38, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:16.310686');
INSERT INTO public.time_slots VALUES (903, 38, '2025-06-02 10:00:00', '2025-06-02 10:30:00', true, NULL, '2025-06-01 12:42:16.31159');
INSERT INTO public.time_slots VALUES (904, 38, '2025-06-02 10:30:00', '2025-06-02 11:00:00', true, NULL, '2025-06-01 12:42:16.312643');
INSERT INTO public.time_slots VALUES (905, 38, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:16.31405');
INSERT INTO public.time_slots VALUES (906, 38, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:16.315067');
INSERT INTO public.time_slots VALUES (907, 38, '2025-06-02 12:00:00', '2025-06-02 12:30:00', true, NULL, '2025-06-01 12:42:16.316048');
INSERT INTO public.time_slots VALUES (908, 38, '2025-06-02 12:30:00', '2025-06-02 13:00:00', true, NULL, '2025-06-01 12:42:16.316986');
INSERT INTO public.time_slots VALUES (909, 38, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:16.317984');
INSERT INTO public.time_slots VALUES (910, 38, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:16.318966');
INSERT INTO public.time_slots VALUES (911, 38, '2025-06-02 14:00:00', '2025-06-02 14:30:00', true, NULL, '2025-06-01 12:42:16.319977');
INSERT INTO public.time_slots VALUES (912, 38, '2025-06-02 14:30:00', '2025-06-02 15:00:00', true, NULL, '2025-06-01 12:42:16.320848');
INSERT INTO public.time_slots VALUES (913, 38, '2025-06-02 15:00:00', '2025-06-02 15:30:00', true, NULL, '2025-06-01 12:42:16.321725');
INSERT INTO public.time_slots VALUES (914, 38, '2025-06-02 15:30:00', '2025-06-02 16:00:00', true, NULL, '2025-06-01 12:42:16.322648');
INSERT INTO public.time_slots VALUES (915, 38, '2025-06-02 16:00:00', '2025-06-02 16:30:00', true, NULL, '2025-06-01 12:42:16.323657');
INSERT INTO public.time_slots VALUES (916, 38, '2025-06-02 16:30:00', '2025-06-02 17:00:00', true, NULL, '2025-06-01 12:42:16.324671');
INSERT INTO public.time_slots VALUES (917, 38, '2025-06-03 09:00:00', '2025-06-03 09:30:00', true, NULL, '2025-06-01 12:42:16.325544');
INSERT INTO public.time_slots VALUES (918, 38, '2025-06-03 09:30:00', '2025-06-03 10:00:00', true, NULL, '2025-06-01 12:42:16.326471');
INSERT INTO public.time_slots VALUES (919, 38, '2025-06-03 10:00:00', '2025-06-03 10:30:00', true, NULL, '2025-06-01 12:42:16.327463');
INSERT INTO public.time_slots VALUES (920, 38, '2025-06-03 10:30:00', '2025-06-03 11:00:00', true, NULL, '2025-06-01 12:42:16.328368');
INSERT INTO public.time_slots VALUES (921, 38, '2025-06-03 11:00:00', '2025-06-03 11:30:00', true, NULL, '2025-06-01 12:42:16.329289');
INSERT INTO public.time_slots VALUES (922, 38, '2025-06-03 11:30:00', '2025-06-03 12:00:00', true, NULL, '2025-06-01 12:42:16.33025');
INSERT INTO public.time_slots VALUES (923, 38, '2025-06-03 12:00:00', '2025-06-03 12:30:00', true, NULL, '2025-06-01 12:42:16.331214');
INSERT INTO public.time_slots VALUES (924, 38, '2025-06-03 12:30:00', '2025-06-03 13:00:00', true, NULL, '2025-06-01 12:42:16.332072');
INSERT INTO public.time_slots VALUES (925, 38, '2025-06-03 13:00:00', '2025-06-03 13:30:00', true, NULL, '2025-06-01 12:42:16.332999');
INSERT INTO public.time_slots VALUES (926, 38, '2025-06-03 13:30:00', '2025-06-03 14:00:00', true, NULL, '2025-06-01 12:42:16.33402');
INSERT INTO public.time_slots VALUES (927, 38, '2025-06-03 14:00:00', '2025-06-03 14:30:00', true, NULL, '2025-06-01 12:42:16.335001');
INSERT INTO public.time_slots VALUES (928, 38, '2025-06-03 14:30:00', '2025-06-03 15:00:00', true, NULL, '2025-06-01 12:42:16.335982');
INSERT INTO public.time_slots VALUES (929, 38, '2025-06-03 15:00:00', '2025-06-03 15:30:00', true, NULL, '2025-06-01 12:42:16.336877');
INSERT INTO public.time_slots VALUES (930, 38, '2025-06-03 15:30:00', '2025-06-03 16:00:00', true, NULL, '2025-06-01 12:42:16.338399');
INSERT INTO public.time_slots VALUES (931, 38, '2025-06-03 16:00:00', '2025-06-03 16:30:00', true, NULL, '2025-06-01 12:42:16.339348');
INSERT INTO public.time_slots VALUES (932, 38, '2025-06-03 16:30:00', '2025-06-03 17:00:00', true, NULL, '2025-06-01 12:42:16.340236');
INSERT INTO public.time_slots VALUES (933, 38, '2025-06-04 09:00:00', '2025-06-04 09:30:00', true, NULL, '2025-06-01 12:42:16.341119');
INSERT INTO public.time_slots VALUES (934, 38, '2025-06-04 09:30:00', '2025-06-04 10:00:00', true, NULL, '2025-06-01 12:42:16.342446');
INSERT INTO public.time_slots VALUES (935, 38, '2025-06-04 10:00:00', '2025-06-04 10:30:00', true, NULL, '2025-06-01 12:42:16.343645');
INSERT INTO public.time_slots VALUES (936, 38, '2025-06-04 10:30:00', '2025-06-04 11:00:00', true, NULL, '2025-06-01 12:42:16.344614');
INSERT INTO public.time_slots VALUES (937, 38, '2025-06-04 11:00:00', '2025-06-04 11:30:00', true, NULL, '2025-06-01 12:42:16.345572');
INSERT INTO public.time_slots VALUES (938, 38, '2025-06-04 11:30:00', '2025-06-04 12:00:00', true, NULL, '2025-06-01 12:42:16.346498');
INSERT INTO public.time_slots VALUES (939, 38, '2025-06-04 12:00:00', '2025-06-04 12:30:00', true, NULL, '2025-06-01 12:42:16.347508');
INSERT INTO public.time_slots VALUES (940, 38, '2025-06-04 12:30:00', '2025-06-04 13:00:00', true, NULL, '2025-06-01 12:42:16.348445');
INSERT INTO public.time_slots VALUES (941, 38, '2025-06-04 13:00:00', '2025-06-04 13:30:00', true, NULL, '2025-06-01 12:42:16.349516');
INSERT INTO public.time_slots VALUES (942, 38, '2025-06-04 13:30:00', '2025-06-04 14:00:00', true, NULL, '2025-06-01 12:42:16.350429');
INSERT INTO public.time_slots VALUES (943, 38, '2025-06-04 14:00:00', '2025-06-04 14:30:00', true, NULL, '2025-06-01 12:42:16.351226');
INSERT INTO public.time_slots VALUES (944, 38, '2025-06-04 14:30:00', '2025-06-04 15:00:00', true, NULL, '2025-06-01 12:42:16.352125');
INSERT INTO public.time_slots VALUES (945, 38, '2025-06-04 15:00:00', '2025-06-04 15:30:00', true, NULL, '2025-06-01 12:42:16.353091');
INSERT INTO public.time_slots VALUES (946, 38, '2025-06-04 15:30:00', '2025-06-04 16:00:00', true, NULL, '2025-06-01 12:42:16.354144');
INSERT INTO public.time_slots VALUES (947, 38, '2025-06-04 16:00:00', '2025-06-04 16:30:00', true, NULL, '2025-06-01 12:42:16.355086');
INSERT INTO public.time_slots VALUES (948, 38, '2025-06-04 16:30:00', '2025-06-04 17:00:00', true, NULL, '2025-06-01 12:42:16.356033');
INSERT INTO public.time_slots VALUES (949, 38, '2025-06-05 09:00:00', '2025-06-05 09:30:00', true, NULL, '2025-06-01 12:42:16.356998');
INSERT INTO public.time_slots VALUES (950, 38, '2025-06-05 09:30:00', '2025-06-05 10:00:00', true, NULL, '2025-06-01 12:42:16.357881');
INSERT INTO public.time_slots VALUES (951, 38, '2025-06-05 10:00:00', '2025-06-05 10:30:00', true, NULL, '2025-06-01 12:42:16.358802');
INSERT INTO public.time_slots VALUES (952, 38, '2025-06-05 10:30:00', '2025-06-05 11:00:00', true, NULL, '2025-06-01 12:42:16.359781');
INSERT INTO public.time_slots VALUES (953, 38, '2025-06-05 11:00:00', '2025-06-05 11:30:00', true, NULL, '2025-06-01 12:42:16.36073');
INSERT INTO public.time_slots VALUES (954, 38, '2025-06-05 11:30:00', '2025-06-05 12:00:00', true, NULL, '2025-06-01 12:42:16.361797');
INSERT INTO public.time_slots VALUES (955, 38, '2025-06-05 12:00:00', '2025-06-05 12:30:00', true, NULL, '2025-06-01 12:42:16.362666');
INSERT INTO public.time_slots VALUES (956, 38, '2025-06-05 12:30:00', '2025-06-05 13:00:00', true, NULL, '2025-06-01 12:42:16.363769');
INSERT INTO public.time_slots VALUES (957, 38, '2025-06-05 13:00:00', '2025-06-05 13:30:00', true, NULL, '2025-06-01 12:42:16.364738');
INSERT INTO public.time_slots VALUES (958, 38, '2025-06-05 13:30:00', '2025-06-05 14:00:00', true, NULL, '2025-06-01 12:42:16.365644');
INSERT INTO public.time_slots VALUES (959, 38, '2025-06-05 14:00:00', '2025-06-05 14:30:00', true, NULL, '2025-06-01 12:42:16.367496');
INSERT INTO public.time_slots VALUES (960, 38, '2025-06-05 14:30:00', '2025-06-05 15:00:00', true, NULL, '2025-06-01 12:42:16.36849');
INSERT INTO public.time_slots VALUES (961, 38, '2025-06-05 15:00:00', '2025-06-05 15:30:00', true, NULL, '2025-06-01 12:42:16.369597');
INSERT INTO public.time_slots VALUES (962, 38, '2025-06-05 15:30:00', '2025-06-05 16:00:00', true, NULL, '2025-06-01 12:42:16.370548');
INSERT INTO public.time_slots VALUES (963, 38, '2025-06-05 16:00:00', '2025-06-05 16:30:00', true, NULL, '2025-06-01 12:42:16.371493');
INSERT INTO public.time_slots VALUES (964, 38, '2025-06-05 16:30:00', '2025-06-05 17:00:00', true, NULL, '2025-06-01 12:42:16.372679');
INSERT INTO public.time_slots VALUES (965, 38, '2025-06-06 09:00:00', '2025-06-06 09:30:00', true, NULL, '2025-06-01 12:42:16.373806');
INSERT INTO public.time_slots VALUES (966, 38, '2025-06-06 09:30:00', '2025-06-06 10:00:00', true, NULL, '2025-06-01 12:42:16.374924');
INSERT INTO public.time_slots VALUES (967, 38, '2025-06-06 10:00:00', '2025-06-06 10:30:00', true, NULL, '2025-06-01 12:42:16.376028');
INSERT INTO public.time_slots VALUES (968, 38, '2025-06-06 10:30:00', '2025-06-06 11:00:00', true, NULL, '2025-06-01 12:42:16.376909');
INSERT INTO public.time_slots VALUES (969, 38, '2025-06-06 11:00:00', '2025-06-06 11:30:00', true, NULL, '2025-06-01 12:42:16.377713');
INSERT INTO public.time_slots VALUES (970, 38, '2025-06-06 11:30:00', '2025-06-06 12:00:00', true, NULL, '2025-06-01 12:42:16.378634');
INSERT INTO public.time_slots VALUES (971, 38, '2025-06-06 12:00:00', '2025-06-06 12:30:00', true, NULL, '2025-06-01 12:42:16.379578');
INSERT INTO public.time_slots VALUES (972, 38, '2025-06-06 12:30:00', '2025-06-06 13:00:00', true, NULL, '2025-06-01 12:42:16.380568');
INSERT INTO public.time_slots VALUES (973, 38, '2025-06-06 13:00:00', '2025-06-06 13:30:00', true, NULL, '2025-06-01 12:42:16.381392');
INSERT INTO public.time_slots VALUES (974, 38, '2025-06-06 13:30:00', '2025-06-06 14:00:00', true, NULL, '2025-06-01 12:42:16.382228');
INSERT INTO public.time_slots VALUES (975, 38, '2025-06-06 14:00:00', '2025-06-06 14:30:00', true, NULL, '2025-06-01 12:42:16.383429');
INSERT INTO public.time_slots VALUES (976, 38, '2025-06-06 14:30:00', '2025-06-06 15:00:00', true, NULL, '2025-06-01 12:42:16.384467');
INSERT INTO public.time_slots VALUES (977, 38, '2025-06-06 15:00:00', '2025-06-06 15:30:00', true, NULL, '2025-06-01 12:42:16.385342');
INSERT INTO public.time_slots VALUES (978, 38, '2025-06-06 15:30:00', '2025-06-06 16:00:00', true, NULL, '2025-06-01 12:42:16.386244');
INSERT INTO public.time_slots VALUES (979, 38, '2025-06-06 16:00:00', '2025-06-06 16:30:00', true, NULL, '2025-06-01 12:42:16.386992');
INSERT INTO public.time_slots VALUES (980, 38, '2025-06-06 16:30:00', '2025-06-06 17:00:00', true, NULL, '2025-06-01 12:42:16.387881');
INSERT INTO public.time_slots VALUES (981, 11, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:46.317559');
INSERT INTO public.time_slots VALUES (982, 11, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:46.318968');
INSERT INTO public.time_slots VALUES (983, 11, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:46.319952');
INSERT INTO public.time_slots VALUES (984, 11, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:46.320975');
INSERT INTO public.time_slots VALUES (985, 11, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:46.322056');
INSERT INTO public.time_slots VALUES (986, 11, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:46.323061');
INSERT INTO public.time_slots VALUES (987, 11, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:46.324631');
INSERT INTO public.time_slots VALUES (988, 11, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:46.326113');
INSERT INTO public.time_slots VALUES (989, 11, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:46.327139');
INSERT INTO public.time_slots VALUES (990, 11, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:46.328127');
INSERT INTO public.time_slots VALUES (991, 11, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:46.329106');
INSERT INTO public.time_slots VALUES (992, 11, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:46.330134');
INSERT INTO public.time_slots VALUES (993, 11, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:46.331121');
INSERT INTO public.time_slots VALUES (994, 11, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:46.332206');
INSERT INTO public.time_slots VALUES (995, 11, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:46.33318');
INSERT INTO public.time_slots VALUES (996, 11, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:46.334171');
INSERT INTO public.time_slots VALUES (997, 11, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:46.335059');
INSERT INTO public.time_slots VALUES (998, 11, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:46.336146');
INSERT INTO public.time_slots VALUES (999, 11, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:46.337092');
INSERT INTO public.time_slots VALUES (1000, 11, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:46.337996');
INSERT INTO public.time_slots VALUES (1001, 11, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:46.338923');
INSERT INTO public.time_slots VALUES (1002, 11, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:46.339859');
INSERT INTO public.time_slots VALUES (1003, 11, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:46.340834');
INSERT INTO public.time_slots VALUES (1004, 11, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:46.341768');
INSERT INTO public.time_slots VALUES (1005, 11, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:46.342621');
INSERT INTO public.time_slots VALUES (1006, 11, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:46.343528');
INSERT INTO public.time_slots VALUES (1007, 11, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:46.344569');
INSERT INTO public.time_slots VALUES (1008, 11, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:46.345537');
INSERT INTO public.time_slots VALUES (1009, 11, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:46.346459');
INSERT INTO public.time_slots VALUES (1010, 11, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:46.347481');
INSERT INTO public.time_slots VALUES (1011, 11, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:46.348458');
INSERT INTO public.time_slots VALUES (1012, 11, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:46.349406');
INSERT INTO public.time_slots VALUES (1013, 11, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:46.350343');
INSERT INTO public.time_slots VALUES (1014, 11, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:46.351203');
INSERT INTO public.time_slots VALUES (1015, 11, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:46.352214');
INSERT INTO public.time_slots VALUES (1016, 11, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:46.353191');
INSERT INTO public.time_slots VALUES (1017, 11, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:46.354046');
INSERT INTO public.time_slots VALUES (1018, 11, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:46.355033');
INSERT INTO public.time_slots VALUES (1019, 11, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:46.355956');
INSERT INTO public.time_slots VALUES (1020, 11, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:46.356981');
INSERT INTO public.time_slots VALUES (1021, 11, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:46.358072');
INSERT INTO public.time_slots VALUES (1022, 11, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:46.35908');
INSERT INTO public.time_slots VALUES (1023, 11, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:46.360206');
INSERT INTO public.time_slots VALUES (1024, 11, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:46.361152');
INSERT INTO public.time_slots VALUES (1025, 11, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:46.362396');
INSERT INTO public.time_slots VALUES (1026, 11, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:46.363732');
INSERT INTO public.time_slots VALUES (1027, 11, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:46.364882');
INSERT INTO public.time_slots VALUES (1028, 11, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:46.36589');
INSERT INTO public.time_slots VALUES (1029, 11, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:46.366837');
INSERT INTO public.time_slots VALUES (1030, 11, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:46.367734');
INSERT INTO public.time_slots VALUES (1031, 11, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:46.368652');
INSERT INTO public.time_slots VALUES (1032, 11, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:46.369666');
INSERT INTO public.time_slots VALUES (1033, 11, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:46.370735');
INSERT INTO public.time_slots VALUES (1034, 11, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:46.371775');
INSERT INTO public.time_slots VALUES (1035, 11, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:46.372866');
INSERT INTO public.time_slots VALUES (1036, 11, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:46.374098');
INSERT INTO public.time_slots VALUES (1037, 11, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:46.375155');
INSERT INTO public.time_slots VALUES (1038, 11, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:46.376191');
INSERT INTO public.time_slots VALUES (1039, 11, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:46.377175');
INSERT INTO public.time_slots VALUES (1040, 11, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:46.378193');
INSERT INTO public.time_slots VALUES (1041, 11, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:46.379125');
INSERT INTO public.time_slots VALUES (1042, 11, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:46.380144');
INSERT INTO public.time_slots VALUES (1043, 11, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:46.381158');
INSERT INTO public.time_slots VALUES (1044, 11, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:46.382344');
INSERT INTO public.time_slots VALUES (1045, 11, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:46.383346');
INSERT INTO public.time_slots VALUES (1046, 11, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:46.384324');
INSERT INTO public.time_slots VALUES (1047, 11, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:46.385422');
INSERT INTO public.time_slots VALUES (1048, 11, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:46.386497');
INSERT INTO public.time_slots VALUES (1049, 11, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:46.388104');
INSERT INTO public.time_slots VALUES (1050, 11, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:46.389157');
INSERT INTO public.time_slots VALUES (1051, 12, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:46.426335');
INSERT INTO public.time_slots VALUES (1052, 12, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:46.427406');
INSERT INTO public.time_slots VALUES (1053, 12, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:46.428403');
INSERT INTO public.time_slots VALUES (1054, 12, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:46.429304');
INSERT INTO public.time_slots VALUES (1055, 12, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:46.430246');
INSERT INTO public.time_slots VALUES (1056, 12, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:46.431207');
INSERT INTO public.time_slots VALUES (1057, 12, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:46.432192');
INSERT INTO public.time_slots VALUES (1058, 12, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:46.433153');
INSERT INTO public.time_slots VALUES (1059, 12, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:46.434334');
INSERT INTO public.time_slots VALUES (1060, 12, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:46.43533');
INSERT INTO public.time_slots VALUES (1061, 12, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:46.436463');
INSERT INTO public.time_slots VALUES (1062, 12, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:46.437438');
INSERT INTO public.time_slots VALUES (1063, 12, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:46.438549');
INSERT INTO public.time_slots VALUES (1064, 12, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:46.439612');
INSERT INTO public.time_slots VALUES (1065, 12, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:46.440859');
INSERT INTO public.time_slots VALUES (1066, 12, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:46.441967');
INSERT INTO public.time_slots VALUES (1067, 12, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:46.443046');
INSERT INTO public.time_slots VALUES (1068, 12, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:46.444268');
INSERT INTO public.time_slots VALUES (1069, 12, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:46.445152');
INSERT INTO public.time_slots VALUES (1070, 12, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:46.446276');
INSERT INTO public.time_slots VALUES (1071, 12, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:46.447345');
INSERT INTO public.time_slots VALUES (1072, 12, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:46.448466');
INSERT INTO public.time_slots VALUES (1073, 12, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:46.449478');
INSERT INTO public.time_slots VALUES (1074, 12, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:46.450445');
INSERT INTO public.time_slots VALUES (1075, 12, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:46.451742');
INSERT INTO public.time_slots VALUES (1076, 12, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:46.452865');
INSERT INTO public.time_slots VALUES (1077, 12, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:46.454642');
INSERT INTO public.time_slots VALUES (1078, 12, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:46.456078');
INSERT INTO public.time_slots VALUES (1079, 12, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:46.457109');
INSERT INTO public.time_slots VALUES (1080, 12, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:46.458285');
INSERT INTO public.time_slots VALUES (1081, 12, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:46.459419');
INSERT INTO public.time_slots VALUES (1082, 12, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:46.460475');
INSERT INTO public.time_slots VALUES (1083, 12, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:46.461536');
INSERT INTO public.time_slots VALUES (1084, 12, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:46.462535');
INSERT INTO public.time_slots VALUES (1085, 12, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:46.463493');
INSERT INTO public.time_slots VALUES (1086, 12, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:46.464707');
INSERT INTO public.time_slots VALUES (1087, 12, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:46.465576');
INSERT INTO public.time_slots VALUES (1088, 12, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:46.46674');
INSERT INTO public.time_slots VALUES (1089, 12, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:46.46777');
INSERT INTO public.time_slots VALUES (1090, 12, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:46.468733');
INSERT INTO public.time_slots VALUES (1091, 12, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:46.469721');
INSERT INTO public.time_slots VALUES (1092, 12, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:46.470608');
INSERT INTO public.time_slots VALUES (1093, 12, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:46.471612');
INSERT INTO public.time_slots VALUES (1094, 12, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:46.473012');
INSERT INTO public.time_slots VALUES (1095, 12, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:46.474046');
INSERT INTO public.time_slots VALUES (1096, 12, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:46.475143');
INSERT INTO public.time_slots VALUES (1097, 12, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:46.476348');
INSERT INTO public.time_slots VALUES (1098, 12, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:46.477308');
INSERT INTO public.time_slots VALUES (1099, 12, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:46.478175');
INSERT INTO public.time_slots VALUES (1100, 12, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:46.479267');
INSERT INTO public.time_slots VALUES (1101, 12, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:46.480147');
INSERT INTO public.time_slots VALUES (1102, 12, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:46.481243');
INSERT INTO public.time_slots VALUES (1103, 12, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:46.48225');
INSERT INTO public.time_slots VALUES (1104, 12, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:46.483331');
INSERT INTO public.time_slots VALUES (1105, 12, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:46.484325');
INSERT INTO public.time_slots VALUES (1106, 12, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:46.485386');
INSERT INTO public.time_slots VALUES (1107, 12, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:46.486402');
INSERT INTO public.time_slots VALUES (1108, 12, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:46.487301');
INSERT INTO public.time_slots VALUES (1109, 12, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:46.488375');
INSERT INTO public.time_slots VALUES (1110, 12, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:46.489257');
INSERT INTO public.time_slots VALUES (1111, 12, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:46.491024');
INSERT INTO public.time_slots VALUES (1112, 12, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:46.491993');
INSERT INTO public.time_slots VALUES (1113, 12, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:46.493119');
INSERT INTO public.time_slots VALUES (1114, 12, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:46.494118');
INSERT INTO public.time_slots VALUES (1115, 12, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:46.495154');
INSERT INTO public.time_slots VALUES (1116, 12, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:46.496139');
INSERT INTO public.time_slots VALUES (1117, 12, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:46.496989');
INSERT INTO public.time_slots VALUES (1118, 12, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:46.497999');
INSERT INTO public.time_slots VALUES (1119, 12, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:46.498936');
INSERT INTO public.time_slots VALUES (1120, 12, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:46.49984');
INSERT INTO public.time_slots VALUES (1121, 13, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:46.56696');
INSERT INTO public.time_slots VALUES (1122, 13, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:46.56791');
INSERT INTO public.time_slots VALUES (1123, 13, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:46.568786');
INSERT INTO public.time_slots VALUES (1124, 13, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:46.569835');
INSERT INTO public.time_slots VALUES (1125, 13, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:46.571041');
INSERT INTO public.time_slots VALUES (1126, 13, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:46.572041');
INSERT INTO public.time_slots VALUES (1127, 13, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:46.572948');
INSERT INTO public.time_slots VALUES (1128, 13, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:46.573874');
INSERT INTO public.time_slots VALUES (1129, 13, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:46.574956');
INSERT INTO public.time_slots VALUES (1130, 13, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:46.575912');
INSERT INTO public.time_slots VALUES (1131, 13, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:46.576924');
INSERT INTO public.time_slots VALUES (1132, 13, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:46.577993');
INSERT INTO public.time_slots VALUES (1133, 13, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:46.579074');
INSERT INTO public.time_slots VALUES (1134, 13, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:46.580151');
INSERT INTO public.time_slots VALUES (1135, 13, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:46.581207');
INSERT INTO public.time_slots VALUES (1136, 13, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:46.582092');
INSERT INTO public.time_slots VALUES (1137, 13, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:46.583184');
INSERT INTO public.time_slots VALUES (1138, 13, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:46.584306');
INSERT INTO public.time_slots VALUES (1139, 13, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:46.585334');
INSERT INTO public.time_slots VALUES (1140, 13, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:46.586286');
INSERT INTO public.time_slots VALUES (1141, 13, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:46.587313');
INSERT INTO public.time_slots VALUES (1142, 13, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:46.588265');
INSERT INTO public.time_slots VALUES (1143, 13, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:46.5892');
INSERT INTO public.time_slots VALUES (1144, 13, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:46.590123');
INSERT INTO public.time_slots VALUES (1145, 13, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:46.591092');
INSERT INTO public.time_slots VALUES (1146, 13, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:46.592019');
INSERT INTO public.time_slots VALUES (1147, 13, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:46.593897');
INSERT INTO public.time_slots VALUES (1148, 13, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:46.595033');
INSERT INTO public.time_slots VALUES (1149, 13, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:46.596028');
INSERT INTO public.time_slots VALUES (1150, 13, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:46.596994');
INSERT INTO public.time_slots VALUES (1151, 13, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:46.59797');
INSERT INTO public.time_slots VALUES (1152, 13, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:46.599008');
INSERT INTO public.time_slots VALUES (1153, 13, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:46.600043');
INSERT INTO public.time_slots VALUES (1154, 13, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:46.601061');
INSERT INTO public.time_slots VALUES (1155, 13, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:46.60213');
INSERT INTO public.time_slots VALUES (1156, 13, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:46.603076');
INSERT INTO public.time_slots VALUES (1157, 13, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:46.604481');
INSERT INTO public.time_slots VALUES (1158, 13, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:46.605672');
INSERT INTO public.time_slots VALUES (1159, 13, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:46.606688');
INSERT INTO public.time_slots VALUES (1160, 13, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:46.607616');
INSERT INTO public.time_slots VALUES (1161, 13, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:46.608568');
INSERT INTO public.time_slots VALUES (1162, 13, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:46.609628');
INSERT INTO public.time_slots VALUES (1163, 13, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:46.61066');
INSERT INTO public.time_slots VALUES (1164, 13, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:46.61159');
INSERT INTO public.time_slots VALUES (1165, 13, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:46.612474');
INSERT INTO public.time_slots VALUES (1166, 13, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:46.613432');
INSERT INTO public.time_slots VALUES (1167, 13, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:46.61464');
INSERT INTO public.time_slots VALUES (1168, 13, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:46.615927');
INSERT INTO public.time_slots VALUES (1169, 13, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:46.617052');
INSERT INTO public.time_slots VALUES (1170, 13, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:46.618089');
INSERT INTO public.time_slots VALUES (1171, 13, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:46.619171');
INSERT INTO public.time_slots VALUES (1172, 13, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:46.620484');
INSERT INTO public.time_slots VALUES (1173, 13, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:46.621581');
INSERT INTO public.time_slots VALUES (1174, 13, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:46.622942');
INSERT INTO public.time_slots VALUES (1175, 13, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:46.625453');
INSERT INTO public.time_slots VALUES (1176, 13, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:46.62701');
INSERT INTO public.time_slots VALUES (1177, 13, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:46.627956');
INSERT INTO public.time_slots VALUES (1178, 13, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:46.628928');
INSERT INTO public.time_slots VALUES (1179, 13, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:46.62997');
INSERT INTO public.time_slots VALUES (1180, 13, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:46.631145');
INSERT INTO public.time_slots VALUES (1181, 13, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:46.632315');
INSERT INTO public.time_slots VALUES (1182, 13, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:46.633498');
INSERT INTO public.time_slots VALUES (1183, 13, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:46.634496');
INSERT INTO public.time_slots VALUES (1184, 13, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:46.635615');
INSERT INTO public.time_slots VALUES (1185, 13, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:46.636578');
INSERT INTO public.time_slots VALUES (1186, 13, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:46.637586');
INSERT INTO public.time_slots VALUES (1187, 13, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:46.638516');
INSERT INTO public.time_slots VALUES (1188, 13, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:46.639846');
INSERT INTO public.time_slots VALUES (1189, 13, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:46.641389');
INSERT INTO public.time_slots VALUES (1190, 13, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:46.64246');
INSERT INTO public.time_slots VALUES (1191, 14, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:46.681218');
INSERT INTO public.time_slots VALUES (1192, 14, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:46.682301');
INSERT INTO public.time_slots VALUES (1193, 14, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:46.683381');
INSERT INTO public.time_slots VALUES (1194, 14, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:46.684322');
INSERT INTO public.time_slots VALUES (1195, 14, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:46.685267');
INSERT INTO public.time_slots VALUES (1196, 14, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:46.686169');
INSERT INTO public.time_slots VALUES (1197, 14, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:46.687189');
INSERT INTO public.time_slots VALUES (1198, 14, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:46.688164');
INSERT INTO public.time_slots VALUES (1199, 14, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:46.68907');
INSERT INTO public.time_slots VALUES (1200, 14, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:46.690017');
INSERT INTO public.time_slots VALUES (1201, 14, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:46.690974');
INSERT INTO public.time_slots VALUES (1202, 14, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:46.691865');
INSERT INTO public.time_slots VALUES (1203, 14, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:46.692765');
INSERT INTO public.time_slots VALUES (1204, 14, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:46.693735');
INSERT INTO public.time_slots VALUES (1205, 14, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:46.694696');
INSERT INTO public.time_slots VALUES (1206, 14, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:46.695664');
INSERT INTO public.time_slots VALUES (1207, 14, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:46.697264');
INSERT INTO public.time_slots VALUES (1208, 14, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:46.698309');
INSERT INTO public.time_slots VALUES (1209, 14, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:46.699349');
INSERT INTO public.time_slots VALUES (1210, 14, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:46.700276');
INSERT INTO public.time_slots VALUES (1211, 14, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:46.701172');
INSERT INTO public.time_slots VALUES (1212, 14, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:46.702177');
INSERT INTO public.time_slots VALUES (1213, 14, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:46.703042');
INSERT INTO public.time_slots VALUES (1214, 14, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:46.703997');
INSERT INTO public.time_slots VALUES (1215, 14, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:46.704939');
INSERT INTO public.time_slots VALUES (1216, 14, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:46.705792');
INSERT INTO public.time_slots VALUES (1217, 14, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:46.706947');
INSERT INTO public.time_slots VALUES (1218, 14, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:46.707946');
INSERT INTO public.time_slots VALUES (1219, 14, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:46.708958');
INSERT INTO public.time_slots VALUES (1220, 14, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:46.709876');
INSERT INTO public.time_slots VALUES (1221, 14, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:46.71081');
INSERT INTO public.time_slots VALUES (1222, 14, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:46.711733');
INSERT INTO public.time_slots VALUES (1223, 14, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:46.712587');
INSERT INTO public.time_slots VALUES (1224, 14, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:46.713655');
INSERT INTO public.time_slots VALUES (1225, 14, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:46.714803');
INSERT INTO public.time_slots VALUES (1226, 14, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:46.715745');
INSERT INTO public.time_slots VALUES (1227, 14, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:46.716635');
INSERT INTO public.time_slots VALUES (1228, 14, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:46.71758');
INSERT INTO public.time_slots VALUES (1229, 14, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:46.718479');
INSERT INTO public.time_slots VALUES (1230, 14, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:46.719337');
INSERT INTO public.time_slots VALUES (1231, 14, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:46.72025');
INSERT INTO public.time_slots VALUES (1232, 14, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:46.721169');
INSERT INTO public.time_slots VALUES (1233, 14, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:46.72219');
INSERT INTO public.time_slots VALUES (1234, 14, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:46.723178');
INSERT INTO public.time_slots VALUES (1235, 14, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:46.724202');
INSERT INTO public.time_slots VALUES (1236, 14, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:46.725093');
INSERT INTO public.time_slots VALUES (1237, 14, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:46.726031');
INSERT INTO public.time_slots VALUES (1238, 14, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:46.727017');
INSERT INTO public.time_slots VALUES (1239, 14, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:46.727998');
INSERT INTO public.time_slots VALUES (1240, 14, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:46.728996');
INSERT INTO public.time_slots VALUES (1241, 14, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:46.730497');
INSERT INTO public.time_slots VALUES (1242, 14, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:46.731598');
INSERT INTO public.time_slots VALUES (1243, 14, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:46.732599');
INSERT INTO public.time_slots VALUES (1244, 14, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:46.73371');
INSERT INTO public.time_slots VALUES (1245, 14, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:46.734711');
INSERT INTO public.time_slots VALUES (1246, 14, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:46.735747');
INSERT INTO public.time_slots VALUES (1247, 14, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:46.736755');
INSERT INTO public.time_slots VALUES (1248, 14, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:46.737726');
INSERT INTO public.time_slots VALUES (1249, 14, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:46.738737');
INSERT INTO public.time_slots VALUES (1250, 14, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:46.739843');
INSERT INTO public.time_slots VALUES (1251, 14, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:46.740828');
INSERT INTO public.time_slots VALUES (1252, 14, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:46.741792');
INSERT INTO public.time_slots VALUES (1253, 14, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:46.742687');
INSERT INTO public.time_slots VALUES (1254, 14, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:46.743553');
INSERT INTO public.time_slots VALUES (1255, 14, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:46.744482');
INSERT INTO public.time_slots VALUES (1256, 14, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:46.745535');
INSERT INTO public.time_slots VALUES (1257, 14, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:46.746419');
INSERT INTO public.time_slots VALUES (1258, 14, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:46.747298');
INSERT INTO public.time_slots VALUES (1259, 14, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:46.748165');
INSERT INTO public.time_slots VALUES (1260, 14, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:46.749256');
INSERT INTO public.time_slots VALUES (1261, 15, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:46.785163');
INSERT INTO public.time_slots VALUES (1262, 15, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:46.786085');
INSERT INTO public.time_slots VALUES (1263, 15, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:46.78717');
INSERT INTO public.time_slots VALUES (1264, 15, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:46.788186');
INSERT INTO public.time_slots VALUES (1265, 15, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:46.789158');
INSERT INTO public.time_slots VALUES (1266, 15, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:46.789979');
INSERT INTO public.time_slots VALUES (1267, 15, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:46.790942');
INSERT INTO public.time_slots VALUES (1268, 15, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:46.791994');
INSERT INTO public.time_slots VALUES (1269, 15, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:46.793178');
INSERT INTO public.time_slots VALUES (1270, 15, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:46.795402');
INSERT INTO public.time_slots VALUES (1271, 15, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:46.796519');
INSERT INTO public.time_slots VALUES (1272, 15, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:46.79737');
INSERT INTO public.time_slots VALUES (1273, 15, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:46.798514');
INSERT INTO public.time_slots VALUES (1274, 15, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:46.799507');
INSERT INTO public.time_slots VALUES (1275, 15, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:46.800499');
INSERT INTO public.time_slots VALUES (1276, 15, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:46.801459');
INSERT INTO public.time_slots VALUES (1277, 15, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:46.802395');
INSERT INTO public.time_slots VALUES (1278, 15, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:46.80356');
INSERT INTO public.time_slots VALUES (1279, 15, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:46.804557');
INSERT INTO public.time_slots VALUES (1280, 15, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:46.805678');
INSERT INTO public.time_slots VALUES (1281, 15, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:46.806579');
INSERT INTO public.time_slots VALUES (1282, 15, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:46.807617');
INSERT INTO public.time_slots VALUES (1283, 15, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:46.808662');
INSERT INTO public.time_slots VALUES (1284, 15, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:46.80959');
INSERT INTO public.time_slots VALUES (1285, 15, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:46.810566');
INSERT INTO public.time_slots VALUES (1286, 15, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:46.811474');
INSERT INTO public.time_slots VALUES (1287, 15, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:46.812354');
INSERT INTO public.time_slots VALUES (1288, 15, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:46.813408');
INSERT INTO public.time_slots VALUES (1289, 15, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:46.814385');
INSERT INTO public.time_slots VALUES (1290, 15, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:46.815502');
INSERT INTO public.time_slots VALUES (1291, 15, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:46.816389');
INSERT INTO public.time_slots VALUES (1292, 15, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:46.817157');
INSERT INTO public.time_slots VALUES (1293, 15, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:46.818209');
INSERT INTO public.time_slots VALUES (1294, 15, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:46.819064');
INSERT INTO public.time_slots VALUES (1295, 15, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:46.820032');
INSERT INTO public.time_slots VALUES (1296, 15, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:46.820982');
INSERT INTO public.time_slots VALUES (1297, 15, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:46.821973');
INSERT INTO public.time_slots VALUES (1298, 15, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:46.822852');
INSERT INTO public.time_slots VALUES (1299, 15, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:46.823967');
INSERT INTO public.time_slots VALUES (1300, 15, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:46.824982');
INSERT INTO public.time_slots VALUES (1301, 15, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:46.825916');
INSERT INTO public.time_slots VALUES (1302, 15, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:46.826871');
INSERT INTO public.time_slots VALUES (1303, 15, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:46.827844');
INSERT INTO public.time_slots VALUES (1304, 15, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:46.82881');
INSERT INTO public.time_slots VALUES (1305, 15, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:46.829674');
INSERT INTO public.time_slots VALUES (1306, 15, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:46.830603');
INSERT INTO public.time_slots VALUES (1307, 15, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:46.831495');
INSERT INTO public.time_slots VALUES (1308, 15, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:46.832427');
INSERT INTO public.time_slots VALUES (1309, 15, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:46.833395');
INSERT INTO public.time_slots VALUES (1310, 15, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:46.834371');
INSERT INTO public.time_slots VALUES (1311, 15, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:46.835329');
INSERT INTO public.time_slots VALUES (1312, 15, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:46.836234');
INSERT INTO public.time_slots VALUES (1313, 15, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:46.837254');
INSERT INTO public.time_slots VALUES (1314, 15, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:46.838117');
INSERT INTO public.time_slots VALUES (1315, 15, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:46.839045');
INSERT INTO public.time_slots VALUES (1316, 15, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:46.840078');
INSERT INTO public.time_slots VALUES (1317, 15, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:46.841');
INSERT INTO public.time_slots VALUES (1318, 15, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:46.841801');
INSERT INTO public.time_slots VALUES (1319, 15, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:46.842939');
INSERT INTO public.time_slots VALUES (1320, 15, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:46.843876');
INSERT INTO public.time_slots VALUES (1321, 15, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:46.844774');
INSERT INTO public.time_slots VALUES (1322, 15, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:46.845612');
INSERT INTO public.time_slots VALUES (1323, 15, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:46.846503');
INSERT INTO public.time_slots VALUES (1324, 15, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:46.847399');
INSERT INTO public.time_slots VALUES (1325, 15, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:46.848314');
INSERT INTO public.time_slots VALUES (1326, 15, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:46.8493');
INSERT INTO public.time_slots VALUES (1327, 15, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:46.850187');
INSERT INTO public.time_slots VALUES (1328, 15, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:46.85107');
INSERT INTO public.time_slots VALUES (1329, 15, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:46.851872');
INSERT INTO public.time_slots VALUES (1330, 15, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:46.852701');
INSERT INTO public.time_slots VALUES (1331, 16, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:46.88921');
INSERT INTO public.time_slots VALUES (1332, 16, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:46.890433');
INSERT INTO public.time_slots VALUES (1333, 16, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:46.891451');
INSERT INTO public.time_slots VALUES (1334, 16, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:46.892459');
INSERT INTO public.time_slots VALUES (1335, 16, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:46.89353');
INSERT INTO public.time_slots VALUES (1336, 16, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:46.894598');
INSERT INTO public.time_slots VALUES (1337, 16, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:46.895429');
INSERT INTO public.time_slots VALUES (1338, 16, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:46.896298');
INSERT INTO public.time_slots VALUES (1339, 16, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:46.897286');
INSERT INTO public.time_slots VALUES (1340, 16, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:46.898298');
INSERT INTO public.time_slots VALUES (1341, 16, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:46.899251');
INSERT INTO public.time_slots VALUES (1342, 16, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:46.900116');
INSERT INTO public.time_slots VALUES (1343, 16, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:46.901041');
INSERT INTO public.time_slots VALUES (1344, 16, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:46.902063');
INSERT INTO public.time_slots VALUES (1345, 16, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:46.903029');
INSERT INTO public.time_slots VALUES (1346, 16, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:46.904136');
INSERT INTO public.time_slots VALUES (1347, 16, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:46.905072');
INSERT INTO public.time_slots VALUES (1348, 16, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:46.90604');
INSERT INTO public.time_slots VALUES (1349, 16, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:46.907029');
INSERT INTO public.time_slots VALUES (1350, 16, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:46.907988');
INSERT INTO public.time_slots VALUES (1351, 16, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:46.908997');
INSERT INTO public.time_slots VALUES (1352, 16, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:46.909909');
INSERT INTO public.time_slots VALUES (1353, 16, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:46.91071');
INSERT INTO public.time_slots VALUES (1354, 16, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:46.911806');
INSERT INTO public.time_slots VALUES (1355, 16, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:46.912769');
INSERT INTO public.time_slots VALUES (1356, 16, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:46.913652');
INSERT INTO public.time_slots VALUES (1357, 16, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:46.914818');
INSERT INTO public.time_slots VALUES (1358, 16, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:46.915811');
INSERT INTO public.time_slots VALUES (1359, 16, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:46.916766');
INSERT INTO public.time_slots VALUES (1360, 16, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:46.917645');
INSERT INTO public.time_slots VALUES (1361, 16, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:46.918442');
INSERT INTO public.time_slots VALUES (1362, 16, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:46.919351');
INSERT INTO public.time_slots VALUES (1363, 16, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:46.920174');
INSERT INTO public.time_slots VALUES (1364, 16, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:46.921149');
INSERT INTO public.time_slots VALUES (1365, 16, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:46.922135');
INSERT INTO public.time_slots VALUES (1366, 16, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:46.923057');
INSERT INTO public.time_slots VALUES (1367, 16, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:46.924272');
INSERT INTO public.time_slots VALUES (1368, 16, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:46.925272');
INSERT INTO public.time_slots VALUES (1369, 16, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:46.926273');
INSERT INTO public.time_slots VALUES (1370, 16, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:46.927087');
INSERT INTO public.time_slots VALUES (1371, 16, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:46.928122');
INSERT INTO public.time_slots VALUES (1372, 16, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:46.929036');
INSERT INTO public.time_slots VALUES (1373, 16, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:46.929905');
INSERT INTO public.time_slots VALUES (1374, 16, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:46.930856');
INSERT INTO public.time_slots VALUES (1375, 16, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:46.93173');
INSERT INTO public.time_slots VALUES (1376, 16, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:46.932547');
INSERT INTO public.time_slots VALUES (1377, 16, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:46.933541');
INSERT INTO public.time_slots VALUES (1378, 16, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:46.934482');
INSERT INTO public.time_slots VALUES (1379, 16, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:46.935356');
INSERT INTO public.time_slots VALUES (1380, 16, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:46.936393');
INSERT INTO public.time_slots VALUES (1381, 16, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:46.9373');
INSERT INTO public.time_slots VALUES (1382, 16, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:46.938124');
INSERT INTO public.time_slots VALUES (1383, 16, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:46.939069');
INSERT INTO public.time_slots VALUES (1384, 16, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:46.940049');
INSERT INTO public.time_slots VALUES (1385, 16, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:46.941037');
INSERT INTO public.time_slots VALUES (1386, 16, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:46.941965');
INSERT INTO public.time_slots VALUES (1387, 16, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:46.94288');
INSERT INTO public.time_slots VALUES (1388, 16, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:46.943869');
INSERT INTO public.time_slots VALUES (1389, 16, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:46.944839');
INSERT INTO public.time_slots VALUES (1390, 16, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:46.945683');
INSERT INTO public.time_slots VALUES (1391, 16, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:46.946593');
INSERT INTO public.time_slots VALUES (1392, 16, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:46.947487');
INSERT INTO public.time_slots VALUES (1393, 16, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:46.948457');
INSERT INTO public.time_slots VALUES (1394, 16, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:46.949441');
INSERT INTO public.time_slots VALUES (1395, 16, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:46.950372');
INSERT INTO public.time_slots VALUES (1396, 16, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:46.951138');
INSERT INTO public.time_slots VALUES (1397, 16, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:46.952045');
INSERT INTO public.time_slots VALUES (1398, 16, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:46.952913');
INSERT INTO public.time_slots VALUES (1399, 16, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:46.95406');
INSERT INTO public.time_slots VALUES (1400, 16, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:46.955021');
INSERT INTO public.time_slots VALUES (1401, 17, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:46.989016');
INSERT INTO public.time_slots VALUES (1402, 17, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:46.990096');
INSERT INTO public.time_slots VALUES (1403, 17, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:46.991071');
INSERT INTO public.time_slots VALUES (1404, 17, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:46.992029');
INSERT INTO public.time_slots VALUES (1405, 17, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:46.992996');
INSERT INTO public.time_slots VALUES (1406, 17, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:46.993969');
INSERT INTO public.time_slots VALUES (1407, 17, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:46.994885');
INSERT INTO public.time_slots VALUES (1408, 17, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:46.995857');
INSERT INTO public.time_slots VALUES (1409, 17, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:46.996763');
INSERT INTO public.time_slots VALUES (1410, 17, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:46.997523');
INSERT INTO public.time_slots VALUES (1411, 17, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:46.998426');
INSERT INTO public.time_slots VALUES (1412, 17, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:46.999419');
INSERT INTO public.time_slots VALUES (1413, 17, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:47.000347');
INSERT INTO public.time_slots VALUES (1414, 17, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:47.001295');
INSERT INTO public.time_slots VALUES (1415, 17, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:47.002241');
INSERT INTO public.time_slots VALUES (1416, 17, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:47.003156');
INSERT INTO public.time_slots VALUES (1417, 17, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:47.004207');
INSERT INTO public.time_slots VALUES (1418, 17, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:47.005255');
INSERT INTO public.time_slots VALUES (1419, 17, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:47.00612');
INSERT INTO public.time_slots VALUES (1420, 17, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:47.007012');
INSERT INTO public.time_slots VALUES (1421, 17, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:47.007996');
INSERT INTO public.time_slots VALUES (1422, 17, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:47.008855');
INSERT INTO public.time_slots VALUES (1423, 17, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:47.00971');
INSERT INTO public.time_slots VALUES (1424, 17, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:47.01069');
INSERT INTO public.time_slots VALUES (1425, 17, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:47.011548');
INSERT INTO public.time_slots VALUES (1426, 17, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:47.012508');
INSERT INTO public.time_slots VALUES (1427, 17, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:47.01339');
INSERT INTO public.time_slots VALUES (1428, 17, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:47.014286');
INSERT INTO public.time_slots VALUES (1429, 17, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:47.015471');
INSERT INTO public.time_slots VALUES (1430, 17, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:47.01634');
INSERT INTO public.time_slots VALUES (1431, 17, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:47.017245');
INSERT INTO public.time_slots VALUES (1432, 17, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:47.018064');
INSERT INTO public.time_slots VALUES (1433, 17, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:47.019007');
INSERT INTO public.time_slots VALUES (1434, 17, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:47.019923');
INSERT INTO public.time_slots VALUES (1435, 17, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:47.02084');
INSERT INTO public.time_slots VALUES (1436, 17, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:47.021687');
INSERT INTO public.time_slots VALUES (1437, 17, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:47.022611');
INSERT INTO public.time_slots VALUES (1438, 17, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:47.02361');
INSERT INTO public.time_slots VALUES (1439, 17, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:47.024447');
INSERT INTO public.time_slots VALUES (1440, 17, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:47.025284');
INSERT INTO public.time_slots VALUES (1441, 17, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:47.026348');
INSERT INTO public.time_slots VALUES (1442, 17, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:47.027266');
INSERT INTO public.time_slots VALUES (1443, 17, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:47.028144');
INSERT INTO public.time_slots VALUES (1444, 17, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:47.029047');
INSERT INTO public.time_slots VALUES (1445, 17, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:47.030047');
INSERT INTO public.time_slots VALUES (1446, 17, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:47.030972');
INSERT INTO public.time_slots VALUES (1447, 17, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:47.031831');
INSERT INTO public.time_slots VALUES (1448, 17, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:47.032703');
INSERT INTO public.time_slots VALUES (1449, 17, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:47.033598');
INSERT INTO public.time_slots VALUES (1450, 17, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:47.034676');
INSERT INTO public.time_slots VALUES (1451, 17, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:47.035558');
INSERT INTO public.time_slots VALUES (1452, 17, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:47.036442');
INSERT INTO public.time_slots VALUES (1453, 17, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:47.037354');
INSERT INTO public.time_slots VALUES (1454, 17, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:47.038237');
INSERT INTO public.time_slots VALUES (1455, 17, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:47.03917');
INSERT INTO public.time_slots VALUES (1456, 17, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:47.040048');
INSERT INTO public.time_slots VALUES (1457, 17, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:47.041054');
INSERT INTO public.time_slots VALUES (1458, 17, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:47.042626');
INSERT INTO public.time_slots VALUES (1459, 17, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:47.04421');
INSERT INTO public.time_slots VALUES (1460, 17, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:47.045457');
INSERT INTO public.time_slots VALUES (1461, 17, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:47.046412');
INSERT INTO public.time_slots VALUES (1462, 17, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:47.047442');
INSERT INTO public.time_slots VALUES (1463, 17, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:47.048572');
INSERT INTO public.time_slots VALUES (1464, 17, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:47.049524');
INSERT INTO public.time_slots VALUES (1465, 17, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:47.050433');
INSERT INTO public.time_slots VALUES (1466, 17, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:47.051419');
INSERT INTO public.time_slots VALUES (1467, 17, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:47.052328');
INSERT INTO public.time_slots VALUES (1468, 17, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:47.053196');
INSERT INTO public.time_slots VALUES (1469, 17, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:47.054199');
INSERT INTO public.time_slots VALUES (1470, 17, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:47.055195');
INSERT INTO public.time_slots VALUES (1471, 18, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:47.091216');
INSERT INTO public.time_slots VALUES (1472, 18, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:47.092266');
INSERT INTO public.time_slots VALUES (1473, 18, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:47.093199');
INSERT INTO public.time_slots VALUES (1474, 18, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:47.094286');
INSERT INTO public.time_slots VALUES (1475, 18, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:47.095303');
INSERT INTO public.time_slots VALUES (1476, 18, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:47.096257');
INSERT INTO public.time_slots VALUES (1477, 18, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:47.097256');
INSERT INTO public.time_slots VALUES (1478, 18, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:47.098267');
INSERT INTO public.time_slots VALUES (1479, 18, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:47.099221');
INSERT INTO public.time_slots VALUES (1480, 18, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:47.100121');
INSERT INTO public.time_slots VALUES (1481, 18, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:47.101131');
INSERT INTO public.time_slots VALUES (1482, 18, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:47.102069');
INSERT INTO public.time_slots VALUES (1483, 18, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:47.102923');
INSERT INTO public.time_slots VALUES (1484, 18, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:47.103797');
INSERT INTO public.time_slots VALUES (1485, 18, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:47.104638');
INSERT INTO public.time_slots VALUES (1486, 18, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:47.105627');
INSERT INTO public.time_slots VALUES (1487, 18, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:47.106529');
INSERT INTO public.time_slots VALUES (1488, 18, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:47.108505');
INSERT INTO public.time_slots VALUES (1489, 18, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:47.109575');
INSERT INTO public.time_slots VALUES (1490, 18, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:47.110482');
INSERT INTO public.time_slots VALUES (1491, 18, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:47.111467');
INSERT INTO public.time_slots VALUES (1492, 18, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:47.112588');
INSERT INTO public.time_slots VALUES (1493, 18, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:47.113576');
INSERT INTO public.time_slots VALUES (1494, 18, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:47.11459');
INSERT INTO public.time_slots VALUES (1495, 18, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:47.115688');
INSERT INTO public.time_slots VALUES (1496, 18, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:47.116952');
INSERT INTO public.time_slots VALUES (1497, 18, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:47.118093');
INSERT INTO public.time_slots VALUES (1498, 18, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:47.119252');
INSERT INTO public.time_slots VALUES (1499, 18, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:47.120493');
INSERT INTO public.time_slots VALUES (1500, 18, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:47.121626');
INSERT INTO public.time_slots VALUES (1501, 18, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:47.122639');
INSERT INTO public.time_slots VALUES (1502, 18, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:47.123896');
INSERT INTO public.time_slots VALUES (1503, 18, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:47.124998');
INSERT INTO public.time_slots VALUES (1504, 18, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:47.125981');
INSERT INTO public.time_slots VALUES (1505, 18, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:47.126959');
INSERT INTO public.time_slots VALUES (1506, 18, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:47.127876');
INSERT INTO public.time_slots VALUES (1507, 18, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:47.128904');
INSERT INTO public.time_slots VALUES (1508, 18, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:47.129891');
INSERT INTO public.time_slots VALUES (1509, 18, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:47.130926');
INSERT INTO public.time_slots VALUES (1510, 18, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:47.131876');
INSERT INTO public.time_slots VALUES (1511, 18, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:47.13296');
INSERT INTO public.time_slots VALUES (1512, 18, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:47.134077');
INSERT INTO public.time_slots VALUES (1513, 18, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:47.135371');
INSERT INTO public.time_slots VALUES (1514, 18, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:47.136748');
INSERT INTO public.time_slots VALUES (1515, 18, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:47.137831');
INSERT INTO public.time_slots VALUES (1516, 18, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:47.1388');
INSERT INTO public.time_slots VALUES (1517, 18, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:47.140043');
INSERT INTO public.time_slots VALUES (1518, 18, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:47.14104');
INSERT INTO public.time_slots VALUES (1519, 18, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:47.141998');
INSERT INTO public.time_slots VALUES (1520, 18, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:47.143062');
INSERT INTO public.time_slots VALUES (1521, 18, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:47.144041');
INSERT INTO public.time_slots VALUES (1522, 18, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:47.144971');
INSERT INTO public.time_slots VALUES (1523, 18, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:47.145873');
INSERT INTO public.time_slots VALUES (1524, 18, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:47.146805');
INSERT INTO public.time_slots VALUES (1525, 18, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:47.147719');
INSERT INTO public.time_slots VALUES (1526, 18, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:47.148657');
INSERT INTO public.time_slots VALUES (1527, 18, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:47.149526');
INSERT INTO public.time_slots VALUES (1528, 18, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:47.150489');
INSERT INTO public.time_slots VALUES (1529, 18, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:47.151433');
INSERT INTO public.time_slots VALUES (1530, 18, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:47.152355');
INSERT INTO public.time_slots VALUES (1531, 18, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:47.153216');
INSERT INTO public.time_slots VALUES (1532, 18, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:47.154281');
INSERT INTO public.time_slots VALUES (1533, 18, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:47.155382');
INSERT INTO public.time_slots VALUES (1534, 18, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:47.156402');
INSERT INTO public.time_slots VALUES (1535, 18, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:47.157294');
INSERT INTO public.time_slots VALUES (1536, 18, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:47.158183');
INSERT INTO public.time_slots VALUES (1537, 18, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:47.159188');
INSERT INTO public.time_slots VALUES (1538, 18, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:47.160138');
INSERT INTO public.time_slots VALUES (1539, 18, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:47.161082');
INSERT INTO public.time_slots VALUES (1540, 18, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:47.162014');
INSERT INTO public.time_slots VALUES (1541, 19, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:47.198848');
INSERT INTO public.time_slots VALUES (1542, 19, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:47.199884');
INSERT INTO public.time_slots VALUES (1543, 19, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:47.200824');
INSERT INTO public.time_slots VALUES (1544, 19, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:47.201902');
INSERT INTO public.time_slots VALUES (1545, 19, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:47.202831');
INSERT INTO public.time_slots VALUES (1546, 19, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:47.203727');
INSERT INTO public.time_slots VALUES (1547, 19, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:47.204729');
INSERT INTO public.time_slots VALUES (1548, 19, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:47.205735');
INSERT INTO public.time_slots VALUES (1549, 19, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:47.2068');
INSERT INTO public.time_slots VALUES (1550, 19, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:47.207762');
INSERT INTO public.time_slots VALUES (1551, 19, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:47.208679');
INSERT INTO public.time_slots VALUES (1552, 19, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:47.209621');
INSERT INTO public.time_slots VALUES (1553, 19, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:47.210491');
INSERT INTO public.time_slots VALUES (1554, 19, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:47.211454');
INSERT INTO public.time_slots VALUES (1555, 19, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:47.212422');
INSERT INTO public.time_slots VALUES (1556, 19, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:47.213301');
INSERT INTO public.time_slots VALUES (1557, 19, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:47.214455');
INSERT INTO public.time_slots VALUES (1558, 19, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:47.215469');
INSERT INTO public.time_slots VALUES (1559, 19, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:47.216452');
INSERT INTO public.time_slots VALUES (1560, 19, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:47.21739');
INSERT INTO public.time_slots VALUES (1561, 19, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:47.218368');
INSERT INTO public.time_slots VALUES (1562, 19, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:47.219283');
INSERT INTO public.time_slots VALUES (1563, 19, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:47.220333');
INSERT INTO public.time_slots VALUES (1564, 19, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:47.221297');
INSERT INTO public.time_slots VALUES (1565, 19, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:47.22226');
INSERT INTO public.time_slots VALUES (1566, 19, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:47.223351');
INSERT INTO public.time_slots VALUES (1567, 19, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:47.22588');
INSERT INTO public.time_slots VALUES (1568, 19, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:47.232654');
INSERT INTO public.time_slots VALUES (1569, 19, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:47.240178');
INSERT INTO public.time_slots VALUES (1570, 19, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:47.241508');
INSERT INTO public.time_slots VALUES (1571, 19, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:47.243108');
INSERT INTO public.time_slots VALUES (1572, 19, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:47.24732');
INSERT INTO public.time_slots VALUES (1573, 19, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:47.248618');
INSERT INTO public.time_slots VALUES (1574, 19, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:47.249739');
INSERT INTO public.time_slots VALUES (1575, 19, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:47.250752');
INSERT INTO public.time_slots VALUES (1576, 19, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:47.251754');
INSERT INTO public.time_slots VALUES (1577, 19, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:47.252948');
INSERT INTO public.time_slots VALUES (1578, 19, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:47.254029');
INSERT INTO public.time_slots VALUES (1579, 19, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:47.255065');
INSERT INTO public.time_slots VALUES (1580, 19, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:47.256047');
INSERT INTO public.time_slots VALUES (1581, 19, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:47.257044');
INSERT INTO public.time_slots VALUES (1582, 19, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:47.258075');
INSERT INTO public.time_slots VALUES (1583, 19, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:47.259087');
INSERT INTO public.time_slots VALUES (1584, 19, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:47.260014');
INSERT INTO public.time_slots VALUES (1585, 19, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:47.261035');
INSERT INTO public.time_slots VALUES (1586, 19, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:47.262119');
INSERT INTO public.time_slots VALUES (1587, 19, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:47.263129');
INSERT INTO public.time_slots VALUES (1588, 19, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:47.264096');
INSERT INTO public.time_slots VALUES (1589, 19, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:47.265066');
INSERT INTO public.time_slots VALUES (1590, 19, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:47.266043');
INSERT INTO public.time_slots VALUES (1591, 19, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:47.266984');
INSERT INTO public.time_slots VALUES (1592, 19, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:47.267954');
INSERT INTO public.time_slots VALUES (1593, 19, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:47.268832');
INSERT INTO public.time_slots VALUES (1594, 19, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:47.269826');
INSERT INTO public.time_slots VALUES (1595, 19, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:47.270721');
INSERT INTO public.time_slots VALUES (1596, 19, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:47.271623');
INSERT INTO public.time_slots VALUES (1597, 19, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:47.272717');
INSERT INTO public.time_slots VALUES (1598, 19, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:47.273718');
INSERT INTO public.time_slots VALUES (1599, 19, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:47.274637');
INSERT INTO public.time_slots VALUES (1600, 19, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:47.275542');
INSERT INTO public.time_slots VALUES (1601, 19, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:47.276571');
INSERT INTO public.time_slots VALUES (1602, 19, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:47.277513');
INSERT INTO public.time_slots VALUES (1603, 19, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:47.278504');
INSERT INTO public.time_slots VALUES (1604, 19, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:47.279431');
INSERT INTO public.time_slots VALUES (1605, 19, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:47.280401');
INSERT INTO public.time_slots VALUES (1606, 19, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:47.281379');
INSERT INTO public.time_slots VALUES (1607, 19, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:47.282512');
INSERT INTO public.time_slots VALUES (1608, 19, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:47.283566');
INSERT INTO public.time_slots VALUES (1609, 19, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:47.284535');
INSERT INTO public.time_slots VALUES (1610, 19, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:47.285375');
INSERT INTO public.time_slots VALUES (1611, 20, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:47.320942');
INSERT INTO public.time_slots VALUES (1612, 20, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:47.321896');
INSERT INTO public.time_slots VALUES (1613, 20, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:47.322961');
INSERT INTO public.time_slots VALUES (1614, 20, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:47.32396');
INSERT INTO public.time_slots VALUES (1615, 20, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:47.32496');
INSERT INTO public.time_slots VALUES (1616, 20, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:47.325956');
INSERT INTO public.time_slots VALUES (1617, 20, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:47.327159');
INSERT INTO public.time_slots VALUES (1618, 20, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:47.328201');
INSERT INTO public.time_slots VALUES (1619, 20, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:47.329084');
INSERT INTO public.time_slots VALUES (1620, 20, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:47.329924');
INSERT INTO public.time_slots VALUES (1621, 20, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:47.330767');
INSERT INTO public.time_slots VALUES (1622, 20, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:47.331797');
INSERT INTO public.time_slots VALUES (1623, 20, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:47.332645');
INSERT INTO public.time_slots VALUES (1624, 20, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:47.333839');
INSERT INTO public.time_slots VALUES (1625, 20, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:47.334797');
INSERT INTO public.time_slots VALUES (1626, 20, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:47.33571');
INSERT INTO public.time_slots VALUES (1627, 20, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:47.336596');
INSERT INTO public.time_slots VALUES (1628, 20, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:47.337565');
INSERT INTO public.time_slots VALUES (1629, 20, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:47.338473');
INSERT INTO public.time_slots VALUES (1630, 20, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:47.339358');
INSERT INTO public.time_slots VALUES (1631, 20, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:47.340241');
INSERT INTO public.time_slots VALUES (1632, 20, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:47.341152');
INSERT INTO public.time_slots VALUES (1633, 20, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:47.342247');
INSERT INTO public.time_slots VALUES (1634, 20, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:47.343372');
INSERT INTO public.time_slots VALUES (1635, 20, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:47.344641');
INSERT INTO public.time_slots VALUES (1636, 20, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:47.345776');
INSERT INTO public.time_slots VALUES (1637, 20, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:47.346788');
INSERT INTO public.time_slots VALUES (1638, 20, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:47.347835');
INSERT INTO public.time_slots VALUES (1639, 20, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:47.348861');
INSERT INTO public.time_slots VALUES (1640, 20, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:47.34986');
INSERT INTO public.time_slots VALUES (1641, 20, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:47.350787');
INSERT INTO public.time_slots VALUES (1642, 20, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:47.35194');
INSERT INTO public.time_slots VALUES (1643, 20, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:47.352813');
INSERT INTO public.time_slots VALUES (1644, 20, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:47.353829');
INSERT INTO public.time_slots VALUES (1645, 20, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:47.354894');
INSERT INTO public.time_slots VALUES (1646, 20, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:47.355858');
INSERT INTO public.time_slots VALUES (1647, 20, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:47.356739');
INSERT INTO public.time_slots VALUES (1648, 20, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:47.357656');
INSERT INTO public.time_slots VALUES (1649, 20, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:47.358672');
INSERT INTO public.time_slots VALUES (1650, 20, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:47.359502');
INSERT INTO public.time_slots VALUES (1651, 20, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:47.36054');
INSERT INTO public.time_slots VALUES (1652, 20, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:47.361481');
INSERT INTO public.time_slots VALUES (1653, 20, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:47.36233');
INSERT INTO public.time_slots VALUES (1654, 20, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:47.363474');
INSERT INTO public.time_slots VALUES (1655, 20, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:47.364459');
INSERT INTO public.time_slots VALUES (1656, 20, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:47.365464');
INSERT INTO public.time_slots VALUES (1657, 20, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:47.366442');
INSERT INTO public.time_slots VALUES (1658, 20, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:47.367367');
INSERT INTO public.time_slots VALUES (1659, 20, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:47.368289');
INSERT INTO public.time_slots VALUES (1660, 20, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:47.369189');
INSERT INTO public.time_slots VALUES (1661, 20, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:47.370221');
INSERT INTO public.time_slots VALUES (1662, 20, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:47.371103');
INSERT INTO public.time_slots VALUES (1663, 20, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:47.37205');
INSERT INTO public.time_slots VALUES (1664, 20, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:47.3732');
INSERT INTO public.time_slots VALUES (1665, 20, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:47.374522');
INSERT INTO public.time_slots VALUES (1666, 20, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:47.375506');
INSERT INTO public.time_slots VALUES (1667, 20, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:47.376427');
INSERT INTO public.time_slots VALUES (1668, 20, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:47.37735');
INSERT INTO public.time_slots VALUES (1669, 20, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:47.378332');
INSERT INTO public.time_slots VALUES (1670, 20, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:47.379221');
INSERT INTO public.time_slots VALUES (1671, 20, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:47.380118');
INSERT INTO public.time_slots VALUES (1672, 20, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:47.38102');
INSERT INTO public.time_slots VALUES (1673, 20, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:47.382');
INSERT INTO public.time_slots VALUES (1674, 20, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:47.382983');
INSERT INTO public.time_slots VALUES (1675, 20, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:47.38401');
INSERT INTO public.time_slots VALUES (1676, 20, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:47.384905');
INSERT INTO public.time_slots VALUES (1677, 20, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:47.385911');
INSERT INTO public.time_slots VALUES (1678, 20, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:47.38681');
INSERT INTO public.time_slots VALUES (1679, 20, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:47.387842');
INSERT INTO public.time_slots VALUES (1680, 20, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:47.388717');
INSERT INTO public.time_slots VALUES (1681, 37, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:47.42295');
INSERT INTO public.time_slots VALUES (1682, 37, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:47.423866');
INSERT INTO public.time_slots VALUES (1683, 37, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:47.424711');
INSERT INTO public.time_slots VALUES (1684, 37, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:47.425607');
INSERT INTO public.time_slots VALUES (1685, 37, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:47.426531');
INSERT INTO public.time_slots VALUES (1686, 37, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:47.427313');
INSERT INTO public.time_slots VALUES (1687, 37, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:47.428109');
INSERT INTO public.time_slots VALUES (1688, 37, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:47.428983');
INSERT INTO public.time_slots VALUES (1689, 37, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:47.429926');
INSERT INTO public.time_slots VALUES (1690, 37, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:47.430883');
INSERT INTO public.time_slots VALUES (1691, 37, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:47.431711');
INSERT INTO public.time_slots VALUES (1692, 37, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:47.43253');
INSERT INTO public.time_slots VALUES (1693, 37, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:47.433305');
INSERT INTO public.time_slots VALUES (1694, 37, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:47.434331');
INSERT INTO public.time_slots VALUES (1695, 37, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:47.435403');
INSERT INTO public.time_slots VALUES (1696, 37, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:47.436291');
INSERT INTO public.time_slots VALUES (1697, 37, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:47.437292');
INSERT INTO public.time_slots VALUES (1698, 37, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:47.438103');
INSERT INTO public.time_slots VALUES (1699, 37, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:47.438991');
INSERT INTO public.time_slots VALUES (1700, 37, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:47.439865');
INSERT INTO public.time_slots VALUES (1701, 37, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:47.440717');
INSERT INTO public.time_slots VALUES (1702, 37, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:47.441669');
INSERT INTO public.time_slots VALUES (1703, 37, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:47.442558');
INSERT INTO public.time_slots VALUES (1704, 37, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:47.443457');
INSERT INTO public.time_slots VALUES (1705, 37, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:47.444531');
INSERT INTO public.time_slots VALUES (1706, 37, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:47.445475');
INSERT INTO public.time_slots VALUES (1707, 37, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:47.446417');
INSERT INTO public.time_slots VALUES (1708, 37, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:47.447316');
INSERT INTO public.time_slots VALUES (1709, 37, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:47.448278');
INSERT INTO public.time_slots VALUES (1710, 37, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:47.449174');
INSERT INTO public.time_slots VALUES (1711, 37, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:47.449949');
INSERT INTO public.time_slots VALUES (1712, 37, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:47.450844');
INSERT INTO public.time_slots VALUES (1713, 37, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:47.451751');
INSERT INTO public.time_slots VALUES (1714, 37, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:47.452572');
INSERT INTO public.time_slots VALUES (1715, 37, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:47.453497');
INSERT INTO public.time_slots VALUES (1716, 37, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:47.454497');
INSERT INTO public.time_slots VALUES (1717, 37, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:47.455567');
INSERT INTO public.time_slots VALUES (1718, 37, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:47.456529');
INSERT INTO public.time_slots VALUES (1719, 37, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:47.457458');
INSERT INTO public.time_slots VALUES (1720, 37, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:47.458267');
INSERT INTO public.time_slots VALUES (1721, 37, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:47.459073');
INSERT INTO public.time_slots VALUES (1722, 37, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:47.460033');
INSERT INTO public.time_slots VALUES (1723, 37, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:47.460992');
INSERT INTO public.time_slots VALUES (1724, 37, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:47.461962');
INSERT INTO public.time_slots VALUES (1725, 37, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:47.462935');
INSERT INTO public.time_slots VALUES (1726, 37, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:47.464021');
INSERT INTO public.time_slots VALUES (1727, 37, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:47.465093');
INSERT INTO public.time_slots VALUES (1728, 37, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:47.466245');
INSERT INTO public.time_slots VALUES (1729, 37, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:47.467155');
INSERT INTO public.time_slots VALUES (1730, 37, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:47.468185');
INSERT INTO public.time_slots VALUES (1731, 37, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:47.468995');
INSERT INTO public.time_slots VALUES (1732, 37, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:47.469923');
INSERT INTO public.time_slots VALUES (1733, 37, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:47.470881');
INSERT INTO public.time_slots VALUES (1734, 37, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:47.471824');
INSERT INTO public.time_slots VALUES (1735, 37, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:47.472997');
INSERT INTO public.time_slots VALUES (1736, 37, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:47.473916');
INSERT INTO public.time_slots VALUES (1737, 37, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:47.474956');
INSERT INTO public.time_slots VALUES (1738, 37, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:47.475948');
INSERT INTO public.time_slots VALUES (1739, 37, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:47.476852');
INSERT INTO public.time_slots VALUES (1740, 37, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:47.47785');
INSERT INTO public.time_slots VALUES (1741, 37, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:47.47954');
INSERT INTO public.time_slots VALUES (1742, 37, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:47.480545');
INSERT INTO public.time_slots VALUES (1743, 37, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:47.481536');
INSERT INTO public.time_slots VALUES (1744, 37, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:47.48248');
INSERT INTO public.time_slots VALUES (1745, 37, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:47.483356');
INSERT INTO public.time_slots VALUES (1746, 37, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:47.48469');
INSERT INTO public.time_slots VALUES (1747, 37, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:47.485803');
INSERT INTO public.time_slots VALUES (1748, 37, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:47.486706');
INSERT INTO public.time_slots VALUES (1749, 37, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:47.487615');
INSERT INTO public.time_slots VALUES (1750, 37, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:47.48869');
INSERT INTO public.time_slots VALUES (1751, 38, '2025-06-09 09:00:00', '2025-06-09 09:30:00', true, NULL, '2025-06-01 12:46:47.524956');
INSERT INTO public.time_slots VALUES (1752, 38, '2025-06-09 09:30:00', '2025-06-09 10:00:00', true, NULL, '2025-06-01 12:46:47.526011');
INSERT INTO public.time_slots VALUES (1753, 38, '2025-06-09 10:00:00', '2025-06-09 10:30:00', true, NULL, '2025-06-01 12:46:47.527064');
INSERT INTO public.time_slots VALUES (1754, 38, '2025-06-09 10:30:00', '2025-06-09 11:00:00', true, NULL, '2025-06-01 12:46:47.527969');
INSERT INTO public.time_slots VALUES (1755, 38, '2025-06-09 11:00:00', '2025-06-09 11:30:00', true, NULL, '2025-06-01 12:46:47.528997');
INSERT INTO public.time_slots VALUES (1756, 38, '2025-06-09 11:30:00', '2025-06-09 12:00:00', true, NULL, '2025-06-01 12:46:47.529934');
INSERT INTO public.time_slots VALUES (1757, 38, '2025-06-09 13:00:00', '2025-06-09 13:30:00', true, NULL, '2025-06-01 12:46:47.530812');
INSERT INTO public.time_slots VALUES (1758, 38, '2025-06-09 13:30:00', '2025-06-09 14:00:00', true, NULL, '2025-06-01 12:46:47.531751');
INSERT INTO public.time_slots VALUES (1759, 38, '2025-06-09 14:00:00', '2025-06-09 14:30:00', true, NULL, '2025-06-01 12:46:47.532782');
INSERT INTO public.time_slots VALUES (1760, 38, '2025-06-09 14:30:00', '2025-06-09 15:00:00', true, NULL, '2025-06-01 12:46:47.533932');
INSERT INTO public.time_slots VALUES (1761, 38, '2025-06-09 15:00:00', '2025-06-09 15:30:00', true, NULL, '2025-06-01 12:46:47.535002');
INSERT INTO public.time_slots VALUES (1762, 38, '2025-06-09 15:30:00', '2025-06-09 16:00:00', true, NULL, '2025-06-01 12:46:47.5359');
INSERT INTO public.time_slots VALUES (1763, 38, '2025-06-09 16:00:00', '2025-06-09 16:30:00', true, NULL, '2025-06-01 12:46:47.536797');
INSERT INTO public.time_slots VALUES (1764, 38, '2025-06-09 16:30:00', '2025-06-09 17:00:00', true, NULL, '2025-06-01 12:46:47.53777');
INSERT INTO public.time_slots VALUES (1765, 38, '2025-06-10 09:00:00', '2025-06-10 09:30:00', true, NULL, '2025-06-01 12:46:47.538759');
INSERT INTO public.time_slots VALUES (1766, 38, '2025-06-10 09:30:00', '2025-06-10 10:00:00', true, NULL, '2025-06-01 12:46:47.539683');
INSERT INTO public.time_slots VALUES (1767, 38, '2025-06-10 10:00:00', '2025-06-10 10:30:00', true, NULL, '2025-06-01 12:46:47.540583');
INSERT INTO public.time_slots VALUES (1768, 38, '2025-06-10 10:30:00', '2025-06-10 11:00:00', true, NULL, '2025-06-01 12:46:47.541417');
INSERT INTO public.time_slots VALUES (1769, 38, '2025-06-10 11:00:00', '2025-06-10 11:30:00', true, NULL, '2025-06-01 12:46:47.54234');
INSERT INTO public.time_slots VALUES (1770, 38, '2025-06-10 11:30:00', '2025-06-10 12:00:00', true, NULL, '2025-06-01 12:46:47.543332');
INSERT INTO public.time_slots VALUES (1771, 38, '2025-06-10 13:00:00', '2025-06-10 13:30:00', true, NULL, '2025-06-01 12:46:47.544311');
INSERT INTO public.time_slots VALUES (1772, 38, '2025-06-10 13:30:00', '2025-06-10 14:00:00', true, NULL, '2025-06-01 12:46:47.545292');
INSERT INTO public.time_slots VALUES (1773, 38, '2025-06-10 14:00:00', '2025-06-10 14:30:00', true, NULL, '2025-06-01 12:46:47.546178');
INSERT INTO public.time_slots VALUES (1774, 38, '2025-06-10 14:30:00', '2025-06-10 15:00:00', true, NULL, '2025-06-01 12:46:47.547016');
INSERT INTO public.time_slots VALUES (1775, 38, '2025-06-10 15:00:00', '2025-06-10 15:30:00', true, NULL, '2025-06-01 12:46:47.547899');
INSERT INTO public.time_slots VALUES (1776, 38, '2025-06-10 15:30:00', '2025-06-10 16:00:00', true, NULL, '2025-06-01 12:46:47.548871');
INSERT INTO public.time_slots VALUES (1777, 38, '2025-06-10 16:00:00', '2025-06-10 16:30:00', true, NULL, '2025-06-01 12:46:47.549776');
INSERT INTO public.time_slots VALUES (1778, 38, '2025-06-10 16:30:00', '2025-06-10 17:00:00', true, NULL, '2025-06-01 12:46:47.55067');
INSERT INTO public.time_slots VALUES (1779, 38, '2025-06-11 09:00:00', '2025-06-11 09:30:00', true, NULL, '2025-06-01 12:46:47.551432');
INSERT INTO public.time_slots VALUES (1780, 38, '2025-06-11 09:30:00', '2025-06-11 10:00:00', true, NULL, '2025-06-01 12:46:47.552432');
INSERT INTO public.time_slots VALUES (1781, 38, '2025-06-11 10:00:00', '2025-06-11 10:30:00', true, NULL, '2025-06-01 12:46:47.553342');
INSERT INTO public.time_slots VALUES (1782, 38, '2025-06-11 10:30:00', '2025-06-11 11:00:00', true, NULL, '2025-06-01 12:46:47.554426');
INSERT INTO public.time_slots VALUES (1783, 38, '2025-06-11 11:00:00', '2025-06-11 11:30:00', true, NULL, '2025-06-01 12:46:47.555257');
INSERT INTO public.time_slots VALUES (1784, 38, '2025-06-11 11:30:00', '2025-06-11 12:00:00', true, NULL, '2025-06-01 12:46:47.556166');
INSERT INTO public.time_slots VALUES (1785, 38, '2025-06-11 13:00:00', '2025-06-11 13:30:00', true, NULL, '2025-06-01 12:46:47.557056');
INSERT INTO public.time_slots VALUES (1786, 38, '2025-06-11 13:30:00', '2025-06-11 14:00:00', true, NULL, '2025-06-01 12:46:47.558035');
INSERT INTO public.time_slots VALUES (1787, 38, '2025-06-11 14:00:00', '2025-06-11 14:30:00', true, NULL, '2025-06-01 12:46:47.559013');
INSERT INTO public.time_slots VALUES (1788, 38, '2025-06-11 14:30:00', '2025-06-11 15:00:00', true, NULL, '2025-06-01 12:46:47.55999');
INSERT INTO public.time_slots VALUES (1789, 38, '2025-06-11 15:00:00', '2025-06-11 15:30:00', true, NULL, '2025-06-01 12:46:47.560887');
INSERT INTO public.time_slots VALUES (1790, 38, '2025-06-11 15:30:00', '2025-06-11 16:00:00', true, NULL, '2025-06-01 12:46:47.561905');
INSERT INTO public.time_slots VALUES (1791, 38, '2025-06-11 16:00:00', '2025-06-11 16:30:00', true, NULL, '2025-06-01 12:46:47.56286');
INSERT INTO public.time_slots VALUES (1792, 38, '2025-06-11 16:30:00', '2025-06-11 17:00:00', true, NULL, '2025-06-01 12:46:47.563909');
INSERT INTO public.time_slots VALUES (1793, 38, '2025-06-12 09:00:00', '2025-06-12 09:30:00', true, NULL, '2025-06-01 12:46:47.566617');
INSERT INTO public.time_slots VALUES (1794, 38, '2025-06-12 09:30:00', '2025-06-12 10:00:00', true, NULL, '2025-06-01 12:46:47.567531');
INSERT INTO public.time_slots VALUES (1795, 38, '2025-06-12 10:00:00', '2025-06-12 10:30:00', true, NULL, '2025-06-01 12:46:47.569042');
INSERT INTO public.time_slots VALUES (1796, 38, '2025-06-12 10:30:00', '2025-06-12 11:00:00', true, NULL, '2025-06-01 12:46:47.56998');
INSERT INTO public.time_slots VALUES (1797, 38, '2025-06-12 11:00:00', '2025-06-12 11:30:00', true, NULL, '2025-06-01 12:46:47.570966');
INSERT INTO public.time_slots VALUES (1798, 38, '2025-06-12 11:30:00', '2025-06-12 12:00:00', true, NULL, '2025-06-01 12:46:47.57318');
INSERT INTO public.time_slots VALUES (1799, 38, '2025-06-12 13:00:00', '2025-06-12 13:30:00', true, NULL, '2025-06-01 12:46:47.574765');
INSERT INTO public.time_slots VALUES (1800, 38, '2025-06-12 13:30:00', '2025-06-12 14:00:00', true, NULL, '2025-06-01 12:46:47.576298');
INSERT INTO public.time_slots VALUES (1801, 38, '2025-06-12 14:00:00', '2025-06-12 14:30:00', true, NULL, '2025-06-01 12:46:47.578363');
INSERT INTO public.time_slots VALUES (1802, 38, '2025-06-12 14:30:00', '2025-06-12 15:00:00', true, NULL, '2025-06-01 12:46:47.579664');
INSERT INTO public.time_slots VALUES (1803, 38, '2025-06-12 15:00:00', '2025-06-12 15:30:00', true, NULL, '2025-06-01 12:46:47.581175');
INSERT INTO public.time_slots VALUES (1804, 38, '2025-06-12 15:30:00', '2025-06-12 16:00:00', true, NULL, '2025-06-01 12:46:47.582768');
INSERT INTO public.time_slots VALUES (1805, 38, '2025-06-12 16:00:00', '2025-06-12 16:30:00', true, NULL, '2025-06-01 12:46:47.585531');
INSERT INTO public.time_slots VALUES (1806, 38, '2025-06-12 16:30:00', '2025-06-12 17:00:00', true, NULL, '2025-06-01 12:46:47.587952');
INSERT INTO public.time_slots VALUES (1807, 38, '2025-06-13 09:00:00', '2025-06-13 09:30:00', true, NULL, '2025-06-01 12:46:47.590521');
INSERT INTO public.time_slots VALUES (1808, 38, '2025-06-13 09:30:00', '2025-06-13 10:00:00', true, NULL, '2025-06-01 12:46:47.591852');
INSERT INTO public.time_slots VALUES (1809, 38, '2025-06-13 10:00:00', '2025-06-13 10:30:00', true, NULL, '2025-06-01 12:46:47.59293');
INSERT INTO public.time_slots VALUES (1810, 38, '2025-06-13 10:30:00', '2025-06-13 11:00:00', true, NULL, '2025-06-01 12:46:47.594264');
INSERT INTO public.time_slots VALUES (1811, 38, '2025-06-13 11:00:00', '2025-06-13 11:30:00', true, NULL, '2025-06-01 12:46:47.595398');
INSERT INTO public.time_slots VALUES (1812, 38, '2025-06-13 11:30:00', '2025-06-13 12:00:00', true, NULL, '2025-06-01 12:46:47.596453');
INSERT INTO public.time_slots VALUES (1813, 38, '2025-06-13 13:00:00', '2025-06-13 13:30:00', true, NULL, '2025-06-01 12:46:47.597535');
INSERT INTO public.time_slots VALUES (1814, 38, '2025-06-13 13:30:00', '2025-06-13 14:00:00', true, NULL, '2025-06-01 12:46:47.598548');
INSERT INTO public.time_slots VALUES (1815, 38, '2025-06-13 14:00:00', '2025-06-13 14:30:00', true, NULL, '2025-06-01 12:46:47.599559');
INSERT INTO public.time_slots VALUES (1816, 38, '2025-06-13 14:30:00', '2025-06-13 15:00:00', true, NULL, '2025-06-01 12:46:47.600511');
INSERT INTO public.time_slots VALUES (1817, 38, '2025-06-13 15:00:00', '2025-06-13 15:30:00', true, NULL, '2025-06-01 12:46:47.601434');
INSERT INTO public.time_slots VALUES (1818, 38, '2025-06-13 15:30:00', '2025-06-13 16:00:00', true, NULL, '2025-06-01 12:46:47.602554');
INSERT INTO public.time_slots VALUES (1819, 38, '2025-06-13 16:00:00', '2025-06-13 16:30:00', true, NULL, '2025-06-01 12:46:47.603628');
INSERT INTO public.time_slots VALUES (1820, 38, '2025-06-13 16:30:00', '2025-06-13 17:00:00', true, NULL, '2025-06-01 12:46:47.605066');
INSERT INTO public.time_slots VALUES (22, 11, '2025-06-02 09:30:00', '2025-06-02 10:00:00', false, NULL, '2025-06-01 12:42:15.382495');
INSERT INTO public.time_slots VALUES (101, 12, '2025-06-02 09:00:00', '2025-06-02 09:30:00', false, NULL, '2025-06-01 12:42:15.469697');
INSERT INTO public.time_slots VALUES (23, 11, '2025-06-02 10:00:00', '2025-06-02 10:30:00', false, NULL, '2025-06-01 12:42:15.383674');
INSERT INTO public.time_slots VALUES (103, 12, '2025-06-02 10:00:00', '2025-06-02 10:30:00', false, NULL, '2025-06-01 12:42:15.471671');
INSERT INTO public.time_slots VALUES (24, 11, '2025-06-02 10:30:00', '2025-06-02 11:00:00', false, NULL, '2025-06-01 12:42:15.385186');
INSERT INTO public.time_slots VALUES (104, 12, '2025-06-02 10:30:00', '2025-06-02 11:00:00', false, NULL, '2025-06-01 12:42:15.472741');
INSERT INTO public.time_slots VALUES (10, 20, '2025-06-17 12:00:00', '2025-06-17 13:00:00', true, NULL, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (12, 15, '2025-06-17 16:30:00', '2025-06-17 17:30:00', true, NULL, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (14, 19, '2025-06-18 11:00:00', '2025-06-18 12:00:00', true, NULL, '2025-06-01 11:57:23.857944');
INSERT INTO public.time_slots VALUES (501, 17, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:15.900101');
INSERT INTO public.time_slots VALUES (16, 37, '2025-06-19 09:00:00', '2025-06-19 10:00:00', true, NULL, '2025-06-01 11:59:02.38133');
INSERT INTO public.time_slots VALUES (17, 37, '2025-06-19 11:00:00', '2025-06-19 12:00:00', true, NULL, '2025-06-01 11:59:02.38133');
INSERT INTO public.time_slots VALUES (20, 12, '2025-06-20 10:00:00', '2025-06-20 11:00:00', true, NULL, '2025-06-01 11:59:02.38133');
INSERT INTO public.time_slots VALUES (21, 11, '2025-06-02 09:00:00', '2025-06-02 09:30:00', true, NULL, '2025-06-01 12:42:15.380306');
INSERT INTO public.time_slots VALUES (102, 12, '2025-06-02 09:30:00', '2025-06-02 10:00:00', true, NULL, '2025-06-01 12:42:15.47059');
INSERT INTO public.time_slots VALUES (25, 11, '2025-06-02 11:00:00', '2025-06-02 11:30:00', true, NULL, '2025-06-01 12:42:15.386608');
INSERT INTO public.time_slots VALUES (106, 12, '2025-06-02 11:30:00', '2025-06-02 12:00:00', true, NULL, '2025-06-01 12:42:15.492839');
INSERT INTO public.time_slots VALUES (29, 11, '2025-06-02 13:00:00', '2025-06-02 13:30:00', true, NULL, '2025-06-01 12:42:15.391301');
INSERT INTO public.time_slots VALUES (110, 12, '2025-06-02 13:30:00', '2025-06-02 14:00:00', true, NULL, '2025-06-01 12:42:15.499987');

*/
--
-- Data for Name: meetings; Type: TABLE DATA; Schema: public; Owner: splash25user
--
/*
INSERT INTO public.meetings VALUES (64, 48, 49, NULL, 'Meeting request for test_meeting_seller', 'ACCEPTED', '2025-06-06 13:52:28.73497', '2025-06-07 07:41:32.953949', NULL, NULL, NULL, 49);
INSERT INTO public.meetings VALUES (63, 34, 37, NULL, 'Meeting request for ${selectedBuyerForMeeting.organization}', 'CANCELLED', '2025-06-06 13:45:08.780914', '2025-06-14 09:42:13.094732', NULL, NULL, NULL, 34);
INSERT INTO public.meetings VALUES (65, 36, 16, NULL, 'Meeting request for Heritage Houseboat', 'CANCELLED', '2025-06-07 06:14:46.476044', '2025-06-14 09:42:13.094734', NULL, NULL, NULL, 36);
INSERT INTO public.meetings VALUES (67, 4, 37, NULL, 'Meeting request for ${selectedBuyerForMeeting.organization}', 'CANCELLED', '2025-06-07 16:03:46.010198', '2025-06-14 09:42:13.094734', NULL, NULL, NULL, 37);
INSERT INTO public.meetings VALUES (68, 36, 13, NULL, 'Meeting request for Coconut Grove Homestay', 'CANCELLED', '2025-06-14 10:12:31.621637', '2025-06-14 10:22:02.755911', NULL, NULL, NULL, 36);
INSERT INTO public.meetings VALUES (69, 36, 12, NULL, 'Meeting request for Spice Garden Retreat', 'CANCELLED', '2025-06-14 11:15:04.179918', '2025-06-16 13:21:18.662929', NULL, NULL, NULL, 36);
INSERT INTO public.meetings VALUES (70, 6, 37, NULL, 'Meeting request for ${selectedBuyerForMeeting.organization}', 'CANCELLED', '2025-06-14 11:27:21.071918', '2025-06-16 13:21:18.66293', NULL, NULL, NULL, 37);
INSERT INTO public.meetings VALUES (71, 36, 15, NULL, 'Meeting request for Ayurveda Wellness Center', 'PENDING', '2025-06-16 13:35:50.787712', NULL, NULL, NULL, NULL, 36);
INSERT INTO public.meetings VALUES (75, 2, 37, NULL, 'Meeting request for ${selectedBuyerForMeeting.organization}', 'PENDING', '2025-06-16 13:43:27.025799', NULL, NULL, NULL, NULL, 37);
INSERT INTO public.meetings VALUES (76, 5, 37, NULL, 'Meeting request for Royal Journey Travels', 'PENDING', '2025-06-17 09:24:07.541322', NULL, NULL, NULL, NULL, 37);
INSERT INTO public.meetings VALUES (77, 9, 37, NULL, 'Meeting request for Hill Station Holidays', 'PENDING', '2025-06-17 09:25:38.351732', NULL, NULL, NULL, NULL, 37);
INSERT INTO public.meetings VALUES (78, 34, 37, NULL, 'Meeting request for Debug Org', 'PENDING', '2025-06-17 09:40:09.583419', NULL, NULL, NULL, NULL, 37);
INSERT INTO public.meetings VALUES (79, 4, 37, NULL, 'Meeting request for South India Tours & Travels', 'PENDING', '2025-06-19 06:15:30.629906', NULL, NULL, NULL, NULL, 37);
INSERT INTO public.meetings VALUES (2, 2, 12, 2, 'Meeting confirmed for spice plantation tour packages', 'ACCEPTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 3, '2025-06-15', '11:00:00', 2);
INSERT INTO public.meetings VALUES (4, 4, 14, 4, 'Discussion on hill station retreat packages for corporate clients', 'ACCEPTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 7, '2025-06-15', '15:30:00', 14);
INSERT INTO public.meetings VALUES (6, 6, 16, 6, 'Houseboat booking requirements - pricing concerns', 'REJECTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 11, '2025-06-16', '11:30:00', 16);
INSERT INTO public.meetings VALUES (7, 7, 17, 7, 'Beach resort packages for honeymoon couples', 'ACCEPTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 13, '2025-06-16', '13:00:00', 7);
INSERT INTO public.meetings VALUES (9, 9, 19, 9, 'Wildlife safari packages and accommodation', 'ACCEPTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 17, '2025-06-17', '10:30:00', 9);
INSERT INTO public.meetings VALUES (11, 1, 13, 11, 'Follow-up meeting for homestay collaboration', 'ACCEPTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 5, '2025-06-17', '14:30:00', 1);
INSERT INTO public.meetings VALUES (13, 5, 17, 13, 'Beach resort wellness retreat combinations', 'ACCEPTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 14, '2025-06-18', '09:00:00', 5);
INSERT INTO public.meetings VALUES (50, 2, 11, 31, 'Sample meeting between priya.sharma and suresh.nair', 'COMPLETED', '2025-06-01 12:50:37.127733', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (52, 2, 12, 111, 'Sample meeting between priya.sharma and lakshmi.pillai', 'ACCEPTED', '2025-06-01 12:50:37.129499', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (53, 3, 11, 32, 'Sample meeting between amit.patel and suresh.nair', 'COMPLETED', '2025-06-01 12:50:37.131248', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.meetings VALUES (55, 3, 12, 110, 'Sample meeting between amit.patel and lakshmi.pillai', 'ACCEPTED', '2025-06-01 12:50:37.133082', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.meetings VALUES (56, 3, 12, 112, 'Sample meeting between amit.patel and lakshmi.pillai', 'COMPLETED', '2025-06-01 12:50:37.133083', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.meetings VALUES (66, 36, 49, NULL, 'Meeting request for test_meeting_seller', 'CANCELLED', '2025-06-07 06:15:09.283528', '2025-06-14 09:42:13.094734', NULL, NULL, NULL, 36);
INSERT INTO public.meetings VALUES (72, 36, 40, NULL, 'Meeting request for Test Business', 'PENDING', '2025-06-16 13:36:29.322107', NULL, NULL, NULL, NULL, 36);
INSERT INTO public.meetings VALUES (73, 36, 46, NULL, 'Meeting request for New Test Business', 'PENDING', '2025-06-16 13:37:29.356237', NULL, NULL, NULL, NULL, 36);
INSERT INTO public.meetings VALUES (18, 1, 37, 17, 'Rajesh Kumar from Wanderlust Travels meeting with generic seller account', 'CANCELLED', '2025-06-01 11:59:13.749898', '2025-06-06 07:50:35.046903', NULL, '2025-06-19', '11:00:00', 37);
INSERT INTO public.meetings VALUES (15, 9, 11, 15, 'Hill station to backwater tour packages', 'ACCEPTED', '2025-06-01 11:55:36.405597', '2025-06-01 11:57:34.575033', 2, '2025-06-18', '15:00:00', 9);
INSERT INTO public.meetings VALUES (17, 36, 11, 19, 'Generic buyer meeting with Backwater Bliss Resort for partnership opportunities', 'ACCEPTED', '2025-06-01 11:59:13.749898', '2025-06-01 11:59:13.749898', 1, '2025-06-19', '16:00:00', 11);
INSERT INTO public.meetings VALUES (19, 3, 37, 18, 'Amit Patel from Explor India Tours discussing packages with generic seller', 'ACCEPTED', '2025-06-01 11:59:13.749898', '2025-06-01 11:59:13.749898', NULL, '2025-06-19', '14:00:00', 37);
INSERT INTO public.meetings VALUES (22, 1, 11, 22, 'Sample meeting between rajesh.kumar and suresh.nair', 'ACCEPTED', '2025-06-01 12:46:47.609642', NULL, NULL, NULL, NULL, 11);
INSERT INTO public.meetings VALUES (23, 1, 12, 101, 'Sample meeting between rajesh.kumar and lakshmi.pillai', 'COMPLETED', '2025-06-01 12:46:47.612721', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.meetings VALUES (25, 2, 11, 21, 'Sample meeting between priya.sharma and suresh.nair', 'ACCEPTED', '2025-06-01 12:46:47.614799', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (26, 2, 11, 23, 'Sample meeting between priya.sharma and suresh.nair', 'COMPLETED', '2025-06-01 12:46:47.614799', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (28, 2, 12, 103, 'Sample meeting between priya.sharma and lakshmi.pillai', 'ACCEPTED', '2025-06-01 12:46:47.617027', NULL, NULL, NULL, NULL, 12);
INSERT INTO public.meetings VALUES (29, 3, 11, 24, 'Sample meeting between amit.patel and suresh.nair', 'COMPLETED', '2025-06-01 12:46:47.618773', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.meetings VALUES (31, 3, 12, 102, 'Sample meeting between amit.patel and lakshmi.pillai', 'ACCEPTED', '2025-06-01 12:46:47.620496', NULL, NULL, NULL, NULL, 12);
INSERT INTO public.meetings VALUES (32, 3, 12, 104, 'Sample meeting between amit.patel and lakshmi.pillai', 'COMPLETED', '2025-06-01 12:46:47.620496', NULL, NULL, NULL, NULL, 12);
INSERT INTO public.meetings VALUES (34, 1, 11, 26, 'Sample meeting between rajesh.kumar and suresh.nair', 'ACCEPTED', '2025-06-01 12:47:09.185934', NULL, NULL, NULL, NULL, 11);
INSERT INTO public.meetings VALUES (35, 1, 12, 105, 'Sample meeting between rajesh.kumar and lakshmi.pillai', 'COMPLETED', '2025-06-01 12:47:09.188984', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.meetings VALUES (37, 2, 11, 25, 'Sample meeting between priya.sharma and suresh.nair', 'ACCEPTED', '2025-06-01 12:47:09.191149', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (38, 2, 11, 27, 'Sample meeting between priya.sharma and suresh.nair', 'COMPLETED', '2025-06-01 12:47:09.19115', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (40, 2, 12, 107, 'Sample meeting between priya.sharma and lakshmi.pillai', 'ACCEPTED', '2025-06-01 12:47:09.193044', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (41, 3, 11, 28, 'Sample meeting between amit.patel and suresh.nair', 'COMPLETED', '2025-06-01 12:47:09.194848', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.meetings VALUES (43, 3, 12, 106, 'Sample meeting between amit.patel and lakshmi.pillai', 'ACCEPTED', '2025-06-01 12:47:09.196709', NULL, NULL, NULL, NULL, 12);
INSERT INTO public.meetings VALUES (44, 3, 12, 108, 'Sample meeting between amit.patel and lakshmi.pillai', 'COMPLETED', '2025-06-01 12:47:09.19671', NULL, NULL, NULL, NULL, 12);
INSERT INTO public.meetings VALUES (46, 1, 11, 30, 'Sample meeting between rajesh.kumar and suresh.nair', 'ACCEPTED', '2025-06-01 12:50:37.122264', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.meetings VALUES (47, 1, 12, 109, 'Sample meeting between rajesh.kumar and lakshmi.pillai', 'COMPLETED', '2025-06-01 12:50:37.125306', NULL, NULL, NULL, NULL, 12);
INSERT INTO public.meetings VALUES (49, 2, 11, 29, 'Sample meeting between priya.sharma and suresh.nair', 'ACCEPTED', '2025-06-01 12:50:37.127732', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.meetings VALUES (74, 36, 37, NULL, 'Meeting request for Balu''s Father''s Business', 'ACCEPTED', '2025-06-16 13:38:51.326482', '2025-06-16 13:43:13.967437', NULL, NULL, NULL, 36);

*/
--
-- Data for Name: migration_log; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.migration_log VALUES (1, 'current_schema_creation', 'completed', 'Current Splash25 schema created successfully', '2025-05-26 05:27:33.646505', '2025-05-26 05:27:33.689347', 0);
INSERT INTO public.migration_log VALUES (2, 'customer_schema_conversion', 'completed', 'Customer schema converted to PostgreSQL successfully', '2025-05-26 05:27:33.703202', '2025-05-26 05:27:33.742034', 0);
INSERT INTO public.migration_log VALUES (3, 'customer_data_insertion', 'completed', 'Customer sample data inserted successfully', '2025-05-26 05:27:33.75631', '2025-05-26 05:27:33.766056', 0);
INSERT INTO public.migration_log VALUES (4, 'hybrid_integration', 'completed', 'Hybrid integration schema created successfully', '2025-05-26 05:27:33.779968', '2025-05-26 05:27:33.826856', 0);
INSERT INTO public.migration_log VALUES (5, 'data_migration', 'started', 'Starting customer data migration to Splash25 schema', '2025-05-26 05:27:33.840834', NULL, NULL);


--
-- Data for Name: migration_mapping_buyers; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.migration_mapping_buyers VALUES (1, 1, 1, 1, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (2, 2, 2, 2, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (3, 3, 3, 3, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (4, 4, 4, 4, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (5, 5, 5, 5, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (6, 6, 6, 6, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (7, 7, 7, 7, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (8, 8, 8, 8, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (9, 9, 9, 9, 'completed', '2025-05-26 05:27:33.847255');
INSERT INTO public.migration_mapping_buyers VALUES (10, 10, 10, 10, 'completed', '2025-05-26 05:27:33.847255');


--
-- Data for Name: migration_mapping_sellers; Type: TABLE DATA; Schema: public; Owner: splash25user
--



--
-- Data for Name: pending_buyers; Type: TABLE DATA; Schema: public; Owner: splash25user
--



--
-- Data for Name: property_type; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.property_type VALUES (1, 'Homestay');
INSERT INTO public.property_type VALUES (2, 'Service Villa');
INSERT INTO public.property_type VALUES (3, 'Budget Resort');
INSERT INTO public.property_type VALUES (4, 'Premium Resort');
INSERT INTO public.property_type VALUES (5, 'Not a property');


--
-- Data for Name: seller; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller VALUES (1, 'Backwater Bliss Resort', 'Kumarakom Lake Side', 'Kumarakom', 'Kerala', '686563', 'India', '@backwaterbliss', '32ABCDE1234F1Z5', 'www.backwaterbliss.com', 'Active', true);
INSERT INTO public.seller VALUES (2, 'Spice Garden Retreat', 'Thekkady Hills', 'Thekkady', 'Kerala', '685536', 'India', '@spicegarden', '32FGHIJ5678K2L6', 'www.spicegardenretreat.com', 'Active', true);
INSERT INTO public.seller VALUES (3, 'Coconut Grove Homestay', 'Alleppey Backwaters', 'Alleppey', 'Kerala', '688001', 'India', '@coconutgrove', '32MNOPQ9012R3S7', 'www.coconutgrovehomestay.in', 'Active', false);
INSERT INTO public.seller VALUES (4, 'Misty Mountain Resort', 'Munnar Hills', 'Munnar', 'Kerala', '685612', 'India', '@mistymountain', '32TUVWX3456Y4Z8', 'www.mistymountainresort.com', 'Active', true);
INSERT INTO public.seller VALUES (5, 'Ayurveda Wellness Center', 'Kovalam Beach', 'Kovalam', 'Kerala', '695527', 'India', '@ayurvedawellness', '32ABCDE7890F5G9', 'www.ayurvedawellness.in', 'Active', true);
INSERT INTO public.seller VALUES (6, 'Heritage Houseboat', 'Alleppey Canals', 'Alleppey', 'Kerala', '688012', 'India', '@heritagehouseboat', '32HIJKL2345M6N0', 'www.heritagehouseboat.com', 'Active', false);
INSERT INTO public.seller VALUES (7, 'Cliff Edge Resort', 'Varkala Cliffs', 'Varkala', 'Kerala', '695141', 'India', '@cliffedge', '32OPQRS6789T7U1', 'www.cliffedgeresort.in', 'Active', true);
INSERT INTO public.seller VALUES (8, 'Tea Estate Villa', 'Munnar Tea Gardens', 'Munnar', 'Kerala', '685565', 'India', '@teaestate', '32VWXYZ0123A8B2', 'www.teaestatevilla.com', 'Active', false);
INSERT INTO public.seller VALUES (9, 'Wayanad Wild Resort', 'Wayanad Forest', 'Wayanad', 'Kerala', '673121', 'India', '@wayanadwild', '32CDEFG4567H9I3', 'www.wayanadwildresort.com', 'Active', true);
INSERT INTO public.seller VALUES (10, 'Beach Paradise Hotel', 'Kovalam Beach Road', 'Kovalam', 'Kerala', '695527', 'India', '@beachparadise', '32JKLMN0123O4P5', 'www.beachparadisehotel.com', 'Active', true);


--
-- Data for Name: seller_business; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_business VALUES (1, 2010, 1, 25, false, 2008);
INSERT INTO public.seller_business VALUES (2, 2015, 1, 18, false, 2012);
INSERT INTO public.seller_business VALUES (3, 2018, 3, 8, true, 2016);
INSERT INTO public.seller_business VALUES (4, 2012, 1, 30, true, 2010);
INSERT INTO public.seller_business VALUES (5, 2008, 1, 15, false, 2005);
INSERT INTO public.seller_business VALUES (6, 2016, 5, 4, true, 2014);
INSERT INTO public.seller_business VALUES (7, 2014, 1, 22, false, 2012);
INSERT INTO public.seller_business VALUES (8, 2019, 5, 6, true, 2017);
INSERT INTO public.seller_business VALUES (9, 2017, 1, 12, true, 2015);
INSERT INTO public.seller_business VALUES (10, 2011, 2, 35, false, 2009);


--
-- Data for Name: seller_business_info; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_business_info VALUES (1, 1, 2010, 25, false, 2008, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (2, 2, 2015, 18, false, 2012, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (3, 3, 2018, 8, true, 2016, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (4, 4, 2012, 30, true, 2010, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (5, 5, 2008, 15, false, 2005, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (6, 6, 2016, 4, true, 2014, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (7, 7, 2014, 22, false, 2012, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (8, 8, 2019, 6, true, 2017, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (9, 9, 2017, 12, true, 2015, '2025-05-26 05:27:33.849757');
INSERT INTO public.seller_business_info VALUES (10, 10, 2011, 35, false, 2009, '2025-05-26 05:27:33.849757');


--
-- Data for Name: seller_financial; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_financial VALUES (1, true, 150000.00, 150000.00, true);
INSERT INTO public.seller_financial VALUES (2, true, 100000.00, 100000.00, true);
INSERT INTO public.seller_financial VALUES (3, false, 75000.00, 50000.00, false);
INSERT INTO public.seller_financial VALUES (4, true, 150000.00, 150000.00, true);
INSERT INTO public.seller_financial VALUES (5, true, 125000.00, 125000.00, true);
INSERT INTO public.seller_financial VALUES (6, false, 75000.00, 25000.00, false);
INSERT INTO public.seller_financial VALUES (7, true, 100000.00, 100000.00, true);
INSERT INTO public.seller_financial VALUES (8, true, 125000.00, 100000.00, false);
INSERT INTO public.seller_financial VALUES (9, true, 100000.00, 100000.00, true);
INSERT INTO public.seller_financial VALUES (10, true, 100000.00, 100000.00, true);


--
-- Data for Name: seller_financial_info; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_financial_info VALUES (1, 1, true, 150000.00, 150000.00, true, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (2, 2, true, 100000.00, 100000.00, true, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (3, 3, false, 75000.00, 50000.00, false, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (4, 4, true, 150000.00, 150000.00, true, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (5, 5, true, 125000.00, 125000.00, true, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (6, 6, false, 75000.00, 25000.00, false, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (7, 7, true, 100000.00, 100000.00, true, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (8, 8, true, 125000.00, 100000.00, false, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (9, 9, true, 100000.00, 100000.00, true, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (10, 10, true, 100000.00, 100000.00, true, '2025-05-26 05:27:33.850234', 0);
INSERT INTO public.seller_financial_info VALUES (11, 12, true, 60000.00, 30000.00, true, '2025-06-22 05:55:21.330704', 2);


--
-- Data for Name: seller_primary_contact; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_primary_contact VALUES (1, 'Mr.', 'Suresh', 'Nair', 'General Manager', '+91-9447123456', 'suresh.nair@backwaterbliss.com');
INSERT INTO public.seller_primary_contact VALUES (2, 'Ms.', 'Lakshmi', 'Pillai', 'Resort Manager', '+91-9447123457', 'lakshmi.pillai@spicegardenretreat.com');
INSERT INTO public.seller_primary_contact VALUES (3, 'Mr.', 'Ravi', 'Kumar', 'Owner', '+91-9447123458', 'ravi.kumar@coconutgrovehomestay.in');
INSERT INTO public.seller_primary_contact VALUES (4, 'Mrs.', 'Meera', 'Menon', 'Operations Head', '+91-9447123459', 'meera.menon@mistymountainresort.com');
INSERT INTO public.seller_primary_contact VALUES (5, 'Dr.', 'Ayush', 'Sharma', 'Director', '+91-9447123460', 'ayush.sharma@ayurvedawellness.in');
INSERT INTO public.seller_primary_contact VALUES (6, 'Mr.', 'Krishnan', 'Nambiar', 'Captain', '+91-9447123461', 'krishnan.nambiar@heritagehouseboat.com');
INSERT INTO public.seller_primary_contact VALUES (7, 'Ms.', 'Priya', 'Varma', 'Resort Director', '+91-9447123462', 'priya.varma@cliffedgeresort.in');
INSERT INTO public.seller_primary_contact VALUES (8, 'Mr.', 'Arun', 'Thampi', 'Estate Manager', '+91-9447123463', 'arun.thampi@teaestatevilla.com');
INSERT INTO public.seller_primary_contact VALUES (9, 'Mrs.', 'Geetha', 'Raj', 'Wildlife Guide', '+91-9447123464', 'geetha.raj@wayanadwildresort.com');
INSERT INTO public.seller_primary_contact VALUES (10, 'Mr.', 'Vinod', 'Das', 'Hotel Manager', '+91-9447123465', 'vinod.das@beachparadisehotel.com');


--
-- Data for Name: seller_reference; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_reference VALUES (1, 'KTDC Kumarakom', 'Kumarakom, Kerala', 'Tourism Department', 'Kottayam, Kerala');
INSERT INTO public.seller_reference VALUES (2, 'Forest Department', 'Thekkady, Kerala', 'Spice Board India', 'Kochi, Kerala');
INSERT INTO public.seller_reference VALUES (3, 'Alleppey Tourism', 'Alleppey, Kerala', 'Homestay Association', 'Kochi, Kerala');
INSERT INTO public.seller_reference VALUES (4, 'Munnar Tourism', 'Munnar, Kerala', 'Tea Board India', 'Kochi, Kerala');
INSERT INTO public.seller_reference VALUES (5, 'Ayurveda Board', 'Thiruvananthapuram, Kerala', 'Medical Tourism', 'Kovalam, Kerala');
INSERT INTO public.seller_reference VALUES (6, 'Boat Owners Association', 'Alleppey, Kerala', 'Backwater Tourism', 'Kumarakom, Kerala');
INSERT INTO public.seller_reference VALUES (7, 'Varkala Tourism', 'Varkala, Kerala', 'Beach Resort Association', 'Kovalam, Kerala');
INSERT INTO public.seller_reference VALUES (8, 'Tea Growers Association', 'Munnar, Kerala', 'Hill Station Tourism', 'Munnar, Kerala');
INSERT INTO public.seller_reference VALUES (9, 'Forest Department', 'Wayanad, Kerala', 'Wildlife Board', 'Wayanad, Kerala');
INSERT INTO public.seller_reference VALUES (10, 'Beach Tourism Board', 'Kovalam, Kerala', 'Hotel Association', 'Thiruvananthapuram, Kerala');


--
-- Data for Name: seller_references; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_references VALUES (1, 1, 'KTDC Kumarakom', 'Kumarakom, Kerala', 'Tourism Department', 'Kottayam, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (2, 2, 'Forest Department', 'Thekkady, Kerala', 'Spice Board India', 'Kochi, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (3, 3, 'Alleppey Tourism', 'Alleppey, Kerala', 'Homestay Association', 'Kochi, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (4, 4, 'Munnar Tourism', 'Munnar, Kerala', 'Tea Board India', 'Kochi, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (5, 5, 'Ayurveda Board', 'Thiruvananthapuram, Kerala', 'Medical Tourism', 'Kovalam, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (6, 6, 'Boat Owners Association', 'Alleppey, Kerala', 'Backwater Tourism', 'Kumarakom, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (7, 7, 'Varkala Tourism', 'Varkala, Kerala', 'Beach Resort Association', 'Kovalam, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (8, 8, 'Tea Growers Association', 'Munnar, Kerala', 'Hill Station Tourism', 'Munnar, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (9, 9, 'Forest Department', 'Wayanad, Kerala', 'Wildlife Board', 'Wayanad, Kerala', '2025-05-26 05:27:33.850702');
INSERT INTO public.seller_references VALUES (10, 10, 'Beach Tourism Board', 'Kovalam, Kerala', 'Hotel Association', 'Thiruvananthapuram, Kerala', '2025-05-26 05:27:33.850702');


--
-- Data for Name: seller_stall; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_stall VALUES (1, 1, 1, 'A1', 'Backwater Bliss Resort', 'www.splash2025.com/backwaterbliss');
INSERT INTO public.seller_stall VALUES (2, 2, 2, 'A2', 'Spice Garden Retreat', 'www.splash2025.com/spicegarden');
INSERT INTO public.seller_stall VALUES (3, 3, 3, 'A3', 'Coconut Grove Homestay', 'www.splash2025.com/coconutgrove');
INSERT INTO public.seller_stall VALUES (4, 4, 1, 'A4', 'Misty Mountain Resort', 'www.splash2025.com/mistymountain');
INSERT INTO public.seller_stall VALUES (5, 5, 6, 'C1', 'Ayurveda Wellness Center', 'www.splash2025.com/ayurvedawellness');
INSERT INTO public.seller_stall VALUES (6, 6, 3, 'A5', 'Heritage Houseboat', 'www.splash2025.com/heritagehouseboat');
INSERT INTO public.seller_stall VALUES (7, 7, 2, 'B2', 'Cliff Edge Resort', 'www.splash2025.com/cliffedge');
INSERT INTO public.seller_stall VALUES (8, 8, 6, 'C5', 'Tea Estate Villa', 'www.splash2025.com/teaestate');
INSERT INTO public.seller_stall VALUES (9, 9, 2, 'B3', 'Wayanad Wild Resort', 'www.splash2025.com/wayanadwild');
INSERT INTO public.seller_stall VALUES (10, 10, 2, 'C2', 'Beach Paradise Hotel', 'www.splash2025.com/beachparadise');


--
-- Data for Name: seller_target_market; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_target_market VALUES (1, 1, 2);
INSERT INTO public.seller_target_market VALUES (2, 1, 6);
INSERT INTO public.seller_target_market VALUES (3, 2, 3);
INSERT INTO public.seller_target_market VALUES (4, 2, 8);
INSERT INTO public.seller_target_market VALUES (5, 3, 11);
INSERT INTO public.seller_target_market VALUES (6, 3, 3);
INSERT INTO public.seller_target_market VALUES (7, 4, 7);
INSERT INTO public.seller_target_market VALUES (8, 4, 12);
INSERT INTO public.seller_target_market VALUES (9, 5, 4);
INSERT INTO public.seller_target_market VALUES (10, 5, 9);
INSERT INTO public.seller_target_market VALUES (11, 6, 5);
INSERT INTO public.seller_target_market VALUES (12, 6, 6);
INSERT INTO public.seller_target_market VALUES (13, 7, 6);
INSERT INTO public.seller_target_market VALUES (14, 7, 12);
INSERT INTO public.seller_target_market VALUES (15, 8, 7);
INSERT INTO public.seller_target_market VALUES (16, 8, 11);
INSERT INTO public.seller_target_market VALUES (17, 9, 8);
INSERT INTO public.seller_target_market VALUES (18, 9, 1);
INSERT INTO public.seller_target_market VALUES (19, 10, 6);
INSERT INTO public.seller_target_market VALUES (20, 10, 11);


--
-- Data for Name: seller_target_markets; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.seller_target_markets VALUES (1, 1, 2, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (2, 1, 6, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (3, 2, 3, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (4, 2, 8, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (5, 3, 11, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (6, 3, 3, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (7, 4, 7, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (8, 4, 12, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (9, 5, 4, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (10, 5, 9, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (11, 6, 5, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (12, 6, 6, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (13, 7, 6, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (14, 7, 12, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (15, 8, 7, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (16, 8, 11, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (17, 9, 8, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (18, 9, 1, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (19, 10, 6, '2025-05-26 05:27:33.851266');
INSERT INTO public.seller_target_markets VALUES (20, 10, 11, '2025-05-26 05:27:33.851266');


--
-- Data for Name: stall_database; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.stall_database VALUES (1, 'A1', 1);
INSERT INTO public.stall_database VALUES (2, 'A2', 2);
INSERT INTO public.stall_database VALUES (3, 'A3', 2);
INSERT INTO public.stall_database VALUES (4, 'A4', 1);
INSERT INTO public.stall_database VALUES (5, 'A5', 3);
INSERT INTO public.stall_database VALUES (6, 'B1', 4);
INSERT INTO public.stall_database VALUES (7, 'B2', 2);
INSERT INTO public.stall_database VALUES (8, 'B3', 2);
INSERT INTO public.stall_database VALUES (9, 'B4', 3);
INSERT INTO public.stall_database VALUES (10, 'B5', 5);
INSERT INTO public.stall_database VALUES (11, 'C1', 6);
INSERT INTO public.stall_database VALUES (12, 'C2', 2);
INSERT INTO public.stall_database VALUES (13, 'C3', 3);
INSERT INTO public.stall_database VALUES (14, 'C4', 2);
INSERT INTO public.stall_database VALUES (15, 'C5', 1);


--
-- Data for Name: stall_inventory; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.stall_inventory VALUES (1, 'A1', 1, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (2, 'A2', 2, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (3, 'A3', 2, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (4, 'A4', 1, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (5, 'A5', 3, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (6, 'B1', 4, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (7, 'B2', 2, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (8, 'B3', 2, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (9, 'B4', 3, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (10, 'B5', 5, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (11, 'C1', 6, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (12, 'C2', 2, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (13, 'C3', 3, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (14, 'C4', 2, false, '2025-05-26 05:27:33.811811');
INSERT INTO public.stall_inventory VALUES (15, 'C5', 1, false, '2025-05-26 05:27:33.811811');


--
-- Data for Name: stalls; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.stalls VALUES (1, 39, 'A001', '2025-06-02 06:29:43.714495', NULL, 1, NULL, NULL, false);
INSERT INTO public.stalls VALUES (2, 40, 'A001', '2025-06-02 06:29:52.916525', NULL, 1, NULL, NULL, false);
INSERT INTO public.stalls VALUES (3, 39, 'A999', '2025-06-02 06:36:00.90755', NULL, 1, NULL, NULL, false);
INSERT INTO public.stalls VALUES (4, 11, '0', '2025-06-16 09:47:34.496913', NULL, 4, '', 'Backwater Bliss Resort', true);
INSERT INTO public.stalls VALUES (12, 12, '0', '2025-06-21 16:05:39.7299', NULL, 1, 'AB1', 'Spice Garden Retreat', true);
INSERT INTO public.stalls VALUES (13, 12, '0', '2025-06-21 16:06:24.158322', NULL, 1, 'AB123', 'Spice Garden Retreat', true);
INSERT INTO public.stalls VALUES (9, 37, '0', '2025-06-16 13:19:55.775238', '2025-06-21 16:14:29.577492', 3, 'BALU', 'Balu''s Father''s Business', true);
INSERT INTO public.stalls VALUES (14, 13, '0', '2025-06-21 16:36:29.568373', '2025-06-21 16:36:46.701457', 4, 'B5', 'Coconut Grove Homestay', true);


--
-- Data for Name: transportation; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.transportation VALUES (1, 1, 'train', 'AI', '644 from Mumbai', 'Cochin International Airport (COK)', '2025-06-20 23:30:00', '', '2025-06-20 23:30:00', 'SPLASH25-73SA8C3OY', 'Nothing', 'Vandebharat', '', 'EKM Bus Stand', '2025-06-22 23:30:00', 'Cochin International Airport (COK)', '2025-06-22 23:30:00', 'SPLASH25-4V92RXKQ8', 'nothing', 'train', 'train');


--
-- Name: accommodations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.accommodations_id_seq', 8, true);


--
-- Name: buyer_business_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_business_info_id_seq', 10, true);


--
-- Name: buyer_buyer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_buyer_id_seq', 1, false);


--
-- Name: buyer_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_categories_id_seq', 6, true);


--
-- Name: buyer_category_buyer_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_category_buyer_category_id_seq', 1, false);


--
-- Name: buyer_financial_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_financial_info_id_seq', 10, true);


--
-- Name: buyer_interest_interest_number_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_interest_interest_number_seq', 1, false);


--
-- Name: buyer_profile_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_profile_interests_id_seq', 20, true);


--
-- Name: buyer_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_profiles_id_seq', 37, true);


--
-- Name: buyer_references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.buyer_references_id_seq', 10, true);


--
-- Name: domain_restrictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.domain_restrictions_id_seq', 1, false);


--
-- Name: ground_transportation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.ground_transportation_id_seq', 2, true);


--
-- Name: host_properties_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.host_properties_property_id_seq', 1, true);


--
-- Name: interest_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.interest_interest_id_seq', 1, false);


--
-- Name: interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.interests_id_seq', 13, true);


--
-- Name: invited_buyers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.invited_buyers_id_seq', 1, false);


--
-- Name: listing_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.listing_dates_id_seq', 1, false);


--
-- Name: listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.listings_id_seq', 1, false);


--
-- Name: meetings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.meetings_id_seq', 79, true);


--
-- Name: migration_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.migration_log_id_seq', 5, true);


--
-- Name: migration_mapping_buyers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.migration_mapping_buyers_id_seq', 10, true);


--
-- Name: migration_mapping_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.migration_mapping_sellers_id_seq', 1, false);


--
-- Name: pending_buyers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.pending_buyers_id_seq', 1, false);


--
-- Name: property_type_property_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.property_type_property_type_id_seq', 1, false);


--
-- Name: property_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.property_types_id_seq', 5, true);


--
-- Name: seller_attendees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_attendees_id_seq', 21, true);


--
-- Name: seller_business_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_business_info_id_seq', 10, true);


--
-- Name: seller_financial_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_financial_info_id_seq', 11, true);


--
-- Name: seller_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_profiles_id_seq', 15, true);


--
-- Name: seller_references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_references_id_seq', 10, true);


--
-- Name: seller_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_seller_id_seq', 1, false);


--
-- Name: seller_stall_seller_stall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_stall_seller_stall_id_seq', 1, false);


--
-- Name: seller_target_market_target_market_number_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_target_market_target_market_number_seq', 1, false);


--
-- Name: seller_target_markets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.seller_target_markets_id_seq', 20, true);


--
-- Name: stall_database_stall_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.stall_database_stall_number_id_seq', 1, false);


--
-- Name: stall_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.stall_inventory_id_seq', 15, true);


--
-- Name: stall_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.stall_types_id_seq', 9, true);


--
-- Name: stalls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.stalls_id_seq', 14, true);


--
-- Name: system_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.system_settings_id_seq', 12, true);


--
-- Name: time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.time_slots_id_seq', 1820, true);


--
-- Name: transport_types_transport_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.transport_types_transport_type_id_seq', 12, true);


--
-- Name: transportation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.transportation_id_seq', 1, true);


--
-- Name: travel_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.travel_plans_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.users_id_seq', 53, true);


--
-- PostgreSQL database dump complete
--

