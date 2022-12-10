CREATE TABLE "user" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar,
  "last_name" varchar,
  "second_name" varchar,
  "role_id" integer
);

CREATE TABLE "role" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "student" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" integer,
  "student_group" integer
);

CREATE TABLE "student_group" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "teacher" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "course" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar,
  "permission_id" integer,
  "owner_id" integer
);

CREATE TABLE "video_course" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_id" integer,
  "video_id" integer,
  "video_number" integer
);

CREATE TABLE "video" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "storage" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "video_id" integer,
  "hash_dir" varchar,
  "hash_name" varchar
);

CREATE TABLE "permission" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "course_access" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_id" integer,
  "student_group_id" integer
);

ALTER TABLE "user" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "student" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "student" ADD FOREIGN KEY ("student_group") REFERENCES "student_group" ("id");

ALTER TABLE "teacher" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("permission_id") REFERENCES "permission" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("owner_id") REFERENCES "user" ("id");

ALTER TABLE "video_course" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("id");

ALTER TABLE "video_course" ADD FOREIGN KEY ("video_id") REFERENCES "video" ("id");

ALTER TABLE "storage" ADD FOREIGN KEY ("video_id") REFERENCES "video" ("id");

ALTER TABLE "course_access" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("id");

ALTER TABLE "course_access" ADD FOREIGN KEY ("student_group_id") REFERENCES "student_group" ("id");