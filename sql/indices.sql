CREATE INDEX idx_airports_city
ON airports(city);

CREATE INDEX idx_flights_departure
ON flights(departure_time);

CREATE INDEX idx_flights_available
ON flights(available_seats);

CREATE INDEX idx_flight_reservations_flight
ON flight_reservations(flight_id);

CREATE INDEX idx_hotel_reservations_room
ON hotel_reservations(room_id);

CREATE INDEX idx_customers_email
ON customers(email);