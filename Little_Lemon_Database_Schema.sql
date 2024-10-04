-- Step 1: Drop the existing database
DROP DATABASE IF EXISTS LittleLemonDB;

-- Step 2: Create the database
CREATE DATABASE LittleLemonDB;
USE LittleLemonDB;

-- Create CustomerDetails table first
CREATE TABLE CustomerDetails (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactDetails VARCHAR(100) NOT NULL
);

-- Create StaffInformation table
CREATE TABLE StaffInformation (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

-- Create Bookings table (references CustomerDetails)
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    CustomerID INT, -- Foreign key reference to CustomerDetails
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails(CustomerID)
);

-- Create Orders table (references both Bookings and StaffInformation)
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    BookingID INT,
    StaffID INT, -- Foreign key reference to StaffInformation
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (StaffID) REFERENCES StaffInformation(StaffID)
);

-- Create MenuItems table
CREATE TABLE MenuItems (
    MenuItemsID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    StarterName VARCHAR(100),
    DessertName VARCHAR(100)
);

-- Create Menus table (references MenuItems)
CREATE TABLE Menus (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    MenuItemsID INT, -- Foreign key reference to MenuItems
    MenuName VARCHAR(100),
    Cuisine VARCHAR(100),
    FOREIGN KEY (MenuItemsID) REFERENCES MenuItems(MenuItemsID)
);

-- Create OrderItems table to connect Orders and Menus
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    MenuID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), -- Link to Orders
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID) -- Link to Menus
);

-- Create OrderDeliveryStatus table (references Orders)
CREATE TABLE OrderDeliveryStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    DeliveryDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Link to Orders
);
