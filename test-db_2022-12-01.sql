-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 01, 2022 at 04:08 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `birth` (IN `month` VARCHAR(64))   BEGIN
  SELECT * FROM employee WHERE date_of_birth LIKE month;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `auditing`
--

CREATE TABLE `auditing` (
  `auditing_id` int NOT NULL,
  `emp_id` varchar(11) NOT NULL,
  `admin_emp_id` varchar(50) DEFAULT NULL,
  `del_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auditing`
--

INSERT INTO `auditing` (`auditing_id`, `emp_id`, `admin_emp_id`, `del_datetime`, `action`) VALUES
(1, '55-3623151', '123', '2022-12-01 14:48:37', 'deleted'),
(2, '55-3623151', '123', '2022-12-01 14:56:56', 'deleted'),
(3, '55-3623151', '123', '2022-12-01 15:03:04', 'deleted'),
(4, '71-7374760', '21', '2022-12-01 15:24:24', 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `building_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaint_number` int NOT NULL,
  `reason` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `full_name` varchar(55) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `postal_location` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_number` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `location` varchar(55) NOT NULL,
  `num_of_employee` int NOT NULL,
  `role` varchar(55) NOT NULL,
  `manager_emp_id` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_number`, `name`, `location`, `num_of_employee`, `role`, `manager_emp_id`) VALUES
(1, 'HR', 'London', 1000, 'HR', '07-4517183'),
(2, 'Packager', 'Manchester', 2000, 'Packager', '07-4517183'),
(3, 'Driver', 'London', 3000, 'Driver', '07-4517183'),
(4, 'Management', 'Manchester', 4000, 'Manager', '07-4517183');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int NOT NULL,
  `emp_id` varchar(50) NOT NULL,
  `warehouse_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `area` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driverweekly`
--

CREATE TABLE `driverweekly` (
  `driver_weekly_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `weekly` int NOT NULL,
  `work_hours` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `salary` varchar(25) NOT NULL,
  `date_of_birth` varchar(25) NOT NULL,
  `nin` varchar(50) NOT NULL,
  `dept_number` int NOT NULL,
  `emergency_name` varchar(50) NOT NULL,
  `emergency_relationship` varchar(50) NOT NULL,
  `emergency_phone` varchar(50) NOT NULL,
  `admin_emp_id` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `name`, `address`, `salary`, `date_of_birth`, `nin`, `dept_number`, `emergency_name`, `emergency_relationship`, `emergency_phone`, `admin_emp_id`) VALUES
('07-4517183', ' Rochell Doohaine', '1802 Hayes Court', '33,027.23 ', '08/11/1973', 'rz111360g', 4, 'Regan Yarn', 'Mother', '07231 462 728', '21'),
('01-6146269', 'Krispin Eastmond', '584 Pines Place', '46,304.52 ', '25/04/1956', 'oc293284f', 3, 'Chandra Tiesman', 'Father', '07829 492 462', '07-4517183'),
('01-5576008', 'Jaquenetta Rankin', '3249 Dahle Plaza', '42,698.62 ', '28/12/1988', 'ir187391u', 2, 'Gustave Benedikt', 'Husband', '07689 714 850', '07-4517183'),
('00-4334715', 'Stormie Lowndes', '280 Thompson Plaza', '66,017.87 ', '20/11/1964', 'xn991742p', 1, 'Anastasia Camamile', 'Civil Partner', '07043 627 535', '07-4517183'),
('00-5433543', 'Michael Feast', '950 Buell Drive', '77,019.57 ', '20/12/1969', 'ab129742p', 3, 'Anderson Feast', 'Father', '07144 637 355', '07-4517183'),
('12-3121540', 'Karen Carmo', '2123 Gold Centre', '87,022.34 ', '22/12/1970', 'cd153712s', 3, 'Chris Carmo', 'Father', '07256 327 251', '07-4517183'),
('07-1233214', 'David James', '121 Silver Garden', '55,312.75 ', '03/05/1999', 'az362131a', 4, 'Linda Vosgi', 'Wife', '07345 547 321', '07-4517183'),
('02-1234121', 'Tony Curry', '213 Music Point', '67,422.31 ', '09/06/1999', 'uz462231b', 2, 'Ammy Canvo', 'Wife', '07225 531 564', '07-4517183'),
('02-2998391', 'Joe Porter', '112 Chorlton Street', '28,312.21 ', '11/11/1989', 'ay363111b', 3, 'Jackson Porter', 'Father', '07223 507 001', '07-4517183'),
('03-2393321', 'Louis Lenno', '329 Kings Row', '92,522.11 ', '12/12/1970', 'av333211p', 1, 'Elton John', 'Girlfriend', '07340 500 511', '07-4517183'),
('04-3498391', 'Carol Stark', '512 Cambridge Street', '98,012.53 ', '01/11/1989', 'mn333211b', 1, 'Bruce Stark', 'Husband', '07453 557 101', '07-4517183'),
('04-3333913', 'Brie Rogers', '422 Oxford Street', '82,912.55 ', '21/10/1989', 'pn123245b', 3, 'Robert Rogers', 'Boyfriend', '07333 447 202', '07-4517183'),
('05-1258291', 'Paul Banner', '772 Salford Street', '99,002.33 ', '01/07/1989', 'vn444211c', 3, 'Mark Banner', 'Father', '07773 777 303', '07-4517183'),
('05-3298391', 'Jerry William', '210 King Street', '46,022.53 ', '01/12/1989', 'ln002211d', 2, 'Renner William', 'Father', '07666 667 106', '07-4517183'),
('55-3623151', 'Malissia Osgardby', '29416 Grover Alley', '17,424.03', '26/12/1989', 'it152291r', 3, 'Marcie Prattington', 'Mother', '07297 230 400', '123');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `trig_employee_delete` AFTER DELETE ON `employee` FOR EACH ROW BEGIN
insert into auditing(emp_id, admin_emp_id, action) values (old.emp_id, old.admin_emp_id, "deleted");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` int NOT NULL,
  `building_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `quantity_left` int DEFAULT NULL,
  `price` varchar(55) DEFAULT NULL,
  `total_price` varchar(55) DEFAULT NULL,
  `crate_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `description` varchar(55) DEFAULT NULL,
  `price` varchar(55) DEFAULT NULL,
  `quantity_left` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int NOT NULL,
  `route_name` varchar(55) NOT NULL,
  `start_location` varchar(55) NOT NULL,
  `end_location` varchar(55) NOT NULL,
  `stop_time` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `area` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicleroute`
--

CREATE TABLE `vehicleroute` (
  `vehicle_route_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `route_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int NOT NULL,
  `size` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouseproduct`
--

CREATE TABLE `warehouseproduct` (
  `warehouse_product_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditing`
--
ALTER TABLE `auditing`
  ADD PRIMARY KEY (`auditing_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `admin_emp_id` (`admin_emp_id`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`building_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_number`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_number`),
  ADD KEY `manager_emp_id` (`manager_emp_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `driverweekly`
--
ALTER TABLE `driverweekly`
  ADD PRIMARY KEY (`driver_weekly_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `dept_number` (`dept_number`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD UNIQUE KEY `route_id` (`route_id`,`route_name`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `vehicleroute`
--
ALTER TABLE `vehicleroute`
  ADD PRIMARY KEY (`vehicle_route_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- Indexes for table `warehouseproduct`
--
ALTER TABLE `warehouseproduct`
  ADD PRIMARY KEY (`warehouse_product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auditing`
--
ALTER TABLE `auditing`
  MODIFY `auditing_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `building_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaint_number` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_number` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driverweekly`
--
ALTER TABLE `driverweekly`
  MODIFY `driver_weekly_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `office_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicle_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicleroute`
--
ALTER TABLE `vehicleroute`
  MODIFY `vehicle_route_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `warehouse_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouseproduct`
--
ALTER TABLE `warehouseproduct`
  MODIFY `warehouse_product_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
