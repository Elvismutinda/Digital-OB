CREATE TABLE `digital_ob`.`user_type` 
(`id` INT NOT NULL AUTO_INCREMENT, 
`status` VARCHAR(50) NOT NULL , 
PRIMARY KEY (`id`) ,
UNIQUE (`status`)) ENGINE = InnoDB;


CREATE TABLE `digital_ob`.`stations` 
(`id` INT(20) NOT NULL , 
`station` VARCHAR(50) NOT NULL , 
`address` VARCHAR(250) NOT NULL , 
`location` VARCHAR(50) NOT NULL , 
`phone` INT(50) NOT NULL , 
`date_added` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
PRIMARY KEY (`id`) , 
UNIQUE (`station`)) ENGINE = InnoDB;


CREATE TABLE `digital_ob`.`users` 
(`staff_id` INT NOT NULL , 
`name` VARCHAR(250) NOT NULL , 
`station` VARCHAR(50) NOT NULL , 
`rank` VARCHAR(50) NOT NULL , 
`gender` ENUM('Male', 'Female') NOT NULL , 
`password` VARCHAR(250) NOT NULL , 
`status` VARCHAR(50) NOT NULL , 
`date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`staff_id`) , 
FOREIGN KEY (`station`) REFERENCES stations(`station`) , 
FOREIGN KEY (`status`) REFERENCES user_type(`status`) ON DELETE CASCADE
) ENGINE = InnoDB;


CREATE TABLE `digital_ob`.`crimes` 
(`id` INT NOT NULL AUTO_INCREMENT , 
`crime_type` VARCHAR(50) NOT NULL , 
PRIMARY KEY (`id`) , 
UNIQUE (`crime_type`)) ENGINE = InnoDB;


CREATE TABLE `digital_ob`.`complainants` 
(`id` INT(11) NOT NULL AUTO_INCREMENT , 
`ob_number` VARCHAR(20) NOT NULL , 
`comp_name` VARCHAR(250) NOT NULL , 
`tel` VARCHAR(50) NOT NULL , 
`occupation` VARCHAR(50) NOT NULL , 
`age` INT(10) NOT NULL , 
`address` VARCHAR(50) NOT NULL , 
`region` VARCHAR(50) NOT NULL , 
`gender` ENUM('Male', 'Female') NOT NULL , 
`crime_type` VARCHAR(50) NOT NULL , 
`location` VARCHAR(50) NOT NULL , 
`station_reported` VARCHAR(50) NOT NULL , 
`date_added` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
PRIMARY KEY (`id`), 
UNIQUE (`ob_number`), 
FOREIGN KEY (`crime_type`) REFERENCES crimes(`crime_type`) ON DELETE CASCADE
) ENGINE =  InnoDB;


CREATE TABLE `digital_ob`.`cases` 
(`id` INT(11) NOT NULL AUTO_INCREMENT , 
`ob_number` VARCHAR(20) NOT NULL , 
`crime_type` VARCHAR(50) NOT NULL , 
`date_reported` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
`recorded_by` INT(20) NOT NULL , 
`station` VARCHAR(50) NOT NULL ,
`statement` VARCHAR(250) NOT NULL , 
`investigator` INT(20) NULL ,
`status` VARCHAR(50) NULL DEFAULT 'Ongoing', 
`date_completed` DATETIME NULL , 
`report` VARCHAR(250) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`recorded_by`) REFERENCES users(`staff_id`) ON DELETE CASCADE,
FOREIGN KEY (`investigator`) REFERENCES users(`staff_id`) ON DELETE SET NULL,
FOREIGN KEY (`ob_number`) REFERENCES complainants(`ob_number`) ON DELETE CASCADE
) ENGINE = InnoDB;


CREATE TABLE `digital_ob`.`suspects`
(`id` INT(11) NOT NULL AUTO_INCREMENT ,
`ob_number` VARCHAR(20) NOT NULL ,
`crime_suspected` VARCHAR(50) NOT NULL ,
`name` VARCHAR(250) NOT NULL ,
`national_id` INT(50) NOT NULL ,
`dob` DATE NOT NULL ,
`address` VARCHAR(50) NOT NULL ,
`phone_num` INT(20) NOT NULL ,
`gender` ENUM('Male', 'Female') NOT NULL ,
`date_added` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
PRIMARY KEY (`id`),
FOREIGN KEY (`crime_suspected`) REFERENCES crimes(`crime_type`) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (`ob_number`) REFERENCES cases(`ob_number`) ON DELETE CASCADE
) ENGINE = InnoDB;


-- DATA FOR CRIMES --

INSERT INTO `crimes` (`id`, `crime_type`) 
VALUES (1, 'Domestic Violence'),
(2, 'Murder Case'),
(3, 'Assault'),
(4, 'Theft Case'),
(5, 'Defilement'),
(6, 'Robbing'),
(7, 'Road Accident'),
(8, 'Other');

-- DATA FOR USER_TYPE --

INSERT INTO `user_type` (`id`, `status`) 
VALUES (1, 'Incharge Officer'),
(2, 'Police'),
(3, 'Investigating Officer'),
(4, 'Admin');


-- DUMMY DATA FOR STATIONS --

INSERT INTO `stations` (`id`, `station`, `address`, `location`, `phone`)
VALUES 
(1, 'Central Police Station', 'Uhuru Highway, Nairobi', 'Nairobi', '0712345678'),
(2, 'Kasarani Police Station', 'Kasarani Road, Nairobi', 'Nairobi', '0723456789'),
(3, 'Kilimani Police Station', 'Argwings Kodhek Road, Nairobi', 'Nairobi', '0734567890'),
(4, 'Embakasi Police Station', 'Embakasi, Nairobi', 'Nairobi', '0745678901'),
(5, 'Parklands Police Station', 'Parklands Avenue, Nairobi', 'Nairobi', '0756789012'),
(6, 'Langata Police Station', 'Langata Road, Nairobi', 'Nairobi', '0767890123'),
(7, 'Buruburu Police Station', 'Buruburu Estate, Nairobi', 'Nairobi', '0778901234'),
(8, 'Ruaraka Police Station', 'Ruaraka, Nairobi', 'Nairobi', '0789012345'),
(9, 'South B Police Station', 'South B Estate, Nairobi', 'Nairobi', '0790123456'),
(10, 'Gigiri Police Station', 'UN Avenue, Nairobi', 'Nairobi', '0801234567'),
(11, 'Dandora Police Station', 'Dandora Estate, Nairobi', 'Nairobi', '0812345678'),
(12, 'Kahawa West Police Station', 'Kahawa West, Nairobi', 'Nairobi', '0823456789'),
(13, 'Ngara Police Station', 'Ngara Road, Nairobi', 'Nairobi', '0834567890'),
(14, 'Kibera Police Station', 'Kibera Drive, Nairobi', 'Nairobi', '0845678901'),
(15, 'Karen Police Station', 'Karen Road, Nairobi', 'Nairobi', '0856789012'),
(16, 'Madaraka Police Station', 'Madaraka Estate, Nairobi', 'Nairobi', '0867890123'),
(17, 'Kileleshwa Police Station', 'Kileleshwa, Nairobi', 'Nairobi', '0878901234'),
(18, 'Starehe Police Station', 'Pangani, Nairobi', 'Nairobi', '0889012345'),
(19, 'Westlands Police Station', 'Woodvale Grove, Nairobi', 'Nairobi', '0890123456'),
(20, 'Njiru Police Station', 'Njiru, Nairobi', 'Nairobi', '0901234567'),
(21, 'N/A', 'N/A', 'N/A', '0');


-- DUMMY DATA FOR USERS --

INSERT INTO `users` (`staff_id`, `name`, `station`, `rank`, `gender`, `password`, `status`)
VALUES 
(1, 'Elvis', 'N/A', 'Inspector General', 'Male', MD5('1234'), 'Admin'),
(11, 'Elvis Mutinda', 'Langata Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(11001, 'John Smith', 'Langata Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(11002, 'Emily Johnson', 'Langata Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(11003, 'David Lee', 'Langata Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(11004, 'Olivia Davis', 'Langata Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(11005, 'William Wilson', 'Langata Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(11006, 'Emma Brown', 'Langata Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(11007, 'Jacob Martin', 'Langata Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(11008, 'Ava Hernandez', 'Langata Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(22, 'Ryan Silu', 'Central Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(22001, 'Paul Brown', 'Central Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(22002, 'Maria Hernandez', 'Central Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(22003, 'Kevin Lee', 'Central Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(22004, 'Jenny Wilson', 'Central Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(22005, 'Eric Davis', 'Central Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(22006, 'Sophia Johnson', 'Central Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(22007, 'Thomas Martin', 'Central Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(22008, 'Linda Garcia', 'Central Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(33, 'Ruai Dak', 'Kasarani Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(33001, 'Michael Clark', 'Kasarani Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(33002, 'Samantha Anderson', 'Kasarani Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(33003, 'Robert Smith', 'Kasarani Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(33004, 'Isabella Davis', 'Kasarani Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(33005, 'Daniel Wilson', 'Kasarani Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(33006, 'Madison Brown', 'Kasarani Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(33007, 'Matthew Martin', 'Kasarani Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(33008, 'Emma Hernandez', 'Kasarani Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(44, 'Dom Kimeu', 'South B Police Station', 'Assistant Superintendent', 'Male', MD5('1234'), 'Incharge Officer'),
(44001, 'Ethan Martinez', 'South B Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(44002, 'Avery Cooper', 'South B Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(44003, 'Mason Lee', 'South B Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(44004, 'Olivia Taylor', 'South B Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(44005, 'Evelyn Jackson', 'South B Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(44006, 'Caleb Wright', 'South B Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(44007, 'Caroline Lee', 'South B Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(44008, 'Brandon Harris', 'South B Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(55, 'Neville Kalunda', 'Embakasi Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(55001, 'Sofia Garcia', 'Embakasi Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(55002, 'Noah Martinez', 'Embakasi Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(55003, 'Isabella Scott', 'Embakasi Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(55004, 'Liam Perez', 'Embakasi Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(55005, 'Chloe Flores', 'Embakasi Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(55006, 'Jacob Allen', 'Embakasi Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(55007, 'Aria Parker', 'Embakasi Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(55008, 'Logan Ramirez', 'Embakasi Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(66, 'Adrian Bikuri', 'Kilimani Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(66001, 'Harper Collins', 'Kilimani Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(66002, 'William Cook', 'Kilimani Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(66003, 'Ella Kelly', 'Kilimani Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(66004, 'James Wood', 'Kilimani Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(66005, 'Victoria Powell', 'Kilimani Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(66006, 'Michael Lee', 'Kilimani Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(66007, 'Grace Torres', 'Kilimani Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(66008, 'Ethan Gonzales', 'Kilimani Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(77, 'Felista Njeri', 'Buruburu Police Station', 'Chief Inspector', 'Female', MD5('1234'), 'Incharge Officer'),
(77001, 'John Doe', 'Buruburu Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(77002, 'Jane Doe', 'Buruburu Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(77003, 'Peter Parker', 'Buruburu Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(77004, 'Mary Jane', 'Buruburu Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(77005, 'Clark Kent', 'Buruburu Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(77006, 'Lois Lane', 'Buruburu Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(77007, 'Bruce Wayne', 'Buruburu Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(77008, 'Selina Kyle', 'Buruburu Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(88, 'Tania Waiganjo', 'Parklands Police Station', 'Chief Inspector', 'Female', MD5('1234'), 'Incharge Officer'),
(88001, 'James Smith', 'Parklands Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(88002, 'Sarah Johnson', 'Parklands Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(88003, 'Michael Davis', 'Parklands Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(88004, 'Emily Wilson', 'Parklands Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(88005, 'David Brown', 'Parklands Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(88006, 'Jennifer Lee', 'Parklands Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(88007, 'Matthew Johnson', 'Parklands Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(88008, 'Jessica Taylor', 'Parklands Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(99, 'Paul Mwangi', 'Gigiri Police Station', 'Assistant Superintendent', 'Male', MD5('1234'), 'Incharge Officer'),
(99001, 'Oliver Queen', 'Gigiri Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(99002, 'Dinah Lance', 'Gigiri Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(99003, 'Barry Allen', 'Gigiri Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(99004, 'Iris West', 'Gigiri Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(99005, 'Hal Jordan', 'Gigiri Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(99006, 'Carol Ferris', 'Gigiri Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(101, 'Eric Muuo', 'Dandora Police Station', 'Assistant Superintendent', 'Male', MD5('1234'), 'Incharge Officer'),
(101001, 'James Kimani', 'Dandora Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(101002, 'Grace Njeri', 'Dandora Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(101003, 'John Kamau', 'Dandora Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(101004, 'Ann Wambui', 'Dandora Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(101005, 'Peter Ngugi', 'Dandora Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(101006, 'Jane Wanjiku', 'Dandora Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(101007, 'David Njoroge', 'Dandora Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(101008, 'Mary Nduta', 'Dandora Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(202, 'Terry Muthoni', 'Kahawa West Police Station', 'Chief Inspector', 'Female', MD5('1234'), 'Incharge Officer'),
(202001, 'Brian Mwangi', 'Kahawa West Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(202002, 'Diana Akinyi', 'Kahawa West Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(202003, 'Michael Omondi', 'Kahawa West Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(202004, 'Lucy Achieng', 'Kahawa West Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(202005, 'Joshua Ochieng', 'Kahawa West Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(202006, 'Faith Njeri', 'Kahawa West Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(202007, 'Daniel Gichuru', 'Kahawa West Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(202008, 'Lydia Wanjiru', 'Kahawa West Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(303, 'Kennedy Kithaka', 'Ngara Police Station', 'Assistant Superintendent', 'Male', MD5('1234'), 'Incharge Officer'),
(303001, 'Eric Otieno', 'Ngara Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(303002, 'Joyce Muthoni', 'Ngara Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(303003, 'Vincent Ouma', 'Ngara Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(303004, 'Esther Chebet', 'Ngara Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(303005, 'Isaac Njoroge', 'Ngara Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(303006, 'Juliet Mueni', 'Ngara Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(404, 'Wilberforce Ojuong', 'Kibera Police Station', 'Assistant Superintendent', 'Male', MD5('1234'), 'Incharge Officer'),
(404001, 'John Doe', 'Kibera Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(404002, 'Jane Smith', 'Kibera Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(404003, 'Peter Parker', 'Kibera Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(404004, 'Mary Jane', 'Kibera Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(505, 'Taylor Omondi', 'Karen Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(505001, 'Bruce Wayne', 'Karen Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(505002, 'Clark Kent', 'Karen Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(505003, 'Diana Prince', 'Karen Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(505004, 'Barry Allen', 'Karen Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(606, 'Hansel Ochieng', 'Madaraka Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(606001, 'Tony Stark', 'Madaraka Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(606002, 'Steve Rogers', 'Madaraka Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(606003, 'Natasha Romanoff', 'Madaraka Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(606004, 'Wanda Maximoff', 'Madaraka Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(707, 'Sally Mueni', 'Kileleshwa Police Station', 'Assistant Superintendent', 'Female', MD5('1234'), 'Incharge Officer'),
(707001, 'Scott Lang', 'Kileleshwa Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(707002, 'Hope Van Dyne', 'Kileleshwa Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(707003, 'TChalla', 'Kileleshwa Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(707004, 'Peter Quill', 'Kileleshwa Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(808, 'Anita Terry', 'Starehe Police Station', 'Chief Inspector', 'Female', MD5('1234'), 'Incharge Officer'),
(808001, 'Sam Wilson', 'Starehe Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(808002, 'Bucky Barnes', 'Starehe Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(808003, 'Gamora', 'Starehe Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(808004, 'Nebula', 'Starehe Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(909, 'Shakeel Moez', 'Westlands Police Station', 'Chief Inspector', 'Male', MD5('1234'), 'Incharge Officer'),
(909001, 'Oliver Queen', 'Westlands Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(909002, 'Felicity Smoak', 'Westlands Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(909003, 'Barbara Gordon', 'Westlands Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(909004, 'Dick Grayson', 'Westlands Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(1001, 'Steve Ngui', 'Njiru Police Station', 'Assistant Superintendent', 'Male', MD5('1234'), 'Incharge Officer'),
(1001001, 'John Doe', 'Njiru Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(1001002, 'Jane Doe', 'Njiru Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(1001003, 'David Kim', 'Njiru Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(1001004, 'Grace Kinyua', 'Njiru Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer'),
(1001005, 'Robert Mwaura', 'Njiru Police Station', 'Corporal', 'Male', MD5('1234'), 'Police'),
(1001006, 'Winnie Ngugi', 'Njiru Police Station', 'Corporal', 'Female', MD5('1234'), 'Police'),
(1001007, 'Brian Kariuki', 'Njiru Police Station', 'Corporal', 'Male', MD5('1234'), 'Investigating Officer'),
(1001008, 'Samantha Muthoni', 'Njiru Police Station', 'Corporal', 'Female', MD5('1234'), 'Investigating Officer');


-- AUTO_INCREMENT FOR DUMPED TABLES --

ALTER TABLE `stations`
MODIFY `id` INT(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;