-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2018 at 09:12 PM
-- Server version: 5.7.21-0ubuntu0.17.10.1
-- PHP Version: 7.1.15-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `d_payments2`
--

CREATE TABLE `d_payments2` (
  `user_id` varchar(255) NOT NULL,
  `passenger_id` int(11) DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `mobile` int(10) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_payments2`
--

INSERT INTO `d_payments2` (`user_id`, `passenger_id`, `price`, `type`, `email_id`, `password`, `first_name`, `last_name`, `gender`, `age`, `mobile`, `city`) VALUES
('pankaj.ajwani@gmail.com', 4, 1700, 'Sleeper', 'pankaj.ajwani@gmail.com', 'password', 'Pankaj', 'Ajwani', 'M', 20, 987654444, 'Delhi'),
('saail.chawande@gmail.com', 3, 1500, 'Two Tier', 'saail.chawande@gmail.com', 'password', 'Saahil', 'Chawande', 'F', 20, 987654333, 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `h_user2`
--

CREATE TABLE `h_user2` (
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `mobile` int(10) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `h_user2`
--

INSERT INTO `h_user2` (`email_id`, `password`, `first_name`, `last_name`, `gender`, `age`, `mobile`, `city`) VALUES
('pankaj.ajwani@gmail.com', 'password', 'Pankaj', 'Ajwani', 'M', 20, 987654444, 'Delhi'),
('saail.chawande@gmail.com', 'password', 'Saahil', 'Chawande', 'F', 20, 987654333, 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `pnr` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `booked_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`pnr`, `first_name`, `last_name`, `age`, `gender`, `booked_by`) VALUES
(1, 'Aaron', 'Blaze', 35, 'M', 'aaron.blaze@gmail.com'),
(2, 'Kratos', 'Warheart', 30, 'M', 'kratos.warheart@gmail.com'),
(3, 'Saahil', 'Chawande', 20, 'F', 'saail.chawande@gmail.com'),
(4, 'Pankaj', 'Ajwani', 20, 'M', 'pankaj.ajwani@gmail.com'),
(5, 'Rakshit', 'Bhat', 20, 'M', 'rakshit.bhat@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `user_id` varchar(255) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `total_distance` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `total_distance`) VALUES
(1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `route_has_station`
--

CREATE TABLE `route_has_station` (
  `route_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `stop_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`station_id`, `station_name`, `city`) VALUES
(1, 'LTT', 'Mumbai'),
(2, 'Ahemdabad', 'Ahemdabad');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `train_id` int(11) NOT NULL,
  `train_name` varchar(255) NOT NULL,
  `train_type` varchar(255) NOT NULL,
  `start_station_id` int(11) NOT NULL,
  `end_station_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`train_id`, `train_name`, `train_type`, `start_station_id`, `end_station_id`, `route_id`) VALUES
(1, 'Shatabdi Express', 'Express', 1, 2, 1),
(2, 'Mumbai express', 'Express', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `train_seats`
--

CREATE TABLE `train_seats` (
  `seat_number` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `pnr` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `mobile` int(10) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email_id`, `password`, `first_name`, `last_name`, `gender`, `age`, `mobile`, `city`) VALUES
('aaron.blaze@gmail.com', '12345678', 'Aaron', 'Blaze', 'M', 35, 987654321, 'Mumbai'),
('kratos.warheart@gmail.com', 'password', 'Kratos', 'Warheart', 'M', 30, 987654322, 'Mumbai'),
('pankaj.ajwani@gmail.com', 'password', 'Pankaj', 'Ajwani', 'M', 20, 987654444, 'Delhi'),
('rakshit.bhat@gmail.com', 'password', 'Rakshit', 'Bhat', 'M', 20, 123456789, 'Mumbai'),
('saail.chawande@gmail.com', 'password', 'Saahil', 'Chawande', 'F', 20, 987654333, 'Delhi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `d_payments2`
--
ALTER TABLE `d_payments2`
  ADD PRIMARY KEY (`user_id`,`email_id`);

--
-- Indexes for table `h_user2`
--
ALTER TABLE `h_user2`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`pnr`),
  ADD UNIQUE KEY `booked_by` (`booked_by`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`user_id`,`passenger_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `route_has_station`
--
ALTER TABLE `route_has_station`
  ADD PRIMARY KEY (`route_id`,`stop_number`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`train_id`),
  ADD KEY `start_station_id` (`start_station_id`),
  ADD KEY `end_station_id` (`end_station_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `train_id` (`train_id`),
  ADD KEY `start_station_id_2` (`start_station_id`),
  ADD KEY `end_station_id_2` (`end_station_id`),
  ADD KEY `route_id_2` (`route_id`);

--
-- Indexes for table `train_seats`
--
ALTER TABLE `train_seats`
  ADD PRIMARY KEY (`seat_number`,`train_id`,`date`),
  ADD KEY `train_id` (`train_id`),
  ADD KEY `pnr` (`pnr`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `email_id` (`email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `pnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `train_seats`
--
ALTER TABLE `train_seats`
  MODIFY `seat_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`booked_by`) REFERENCES `user` (`email_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`email_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`pnr`);

--
-- Constraints for table `route_has_station`
--
ALTER TABLE `route_has_station`
  ADD CONSTRAINT `route_has_station_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`);

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`start_station_id`) REFERENCES `station` (`station_id`),
  ADD CONSTRAINT `train_ibfk_2` FOREIGN KEY (`end_station_id`) REFERENCES `station` (`station_id`),
  ADD CONSTRAINT `train_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints for table `train_seats`
--
ALTER TABLE `train_seats`
  ADD CONSTRAINT `train_seats_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  ADD CONSTRAINT `train_seats_ibfk_2` FOREIGN KEY (`pnr`) REFERENCES `passenger` (`pnr`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
