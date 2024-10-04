DELIMITER $$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxOrderQuantity
    FROM Orders;
END $$

DELIMITER ;

CALL GetMaxQuantity();