CREATE TABLE user_login (
	id integer PRIMARY KEY AUTOINCREMENT,
	username varchar,
	password varchar,
	emailId varchar,
	last_logged_in datetime,
	last_password_updated datetime,
	created_time datetime,
	updated_time datetime,
	status integer
);

CREATE TABLE user_details (
	user_id integer PRIMARY KEY AUTOINCREMENT,
	username varchar,
	first_name varchar,
	middle_name varchar,
	last_name varchar,
	mobile_number varchar,
	profile_pic_url varchar,
	created_time timestamp,
	updated_time timestamp,
	status integer
);

CREATE TABLE user_follows (
	id integer PRIMARY KEY AUTOINCREMENT,
	follower integer PRIMARY KEY AUTOINCREMENT,
	follows integer PRIMARY KEY AUTOINCREMENT,
	from_date datetime PRIMARY KEY AUTOINCREMENT,
	created_time timestamp,
	updated_time timestamp,
	status boolean
);

CREATE TABLE user_posts (
	id integer PRIMARY KEY AUTOINCREMENT,
	post_title varchar,
	post_description varchar,
	post_by integer,
	posted_on timestamp,
	post_url varchar,
	has_attachment boolean,
	attachment_url varchar
);

CREATE TABLE user_likes (
	id integer PRIMARY KEY AUTOINCREMENT,
	post_id integer PRIMARY KEY AUTOINCREMENT,
	user_id integer PRIMARY KEY AUTOINCREMENT,
	created_time timestamp,
	updated_time timestamp,
	status boolean
);

CREATE TABLE user_account_settings (
	id integer PRIMARY KEY AUTOINCREMENT,
	user_id integer,
	enable_public_profile boolean,
	is_active boolean,
	is_deleted boolean,
	created_time timestamp,
	updated_time timestamp,
	status boolean
);

CREATE TABLE user_groups (
	id integer PRIMARY KEY AUTOINCREMENT,
	group_name varchar PRIMARY KEY AUTOINCREMENT,
	group_desc varchar PRIMARY KEY AUTOINCREMENT,
	created_time timestamp PRIMARY KEY AUTOINCREMENT
);

CREATE TABLE user_group_members (
	id binary PRIMARY KEY AUTOINCREMENT,
	group_id integer,
	user_id integer,
	joined_datetime timestamp,
	left boolean,
	left_time timestamp
);

