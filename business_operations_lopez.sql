
CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone_Number VARCHAR(15) NOT NULL
);

CREATE TABLE Facility (
    Facility_ID INT AUTO_INCREMENT PRIMARY KEY,
    Facility_Name VARCHAR(100) NOT NULL,
    Capacity INT
);

CREATE TABLE Booking (
    Booking_ID INT AUTO_INCREMENT PRIMARY KEY,
    Booking_Date DATE NOT NULL,
    Booking_Time TIME NOT NULL,
    Duration INT NOT NULL,
    Customer_ID INT NOT NULL,
    Facility_ID INT NOT NULL,
    Service_Name VARCHAR(100),
    Service_Price DECIMAL(6,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Facility_ID) REFERENCES Facility(Facility_ID)
);

CREATE TABLE Staff (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Contact_Info VARCHAR(100)
);



