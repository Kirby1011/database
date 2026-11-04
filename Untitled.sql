CREATE TABLE `ROLE` (
  `role_id` int PRIMARY KEY AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(255)
);

CREATE TABLE `USER_ACCOUNT` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100),
  `last_name` varchar(100) NOT NULL,
  `phone_number` varchar(30),
  `house_street` varchar(255),
  `barangay` varchar(100),
  `city_municipality` varchar(100),
  `province` varchar(100),
  `account_status` varchar(30) NOT NULL,
  `email_verified_at` datetime,
  `created_at` datetime NOT NULL
);

CREATE TABLE `LOGIN_ATTEMPT` (
  `login_attempt_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `username_entered` varchar(100) NOT NULL,
  `attempted_at` datetime NOT NULL,
  `was_successful` boolean NOT NULL,
  `source_ip` varchar(45)
);

CREATE TABLE `USER_TOKEN` (
  `token_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token_type` varchar(30) NOT NULL,
  `token_hash` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `used_at` datetime,
  `revoked_at` datetime
);

CREATE TABLE `USER_DOCUMENT` (
  `document_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `document_number` varchar(150),
  `file_path` varchar(500) NOT NULL,
  `verification_status` varchar(30) NOT NULL,
  `submitted_at` datetime NOT NULL,
  `reviewed_by_user_id` int,
  `reviewed_at` datetime
);

CREATE TABLE `NOTIFICATION_LOG` (
  `notification_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `channel` varchar(20) NOT NULL,
  `subject` varchar(255),
  `message` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `sent_at` datetime
);

CREATE TABLE `AGENT` (
  `agent_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `agent_code` varchar(50) NOT NULL,
  `recruited_by_agent_id` int,
  `recruitment_date` date
);

CREATE TABLE `TEAM` (
  `team_id` int PRIMARY KEY AUTO_INCREMENT,
  `team_name` varchar(100) NOT NULL
);

CREATE TABLE `TEAM_MEMBERSHIP` (
  `team_membership_id` int PRIMARY KEY AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `membership_role` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date
);

CREATE TABLE `OWNER` (
  `owner_id` int PRIMARY KEY AUTO_INCREMENT,
  `owner_name` varchar(200) NOT NULL,
  `email` varchar(255),
  `phone_number` varchar(30),
  `address` varchar(500)
);

CREATE TABLE `PROPERTY_OWNER` (
  `property_owner_id` int PRIMARY KEY AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `ownership_percentage` decimal(5,2)
);

CREATE TABLE `DEVELOPER` (
  `developer_id` int PRIMARY KEY AUTO_INCREMENT,
  `developer_name` varchar(200) NOT NULL,
  `contact_person` varchar(150),
  `email` varchar(255),
  `phone_number` varchar(30),
  `address` varchar(500)
);

CREATE TABLE `PROJECT` (
  `project_id` int PRIMARY KEY AUTO_INCREMENT,
  `developer_id` int NOT NULL,
  `project_name` varchar(200) NOT NULL,
  `address` varchar(500)
);

CREATE TABLE `PROPERTY` (
  `property_id` int PRIMARY KEY AUTO_INCREMENT,
  `project_id` int,
  `model_name` varchar(150),
  `unit_name` varchar(100),
  `property_type` varchar(30) NOT NULL,
  `property_title` varchar(200) NOT NULL,
  `description` text,
  `street_address` varchar(255),
  `barangay` varchar(100),
  `city_municipality` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `list_price` decimal(14,2) NOT NULL,
  `lot_area` decimal(10,2),
  `floor_area` decimal(10,2),
  `bedrooms` int,
  `bathrooms` int,
  `parking_spaces` int,
  `floor_count` int,
  `floor_number` int,
  `listing_status` varchar(30) NOT NULL,
  `encoded_by_user_id` int NOT NULL,
  `assigned_agent_id` int,
  `created_at` datetime NOT NULL
);

