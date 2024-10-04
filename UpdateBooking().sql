DELIMITER $$

CREATE PROCEDURE UpdateBooking(IN bookingID INT, IN newBookingDate DATE)
BEGIN
    -- Update the booking date for the given booking ID
    UPDATE Bookings
    SET BookingDate = newBookingDate
    WHERE BookingID = bookingID;

    -- Output a confirmation message
    SELECT CONCAT('Booking with ID ', bookingID, ' has been updated to ', newBookingDate) AS UpdateStatus;
END$$

DELIMITER ;




CALL UpdateBooking(9, '2022-12-31');
