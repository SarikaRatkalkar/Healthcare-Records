create database healthcare_records;
use healthcare_records;
create table patient (
    p_id int primary key,
    p_name varchar(100),
    p_dob date,
    p_gender varchar(10),
    p_number varchar(15)
);

insert into patient values
(1, 'rahul sharma', '1990-05-12', 'male', '9876543210'),
(2, 'priya verma', '1985-08-25', 'female', '9123456780'),
(3, 'amit singh', '1992-11-03', 'male', '9988776655'),
(4, 'neha patel', '1994-02-14', 'female', '9871234567'),
(5, 'arjun mehta', '1988-07-19', 'male', '9812345678'),
(6, 'anita desai', '1996-03-21', 'female', '9765432109'),
(7, 'vivek kumar', '1991-09-30', 'male', '9654321876'),
(8, 'kavita joshi', '1993-12-11', 'female', '9543216789'),
(9, 'rajat kapoor', '1987-04-09', 'male', '9432167890'),
(10, 'sneha nair', '1995-06-27', 'female', '9321654789');

create table doctor (
    d_id int primary key,
    d_name varchar(100),
    degree varchar(50),
    speciality varchar(50),
    years_of_experience int
);

insert into doctor values
(1, 'manoj reddy', 'mbbs, md', 'cardiology', 14),
(2, 'asha thakur', 'mbbs', 'dermatology', 9),
(3, 'ramesh iyer', 'mbbs, ms', 'orthopedics', 13),
(4, 'meera chhabra', 'mbbs, md', 'pediatrics', 7),
(5, 'sanjay bhatia', 'mbbs', 'general medicine', 16),
(6, 'naina khan', 'mbbs, md', 'gynecology', 11),
(7, 'rajeev joshi', 'mbbs, dm', 'neurology', 20),
(8, 'divya pillai', 'mbbs, md', 'psychiatry', 8),
(9, 'harish malik', 'mbbs, ms', 'surgery', 10),
(10, 'pooja aggarwal', 'mbbs', 'ent', 5);

create table insurance (
    p_id int,
    policy_number varchar(30) primary key,
    type varchar(50),
    amount decimal(10,2),
    exp_date date
);

alter table insurance
add foreign key (p_id) references patient(p_id);

insert into insurance values
(1, 'POL123456', 'health', 500000.00, '2026-12-31'),
(1, 'POL123466', 'life', 1000000.00, '2030-01-01'),
(2, 'POL123457', 'accident', 300000.00, '2025-11-30'),
(3, 'POL123458', 'health', 400000.00, '2027-01-15'),
(3, 'POL123467', 'life', 200000.00, '2025-12-31'),
(4, 'POL123459', 'health', 250000.00, '2025-06-30'),
(5, 'POL123460', 'accident', 350000.00, '2026-08-20'),
(6, 'POL123461', 'health', 600000.00, '2027-09-10'),
(6, 'POL123468', 'critical illness', 750000.00, '2028-05-15'),
(7, 'POL123462', 'accident', 200000.00, '2025-04-15'),
(8, 'POL123469', 'health', 480000.00, '2026-10-20'),
(9, 'POL123470', 'accident', 320000.00, '2025-09-15'),
(10, 'POL123471', 'critical illness', 550000.00, '2027-08-05');

create table medical_history (
    m_id int primary key,
    p_id int,
    diagnoses text,
    allergies text,
    medications text,
    old_treatments text,
    foreign key (p_id) references patient(p_id)
);

