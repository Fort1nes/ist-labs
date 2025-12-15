CREATE TABLE IF NOT EXISTS "users" (
    "id" bigint NOT NULL UNIQUE,
    "full_name" varchar(255) NOT NULL,
    "post" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "password_hash" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "explorations" (
    "id" bigint NOT NULL UNIQUE,
    "type" varchar(255) NOT NULL,
    "created_at" varchar(255) NOT NULL,
    "oil_field" varchar(255) NOT NULL,
    "well" varchar(255) NOT NULL,
    "wellbore" varchar(255) NOT NULL,
    "cluster" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "document_package" (
    "id" bigint NOT NULL UNIQUE,
    "exploration_id" bigint NOT NULL,
    "filename" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL,
    "created_at" varchar(255) NOT NULL,
    "updated_at" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "document" (
    "id" bigint NOT NULL,
    "document_package_id" bigint NOT NULL,
    "filename" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL,
    "created_at" varchar(255) NOT NULL,
    "updated_at" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "verification_log" (
    "id" bigint NOT NULL UNIQUE,
    "document_package_id" bigint NOT NULL,
    "document_id" bigint NOT NULL,
    "created_at" varchar(255) NOT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "discrepancy" (
    "id" bigint NOT NULL UNIQUE,
    "log_id" bigint NOT NULL,
    "document_id" bigint NOT NULL,
    "field_name" varchar(255) NOT NULL,
    "value_document" varchar(255) NOT NULL,
    "value_description" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);
ALTER TABLE "document_package" ADD CONSTRAINT "document_package_fk1" FOREIGN KEY ("exploration_id") REFERENCES "explorations"("id");
ALTER TABLE "document" ADD CONSTRAINT "document_fk1" FOREIGN KEY ("document_package_id") REFERENCES "document_package"("id");
ALTER TABLE "verification_log" ADD CONSTRAINT "verification_log_fk1" FOREIGN KEY ("document_package_id") REFERENCES "document_package"("id");
ALTER TABLE "verification_log" ADD CONSTRAINT "verification_log_fk2" FOREIGN KEY ("document_id") REFERENCES "document"("id");
ALTER TABLE "verification_log" ADD CONSTRAINT "verification_log_fk4" FOREIGN KEY ("user_id") REFERENCES "users"("id");
ALTER TABLE "discrepancy" ADD CONSTRAINT "discrepancy_fk1" FOREIGN KEY ("log_id") REFERENCES "verification_log"("id");
ALTER TABLE "discrepancy" ADD CONSTRAINT "discrepancy_fk2" FOREIGN KEY ("document_id") REFERENCES "document"("id");
