CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL DEFAULT 'USER',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE cars (
    id BIGSERIAL PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    plate_number VARCHAR(30) NOT NULL UNIQUE,
    status VARCHAR(30) NOT NULL DEFAULT 'AVAILABLE',
    price_per_minute NUMERIC(10, 2) NOT NULL,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION
);


CREATE TABLE bookings (
    id BIGSERIAL PRIMARY KEY,

    user_id BIGINT NOT NULL,
    car_id BIGINT NOT NULL,

    status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMPTZ NOT NULL,

    CONSTRAINT fk_booking_user
      FOREIGN KEY (user_id)
          REFERENCES users(id),

    CONSTRAINT fk_booking_car
      FOREIGN KEY (car_id)
          REFERENCES cars(id)
);


CREATE TABLE trips (
    id BIGSERIAL PRIMARY KEY,

    booking_id BIGINT NOT NULL UNIQUE,

    started_at TIMESTAMPTZ NOT NULL,
    ended_at TIMESTAMPTZ,

    total_price NUMERIC(10, 2),

    status VARCHAR(30) NOT NULL DEFAULT 'IN_PROGRESS',

    CONSTRAINT fk_trip_booking
       FOREIGN KEY (booking_id)
           REFERENCES bookings(id)
);