insert into medical_history (m_id, p_id, diagnoses, allergies, medications, old_treatments) values
(1, 1, 'hypertension', 'penicillin', 'amlodipine', 'blood pressure monitoring'),
(2, 1, 'high cholesterol', 'none', 'statins', 'diet control'),
(3, 2, 'diabetes type 2', 'none', 'metformin', 'diet and exercise'),
(4, 2, 'retinopathy', 'none', 'eye drops', 'laser therapy'),
(5, 3, 'asthma', 'dust', 'salbutamol inhaler', 'pulmonary function tests'),
(6, 3, 'allergic rhinitis', 'pollen', 'antihistamines', 'nasal sprays'),
(7, 4, 'eczema', 'pollen', 'hydrocortisone cream', 'allergy shots'),
(8, 4, 'psoriasis', 'none', 'topical steroids', 'phototherapy'),
(9, 5, 'arthritis', 'none', 'ibuprofen', 'physical therapy'),
(10, 5, 'osteoporosis', 'none', 'calcium supplements', 'bone density scans'),
(11, 6, 'anemia', 'none', 'iron supplements', 'blood transfusion'),
(12, 6, 'vitamin D deficiency', 'none', 'vitamin D tablets', 'sun exposure therapy'),
(13, 7, 'migraine', 'gluten', 'sumatriptan', 'pain management'),
(14, 7, 'tension headache', 'none', 'analgesics', 'stress reduction'),
(15, 8, 'hypothyroidism', 'none', 'levothyroxine', 'thyroid function tests'),
(16, 8, 'goiter', 'none', 'iodine supplements', 'surgical evaluation'),
(17, 9, 'depression', 'none', 'sertraline', 'cognitive behavioral therapy'),
(18, 9, 'anxiety', 'none', 'benzodiazepines', 'counseling'),
(19, 10, 'bronchitis', 'smoke', 'antibiotics', 'chest physiotherapy'),
(20, 10, 'chronic obstructive pulmonary disease', 'none', 'bronchodilators', 'oxygen therapy');

CREATE TABLE encounter_records (
    e_id INT PRIMARY KEY,
    p_id INT,
    d_id INT,
    appointments VARCHAR(255),
    reason VARCHAR(255),
    encounter_date DATE,
    FOREIGN KEY (p_id) REFERENCES patient(p_id),
    FOREIGN KEY (d_id) REFERENCES doctor(d_id)
);

INSERT INTO encounter_records (e_id, p_id, d_id, appointments, reason, encounter_date) VALUES
-- Patient 1 visits Doctor 1 and 5
(1, 1, 1, 'Cardiology Follow-up', 'Hypertension Management','2025-04-27'),
(2, 1, 5, 'General Checkup', 'Routine Health Screening','2025-01-3'),

-- Patient 2 visits Doctor 2 and 10
(3, 2, 2, 'Skin Rash Evaluation', 'Allergic Dermatitis', '2025-05-03'),
(4, 2, 10, 'ENT Consultation', 'Ear Infection', '2024-05-17'),

-- Patient 3 visits Doctor 3 and 5
(5, 3, 3, 'Joint Pain Checkup', 'Knee Arthritis', '2025-05-05'),
(6, 3, 5, 'Diabetes Review', 'Type 2 Diabetes Follow-up', '2024-05-19'),

-- Patient 4 visits Doctor 4 and 1
(7, 4, 4, 'Pediatric Fever', 'Seasonal Flu', '2025-05-17'),
(8, 4, 1, 'Heart Murmur Investigation', 'Congenital Heart Condition', '2024-10-21'),

-- Patient 5 visits Doctor 6 and 8
(9, 5, 2, 'Hair Growth Consultation', 'Hair Growth Issues', '2024-09-09'),
(10, 5, 8, 'Counseling Session', 'Anxiety Management', '2025-05-23'),

-- Patient 6 visits Doctor 7 and 9
(11, 6, 7, 'Neurology Checkup', 'Chronic Migraine', '2024-07-11'),
(12, 6, 9, 'Surgical Consultation', 'Gallbladder Stones', '2025-03-25'),

-- Patient 7 visits Doctor 2 and 4
(13, 7, 2, 'Skin Infection', 'Fungal Infection', '2025-05-13'),
(14, 7, 4, 'Vaccination Visit', 'Immunization', '2025-05-26'),

-- Patient 8 visits Doctor 3 and 7
(15, 8, 3, 'Back Pain Evaluation', 'Spinal Disc Issue', '2025-05-14'),
(16, 8, 7, 'Neurology Review', 'Nerve Compression', '2024-12-27'),

-- Patient 9 visits Doctor 9 and 6
(17, 9, 9, 'Surgery Prep', 'Appendix Surgery', '2025-05-16'),
(18, 9, 6, 'Post-op Gynecology', 'Post-surgical Checkup', '2025-05-28'),

-- Patient 10 visits Doctor 10 and 8
(19, 10, 10, 'ENT Checkup', 'Sinus Congestion', '2025-05-20'),
(20, 10, 8, 'Mental Health Evaluation', 'Mild Depression', '2025-05-30');

