-- EchoDesk V2: seed data for Sunrise Property Group / Sunrise at Tempe

-- ===== COMPANY & STAFF =====
INSERT INTO management_company (id, name, contact_email, contact_phone, timezone) VALUES
('10000000-0000-0000-0000-000000000001', 'Sunrise Property Group', 'ops@sunrisepg.com', '+16025550100', 'America/Phoenix');

INSERT INTO staff_user (id, company_id, full_name, email, phone, role) VALUES
('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 'Maria Delgado', 'maria@sunrisepg.com', '+16025550101', 'MANAGER'),
('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001', 'James Okafor', 'james@sunrisepg.com', '+16025550102', 'AGENT'),
('20000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000001', 'Tony Reyes', 'tony@sunrisepg.com', '+16025550103', 'MAINTENANCE'),
('20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000001', 'Priya Sharma', 'priya@sunrisepg.com', '+16025550104', 'ADMIN');

-- ===== PROPERTY & UNITS =====
INSERT INTO property (id, company_id, name, address_line1, city, state, zip, unit_count, office_hours) VALUES
('30000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 'Sunrise at Tempe', '1200 E Apache Blvd', 'Tempe', 'AZ', '85281', 10, 'Mon-Fri 9am-6pm, Sat 10am-4pm');

INSERT INTO unit (id, property_id, unit_number, bedrooms, bathrooms, sqft, market_rent, status, available_on) VALUES
('40000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', '101', 1, 1.0, 720,  1395.00, 'OCCUPIED', NULL),
('40000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', '102', 2, 2.0, 1050, 1795.00, 'OCCUPIED', NULL),
('40000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', '103', 1, 1.0, 720,  1425.00, 'VACANT', '2026-07-15'),
('40000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000001', '104', 2, 2.0, 1050, 1810.00, 'OCCUPIED', NULL),
('40000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000001', '201', 1, 1.0, 745,  1450.00, 'OCCUPIED', NULL),
('40000000-0000-0000-0000-000000000006', '30000000-0000-0000-0000-000000000001', '202', 3, 2.0, 1310, 2250.00, 'NOTICE', '2026-08-31'),
('40000000-0000-0000-0000-000000000007', '30000000-0000-0000-0000-000000000001', '203', 2, 2.0, 1080, 1825.00, 'OCCUPIED', NULL),
('40000000-0000-0000-0000-000000000008', '30000000-0000-0000-0000-000000000001', '204', 1, 1.0, 745,  1440.00, 'MAKE_READY', '2026-07-20'),
('40000000-0000-0000-0000-000000000009', '30000000-0000-0000-0000-000000000001', '301', 2, 2.0, 1080, 1850.00, 'OCCUPIED', NULL),
('40000000-0000-0000-0000-000000000010', '30000000-0000-0000-0000-000000000001', '302', 3, 2.5, 1350, 2325.00, 'VACANT', '2026-07-12');

-- ===== RESIDENTS & LEASES =====
INSERT INTO resident (id, unit_id, full_name, email, phone, status) VALUES
('50000000-0000-0000-0000-000000000001', '40000000-0000-0000-0000-000000000001', 'Alicia Fernandez', 'alicia.f@example.com', '+14805550201', 'CURRENT'),
('50000000-0000-0000-0000-000000000002', '40000000-0000-0000-0000-000000000002', 'Derek Hall', 'derek.h@example.com', '+14805550202', 'CURRENT'),
('50000000-0000-0000-0000-000000000003', '40000000-0000-0000-0000-000000000004', 'Mei Lin', 'mei.lin@example.com', '+14805550203', 'CURRENT'),
('50000000-0000-0000-0000-000000000004', '40000000-0000-0000-0000-000000000005', 'Sam Whitaker', 'sam.w@example.com', '+14805550204', 'CURRENT'),
('50000000-0000-0000-0000-000000000005', '40000000-0000-0000-0000-000000000006', 'Grace Adeyemi', 'grace.a@example.com', '+14805550205', 'NOTICE'),
('50000000-0000-0000-0000-000000000006', '40000000-0000-0000-0000-000000000007', 'Robert Kim', 'robert.k@example.com', '+14805550206', 'CURRENT'),
('50000000-0000-0000-0000-000000000007', '40000000-0000-0000-0000-000000000009', 'Dana Novak', 'dana.n@example.com', '+14805550207', 'CURRENT');

INSERT INTO lease (id, unit_id, resident_id, start_date, end_date, monthly_rent, deposit, status) VALUES
('60000000-0000-0000-0000-000000000001', '40000000-0000-0000-0000-000000000001', '50000000-0000-0000-0000-000000000001', '2025-09-01', '2026-08-31', 1350.00, 500.00, 'ACTIVE'),
('60000000-0000-0000-0000-000000000002', '40000000-0000-0000-0000-000000000002', '50000000-0000-0000-0000-000000000002', '2025-10-15', '2026-10-14', 1750.00, 600.00, 'ACTIVE'),
('60000000-0000-0000-0000-000000000003', '40000000-0000-0000-0000-000000000004', '50000000-0000-0000-0000-000000000003', '2025-08-01', '2026-07-31', 1780.00, 600.00, 'ACTIVE'),
('60000000-0000-0000-0000-000000000004', '40000000-0000-0000-0000-000000000005', '50000000-0000-0000-0000-000000000004', '2026-01-01', '2026-12-31', 1425.00, 500.00, 'ACTIVE'),
('60000000-0000-0000-0000-000000000005', '40000000-0000-0000-0000-000000000006', '50000000-0000-0000-0000-000000000005', '2025-09-01', '2026-08-31', 2200.00, 800.00, 'ACTIVE'),
('60000000-0000-0000-0000-000000000006', '40000000-0000-0000-0000-000000000007', '50000000-0000-0000-0000-000000000006', '2025-06-01', '2026-05-31', 1795.00, 600.00, 'MONTH_TO_MONTH'),
('60000000-0000-0000-0000-000000000007', '40000000-0000-0000-0000-000000000009', '50000000-0000-0000-0000-000000000007', '2025-11-01', '2026-10-31', 1820.00, 650.00, 'ACTIVE');

-- ===== PROSPECTS & TOURS =====
INSERT INTO prospect (id, property_id, full_name, email, phone, desired_beds, desired_move_in, max_budget, source, status) VALUES
('70000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 'Tyler Brooks', 'tyler.b@example.com', '+14805550301', 1, '2026-08-01', 1500.00, 'PHONE', 'TOUR_SCHEDULED'),
('70000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', 'Nina Castellanos', 'nina.c@example.com', '+14805550302', 2, '2026-07-20', 1900.00, 'PHONE', 'TOURED'),
('70000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', 'Jordan Avery', NULL, '+14805550303', 3, '2026-09-01', 2400.00, 'PHONE', 'NEW'),
('70000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000001', 'Fatima Noor', 'fatima.n@example.com', '+14805550304', 1, '2026-07-25', 1450.00, 'WEBSITE', 'CONTACTED'),
('70000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000001', 'Chris Dunlap', 'chris.d@example.com', '+14805550305', 2, '2026-08-15', 1850.00, 'PHONE', 'LOST');

INSERT INTO tour (id, prospect_id, property_id, unit_id, scheduled_at, tour_type, status) VALUES
('80000000-0000-0000-0000-000000000001', '70000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', '40000000-0000-0000-0000-000000000003', '2026-07-14 17:30:00+00', 'IN_PERSON', 'SCHEDULED'),
('80000000-0000-0000-0000-000000000002', '70000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', '40000000-0000-0000-0000-000000000010', '2026-07-08 20:00:00+00', 'IN_PERSON', 'COMPLETED'),
('80000000-0000-0000-0000-000000000003', '70000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000001', NULL, '2026-07-03 18:00:00+00', 'VIRTUAL', 'NO_SHOW');

-- ===== VOICE AGENTS (one per module) =====
INSERT INTO voice_agent (id, property_id, module, retell_agent_id, phone_number, voice_name, system_prompt, is_active) VALUES
('90000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 'LEASING',     NULL, NULL, 'nova', 'You are Sunny, the leasing assistant for Sunrise at Tempe. Answer availability and pricing questions, qualify prospects, and book tours.', TRUE),
('90000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', 'MAINTENANCE', NULL, NULL, 'nova', 'You are Sunny, the maintenance assistant. Triage requests, classify emergencies, capture permission to enter, and create work orders.', TRUE),
('90000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', 'RENEWALS',    NULL, NULL, 'nova', 'You are Sunny, the renewals assistant. Present renewal offers, answer questions about terms, and record accept or decline decisions.', TRUE),
('90000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000001', 'DELINQUENCY', NULL, NULL, 'nova', 'You are Sunny, the payments assistant. Discuss balances respectfully, capture promise-to-pay dates, and escalate disputes to staff.', TRUE),
('90000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000001', 'GENERAL',     NULL, NULL, 'nova', 'You are Sunny, the front desk assistant for Sunrise at Tempe. Answer general questions and route callers to the right module.', TRUE);

-- ===== CALLS (last ~10 days) =====
INSERT INTO call (id, property_id, voice_agent_id, resident_id, prospect_id, direction, caller_number, module, started_at, ended_at, duration_seconds, outcome, sentiment, summary) VALUES
('a0000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', NULL, '70000000-0000-0000-0000-000000000001', 'INBOUND', '+14805550301', 'LEASING',     '2026-07-10 16:02:00+00', '2026-07-10 16:07:40+00', 340, 'TOUR_BOOKED', 'POSITIVE', 'Prospect asked about 1BR availability under 1500. Qualified on budget and move-in date, booked in-person tour of unit 103 for July 14.'),
('a0000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000002', '50000000-0000-0000-0000-000000000003', NULL, 'INBOUND', '+14805550203', 'MAINTENANCE', '2026-07-10 03:15:00+00', '2026-07-10 03:21:10+00', 370, 'WORK_ORDER_CREATED', 'NEGATIVE', 'Resident in 104 reported AC not cooling, indoor temp 88F. Classified URGENT per Arizona heat policy, granted permission to enter, work order created.'),
('a0000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000005', NULL, NULL, 'INBOUND', '+16235550999', 'GENERAL',    '2026-07-09 19:45:00+00', '2026-07-09 19:47:05+00', 125, 'RESOLVED', 'NEUTRAL', 'Caller asked about office hours and package pickup location. Provided info, no follow-up needed.'),
('a0000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000003', '50000000-0000-0000-0000-000000000001', NULL, 'OUTBOUND', '+14805550201', 'RENEWALS',   '2026-07-09 17:30:00+00', '2026-07-09 17:36:20+00', 380, 'RENEWAL_ACCEPTED', 'POSITIVE', 'Presented renewal at 1395 for 12 months to resident in 101. Resident accepted verbally; offer marked accepted.'),
('a0000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000004', '50000000-0000-0000-0000-000000000006', NULL, 'OUTBOUND', '+14805550206', 'DELINQUENCY','2026-07-08 16:10:00+00', '2026-07-08 16:15:45+00', 345, 'PAYMENT_PROMISED', 'NEUTRAL', 'Resident in 203 is 9 days late on July rent. Cited a delayed paycheck; promised payment of 1795 by July 15. Promise recorded.'),
('a0000000-0000-0000-0000-000000000006', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', NULL, '70000000-0000-0000-0000-000000000002', 'INBOUND', '+14805550302', 'LEASING',    '2026-07-07 21:20:00+00', '2026-07-07 21:26:30+00', 390, 'TOUR_BOOKED', 'POSITIVE', 'Prospect wanted 2BR or 3BR with July move-in. Offered units 302 and 103; booked tour of 302 for July 8.'),
('a0000000-0000-0000-0000-000000000007', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000002', '50000000-0000-0000-0000-000000000004', NULL, 'INBOUND', '+14805550204', 'MAINTENANCE','2026-07-07 14:05:00+00', '2026-07-07 14:09:15+00', 255, 'WORK_ORDER_CREATED', 'NEUTRAL', 'Resident in 201 reported dripping kitchen faucet. Classified ROUTINE, permission to enter granted, work order created.'),
('a0000000-0000-0000-0000-000000000008', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000005', NULL, NULL, 'INBOUND', '+16025550777', 'GENERAL',    '2026-07-06 22:40:00+00', '2026-07-06 22:41:20+00', 80, 'HANGUP', NULL, 'Caller disconnected after greeting. No information captured.'),
('a0000000-0000-0000-0000-000000000009', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000004', '50000000-0000-0000-0000-000000000005', NULL, 'OUTBOUND', '+14805550205', 'DELINQUENCY','2026-07-05 17:00:00+00', '2026-07-05 17:08:30+00', 510, 'ESCALATED', 'NEGATIVE', 'Resident in 202 disputes a 150 late fee, states rent was paid on time via portal. Dispute escalated to property manager.'),
('a0000000-0000-0000-0000-000000000010', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000001', NULL, '70000000-0000-0000-0000-000000000003', 'INBOUND', '+14805550303', 'LEASING',    '2026-07-04 18:15:00+00', '2026-07-04 18:19:50+00', 290, 'RESOLVED', 'NEUTRAL', 'Prospect asked about 3BR pricing for September. Provided rates and amenities; prospect will call back to schedule a tour.'),
('a0000000-0000-0000-0000-000000000011', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000002', '50000000-0000-0000-0000-000000000002', NULL, 'INBOUND', '+14805550202', 'MAINTENANCE','2026-07-03 02:50:00+00', '2026-07-03 02:58:20+00', 500, 'ESCALATED', 'NEGATIVE', 'Resident in 102 reported water leaking from ceiling near light fixture. Classified EMERGENCY, escalated to on-call maintenance immediately.'),
('a0000000-0000-0000-0000-000000000012', '30000000-0000-0000-0000-000000000001', '90000000-0000-0000-0000-000000000003', '50000000-0000-0000-0000-000000000003', NULL, 'OUTBOUND', '+14805550203', 'RENEWALS',   '2026-07-02 16:30:00+00', '2026-07-02 16:35:10+00', 280, 'TRANSFERRED', 'NEUTRAL', 'Presented renewal at 1810 to resident in 104. Resident wants to negotiate; call transferred to leasing manager.');

-- ===== TRANSCRIPTS (2 sample calls) =====
INSERT INTO call_transcript_segment (call_id, seq, speaker, content, offset_ms) VALUES
('a0000000-0000-0000-0000-000000000001', 1, 'AGENT',  'Thanks for calling Sunrise at Tempe, this is Sunny. How can I help you today?', 0),
('a0000000-0000-0000-0000-000000000001', 2, 'CALLER', 'Hi, I am looking for a one bedroom, hopefully under fifteen hundred a month.', 4200),
('a0000000-0000-0000-0000-000000000001', 3, 'AGENT',  'Great news, unit 103 is a one bedroom at 1425 available July 15. When are you hoping to move in?', 11800),
('a0000000-0000-0000-0000-000000000001', 4, 'CALLER', 'Beginning of August would be perfect.', 19500),
('a0000000-0000-0000-0000-000000000001', 5, 'AGENT',  'That works. Would you like to tour it? I have Tuesday July 14 at 10:30 am open.', 24100),
('a0000000-0000-0000-0000-000000000001', 6, 'CALLER', 'Yes, Tuesday works. My name is Tyler Brooks.', 31000),
('a0000000-0000-0000-0000-000000000001', 7, 'AGENT',  'You are all set, Tyler. Tour of unit 103 on Tuesday July 14 at 10:30 am. See you then!', 36400),
('a0000000-0000-0000-0000-000000000002', 1, 'AGENT',  'Thanks for calling Sunrise at Tempe maintenance line, this is Sunny. What is going on?', 0),
('a0000000-0000-0000-0000-000000000002', 2, 'CALLER', 'My AC stopped cooling hours ago. It is 88 degrees in here.', 5100),
('a0000000-0000-0000-0000-000000000002', 3, 'AGENT',  'I am sorry, that is miserable in July. This qualifies as urgent under our heat policy. Which unit are you in?', 12000),
('a0000000-0000-0000-0000-000000000002', 4, 'CALLER', 'Unit 104. This is Mei Lin.', 20300),
('a0000000-0000-0000-0000-000000000002', 5, 'AGENT',  'Thank you Mei. Do we have your permission to enter if you are not home?', 24800),
('a0000000-0000-0000-0000-000000000002', 6, 'CALLER', 'Yes, please just fix it.', 30500),
('a0000000-0000-0000-0000-000000000002', 7, 'AGENT',  'Done. Urgent work order created, a technician will be out within four hours and you will get a text confirmation.', 34200);

-- ===== MODULE RECORDS =====
INSERT INTO maintenance_request (id, property_id, unit_id, resident_id, call_id, category, description, priority, permission_to_enter, status, created_at) VALUES
('b0000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', '40000000-0000-0000-0000-000000000004', '50000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000002', 'HVAC', 'AC not cooling, indoor temp 88F. Urgent per heat policy.', 'URGENT', TRUE, 'IN_PROGRESS', '2026-07-10 03:21:00+00'),
('b0000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', '40000000-0000-0000-0000-000000000005', '50000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000007', 'PLUMBING', 'Kitchen faucet dripping steadily.', 'ROUTINE', TRUE, 'SCHEDULED', '2026-07-07 14:09:00+00'),
('b0000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', '40000000-0000-0000-0000-000000000002', '50000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000011', 'PLUMBING', 'Water leaking from ceiling near light fixture. Emergency dispatch.', 'EMERGENCY', TRUE, 'COMPLETED', '2026-07-03 02:58:00+00');

INSERT INTO renewal_offer (id, lease_id, call_id, offered_rent, term_months, expires_on, status) VALUES
('c0000000-0000-0000-0000-000000000001', '60000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000004', 1395.00, 12, '2026-07-31', 'ACCEPTED'),
('c0000000-0000-0000-0000-000000000002', '60000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000012', 1810.00, 12, '2026-07-20', 'NEGOTIATING'),
('c0000000-0000-0000-0000-000000000003', '60000000-0000-0000-0000-000000000005', NULL, 2250.00, 12, '2026-07-25', 'SENT');

INSERT INTO delinquency_case (id, lease_id, call_id, amount_owed, days_late, promise_to_pay_on, promised_amount, status) VALUES
('d0000000-0000-0000-0000-000000000001', '60000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000005', 1795.00, 9, '2026-07-15', 1795.00, 'PROMISE_MADE'),
('d0000000-0000-0000-0000-000000000002', '60000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000009', 150.00, 12, NULL, NULL, 'OPEN');

INSERT INTO escalation_ticket (id, call_id, property_id, assigned_to, reason, notes, priority, status, created_at) VALUES
('e0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000009', '30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 'FEE_DISPUTE', 'Resident disputes 150 late fee, claims on-time portal payment. Verify payment records.', 'NORMAL', 'OPEN', '2026-07-05 17:09:00+00'),
('e0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000011', '30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000003', 'EMERGENCY_MAINTENANCE', 'Ceiling water leak near electrical fixture in unit 102. On-call dispatched.', 'CRITICAL', 'RESOLVED', '2026-07-03 02:59:00+00');

-- ===== CONFIG =====
INSERT INTO routing_rule (id, property_id, module, trigger_keyword, condition_json, action, transfer_target, priority, is_active) VALUES
('f0000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 'MAINTENANCE', 'gas leak',    '{"severity":"emergency"}', 'TRANSFER_TO_STAFF', '20000000-0000-0000-0000-000000000003', 1,  TRUE),
('f0000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', 'MAINTENANCE', 'flood',       '{"severity":"emergency"}', 'ESCALATE', NULL, 2,  TRUE),
('f0000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', 'DELINQUENCY', 'dispute',     '{"topic":"fee_dispute"}',  'ESCALATE', '20000000-0000-0000-0000-000000000001', 10, TRUE),
('f0000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000001', 'LEASING',     NULL,          '{"after_hours":true}',     'HANDLE_WITH_AI', NULL, 50, TRUE),
('f0000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000001', 'GENERAL',     'manager',     NULL,                       'TRANSFER_TO_STAFF', '20000000-0000-0000-0000-000000000001', 20, TRUE);

INSERT INTO knowledge_article (id, property_id, module, title, content, is_published) VALUES
('11000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 'GENERAL',     'Office hours and location', 'The leasing office is open Mon-Fri 9am-6pm and Sat 10am-4pm. Located at the main entrance on Apache Blvd. Packages are held at the office for 7 days.', TRUE),
('11000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', 'LEASING',     'Pet policy', 'Cats and dogs welcome, max 2 pets. 300 pet deposit plus 35 monthly pet rent per pet. Breed restrictions apply for dogs over 50 lbs.', TRUE),
('11000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', 'MAINTENANCE', 'AC and heat emergency policy', 'From May through September, AC outages are classified URGENT with a 4-hour response target when indoor temperature exceeds 85F.', TRUE),
('11000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000001', 'DELINQUENCY', 'Late fee schedule', 'Rent is due on the 1st with a grace period through the 3rd. A 75 late fee applies on the 4th and an additional 75 on the 10th.', TRUE),
('11000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000001', 'RENEWALS',    'Renewal offer window', 'Renewal offers are sent 90 days before lease end and expire 30 days after issue. Month-to-month carries a 150 premium.', TRUE);