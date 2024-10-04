DELIMITER $$

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    -- Declare a variable to store the count of bookings
    DECLARE bookingCount INT;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*)
    INTO bookingCount
    FROM Bookings
    WHERE BookingDate = bookingDate
    AND TableNumber = tableNumber;

    -- If the table is already booked, display a message
    IF bookingCount > 0 THEN
        SELECT CONCAT('Table ', tableNumber, ' is already booked on ', bookingDate) AS BookingStatus;
    ELSE
        SELECT CONCAT('Table ', tableNumber, ' is available on ', bookingDate) AS BookingStatus;
    END IF;

END$$

DELIMITER ;



CALL CheckBooking('2022-10-10', 3);
