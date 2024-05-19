create database thanuja;
use thanuja;
CREATE TABLE regions (
    region_id VARCHAR(10) PRIMARY KEY,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);
CREATE TABLE countries (
    country_cd VARCHAR(10) PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    region_id VARCHAR(10),
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
CREATE TABLE departments (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);
CREATE TABLE job_types (
    job_type_cd VARCHAR(10) PRIMARY KEY,
    job_type_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
); 
CREATE TABLE job_status_codes (
    job_status_cd VARCHAR(10) PRIMARY KEY,
    status_cd VARCHAR(10) NOT NULL,
    status_desc VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);
CREATE TABLE appl_status_codes (
    appl_status_cd VARCHAR(10) PRIMARY KEY,
    status_desc VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
); 
CREATE TABLE education_levels (
    edu_level_cd VARCHAR(10) PRIMARY KEY,
    edu_level_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
); 
CREATE TABLE education_type (
    edu_type_cd VARCHAR(10) PRIMARY KEY,
    edu_type_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);
CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    job_desc VARCHAR(4000),
    job_type_cd VARCHAR(10),
    dept_id VARCHAR(10),
    job_status_cd VARCHAR(10),
    country_cd VARCHAR(10),
    date_opened DATE,
    date_closed DATE,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    FOREIGN KEY (job_type_cd) REFERENCES job_types(job_type_cd),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (job_status_cd) REFERENCES job_status_codes(job_status_cd),
    FOREIGN KEY (country_cd) REFERENCES countries(country_cd)
);
CREATE TABLE applicants (
    appl_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_num VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(20),
    country_cd VARCHAR(10),
    appl_status_cd VARCHAR(10),
    edu_level_cd VARCHAR(10),
    edu_type_cd VARCHAR(10),
    resume_file_name VARCHAR(200),
    cover_letter_text VARCHAR(4000),
    date_applied DATE,
    employed_flag CHAR(1),
    current_employer_name VARCHAR(100),
    years_of_exp DECIMAL(5, 2),
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    FOREIGN KEY (country_cd) REFERENCES countries(country_cd),
    FOREIGN KEY (appl_status_cd) REFERENCES appl_status_codes(appl_status_cd),
    FOREIGN KEY (edu_level_cd) REFERENCES education_levels(edu_level_cd),
    FOREIGN KEY (edu_type_cd) REFERENCES education_type(edu_type_cd)
);
CREATE TABLE applicant_jobs (
    appl_id INT,
    job_id INT,
    appl_status_cd VARCHAR(10),
    date_applied DATE,
    written_test_date DATE,
    interview1_date DATE,
    interview2_date DATE,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    PRIMARY KEY (appl_id, job_id),
    FOREIGN KEY (appl_id) REFERENCES applicants(appl_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (appl_status_cd) REFERENCES appl_status_codes(appl_status_cd)
); 
INSERT INTO regions (region_id, last_update_date, last_updated_by) VALUES 
('EU', CURRENT_TIMESTAMP, 'system'), 
('NA', CURRENT_TIMESTAMP, 'system');
INSERT INTO countries (country_cd, country_name, region_id, last_update_date, last_updated_by) VALUES 
('US', 'United States', 'NA', CURRENT_TIMESTAMP, 'system'), 
('CA', 'Canada', 'NA', CURRENT_TIMESTAMP, 'system'),
('DE', 'Germany', 'EU', CURRENT_TIMESTAMP, 'system'), 
('FR', 'France', 'EU', CURRENT_TIMESTAMP, 'system');
INSERT INTO job_types (job_type_cd, job_type_name, last_update_date, last_updated_by) VALUES 
('ITMGR', 'IT Manager', CURRENT_TIMESTAMP, 'system'), 
('HRMGR', 'HR Manager', CURRENT_TIMESTAMP, 'system'),
('DEV', 'Developer', CURRENT_TIMESTAMP, 'system'),
('HRASS', 'HR Assistant', CURRENT_TIMESTAMP, 'system'),
('SALESMGR', 'Sales Manager', CURRENT_TIMESTAMP, 'system'); 
INSERT INTO job_status_codes (job_status_cd, status_cd, status_desc, last_update_date, last_updated_by) VALUES 
('OPEN', 'OPN', 'Open', CURRENT_TIMESTAMP, 'system'), 
('CLOSED', 'CLSD', 'Closed', CURRENT_TIMESTAMP, 'system'),
('PENDING', 'PEND', 'Pending', CURRENT_TIMESTAMP, 'system'); 
INSERT INTO appl_status_codes (appl_status_cd, status_desc, last_update_date, last_updated_by) VALUES 
('PEND', 'Pending', CURRENT_TIMESTAMP, 'system'), 
('REJ', 'Rejected', CURRENT_TIMESTAMP, 'system'),
('PASS_WR', 'Passed Written Test', CURRENT_TIMESTAMP, 'system'), 
('PASS_I1', 'Passed Interview 1', CURRENT_TIMESTAMP, 'system'),
('SHLIST', 'Short Listed', CURRENT_TIMESTAMP, 'system'), 
('SEL', 'Selected', CURRENT_TIMESTAMP, 'system'); 
INSERT INTO education_levels (edu_level_cd, edu_level_name, last_update_date, last_updated_by) VALUES 
('HS', 'High School', CURRENT_TIMESTAMP, 'system'), 
('GRAD', 'Graduate', CURRENT_TIMESTAMP, 'system'),
('POSTGRAD', 'Post Graduate', CURRENT_TIMESTAMP, 'system'), 
('PHD', 'Doctorate/PhD', CURRENT_TIMESTAMP, 'system'); 
INSERT INTO education_type (edu_type_cd, edu_type_name, last_update_date, last_updated_by) VALUES 
('CIVENG', 'Civil Engineering', CURRENT_TIMESTAMP, 'system'), 
('COMPENG', 'Computer Engineering', CURRENT_TIMESTAMP, 'system'),
('BUSADM', 'Business Administration', CURRENT_TIMESTAMP, 'system'), 
('ECON', 'Economics', CURRENT_TIMESTAMP, 'system'),
('GEN', 'General', CURRENT_TIMESTAMP, 'system');


