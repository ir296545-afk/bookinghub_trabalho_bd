BEGIN;

UPDATE flights
SET available_seats = available_seats - 1
WHERE id = 1
AND available_seats > 0;

ROLLBACK;


BEGIN;

UPDATE flights
SET available_seats = available_seats - 1
WHERE id = 1;

SAVEPOINT reserva_voo;

UPDATE payments
SET amount = amount + 100
WHERE id = 1;

ROLLBACK TO SAVEPOINT reserva_voo;

COMMIT;