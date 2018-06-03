CREATE TABLE "user_login" (
	"id" INT,
	"username" varchar,
	"password" varchar,
	"emailId" varchar,
	"last_logged_in" DATETIME,
	"last_password_updated" DATETIME,
	"created_time" DATETIME,
	"updated_time" DATETIME,
	"status" INT,
	constraint USER_LOGIN_PK PRIMARY KEY ("id")
CREATE sequence "USER_LOGIN_SEQ"
/
CREATE trigger "BI_USER_LOGIN"
  before insert on "USER_LOGIN"
  for each row
begin
  select "USER_LOGIN_SEQ".nextval into :NEW."id" from dual;
end;
/

)
/
CREATE TABLE "user_details" (
	"user_id" INT,
	"username" varchar,
	"first_name" varchar,
	"middle_name" varchar,
	"last_name" varchar,
	"mobile_number" varchar,
	"profile_pic_url" varchar,
	"created_time" TIMESTAMP,
	"updated_time" TIMESTAMP,
	"status" INT,
	constraint USER_DETAILS_PK PRIMARY KEY ("user_id")
CREATE sequence "USER_DETAILS_SEQ"
/
CREATE trigger "BI_USER_DETAILS"
  before insert on "USER_DETAILS"
  for each row
begin
  select "USER_DETAILS_SEQ".nextval into :NEW."user_id" from dual;
end;
/

)
/
CREATE TABLE "user_follows" (
	"id" INT,
	"follower" INT,
	"follows" INT,
	"from_date" DATETIME,
	"created_time" TIMESTAMP,
	"updated_time" TIMESTAMP,
	"status" BOOLEAN,
	constraint USER_FOLLOWS_PK PRIMARY KEY ("id")
CREATE sequence "USER_FOLLOWS_SEQ"
/
CREATE trigger "BI_USER_FOLLOWS"
  before insert on "USER_FOLLOWS"
  for each row
begin
  select "USER_FOLLOWS_SEQ".nextval into :NEW."id" from dual;
end;
/

)
/
CREATE TABLE "user_posts" (
	"id" INT,
	"post_title" varchar,
	"post_description" varchar,
	"post_by" INT,
	"posted_on" TIMESTAMP,
	"post_url" varchar,
	"has_attachment" BOOLEAN,
	"attachment_url" varchar,
	constraint USER_POSTS_PK PRIMARY KEY ("id")
CREATE sequence "USER_POSTS_SEQ"
/
CREATE trigger "BI_USER_POSTS"
  before insert on "USER_POSTS"
  for each row
begin
  select "USER_POSTS_SEQ".nextval into :NEW."id" from dual;
end;
/

)
/
CREATE TABLE "user_likes" (
	"id" INT,
	"post_id" INT,
	"user_id" INT,
	"created_time" TIMESTAMP,
	"updated_time" TIMESTAMP,
	"status" BOOLEAN,
	constraint USER_LIKES_PK PRIMARY KEY ("id")
CREATE sequence "USER_LIKES_SEQ"
/
CREATE trigger "BI_USER_LIKES"
  before insert on "USER_LIKES"
  for each row
begin
  select "USER_LIKES_SEQ".nextval into :NEW."id" from dual;
end;
/

)
/
CREATE TABLE "user_account_settings" (
	"id" INT,
	"user_id" INT,
	"enable_public_profile" BOOLEAN,
	"is_active" BOOLEAN,
	"is_deleted" BOOLEAN,
	"created_time" TIMESTAMP,
	"updated_time" TIMESTAMP,
	"status" BOOLEAN,
	constraint USER_ACCOUNT_SETTINGS_PK PRIMARY KEY ("id")
CREATE sequence "USER_ACCOUNT_SETTINGS_SEQ"
/
CREATE trigger "BI_USER_ACCOUNT_SETTINGS"
  before insert on "USER_ACCOUNT_SETTINGS"
  for each row
begin
  select "USER_ACCOUNT_SETTINGS_SEQ".nextval into :NEW."id" from dual;
end;
/

)
/
CREATE TABLE "user_groups" (
	"id" INT,
	"group_name" varchar,
	"group_desc" varchar,
	"created_time" TIMESTAMP,
	constraint USER_GROUPS_PK PRIMARY KEY ("id")
CREATE sequence "USER_GROUPS_SEQ"
/
CREATE trigger "BI_USER_GROUPS"
  before insert on "USER_GROUPS"
  for each row
begin
  select "USER_GROUPS_SEQ".nextval into :NEW."id" from dual;
end;
/

)
/
CREATE TABLE "user_group_members" (
	"id" BINARY,
	"group_id" INT,
	"user_id" INT,
	"joined_datetime" TIMESTAMP,
	"left" BOOLEAN,
	"left_time" TIMESTAMP,
	constraint USER_GROUP_MEMBERS_PK PRIMARY KEY ("id")
CREATE sequence "USER_GROUP_MEMBERS_SEQ"
/
CREATE trigger "BI_USER_GROUP_MEMBERS"
  before insert on "USER_GROUP_MEMBERS"
  for each row
begin
  select "USER_GROUP_MEMBERS_SEQ".nextval into :NEW."id" from dual;
end;
/

)
/
ALTER TABLE "user_login" ADD CONSTRAINT "user_login_fk0" FOREIGN KEY ("username") REFERENCES user_details("username");


ALTER TABLE "user_follows" ADD CONSTRAINT "user_follows_fk0" FOREIGN KEY ("follower") REFERENCES user_details("user_id");
ALTER TABLE "user_follows" ADD CONSTRAINT "user_follows_fk1" FOREIGN KEY ("follows") REFERENCES user_details("user_id");

ALTER TABLE "user_posts" ADD CONSTRAINT "user_posts_fk0" FOREIGN KEY ("post_by") REFERENCES user_details("user_id");

ALTER TABLE "user_likes" ADD CONSTRAINT "user_likes_fk0" FOREIGN KEY ("post_id") REFERENCES user_posts("id");
ALTER TABLE "user_likes" ADD CONSTRAINT "user_likes_fk1" FOREIGN KEY ("user_id") REFERENCES user_details("user_id");

ALTER TABLE "user_account_settings" ADD CONSTRAINT "user_account_settings_fk0" FOREIGN KEY ("user_id") REFERENCES user_details("user_id");


ALTER TABLE "user_group_members" ADD CONSTRAINT "user_group_members_fk0" FOREIGN KEY ("group_id") REFERENCES user_groups("id");
ALTER TABLE "user_group_members" ADD CONSTRAINT "user_group_members_fk1" FOREIGN KEY ("user_id") REFERENCES user_details("user_id");

