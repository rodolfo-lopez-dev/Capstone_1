
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

CREATE TABLE Membership (
    Membership_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Membership_Type VARCHAR(50) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE,
    Price DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

ALTER TABLE Booking
ADD COLUMN Staff_ID INT,
ADD CONSTRAINT Fk_Staff_Booking
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID);

CREATE TABLE BookingMembership (
    BookingMembership_ID INT AUTO_INCREMENT PRIMARY KEY,
    Booking_ID INT NOT NULL,
    Membership_ID INT NOT NULL,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
    FOREIGN KEY (Membership_ID) REFERENCES Membership(Membership_ID)
);

