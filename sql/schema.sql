CREATE TABLE airports (
    id SERIAL PRIMARY KEY,
    code VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE hotels (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    stars INT CHECK(stars BETWEEN 1 AND 5),
    address TEXT
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    flight_number VARCHAR(20) UNIQUE,
    origin_airport_id INT REFERENCES airports(id),
    destination_airport_id INT REFERENCES airports(id),
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    total_seats INT,
    available_seats INT,
    price NUMERIC(10,2)
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    hotel_id INT REFERENCES hotels(id),
    room_number VARCHAR(20),
    type VARCHAR(20),
    capacity INT,
    price_per_night NUMERIC(10,2)
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    cpf VARCHAR(14),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE flight_reservations (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    flight_id INT REFERENCES flights(id),
    seat_number VARCHAR(10),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE hotel_reservations (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    room_id INT REFERENCES rooms(id),
    check_in DATE,
    check_out DATE,
    status VARCHAR(20),
    total_price NUMERIC(10,2),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    reservation_type VARCHAR(20),
    reservation_id INT,
    amount NUMERIC(10,2),
    status VARCHAR(20),
    payment_method VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);