CREATE TABLE `PROPERTY_FILE` (
  `file_id` int PRIMARY KEY AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `file_category` varchar(30) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `is_primary` boolean NOT NULL,
  `uploaded_by_user_id` int NOT NULL,
  `uploaded_at` datetime NOT NULL
);

CREATE TABLE `LISTING_AGREEMENT` (
  `listing_agreement_id` int PRIMARY KEY AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `agreement_number` varchar(50) NOT NULL,
  `agreement_type` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `expiry_date` date,
  `status` varchar(30) NOT NULL,
  `file_path` varchar(500),
  `signed_at` datetime,
  `created_by_user_id` int NOT NULL
);

CREATE TABLE `PROPERTY_APPROVAL_HISTORY` (
  `approval_id` int PRIMARY KEY AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `reviewed_by_user_id` int NOT NULL,
  `decision` varchar(30) NOT NULL,
  `remarks` varchar(500),
  `decided_at` datetime NOT NULL
);

CREATE TABLE `PROPERTY_STATUS_HISTORY` (
  `property_status_history_id` int PRIMARY KEY AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `previous_status` varchar(30),
  `new_status` varchar(30) NOT NULL,
  `changed_by_user_id` int NOT NULL,
  `changed_at` datetime NOT NULL,
  `remarks` varchar(500)
);

CREATE TABLE `BUYER` (
  `buyer_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `buyer_name` varchar(200) NOT NULL,
  `email` varchar(255),
  `phone_number` varchar(30),
  `address` varchar(500),
  `date_of_birth` date,
  `occupation` varchar(150)
);

CREATE TABLE `CLIENT_INQUIRY` (
  `inquiry_id` int PRIMARY KEY AUTO_INCREMENT,
  `buyer_id` int NOT NULL,
  `property_id` int,
  `assigned_agent_id` int,
  `inquiry_type` varchar(50),
  `message` text,
  `inquiry_status` varchar(30) NOT NULL,
  `inquiry_date` datetime NOT NULL
);

CREATE TABLE `PROPERTY_VIEWING` (
  `viewing_id` int PRIMARY KEY AUTO_INCREMENT,
  `inquiry_id` int NOT NULL,
  `property_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `viewing_status` varchar(30) NOT NULL,
  `notes` varchar(500),
  `created_at` datetime NOT NULL
);

CREATE TABLE `PROPERTY_OFFER` (
  `offer_id` int PRIMARY KEY AUTO_INCREMENT,
  `buyer_id` int NOT NULL,
  `property_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `offer_amount` decimal(14,2) NOT NULL,
  `offer_date` datetime NOT NULL,
  `status` varchar(30) NOT NULL,
  `remarks` varchar(500)
);

CREATE TABLE `PROPERTY_RESERVATION` (
  `reservation_id` int PRIMARY KEY AUTO_INCREMENT,
  `buyer_id` int NOT NULL,
  `property_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `recorded_by_user_id` int NOT NULL,
  `reservation_date` datetime NOT NULL,
  `expiry_date` datetime,
  `reservation_fee` decimal(14,2),
  `status` varchar(30) NOT NULL,
  `remarks` varchar(500)
);

CREATE TABLE `SALE` (
  `sale_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_no` varchar(50) NOT NULL,
  `agent_id` int NOT NULL,
  `recorded_by_user_id` int NOT NULL,
  `sale_date` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `remarks` varchar(500)
);

CREATE TABLE `SALE_BUYER` (
  `sale_buyer_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `buyer_id` int NOT NULL,
  `buyer_role` varchar(30),
  `ownership_percentage` decimal(5,2)
);

CREATE TABLE `SALE_PROPERTY` (
  `sale_property_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `property_id` int NOT NULL,
  `reservation_id` int,
  `selling_price` decimal(14,2) NOT NULL,
  `financing_type` varchar(50) NOT NULL,
  `down_payment_amount` decimal(14,2) NOT NULL,
  `annual_interest_rate` decimal(7,4),
  `payment_term_months` int,
  `first_due_date` date,
  `commission_rate_id` int,
  `agency_commission_amount` decimal(14,2)
);

