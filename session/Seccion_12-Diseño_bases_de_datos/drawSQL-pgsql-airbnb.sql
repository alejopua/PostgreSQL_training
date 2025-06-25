CREATE TABLE "users"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "email_verified_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "password" VARCHAR(255) NOT NULL,
    "remember_token" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "phone_number" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "profile_image" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_email_unique" UNIQUE("email");
CREATE TABLE "rooms"(
    "id" INTEGER NOT NULL,
    "home_type" VARCHAR(255) NOT NULL,
    "room_type" VARCHAR(255) NOT NULL,
    "total_occupancy" INTEGER NOT NULL,
    "total_bedrooms" INTEGER NOT NULL,
    "total_bathrooms" INTEGER NOT NULL,
    "summary" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "has_tv" BOOLEAN NOT NULL,
    "has_kitchen" BOOLEAN NOT NULL,
    "has_air_con" BOOLEAN NOT NULL,
    "has_heating" BOOLEAN NOT NULL,
    "has_internet" BOOLEAN NOT NULL,
    "price" INTEGER NOT NULL,
    "published_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "owner_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "latitude" FLOAT(53) NOT NULL,
    "longitude" FLOAT(53) NOT NULL
);
ALTER TABLE
    "rooms" ADD PRIMARY KEY("id");
CREATE TABLE "reservations"(
    "id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "room_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "end_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "price" INTEGER NOT NULL,
    "total" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "reservations" ADD PRIMARY KEY("id");
CREATE TABLE "media"(
    "id" INTEGER NOT NULL,
    "model_id" INTEGER NOT NULL,
    "model_type" VARCHAR(255) NOT NULL,
    "file_name" VARCHAR(255) NOT NULL,
    "mime_type" VARCHAR(255) NULL
);
ALTER TABLE
    "media" ADD PRIMARY KEY("id");
CREATE TABLE "reviews"(
    "id" INTEGER NOT NULL,
    "reservation_id" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "reviews" ADD PRIMARY KEY("id");
ALTER TABLE
    "reviews" ADD CONSTRAINT "reviews_reservation_id_foreign" FOREIGN KEY("reservation_id") REFERENCES "reservations"("id");
ALTER TABLE
    "media" ADD CONSTRAINT "media_model_id_foreign" FOREIGN KEY("model_id") REFERENCES "rooms"("id");
ALTER TABLE
    "reservations" ADD CONSTRAINT "reservations_room_id_foreign" FOREIGN KEY("room_id") REFERENCES "rooms"("id");
ALTER TABLE
    "media" ADD CONSTRAINT "media_model_id_foreign" FOREIGN KEY("model_id") REFERENCES "reviews"("id");
ALTER TABLE
    "rooms" ADD CONSTRAINT "rooms_published_at_foreign" FOREIGN KEY("published_at") REFERENCES "users"("id");
ALTER TABLE
    "reservations" ADD CONSTRAINT "reservations_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");