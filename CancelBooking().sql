DELIMITER $$

CREATE PROCEDURE CancelBooking(IN bookingID INT)
BEGIN
    -- Delete the booking with the given booking ID
    DELETE FROM Bookings
    WHERE BookingID = bookingID;

    -- Output a confirmation message
    SELECT CONCAT('Booking with ID ', bookingID, ' has been canceled successfully.') AS CancelStatus;
END$$

DELIMITER ;



CALL CancelBooking(9);