CREATE TABLE `SALE_DOCUMENT` (
  `sale_document_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `document_version` int NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `verification_status` varchar(30) NOT NULL,
  `signed_by_name` varchar(200),
  `signed_at` datetime,
  `uploaded_by_user_id` int NOT NULL,
  `uploaded_at` datetime NOT NULL,
  `reviewed_by_user_id` int,
  `reviewed_at` datetime
);

CREATE TABLE `SALE_STATUS_HISTORY` (
  `sale_status_history_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `previous_status` varchar(30),
  `new_status` varchar(30) NOT NULL,
  `changed_by_user_id` int NOT NULL,
  `changed_at` datetime NOT NULL,
  `remarks` varchar(500)
);

CREATE TABLE `COMMISSION_RATE` (
  `commission_rate_id` int PRIMARY KEY AUTO_INCREMENT,
  `transaction_type` varchar(30) NOT NULL,
  `rate_percent` decimal(7,4),
  `fixed_amount` decimal(14,2),
  `effective_from` date NOT NULL,
  `effective_to` date
);

CREATE TABLE `COMMISSION_SHARE` (
  `commission_share_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_property_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `voucher_id` int,
  `share_type` varchar(30) NOT NULL,
  `share_amount` decimal(14,2) NOT NULL
);

CREATE TABLE `COMMISSION_RECEIPT` (
  `receipt_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `amount_received` decimal(14,2) NOT NULL,
  `received_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_number` varchar(150),
  `recorded_by_user_id` int NOT NULL,
  `is_void` boolean NOT NULL
);

CREATE TABLE `COMMISSION_RECEIPT_ALLOCATION` (
  `receipt_allocation_id` int PRIMARY KEY AUTO_INCREMENT,
  `receipt_id` int NOT NULL,
  `sale_property_id` int NOT NULL,
  `amount_allocated` decimal(14,2) NOT NULL
);

CREATE TABLE `COMMISSION_VOUCHER` (
  `voucher_id` int PRIMARY KEY AUTO_INCREMENT,
  `voucher_no` varchar(50) NOT NULL,
  `agent_id` int NOT NULL,
  `prepared_by_user_id` int NOT NULL,
  `voucher_date` date NOT NULL,
  `status` varchar(30) NOT NULL
);

