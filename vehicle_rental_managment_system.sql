-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2024 at 03:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicle_rental_managment_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Contact_no` varchar(20) NOT NULL,
  `NIC_no` varchar(24) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `Status` enum('new','blacklist','pending','completed') DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_id`, `First_name`, `Last_name`, `Gender`, `Contact_no`, `NIC_no`, `Street`, `City`, `District`, `Status`) VALUES
(37, 'Saman', 'Kumara', 'Male', '0332289640', '200127900415', 'Passara road', 'Badulla', 'Uva province', 'completed'),
(41, 'Lahiru', 'Kumara', 'Male', '0332289640', '20002532315', 'Passara road', 'Badulla', 'Uva province', 'blacklist'),
(42, 'Nihal', 'Prassanna', 'Male', '0332289640', '20022543315', 'Passara road', 'Badulla', 'Uva province', 'new'),
(43, 'Aravinda', 'Prassanna', 'Male', '0332289640', '22022543315', 'Passara road', 'Badulla', 'Uva province', 'blacklist');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Contact_No` varchar(15) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Role` enum('employee','admin') NOT NULL DEFAULT 'employee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `First_Name`, `Last_Name`, `Gender`, `Contact_No`, `Street`, `City`, `District`, `Email`, `Password`, `Role`) VALUES
(5, 'test', 'user', 'M', '0815368063', 'prajamawatha,', 'Maho', 'Colombo', 'test@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'admin'),
(6, 'Lakshitha', 'hewawissa', 'M', '0712798689', 'prajamawatha,', 'Nittambuwa', 'Colombo', 'chanuth@gmail.com', '5bb7c50572551a2133bf92a979e44769', 'employee'),
(7, 'Lakshitha', 'hewawissa', 'M', '0712798689', 'prajamawatha,', 'Nittambuwa', 'Colombo', 'sayuru@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'employee'),
(8, 'Sadew', 'hewawissa', 'M', '0712798689', 'prajamawatha,', 'Nittambuwa', 'Colombo', 'sayuru@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `Rental_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `License_plate_no` varchar(20) NOT NULL,
  `Rental_start_date` date NOT NULL,
  `No_of_days` int(11) NOT NULL,
  `Pickup_location` varchar(100) NOT NULL,
  `Total_cost` decimal(10,2) NOT NULL,
  `status` enum('pending','active','completed','declined','booked') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`Rental_id`, `Customer_id`, `License_plate_no`, `Rental_start_date`, `No_of_days`, `Pickup_location`, `Total_cost`, `status`) VALUES
(30, 37, 'CBB-3245', '2024-08-22', 1, 'Badulla', 15000.00, 'completed'),
(31, 41, 'CDS-1344', '2024-08-14', 2, 'Badulla', 50000.00, 'pending'),
(32, 42, 'ABB-223', '2024-08-13', 2, 'Badulla', 24000.00, 'pending'),
(33, 37, 'CDS-1344', '2024-08-15', 2, 'Badulla', 50000.00, 'declined');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Vehicle_id` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Year` int(11) NOT NULL,
  `License_plate_no` varchar(20) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `status` enum('available','unavailable','booked') NOT NULL DEFAULT 'available',
  `rental_price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_id`, `Type`, `Brand`, `Model`, `Year`, `License_plate_no`, `Image`, `status`, `rental_price`) VALUES
(16, 'Convertible', 'Suzuki', 'Katana', 2000, 'ABC-1234', 'https://upload.wikimedia.org/wikipedia/commons/2/20/Suzukikatana1100-2010.JPG', 'available', 10000.00),
(17, 'SUV', 'Honda', 'HR-V', 2019, 'CDJ-9312', 'https://imagizer.imageshack.com/img923/8981/lFRR3u.jpg', 'available', 18000.00),
(18, 'Sedan', 'Toyota', 'Camry', 2023, 'CBB-3245', 'https://tmna.aemassets.toyota.com/is/image/toyota/toyota/jellies/max/2025/camry/le/2552/040/1.png?bg=fff&fmt=webp&qlt=90&wid=1764', 'available', 15000.00),
(19, 'Van', 'Ford', 'TRANSIT', 2024, 'CDS-1344', 'https://storage.googleapis.com/wackk-images-production-4f204ab/m8sbob3h42emzr8ujw7kye5fs1uh', 'available', 25000.00),
(20, 'Sedan', 'Honda', 'Civic', 1998, 'CJ-2433', 'https://riyasewana.com/uploads/honda-civic-ek3-10153115271.jpg', 'booked', 15000.00),
(24, 'Truck', 'Toyota', 'Test', 2020, 'CDK-2332', 'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'available', 14000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`Rental_id`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `Rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `Vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
