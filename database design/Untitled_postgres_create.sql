CREATE TABLE "user_login" (
	"id" serial(10) NOT NULL DEFAULT '0',
	"username" varchar(25) NOT NULL UNIQUE DEFAULT '0',
	"password" varchar(100) NOT NULL DEFAULT '0',
	"emailId" varchar(60) NOT NULL UNIQUE DEFAULT '0',
	"last_logged_in" DATETIME NOT NULL DEFAULT '0',
	"last_password_updated" DATETIME NOT NULL DEFAULT '0',
	"created_time" DATETIME NOT NULL DEFAULT '0',
	"updated_time" DATETIME NOT NULL DEFAULT '0',
	"status" integer NOT NULL DEFAULT '0',
	CONSTRAINT user_login_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_details" (
	"user_id" serial(10) NOT NULL,
	"username" varchar(25) NOT NULL UNIQUE,
	"first_name" varchar(25) NOT NULL,
	"middle_name" varchar(25) NOT NULL,
	"last_name" varchar(25) NOT NULL,
	"mobile_number" varchar(14) NOT NULL,
	"profile_pic_url" varchar(200) NOT NULL,
	"created_time" TIMESTAMP NOT NULL,
	"updated_time" TIMESTAMP NOT NULL,
	"status" integer NOT NULL,
	CONSTRAINT user_details_pk PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_follows" (
	"id" serial(10) NOT NULL,
	"follower" serial(10) NOT NULL,
	"follows" serial(10) NOT NULL,
	"from_date" serial NOT NULL,
	"created_time" TIMESTAMP NOT NULL,
	"updated_time" TIMESTAMP NOT NULL,
	"status" BOOLEAN NOT NULL,
	CONSTRAINT user_follows_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_posts" (
	"id" serial(10) NOT NULL,
	"post_title" varchar(100) NOT NULL,
	"post_description" varchar(2000) NOT NULL,
	"post_by" integer(10) NOT NULL,
	"posted_on" TIMESTAMP NOT NULL,
	"post_url" varchar NOT NULL,
	"has_attachment" BOOLEAN NOT NULL,
	"attachment_url" varchar NOT NULL,
	CONSTRAINT user_posts_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_likes" (
	"id" serial NOT NULL,
	"post_id" serial NOT NULL,
	"user_id" serial NOT NULL,
	"created_time" TIMESTAMP NOT NULL,
	"updated_time" TIMESTAMP NOT NULL,
	"status" BOOLEAN NOT NULL,
	CONSTRAINT user_likes_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_account_settings" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"enable_public_profile" BOOLEAN NOT NULL,
	"is_active" BOOLEAN NOT NULL,
	"is_deleted" BOOLEAN NOT NULL,
	"created_time" TIMESTAMP NOT NULL,
	"updated_time" TIMESTAMP NOT NULL,
	"status" BOOLEAN NOT NULL,
	CONSTRAINT user_account_settings_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_groups" (
	"id" serial NOT NULL,
	"group_name" serial(100) NOT NULL,
	"group_desc" serial(1000) NOT NULL,
	"created_time" serial NOT NULL,
	CONSTRAINT user_groups_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_group_members" (
	"id" serial NOT NULL,
	"group_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"joined_datetime" TIMESTAMP NOT NULL,
	"left" BOOLEAN NOT NULL,
	"left_time" TIMESTAMP NOT NULL,
	CONSTRAINT user_group_members_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "user_login" ADD CONSTRAINT "user_login_fk0" FOREIGN KEY ("username") REFERENCES "user_details"("username");


ALTER TABLE "user_follows" ADD CONSTRAINT "user_follows_fk0" FOREIGN KEY ("follower") REFERENCES "user_details"("user_id");
ALTER TABLE "user_follows" ADD CONSTRAINT "user_follows_fk1" FOREIGN KEY ("follows") REFERENCES "user_details"("user_id");

ALTER TABLE "user_posts" ADD CONSTRAINT "user_posts_fk0" FOREIGN KEY ("post_by") REFERENCES "user_details"("user_id");

ALTER TABLE "user_likes" ADD CONSTRAINT "user_likes_fk0" FOREIGN KEY ("post_id") REFERENCES "user_posts"("id");
ALTER TABLE "user_likes" ADD CONSTRAINT "user_likes_fk1" FOREIGN KEY ("user_id") REFERENCES "user_details"("user_id");

ALTER TABLE "user_account_settings" ADD CONSTRAINT "user_account_settings_fk0" FOREIGN KEY ("user_id") REFERENCES "user_details"("user_id");


ALTER TABLE "user_group_members" ADD CONSTRAINT "user_group_members_fk0" FOREIGN KEY ("group_id") REFERENCES "user_groups"("id");
ALTER TABLE "user_group_members" ADD CONSTRAINT "user_group_members_fk1" FOREIGN KEY ("user_id") REFERENCES "user_details"("user_id");