CREATE TABLE `COMMISSION_PAYOUT` (
  `payout_id` int PRIMARY KEY AUTO_INCREMENT,
  `voucher_id` int NOT NULL,
  `amount_paid` decimal(14,2) NOT NULL,
  `deductions` decimal(14,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_number` varchar(150),
  `recorded_by_user_id` int NOT NULL,
  `is_void` boolean NOT NULL
);

CREATE TABLE `RECEIVABLE_SCHEDULE` (
  `schedule_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_property_id` int NOT NULL,
  `installment_number` int NOT NULL,
  `due_date` date NOT NULL,
  `amount_due` decimal(14,2) NOT NULL
);

CREATE TABLE `RECEIVABLE_PAYMENT` (
  `receivable_payment_id` int PRIMARY KEY AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `payment_date` date NOT NULL,
  `amount_paid` decimal(14,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_number` varchar(150),
  `recorded_by_user_id` int NOT NULL,
  `is_void` boolean NOT NULL
);

CREATE TABLE `RECEIVABLE_PAYMENT_ALLOCATION` (
  `allocation_id` int PRIMARY KEY AUTO_INCREMENT,
  `receivable_payment_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `amount_applied` decimal(14,2) NOT NULL
);

CREATE TABLE `AUDIT_LOG` (
  `audit_log_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `action` varchar(100) NOT NULL,
  `entity_name` varchar(100) NOT NULL,
  `entity_id` varchar(100),
  `details` text,
  `source_ip` varchar(45),
  `created_at` datetime NOT NULL
);

ALTER TABLE `USER_ACCOUNT` ADD FOREIGN KEY (`role_id`) REFERENCES `ROLE` (`role_id`);

ALTER TABLE `LOGIN_ATTEMPT` ADD FOREIGN KEY (`user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `USER_TOKEN` ADD FOREIGN KEY (`user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `USER_DOCUMENT` ADD FOREIGN KEY (`user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `USER_DOCUMENT` ADD FOREIGN KEY (`reviewed_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `NOTIFICATION_LOG` ADD FOREIGN KEY (`user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `AGENT` ADD FOREIGN KEY (`user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `AGENT` ADD FOREIGN KEY (`recruited_by_agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `TEAM_MEMBERSHIP` ADD FOREIGN KEY (`team_id`) REFERENCES `TEAM` (`team_id`);

ALTER TABLE `TEAM_MEMBERSHIP` ADD FOREIGN KEY (`agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `PROPERTY_OWNER` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `PROPERTY_OWNER` ADD FOREIGN KEY (`owner_id`) REFERENCES `OWNER` (`owner_id`);

ALTER TABLE `PROJECT` ADD FOREIGN KEY (`developer_id`) REFERENCES `DEVELOPER` (`developer_id`);

ALTER TABLE `PROPERTY` ADD FOREIGN KEY (`project_id`) REFERENCES `PROJECT` (`project_id`);

ALTER TABLE `PROPERTY` ADD FOREIGN KEY (`encoded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `PROPERTY` ADD FOREIGN KEY (`assigned_agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `PROPERTY_FILE` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `PROPERTY_FILE` ADD FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `LISTING_AGREEMENT` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `LISTING_AGREEMENT` ADD FOREIGN KEY (`created_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `PROPERTY_APPROVAL_HISTORY` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `PROPERTY_APPROVAL_HISTORY` ADD FOREIGN KEY (`reviewed_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `PROPERTY_STATUS_HISTORY` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `PROPERTY_STATUS_HISTORY` ADD FOREIGN KEY (`changed_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `BUYER` ADD FOREIGN KEY (`user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `CLIENT_INQUIRY` ADD FOREIGN KEY (`buyer_id`) REFERENCES `BUYER` (`buyer_id`);

ALTER TABLE `CLIENT_INQUIRY` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `CLIENT_INQUIRY` ADD FOREIGN KEY (`assigned_agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `PROPERTY_VIEWING` ADD FOREIGN KEY (`inquiry_id`) REFERENCES `CLIENT_INQUIRY` (`inquiry_id`);

ALTER TABLE `PROPERTY_VIEWING` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `PROPERTY_VIEWING` ADD FOREIGN KEY (`agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `PROPERTY_OFFER` ADD FOREIGN KEY (`buyer_id`) REFERENCES `BUYER` (`buyer_id`);

ALTER TABLE `PROPERTY_OFFER` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `PROPERTY_OFFER` ADD FOREIGN KEY (`agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `PROPERTY_RESERVATION` ADD FOREIGN KEY (`buyer_id`) REFERENCES `BUYER` (`buyer_id`);

ALTER TABLE `PROPERTY_RESERVATION` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `PROPERTY_RESERVATION` ADD FOREIGN KEY (`agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `PROPERTY_RESERVATION` ADD FOREIGN KEY (`recorded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `SALE` ADD FOREIGN KEY (`agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `SALE` ADD FOREIGN KEY (`recorded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `SALE_BUYER` ADD FOREIGN KEY (`sale_id`) REFERENCES `SALE` (`sale_id`);

ALTER TABLE `SALE_BUYER` ADD FOREIGN KEY (`buyer_id`) REFERENCES `BUYER` (`buyer_id`);

ALTER TABLE `SALE_PROPERTY` ADD FOREIGN KEY (`sale_id`) REFERENCES `SALE` (`sale_id`);

ALTER TABLE `SALE_PROPERTY` ADD FOREIGN KEY (`property_id`) REFERENCES `PROPERTY` (`property_id`);

ALTER TABLE `SALE_PROPERTY` ADD FOREIGN KEY (`reservation_id`) REFERENCES `PROPERTY_RESERVATION` (`reservation_id`);

ALTER TABLE `SALE_PROPERTY` ADD FOREIGN KEY (`commission_rate_id`) REFERENCES `COMMISSION_RATE` (`commission_rate_id`);

ALTER TABLE `SALE_DOCUMENT` ADD FOREIGN KEY (`sale_id`) REFERENCES `SALE` (`sale_id`);

ALTER TABLE `SALE_DOCUMENT` ADD FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `SALE_DOCUMENT` ADD FOREIGN KEY (`reviewed_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `SALE_STATUS_HISTORY` ADD FOREIGN KEY (`sale_id`) REFERENCES `SALE` (`sale_id`);

ALTER TABLE `SALE_STATUS_HISTORY` ADD FOREIGN KEY (`changed_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `COMMISSION_SHARE` ADD FOREIGN KEY (`sale_property_id`) REFERENCES `SALE_PROPERTY` (`sale_property_id`);

ALTER TABLE `COMMISSION_SHARE` ADD FOREIGN KEY (`agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `COMMISSION_SHARE` ADD FOREIGN KEY (`voucher_id`) REFERENCES `COMMISSION_VOUCHER` (`voucher_id`);

ALTER TABLE `COMMISSION_RECEIPT` ADD FOREIGN KEY (`sale_id`) REFERENCES `SALE` (`sale_id`);

ALTER TABLE `COMMISSION_RECEIPT` ADD FOREIGN KEY (`recorded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `COMMISSION_RECEIPT_ALLOCATION` ADD FOREIGN KEY (`receipt_id`) REFERENCES `COMMISSION_RECEIPT` (`receipt_id`);

ALTER TABLE `COMMISSION_RECEIPT_ALLOCATION` ADD FOREIGN KEY (`sale_property_id`) REFERENCES `SALE_PROPERTY` (`sale_property_id`);

ALTER TABLE `COMMISSION_VOUCHER` ADD FOREIGN KEY (`agent_id`) REFERENCES `AGENT` (`agent_id`);

ALTER TABLE `COMMISSION_VOUCHER` ADD FOREIGN KEY (`prepared_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `COMMISSION_PAYOUT` ADD FOREIGN KEY (`voucher_id`) REFERENCES `COMMISSION_VOUCHER` (`voucher_id`);

ALTER TABLE `COMMISSION_PAYOUT` ADD FOREIGN KEY (`recorded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `RECEIVABLE_PAYMENT` ADD FOREIGN KEY (`sale_id`) REFERENCES `SALE` (`sale_id`);

ALTER TABLE `RECEIVABLE_PAYMENT` ADD FOREIGN KEY (`recorded_by_user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);

ALTER TABLE `RECEIVABLE_SCHEDULE` ADD FOREIGN KEY (`sale_property_id`) REFERENCES `SALE_PROPERTY` (`sale_property_id`);

ALTER TABLE `RECEIVABLE_PAYMENT_ALLOCATION` ADD FOREIGN KEY (`receivable_payment_id`) REFERENCES `RECEIVABLE_PAYMENT` (`receivable_payment_id`);

ALTER TABLE `RECEIVABLE_PAYMENT_ALLOCATION` ADD FOREIGN KEY (`schedule_id`) REFERENCES `RECEIVABLE_SCHEDULE` (`schedule_id`);

ALTER TABLE `AUDIT_LOG` ADD FOREIGN KEY (`user_id`) REFERENCES `USER_ACCOUNT` (`user_id`);
