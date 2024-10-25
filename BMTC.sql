CREATE DATABASE bmtc;
USE bmtc;
-- Bus Table
CREATE TABLE Bus (
    Bus_ID INT PRIMARY KEY AUTO_INCREMENT,
    Bus_Number VARCHAR(20) UNIQUE,
    Capacity INT,
    Type ENUM('AC', 'Non-AC', 'Sleeper', 'Seater'),
    Registration_Number VARCHAR(50) UNIQUE,
    Status ENUM('Active', 'In Maintenance', 'Retired'),
    Last_Maintenance_Date DATE
);

-- Route Table
CREATE TABLE Route (
    Route_ID INT PRIMARY KEY AUTO_INCREMENT,
    Start_Location VARCHAR(100),
    End_Location VARCHAR(100),
    Distance DECIMAL(5, 2)
);

-- Stop Table
CREATE TABLE Stop (
    Stop_ID INT PRIMARY KEY AUTO_INCREMENT,
    Stop_Name VARCHAR(100),
    Location VARCHAR(200)
);

-- Route_Stop Table (Linking Routes to Stops)
CREATE TABLE Route_Stop (
    Route_Stop_ID INT PRIMARY KEY AUTO_INCREMENT,
    Route_ID INT,
    Stop_ID INT,
    Stop_Order INT,
    Distance_From_Start DECIMAL(5, 2),
    FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID),
    FOREIGN KEY (Stop_ID) REFERENCES Stop(Stop_ID)
);

-- Schedule Table
CREATE TABLE Schedule (
    Schedule_ID INT PRIMARY KEY AUTO_INCREMENT,
    Route_ID INT,
    Bus_ID INT,
    Departure_Time TIME,
    Arrival_Time TIME,
    Frequency ENUM('Daily', 'Weekdays', 'Weekends'),
    FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID),
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID)
);

-- Driver Table
CREATE TABLE Driver (
    Driver_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    License_Number VARCHAR(50) UNIQUE,
    Contact_Info VARCHAR(100)
);

-- Bus_Driver Table (Linking Drivers to Buses)
CREATE TABLE Bus_Driver (
    Bus_Driver_ID INT PRIMARY KEY AUTO_INCREMENT,
    Bus_ID INT,
    Driver_ID INT,
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);

-- Passenger Table
CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Contact_Info VARCHAR(100),
    Email VARCHAR(100)
);

-- Ticket Table
CREATE TABLE Ticket (
    Ticket_ID INT PRIMARY KEY AUTO_INCREMENT,
    Passenger_ID INT,
    Schedule_ID INT,
    Boarding_Stop_ID INT,
    Destination_Stop_ID INT,
    Fare DECIMAL(6, 2),
    Booking_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Schedule_ID) REFERENCES Schedule(Schedule_ID),
    FOREIGN KEY (Boarding_Stop_ID) REFERENCES Stop(Stop_ID),
    FOREIGN KEY (Destination_Stop_ID) REFERENCES Stop(Stop_ID)
);
