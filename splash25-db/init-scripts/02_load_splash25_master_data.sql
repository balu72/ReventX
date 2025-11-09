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
-- Data for Name: buyer_categories; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.buyer_categories VALUES (2, 'Pre-reg', 0.00, 500.00, false, false, 0, 0, '2025-05-26 05:27:33.810811');
INSERT INTO public.buyer_categories VALUES (4, 'Blogger', 0.00, 0.00, true, true, 0, 0, '2025-05-26 05:27:33.810811');
INSERT INTO public.buyer_categories VALUES (5, 'Government', 0.00, 0.00, true, true, 0, 0, '2025-05-26 05:27:33.810811');
INSERT INTO public.buyer_categories VALUES (1, 'Hosted', 10000.00, 2500.00, true, true, 30, 10, '2025-05-26 05:27:33.810811');
INSERT INTO public.buyer_categories VALUES (6, 'Student', 0.00, 500.00, false, false, 0, 0, '2025-05-26 05:27:33.810811');
INSERT INTO public.buyer_categories VALUES (3, 'Media', NULL, NULL, false, false, 30, 10, '2025-05-26 05:27:33.810811');


--
-- Data for Name: domain_restrictions; Type: TABLE DATA; Schema: public; Owner: splash25user
--



--
-- Data for Name: host_properties; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.host_properties VALUES (1, 'Abad Brookside Lakkidi', 6, 'Joshi', '7306023338', 'reservations@abadhotel.com', NULL, 6, 3);
INSERT INTO public.host_properties VALUES (4, 'Annapara', 3, 'Safar', '94430223320', 'annappahomestay@gmail.com', NULL, 0, 0);
INSERT INTO public.host_properties VALUES (5, 'Aranyakam Homestay', 0, 'Rajesh', '9745539633', 'stay@aranyakam.com', NULL, 0, 0);
INSERT INTO public.host_properties VALUES (2, 'After the Rains', 4, 'Rakesh', '9400881898', 'info@aftertherains.in', NULL, 1, 0);
INSERT INTO public.host_properties VALUES (3, 'Ananterra Resort Wayanad', 5, 'Soorajith', '9742385328', 'surji@outlook.com', NULL, 2, 1);


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.interests VALUES (1, 'Adventure', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (2, 'Agritourism', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (3, 'Ayurveda', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (4, 'Culture', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (5, 'Family Holidays', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (6, 'Honeymoon', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (7, 'MICE', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (8, 'Nature', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (9, 'Schools & Colleges', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (10, 'Spiritual', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (11, 'Wildlife', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (12, 'Yoga', NULL, '2025-05-26 05:27:33.810465');
INSERT INTO public.interests VALUES (13, 'Sightseeing', NULL, '2025-05-26 05:27:33.810465');


--
-- Data for Name: property_types; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.property_types VALUES (1, 'Homestay', NULL, '2025-05-26 05:27:33.811149');
INSERT INTO public.property_types VALUES (2, 'Serviced Villa', NULL, '2025-05-26 05:27:33.811149');
INSERT INTO public.property_types VALUES (3, 'Budget Resort', NULL, '2025-05-26 05:27:33.811149');
INSERT INTO public.property_types VALUES (4, 'Premium Resort', NULL, '2025-05-26 05:27:33.811149');
INSERT INTO public.property_types VALUES (5, 'Not a property', NULL, '2025-05-26 05:27:33.811149');
INSERT INTO public.property_types VALUES (6, 'Hotel', NULL, '2025-05-26 05:27:33.811149');


--
-- Data for Name: stall_types; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.stall_types VALUES (1, 'Standard Stall', 25000.00, 2, 30, 0, '2m x 2m', true, '2mx2m, A/c, 1 x table with tablecloth, 2 x chairs with seat covers, 1 x powerpoint, 1 x light', '2025-05-26 05:27:33.811451', 1, 1, 3500);
INSERT INTO public.stall_types VALUES (7, 'FOC Std Stall', 0.00, 2, 0, 0, '2m x 2m', NULL, 'Standard location, basic branding, meeting space, chairs, power supply', '2025-05-26 05:27:33.811451', 1, 1, 3500);
INSERT INTO public.stall_types VALUES (8, 'Sponsor Stall', 0.00, 2, 0, 0, '2m x 2m', NULL, 'Stall for Sponsor, meeting space, chairs, power supply', '2025-05-26 05:27:33.811451', 1, 1, 3500);
INSERT INTO public.stall_types VALUES (2, 'Standard Corner', 27500.00, 2, 30, 0, '2m x 2m', true, '2mx2m corner location,  A/c, 1 x table with tablecloth, 2 x chairs with seat covers, 1 x powerpoint, 1 x light', '2025-05-26 05:27:33.811451', 1, 1, 3500);
INSERT INTO public.stall_types VALUES (3, 'Premium Stall', 40000.00, 3, 30, 0, '3m x 2m', true, '3mx2m, A/c, 2 x table with tablecloth, 4 x chairs with seat covers, 1 x powerpoint, 2 x light', '2025-05-26 05:27:33.811451', 2, 1, 3500);
INSERT INTO public.stall_types VALUES (4, 'Premium Corner', 44000.00, 3, 30, 0, '3m x 2m', true, '3mx2m corner location, A/c, 2 x table with tablecloth, 4 x chairs with seat covers, 1 x powerpoint, 2 x light', '2025-05-26 05:27:33.811451', 2, 1, 3500);
INSERT INTO public.stall_types VALUES (5, 'Tablespace', 12000.00, 1, 30, 0, '1.5m x 1m', true, 'A/c, 1 x table with tablecloth, 2 x chairs with seat covers (1 on each side)', '2025-05-26 05:27:33.811451', 1, 1, 3500);
INSERT INTO public.stall_types VALUES (6, 'WTO Standard Stall', 20000.00, 2, 30, 0, '2m x 2m', NULL, '2mx2m, A/c, 1 x table with tablecloth, 2 x chairs with seat covers, 1 x powerpoint, 1 x light', '2025-05-26 05:27:33.811451', 1, 1, 3500);
INSERT INTO public.stall_types VALUES (10, 'Corporate', 0.00, 5, 0, 0, '4m x 2m', NULL, 'Stall for corporate use only', '2025-06-24 12:53:20.843647', 1, 2, 3500);


--
-- Data for Name: stall_inventory; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.stall_inventory VALUES (358, 'GT1', 2, true, false, '2025-06-24 14:01:54.879892', '2025-06-24 14:01:54.879892');
INSERT INTO public.stall_inventory VALUES (187, 'GT2', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (188, 'GT3', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (189, 'GT4', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (190, 'GT5', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (191, 'GT6', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (192, 'GT7', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (193, 'GT8', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (194, 'GT9', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (195, 'GT10', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (196, 'GT11', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (197, 'GT12', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (198, 'GT13', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (199, 'GT14', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (200, 'GT15', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (201, 'GT16', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (202, 'GT17', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (203, 'GT18', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (204, 'GT19', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (205, 'GT20', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (206, 'GT21', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (207, 'GT22', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (208, 'GT23', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (209, 'GT24', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (210, 'GT25', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (211, 'GT26', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (212, 'GT27', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (213, 'GT28', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (214, 'GT29', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (215, 'GT30', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (216, 'GT31', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (217, 'GT32', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (218, 'GT33', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (219, 'GT34', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (220, 'GT35', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (221, 'GT36', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (222, 'GT37', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (223, 'GT38', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (224, 'GT39', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (225, 'GT40', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (226, 'GT41', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (227, 'GT42', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (228, 'GT43', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (229, 'GT44', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (230, 'GT45', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (231, 'GT46', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (232, 'GT47', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (233, 'GT48', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (234, 'GT49', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (235, 'GT50', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (236, 'GTT1', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (237, 'GTT2', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (238, 'GTT3', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (239, 'GTT4', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (240, 'GTT5', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (241, 'GTT6', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (242, 'GTT7', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (243, 'GTT8', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (244, 'GTT9', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (245, 'GTT10', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (246, 'GTT11', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (247, 'GTT12', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (248, 'GTT13', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (249, 'GTT14', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (250, 'F1', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (251, 'F2', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (252, 'F3', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (253, 'F4', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (254, 'F5', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (255, 'F6', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (256, 'F7', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (257, 'F8', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (258, 'F9', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (259, 'F10', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (260, 'F11', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (261, 'F12', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (262, 'F13', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (263, 'F14', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (264, 'F15', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (265, 'F16', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (266, 'F17', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (267, 'F18', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (268, 'F19', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (269, 'F20', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (270, 'F21', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (271, 'F22', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (272, 'F23', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (273, 'F24', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (274, 'F25', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (275, 'F26', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (276, 'F27', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (277, 'F28', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (278, 'F29', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (279, 'F30', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (280, 'F31', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (281, 'F32', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (282, 'F33', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (283, 'F34', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (284, 'F35', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (285, 'F36', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (286, 'F37', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (287, 'F38', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (288, 'F39', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (289, 'F40', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (290, 'F41', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (291, 'F42', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (292, 'F43', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (293, 'F44', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (294, 'F45', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (295, 'F46', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (296, 'F47', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (297, 'F48', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (298, 'F49', 2, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (299, 'F50', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (300, 'F51', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (301, 'F52', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (302, 'F53', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (303, 'F54', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (304, 'F55', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (305, 'GT1', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (306, 'GT2', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (307, 'GT3', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (308, 'GT4', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (309, 'GT5', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (310, 'GT6', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (311, 'GT7', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (312, 'GT8', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (313, 'GT9', 5, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (314, 'G1', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (315, 'G2', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (316, 'G3', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (317, 'G4', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (318, 'G5', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (319, 'G6', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (320, 'G7', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (321, 'G8', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (322, 'G9', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (323, 'G10', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (324, 'G11', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (325, 'G12', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (326, 'G13', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (327, 'G14', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (328, 'G15', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (329, 'G16', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (330, 'G17', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (331, 'G18', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (332, 'G19', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (333, 'G20', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (334, 'G21', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (335, 'G22', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (336, 'G23', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (337, 'G24', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (338, 'G25', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (339, 'G26', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (340, 'G27', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (341, 'G28', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (342, 'G29', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (343, 'G30', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (344, 'G31', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (345, 'G32', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (346, 'G33', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (347, 'G34', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (348, 'G35', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (349, 'G36', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (350, 'G37', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (351, 'G38', 4, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (352, 'G39', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (353, 'G40', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (354, 'G41', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (355, 'G42', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (356, 'G43', 3, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');
INSERT INTO public.stall_inventory VALUES (357, 'G44', 1, true, true, '2025-06-24 13:53:15.528938', '2025-06-24 13:53:15.528938');


--
-- Data for Name: system_settings; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.system_settings VALUES (7, 'event_start_date', '2025-07-11T00:00:00.000Z', 'Event start date and time', '2025-06-08 17:38:13.599322', NULL);
INSERT INTO public.system_settings VALUES (8, 'event_end_date', '2025-07-13T23:59:59.000Z', 'Event end date and time', '2025-06-08 17:38:13.599322', NULL);
INSERT INTO public.system_settings VALUES (2, 'meeting_duration', '25', 'Meeting duration in minutes', '2025-06-01 12:46:46.272795', '2025-06-14 08:24:36.921501');
INSERT INTO public.system_settings VALUES (3, 'meeting_interval', '5', 'Interval between meeting slots in minutes', '2025-06-01 12:46:46.274003', '2025-06-14 08:24:36.921501');
INSERT INTO public.system_settings VALUES (4, 'day_start_time', '9:00 AM', 'Day start time for meetings', '2025-06-01 12:46:46.275207', '2025-06-14 08:24:36.921501');
INSERT INTO public.system_settings VALUES (5, 'day_end_time', '5:00 PM', 'Day end time for meetings', '2025-06-01 12:46:46.276258', '2025-06-14 08:24:36.921501');
INSERT INTO public.system_settings VALUES (6, 'meeting_breaks', '[{"id": 1, "label": "Lunch Break", "startTime": "12:00 PM", "endTime": "1:00 PM"}]', 'Meeting breaks configuration (JSON)', '2025-06-01 12:46:46.277245', '2025-06-14 08:24:36.921501');
INSERT INTO public.system_settings VALUES (9, 'max_seller_attendees_per_day', '30', 'Maximum seller attendees per day', '2025-06-14 08:22:33.295575', '2025-06-14 08:24:36.921501');
INSERT INTO public.system_settings VALUES (10, 'max_buyer_meetings_per_day', '30', 'Maximum buyer meetings per day', '2025-06-14 08:22:33.297764', '2025-06-14 08:24:36.921501');
INSERT INTO public.system_settings VALUES (12, 'registration_open', 'true', 'Setting for registration_open', '2025-06-14 08:54:52.146758', '2025-06-14 08:56:41.43361');
INSERT INTO public.system_settings VALUES (11, 'travel_plans_enabled', 'true', 'Enable/disable travel plans functionality', '2025-06-14 08:50:28.690849', '2025-06-14 09:12:54.497721');
INSERT INTO public.system_settings VALUES (1, 'meetings_enabled', 'true', 'Enable or disable meeting requests functionality', '2025-06-01 12:41:58.83444', '2025-06-16 13:23:02.148471');


--
-- Data for Name: transport_types; Type: TABLE DATA; Schema: public; Owner: splash25user
--

INSERT INTO public.transport_types VALUES (4, 'Tavera', 'Tavera (4 Seater)', 4, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (5, 'Innova', 'Innova', 4, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (6, 'TT_14', 'Tempo Traveller (9 Seater)', 9, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (7, 'TT_17', 'Tempo Traveller (12 seater)', 12, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (8, 'Bus_24', 'Bus (20 seater)', 20, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (9, 'Bus_26', 'Bus (22 seater)', 22, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (10, 'Bus_35', 'Bus (35 seater)', 30, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (11, 'Bus_49', 'Bus (40 seater)', 40, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 13:19:21.379665');
INSERT INTO public.transport_types VALUES (12, 'Bullet', 'Enfield', 2, 'Balu', '9740090435', 5, '2025-06-21 13:42:35.293622', '2025-06-21 13:42:35.293625');
INSERT INTO public.transport_types VALUES (3, 'Sedan', 'Sedan (3 seater)', 4, NULL, NULL, 0, '2025-06-21 13:19:21.379665', '2025-06-21 16:23:35.202161');


--
-- Name: host_properties_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.host_properties_property_id_seq', 1, true);


--
-- Name: transport_types_transport_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: splash25user
--

SELECT pg_catalog.setval('public.transport_types_transport_type_id_seq', 12, true);


--
-- PostgreSQL database dump complete
--

