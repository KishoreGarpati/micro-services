CREATE TABLE `user_login` (
	`id` INT(10) NOT NULL AUTO_INCREMENT DEFAULT '0',
	`username` varchar(25) NOT NULL UNIQUE DEFAULT '0',
	`password` varchar(100) NOT NULL DEFAULT '0',
	`emailId` varchar(60) NOT NULL UNIQUE DEFAULT '0',
	`last_logged_in` DATETIME NOT NULL DEFAULT '0',
	`last_password_updated` DATETIME NOT NULL DEFAULT '0',
	`created_time` DATETIME NOT NULL DEFAULT '0',
	`updated_time` DATETIME NOT NULL DEFAULT '0',
	`status` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_details` (
	`user_id` INT(10) NOT NULL AUTO_INCREMENT,
	`username` varchar(25) NOT NULL UNIQUE,
	`first_name` varchar(25) NOT NULL,
	`middle_name` varchar(25) NOT NULL,
	`last_name` varchar(25) NOT NULL,
	`mobile_number` varchar(14) NOT NULL,
	`profile_pic_url` varchar(200) NOT NULL,
	`created_time` TIMESTAMP NOT NULL,
	`updated_time` TIMESTAMP NOT NULL,
	`status` INT NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `user_follows` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`follower` INT(10) NOT NULL AUTO_INCREMENT,
	`follows` INT(10) NOT NULL AUTO_INCREMENT,
	`from_date` DATETIME NOT NULL AUTO_INCREMENT,
	`created_time` TIMESTAMP NOT NULL,
	`updated_time` TIMESTAMP NOT NULL,
	`status` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_posts` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`post_title` varchar(100) NOT NULL,
	`post_description` varchar(2000) NOT NULL,
	`post_by` INT(10) NOT NULL,
	`posted_on` TIMESTAMP NOT NULL,
	`post_url` varchar NOT NULL,
	`has_attachment` BOOLEAN NOT NULL,
	`attachment_url` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_likes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`post_id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`created_time` TIMESTAMP NOT NULL,
	`updated_time` TIMESTAMP NOT NULL,
	`status` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_account_settings` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`enable_public_profile` BOOLEAN NOT NULL,
	`is_active` BOOLEAN NOT NULL,
	`is_deleted` BOOLEAN NOT NULL,
	`created_time` TIMESTAMP NOT NULL,
	`updated_time` TIMESTAMP NOT NULL,
	`status` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_groups` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`group_name` varchar(100) NOT NULL AUTO_INCREMENT,
	`group_desc` varchar(1000) NOT NULL AUTO_INCREMENT,
	`created_time` TIMESTAMP NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_group_members` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`group_id` INT NOT NULL,
	`user_id` INT NOT NULL,
	`joined_datetime` TIMESTAMP NOT NULL,
	`left` BOOLEAN NOT NULL,
	`left_time` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `user_login` ADD CONSTRAINT `user_login_fk0` FOREIGN KEY (`username`) REFERENCES `user_details`(`username`);

ALTER TABLE `user_follows` ADD CONSTRAINT `user_follows_fk0` FOREIGN KEY (`follower`) REFERENCES `user_details`(`user_id`);

ALTER TABLE `user_follows` ADD CONSTRAINT `user_follows_fk1` FOREIGN KEY (`follows`) REFERENCES `user_details`(`user_id`);

ALTER TABLE `user_posts` ADD CONSTRAINT `user_posts_fk0` FOREIGN KEY (`post_by`) REFERENCES `user_details`(`user_id`);

ALTER TABLE `user_likes` ADD CONSTRAINT `user_likes_fk0` FOREIGN KEY (`post_id`) REFERENCES `user_posts`(`id`);

ALTER TABLE `user_likes` ADD CONSTRAINT `user_likes_fk1` FOREIGN KEY (`user_id`) REFERENCES `user_details`(`user_id`);

ALTER TABLE `user_account_settings` ADD CONSTRAINT `user_account_settings_fk0` FOREIGN KEY (`user_id`) REFERENCES `user_details`(`user_id`);

ALTER TABLE `user_group_members` ADD CONSTRAINT `user_group_members_fk0` FOREIGN KEY (`group_id`) REFERENCES `user_groups`(`id`);

ALTER TABLE `user_group_members` ADD CONSTRAINT `user_group_members_fk1` FOREIGN KEY (`user_id`) REFERENCES `user_details`(`user_id`);

