EXPLAIN (ANALYZE, BUFFERS)

SELECT
f.id,
f.flight_number,
f.departure_time,
f.arrival_time,
f.available_seats,
f.price,
a1.code AS origin,
a2.code AS destination

FROM flights f
JOIN airports a1
ON a1.id = f.origin_airport_id

JOIN airports a2
ON a2.id = f.destination_airport_id

WHERE a1.city='São Paulo'
AND a2.city='Rio de Janeiro'
AND f.available_seats > 0

ORDER BY f.departure_time;


EXPLAIN (ANALYZE, BUFFERS)

SELECT
h.name,
h.city,
r.room_number,
r.type,
r.price_per_night

FROM hotels h

JOIN rooms r
ON h.id = r.hotel_id

WHERE h.city='São Paulo'
AND r.price_per_night < 300

ORDER BY r.price_per_night;


EXPLAIN (ANALYZE, BUFFERS)

SELECT
c.name,
p.payment_method,
p.amount,
p.status

FROM customers c

JOIN payments p
ON c.id = p.reservation_id

WHERE p.amount > 500
AND p.status='paid'

ORDER BY p.amount DESC;


EXPLAIN (ANALYZE, BUFFERS)

SELECT
fr.id,
c.name,
f.flight_number,
f.departure_time,
fr.seat_number

FROM flight_reservations fr

JOIN customers c
ON c.id = fr.customer_id

JOIN flights f
ON f.id = fr.flight_id

WHERE fr.status='confirmed'

ORDER BY f.departure_time;