create table prescription (
    pres_no int primary key,
    e_id int,
    medication varchar(255),
    instructions text,
    dispensing_details varchar(255),
    date date,
    foreign key (e_id) references encounter_records(e_id)
);

INSERT INTO prescription (pres_no, e_id, medication, instructions, dispensing_details, date) VALUES
(1, 1, 'amlodipine', '5mg once daily', 'Main Pharmacy', '2025-04-27'), -- hypertension patient, cardiology doc
(2, 1, 'aspirin', '75mg once daily', 'Main Pharmacy', '2025-04-27'),

(3, 3, 'hydrocortisone cream', 'apply twice daily', 'Skin Clinic', '2025-05-03'), -- dermatology, hair growth treatment

(4, 6, 'metformin', '500mg twice daily', 'Hospital Pharmacy', '2024-05-19'), -- diabetes, orthopedics but patient has diabetes

(5, 8, 'salbutamol inhaler', '2 puffs as needed', 'Respiratory Dept', '2024-10-21'), -- asthma, cardiology but respiratory related

(6, 5, 'ibuprofen', '400mg every 8 hours', 'General Pharmacy', '2025-05-05'), -- arthritis, dermatologist for skin lesions but pain meds

(7, 2, 'iron supplements', '1 tablet daily with food', 'Hematology Pharmacy', '2025-01-03'), -- anemia, general medicine

(8, 11, 'sumatriptan', '50mg at onset of migraine', 'Neuro Pharmacy', '2024-07-11'), -- migraine, neurology

(9, 18, 'levothyroxine', '75mcg daily before breakfast', 'Endocrine Pharmacy', '2025-05-28'), -- thyroid issues, gynecology doc (also endocrine)

(10, 20, 'sertraline', '50mg daily', 'Psych Pharmacy', '2025-05-30'), -- depression, neurology

(11, 14, 'allergy shots', 'weekly for 4 weeks', 'Immunology Dept', '2025-05-26'), -- bronchitis, cardiology but general infection treatment

(12, 15, 'calcium supplements', '500mg daily', 'General Pharmacy', '2025-05-14'); -- joint pain, orthopedics

create table tests (
    t_id int primary key,
    e_id int,
    t_type varchar(50),
    t_name varchar(100),
    result varchar(100),
    date date,
    foreign key (e_id) references encounter_records(e_id)
);

INSERT INTO tests (t_id, e_id, t_type, t_name, result, date) VALUES
-- For e_id 1 (Hypertension Management)
(1, 1, 'Blood Test', 'Lipid Profile', 'High LDL', '2025-04-27'),
(2, 1, 'Imaging', 'ECG', 'Mild Abnormality', '2025-04-27'),

-- For e_id 3 (Allergic Dermatitis)
(3, 3, 'Allergy Test', 'Patch Test', 'Positive to Nickel', '2025-05-04'),

-- For e_id 5 (Knee Arthritis)
(4, 5, 'Imaging', 'Knee X-ray', 'Arthritic Changes', '2025-05-05'),

-- For e_id 6 (Type 2 Diabetes Follow-up)
(5, 6, 'Blood Test', 'HbA1c', '7.2%', '2024-05-19'),

-- For e_id 7 (Seasonal Flu)
(6, 7, 'Blood Test', 'CBC', 'Viral Infection Detected', '2025-05-17'),

-- For e_id 11 (Chronic Migraine)
(7, 11, 'Imaging', 'Brain MRI', 'No Abnormality Detected', '2024-07-12'),

-- For e_id 12 (Gallbladder Stones)
(8, 12, 'Imaging', 'Abdominal Ultrasound', 'Gallstones Present', '2025-03-25'),

-- For e_id 13 (Fungal Infection)
(9, 13, 'Skin Test', 'KOH Test', 'Fungal Elements Found', '2025-05-13'),

-- For e_id 15 (Spinal Disc Issue)
(10, 15, 'Imaging', 'Spine MRI', 'Disc Bulge at L4-L5', '2025-05-16'),

-- For e_id 17 (Appendix Surgery)
(11, 17, 'Imaging', 'Abdominal CT', 'Appendix Inflammation', '2025-05-16'),

-- For e_id 19 (Sinus Congestion)
(12, 19, 'Imaging', 'Sinus X-ray', 'Sinus Blockage Noted', '2025-05-20');

