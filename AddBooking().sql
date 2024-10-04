DELIMITER $$

CREATE PROCEDURE AddBooking(IN bookingID INT, IN customerID INT, IN bookingDate DATE, IN tableNumber INT)
BEGIN
    -- Insert a new booking record into the Bookings table
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (bookingID, customerID, bookingDate, tableNumber);

    -- Output a confirmation message
    SELECT CONCAT('Booking added successfully for Table ', tableNumber, ' on ', bookingDate) AS BookingStatus;
END$$

DELIMITER ;



CALL AddBooking(9, 3, '2022-12-30', 4);
