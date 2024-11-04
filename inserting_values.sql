--donor table
INSERT INTO Donor (name, gender, age, blood_group, contact_phone, contact_email, address, last_donation_date)
VALUES ('Aarav Sharma', 'M', 30, 'A+', '9876543210', 'aarav.sharma@example.com', 'Chennai, TN', TO_DATE('2024-01-15', 'YYYY-MM-DD'));

INSERT INTO Donor (name, gender, age, blood_group, contact_phone, contact_email, address, last_donation_date)
VALUES ('Ananya Iyer', 'F', 25, 'O+', '9876543211', 'ananya.iyer@example.com', 'Mumbai, MH', TO_DATE('2024-02-12', 'YYYY-MM-DD'));

INSERT INTO Donor (name, gender, age, blood_group, contact_phone, contact_email, address, last_donation_date)
VALUES ('Vivaan Rao', 'M', 22, 'B+', '9876543212', 'vivaan.rao@example.com', 'Bangalore, KA', TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Donor (name, gender, age, blood_group, contact_phone, contact_email, address, last_donation_date)
VALUES ('Diya Patel', 'F', 28, 'AB-', '9876543213', 'diya.patel@example.com', 'Ahmedabad, GJ', TO_DATE('2024-04-10', 'YYYY-MM-DD'));

INSERT INTO Donor (name, gender, age, blood_group, contact_phone, contact_email, address, last_donation_date)
VALUES ('Karan Singh', 'M', 35, 'O-', '9876543214', 'karan.singh@example.com', 'Delhi, DL', TO_DATE('2024-05-05', 'YYYY-MM-DD'));

INSERT INTO Donor (name, gender, age, blood_group, contact_phone, contact_email, address, last_donation_date)
VALUES ('Priya Reddy', 'F', 27, 'B-', '9876543215', 'priya.reddy@example.com', 'Hyderabad, TS', TO_DATE('2024-01-28', 'YYYY-MM-DD'));


--donation  table
INSERT INTO BloodDonation (donor_id, blood_group, donation_date, volume)
VALUES (1, 'A+', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 450);

INSERT INTO BloodDonation (donor_id, blood_group, donation_date, volume)
VALUES (2, 'O+', TO_DATE('2024-02-12', 'YYYY-MM-DD'), 500);

INSERT INTO BloodDonation (donor_id, blood_group, donation_date, volume)
VALUES (3, 'B+', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 350);

INSERT INTO BloodDonation (donor_id, blood_group, donation_date, volume)
VALUES (4, 'AB-', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 400);

INSERT INTO BloodDonation (donor_id, blood_group, donation_date, volume)
VALUES (5, 'O-', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 500);

INSERT INTO BloodDonation (donor_id, blood_group, donation_date, volume)
VALUES (6, 'B-', TO_DATE('2024-01-28', 'YYYY-MM-DD'), 300);


--inventory table
INSERT INTO BloodInventory (blood_group, units_available, expiry_date)
VALUES ('A+', 10, TO_DATE('2024-12-31', 'YYYY-MM-DD'));

INSERT INTO BloodInventory (blood_group, units_available, expiry_date)
VALUES ('O+', 15, TO_DATE('2024-11-30', 'YYYY-MM-DD'));

INSERT INTO BloodInventory (blood_group, units_available, expiry_date)
VALUES ('B+', 8, TO_DATE('2024-10-15', 'YYYY-MM-DD'));

INSERT INTO BloodInventory (blood_group, units_available, expiry_date)
VALUES ('AB-', 5, TO_DATE('2024-09-01', 'YYYY-MM-DD'));

INSERT INTO BloodInventory (blood_group, units_available, expiry_date)
VALUES ('O-', 12, TO_DATE('2024-08-15', 'YYYY-MM-DD'));

INSERT INTO BloodInventory (blood_group, units_available, expiry_date)
VALUES ('B-', 7, TO_DATE('2024-07-20', 'YYYY-MM-DD'));


--hospital table
INSERT INTO Hospital (name, address, contact_phone, contact_email)
VALUES ('Apollo Hospital', 'Chennai, TN', '04423456789', 'apollo.chennai@hospital.com');

INSERT INTO Hospital (name, address, contact_phone, contact_email)
VALUES ('Fortis Hospital', 'Mumbai, MH', '02234567890', 'fortis.mumbai@hospital.com');

INSERT INTO Hospital (name, address, contact_phone, contact_email)
VALUES ('Narayana Health', 'Bangalore, KA', '08045678901', 'narayana.bangalore@hospital.com');

INSERT INTO Hospital (name, address, contact_phone, contact_email)
VALUES ('Medanta Hospital', 'Delhi, DL', '01156789012', 'medanta.delhi@hospital.com');

INSERT INTO Hospital (name, address, contact_phone, contact_email)
VALUES ('Care Hospital', 'Hyderabad, TS', '04067890123', 'care.hyderabad@hospital.com');


--request table
INSERT INTO BloodRequest (hospital_id, blood_group, units_requested, request_date, fulfilled)
VALUES (1, 'A+', 5, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'N');

INSERT INTO BloodRequest (hospital_id, blood_group, units_requested, request_date, fulfilled)
VALUES (2, 'O+', 3, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Y');

INSERT INTO BloodRequest (hospital_id, blood_group, units_requested, request_date, fulfilled)
VALUES (3, 'B+', 4, TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'N');

INSERT INTO BloodRequest (hospital_id, blood_group, units_requested, request_date, fulfilled)
VALUES (4, 'AB-', 2, TO_DATE('2024-07-20', 'YYYY-MM-DD'), 'Y');

INSERT INTO BloodRequest (hospital_id, blood_group, units_requested, request_date, fulfilled)
VALUES (5, 'O-', 6, TO_DATE('2024-08-10', 'YYYY-MM-DD'), 'N');