CREATE TABLE procedure_surgery (
    procedure_id INT PRIMARY KEY,
    e_id INT,
    s_date DATE,
    s_type VARCHAR(50),
    s_name VARCHAR(100),
    room VARCHAR(20),
    time TIME,
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (e_id) REFERENCES encounter_records(e_id)
);

INSERT INTO procedure_surgery (procedure_id, e_id, s_date, s_type, s_name, room, time, admission_date, discharge_date) VALUES
-- Appendix Surgery (based on e_id 17: 'Surgery Prep', 'Appendix Surgery')
(1, 17, '2025-05-17', 'General Surgery', 'Appendectomy', 'OR-1', '09:00:00', '2025-05-16', '2025-05-20'),

-- Gallbladder Stone Removal (e_id 12: Surgical Consultation, Gallbladder Stones)
(2, 12, '2025-03-26', 'Laparoscopic Surgery', 'Cholecystectomy', 'OR-2', '11:30:00', '2025-03-28', '2025-03-31'),

-- Knee Arthritis (e_id 5: Joint Pain Checkup, prescribed ibuprofen, ortho-related)
(3, 5, '2025-05-06', 'Orthopedic Surgery', 'Arthroscopic Knee Surgery', 'OR-5', '10:00:00', '2025-05-06', '2025-05-09'),

-- ENT-related procedure (e_id 4: Ear Infection, could need myringotomy)
(4, 4, '2024-05-18', 'ENT Surgery', 'Myringotomy', 'OR-ENT', '08:00:00', '2024-05-17', '2024-05-17'),

-- Gynecological Surgery (e_id 18: Post-op Gynecology, likely after prior procedure)
(5, 18, '2025-05-24', 'Gynecological Surgery', 'Cyst Removal', 'OR-3', '13:00:00', '2025-05-20', '2025-05-25'),

-- Spine Surgery (e_id 15: Back Pain Evaluation, Spinal Disc Issue)
(6, 15, '2025-05-15', 'Neurosurgery', 'Laminectomy', 'OR-6', '14:00:00', '2025-05-14', '2025-05-19'),

-- e_id 1: Cardiology Follow-up → May have had a stent placement earlier, now for a minor cardiac intervention
(7, 1, '2025-04-28', 'Cardiothoracic Surgery', 'Angioplasty with Stent', 'OR-Cardio', '08:30:00', '2025-04-28', '2025-04-30'),

-- e_id 11: Chronic Migraine under Neurology → Botox procedure for migraine relief
(8, 11, '2024-07-12', 'Neurological Procedure', 'Botox Injection for Migraine', 'DayCare-Neuro', '10:00:00', '2024-07-11', '2024-07-11'),

-- e_id 10: Counseling for Anxiety → Underwent Electroconvulsive Therapy (ECT)
(9, 10, '2025-05-24', 'Psychiatric Procedure', 'Electroconvulsive Therapy (ECT)', 'Psych-OR', '07:30:00', '2025-05-24', '2025-05-25'),

-- e_id 3: Allergic Dermatitis (skin condition) → Minor surgical excision of a suspicious mole
(10, 3, '2025-05-04', 'Dermatologic Surgery', 'Mole Excision', 'OR-Derm', '09:45:00', '2025-05-03', '2025-05-03');

use healthcare_records;

select * from doctor where d_id not in(select d_id from encounter_records);

select * from tests where date in (select date from prescription); 

select t_type, count(*) from tests group by t_type;

select p_name from patient 
where p_id = (select p_id from encounter_records where e_id = (select e_id from prescription where medication = 'metformin')
);

select s_type, count(*) from procedure_surgery where s_date>'2025-01-01' group by s_type ;

select d_id, count(distinct p_id) as patient_count from encounter_records
group by d_id
order by patient_count desc
limit 1;

select room, count(procedure_id) from procedure_surgery group by room having count(procedure_id)>1;

select p_id, count(*) as total_prescriptions from encounter_records
where e_id in (select e_id from prescription) group by p_id;

select prescription.pres_no, prescription.medication, prescription.instructions, 
       patient.p_name, encounter_records.encounter_date
from prescription
inner join encounter_records on prescription.e_id = encounter_records.e_id
inner join patient on encounter_records.p_id = patient.p_id;
