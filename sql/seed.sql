INSERT INTO airports (code, name, city, country)
VALUES
('GRU','Guarulhos','São Paulo','Brasil'),
('CGH','Congonhas','São Paulo','Brasil'),
('SDU','Santos Dumont','Rio de Janeiro','Brasil'),
('GIG','Galeão','Rio de Janeiro','Brasil'),
('FOR','Pinto Martins','Fortaleza','Brasil'),
('BSB','Brasília Internacional','Brasília','Brasil');

INSERT INTO hotels (name, city, country, stars, address)
VALUES
('Hotel Sol Nascente','São Paulo','Brasil',5,'Av. Paulista, 1000'),
('Hotel Central','Rio de Janeiro','Brasil',4,'Rua Copacabana, 500'),
('Hotel Beira Mar','Fortaleza','Brasil',5,'Av. Beira Mar, 700'),
('Hotel Executivo','Brasília','Brasil',4,'Setor Hoteleiro Sul'),
('Hotel Paraíso','São Paulo','Brasil',3,'Rua Augusta, 300');

INSERT INTO customers (name,email,cpf,phone)
SELECT
'Cliente ' || gs,
'cliente' || gs || '@email.com',
LPAD(gs::text,11,'0'),
'(85)99999-' || LPAD(gs::text,4,'0')
FROM generate_series(1,5000) gs;

INSERT INTO flights
(flight_number,origin_airport_id,destination_airport_id,
departure_time,arrival_time,total_seats,
available_seats,price)

SELECT
'VOO' || gs,
((gs % 6)+1),
(((gs+1)%6)+1),
NOW() + (gs || ' hours')::interval,
NOW() + ((gs+2) || ' hours')::interval,
180,
180,
ROUND((random()*1000+300)::numeric,2)

FROM generate_series(1,2000) gs;

INSERT INTO rooms
(hotel_id,room_number,type,capacity,price_per_night)

SELECT
((gs % 5)+1),
'Q' || gs,

CASE
WHEN gs % 3 = 0 THEN 'single'
WHEN gs % 3 = 1 THEN 'double'
ELSE 'suite'
END,

CASE
WHEN gs % 3 = 0 THEN 1
WHEN gs % 3 = 1 THEN 2
ELSE 4
END,

ROUND((random()*500+100)::numeric,2)

FROM generate_series(1,1000) gs;

INSERT INTO flight_reservations
(customer_id,flight_id,seat_number,status)

SELECT
((gs % 5000)+1),
((gs % 2000)+1),
'A' || gs,

CASE
WHEN gs % 5 = 0 THEN 'cancelled'
WHEN gs % 3 = 0 THEN 'pending'
ELSE 'confirmed'
END

FROM generate_series(1,3000) gs;

INSERT INTO hotel_reservations
(customer_id,room_id,check_in,check_out,status,total_price)

SELECT
((gs % 5000)+1),
((gs % 1000)+1),
CURRENT_DATE + (gs % 30),
CURRENT_DATE + ((gs % 30)+3),

CASE
WHEN gs % 4 = 0 THEN 'cancelled'
ELSE 'confirmed'
END,

ROUND((random()*1000+200)::numeric,2)

FROM generate_series(1,2000) gs;

INSERT INTO payments
(reservation_type,reservation_id,amount,status,payment_method)

SELECT
CASE
WHEN gs % 2 = 0 THEN 'flight'
ELSE 'hotel'
END,

gs,

ROUND((random()*1500+100)::numeric,2),

CASE
WHEN gs % 5 = 0 THEN 'pending'
ELSE 'paid'
END,

CASE
WHEN gs % 3 = 0 THEN 'credit_card'
WHEN gs % 3 = 1 THEN 'pix'
ELSE 'debit_card'
END

FROM generate_series(1,3000) gs;