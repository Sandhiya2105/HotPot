create database hotpot;
use hotpot;
drop table customer;
drop table restaurants;
drop table menu;
drop table wallet;
drop table orders;
drop table ordersnew;
CREATE TABLE customer (
CUS_ID int NOT NULL AUTO_INCREMENT,
CUS_NAME varchar(50) NOT NULL,
CUS_PHN_NO varchar(50) NOT NULL,
CUS_USERNAME varchar(50) NOT NULL,
CUS_PASSWORD varchar(50) NOT NULL,
CUS_EMAIL varchar(50) NOT NULL,
PRIMARY KEY (CUS_ID),
UNIQUE KEY CUS_PHN_NO (CUS_PHN_NO),
UNIQUE KEY CUS_USERNAME (CUS_USERNAME)
) ;
INSERT INTO customer VALUES (1,'Sandhiya','9381413089','sand','hexaware@','sandhiya@gmail.com'),(2,'Ravi','8939391144','raviig','ravi@123','ravi@gmail.com'),(3,'Renu Srivastav','8755144556','Renu','ghazi@117','renusan@gmmail.com'),(9,'Sunil','888235','sunilvizag','rushikonda','sunil@gmail.com'),(91,'Naresh','8488444882','nareshp','infinite','naresh@gmail.com'),(99,'preethi','848233','asdkjf','kkkkasdjfkl','a@b.com'),(993,'ram','84884845','akjfd','faffafsd','ram@gmail.com'),(9022,'varsha','88848483','sdfkjj','kkaskf','varsha@gmail.com'),(9121,'swathi','422555555','swathips','infinite','swathi@gmail.com');

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
    MEN_ID INT NOT NULL AUTO_INCREMENT,
    MEN_ITEM VARCHAR(50) DEFAULT NULL,
    MEN_PRICE DECIMAL(9,2) DEFAULT NULL,
    MEN_CALORIES DOUBLE NOT NULL,
    MEN_SPECIALITY VARCHAR(50) NOT NULL,
    RESTAURANT_ID INT, 
    PRIMARY KEY (MEN_ID),
    CONSTRAINT fk_restaurant_id FOREIGN KEY (RESTAURANT_ID) REFERENCES Restaurants(restaurant_id)
);
INSERT INTO menu (MEN_ITEM, MEN_PRICE, MEN_CALORIES, MEN_SPECIALITY, RESTAURANT_ID) VALUES
('CHICKEN BIRIYANI', 856.00, 750, 'NON-VEG', 1),
('CHICKEN 65', 674.00, 500, 'NON-VEG', 1),
('GOBI MANCHURIAN', 684.00, 650, 'VEG', 2),
('CHICKEN MANCHURIAN', 999.00, 750, 'NON-VEG', 2),
('FISH', 901.00, 850, 'NON-VEG', 3),
('DAHI BHALLE', 111.00, 150, 'VEG', 3),
('MIX PRANTHA', 911.00, 360, 'VEG', 4),
('GOL GAPPE', 901.00, 170, 'VEG', 4),
('PRAWN BIRYANI', 901.00, 580, 'NON-VEG', 5),
('THAI NOODLES', 744.00, 660, 'VEG', 6);



CREATE TABLE wallet (
CUS_ID int unsigned DEFAULT NULL,
WAL_ID int unsigned NOT NULL AUTO_INCREMENT,
WAL_AMOUNT double unsigned NOT NULL,
WAL_SOURCE enum('PAYTM','CREDIT_CARD','DEBIT_CARD') DEFAULT 'DEBIT_CARD',
PRIMARY KEY (WAL_ID),
UNIQUE KEY CUS_ID (CUS_ID,WAL_SOURCE)
);
INSERT INTO wallet VALUES (1,1,4215,'PAYTM'),(1,2,3000,'DEBIT_CARD'),(1,3,5602.36,'CREDIT_CARD'),(2,4,4500.36,'DEBIT_CARD'),(3,5,485.23,'CREDIT_CARD'),(2,6,3000,'CREDIT_CARD'),(2,7,4560,'PAYTM'),(3,8,56.36,'PAYTM'),(3,9,4566,'DEBIT_CARD');
CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(150),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO Restaurants (name, location, contact_number, email) VALUES
('Saravana Bhavan', 'Chennai', '9845612345', 'saravana@bhavan.com'),
('Saravana Bhavan','Villupuram','8879654132','saravana@bhavan.com'),
('A2B Adyar Ananda Bhavan', 'Coimbatore', '9812345678', 'a2b@aab.com'),
('A2B Adyar Ananda Bhavan', 'Cuddalore', '9812345678', 'a2b@aab.com'),
('Sree Annapoorna', 'Madurai', '9823456789', 'annapoorna@sree.com'),
('Arya Bhavan', 'Kochi', '9834567890', 'arya@bhavan.com'),
('Dindigul Thalappakatti', 'Trichy', '9845678901', 'thalappakatti@dgl.com');
CREATE TABLE `orders` (
`ORD_ID` int NOT NULL AUTO_INCREMENT,
`CUS_ID` int unsigned NOT NULL,
`VEN_ID` int unsigned NOT NULL,
`WAL_SOURCE` varchar(30) DEFAULT NULL,
`MEN_ID` int NOT NULL,
`ORD_DATE` date DEFAULT NULL,
`ORD_QUANTITY` int DEFAULT NULL,
`ORD_BILLAMOUNT` double DEFAULT NULL,
`ORD_STATUS` enum('ACCEPTED','DENIED','PENDING') DEFAULT 'PENDING',
`ORD_COMMENTS` varchar(50) DEFAULT NULL,
PRIMARY KEY (`ORD_ID`)
);
INSERT INTO `orders` VALUES (1,1,1,'PAYTM',1,NULL,1,856,'ACCEPTED','slkjf'),(12,1,2,'PAYTM',1,NULL,1,856,'DENIED','salfkasf'),(13,2,1,'PAYTM',1,NULL,1,856,'PENDING','aslkfdjasdf'),(14,1,1,'PAYTM',1,NULL,1,856,'PENDING','asfasf'),(15,2,2,'PAYTM',1,NULL,1,856,'PENDING','asfasf'),(16,1,1,'PAYTM',1,NULL,1,856,'PENDING','lkasfd'),(17,2,1,'PAYTM',1,NULL,1,856,'PENDING','lkasfd'),(18,1,1,'PAYTM',1,NULL,1,856,'PENDING','Make it Faster'),(19,2,2,'PAYTM',6,NULL,1,111,'PENDING','aklsdfkljasf'),(20,1,2,'PAYTM',2,NULL,1,674,'PENDING','make it faster'),(21,1,1,'PAYTM',1,NULL,2,1712,'PENDING','Make is Spicy...Prasanna'),(22,1,1,'PAYTM',1,'2021-11-08',2,1712,'DENIED','Make is Spicy...Prasanna'),(23,1,1,'PAYTM',1,'2021-11-08',12,10272,'PENDING','Make is Spicy...Prasanna'),(24,1,1,'PAYTM',1,'2021-11-08',1,856,'ACCEPTED','New Order');
DROP TABLE IF EXISTS `ordersnew`;
CREATE TABLE `ordersnew` (
`order_id` int NOT NULL AUTO_INCREMENT,
`custId` int DEFAULT NULL,
`venId` int DEFAULT NULL,
`MenuId` int DEFAULT NULL,
`WalSource` varchar(30) DEFAULT NULL,
`qtyord` int DEFAULT NULL,
`billAmount` double DEFAULT NULL,
`ordstatus` enum('ACCEPTED','DENIED','PENDING') DEFAULT 'PENDING',
`comments` varchar(30) DEFAULT NULL,
PRIMARY KEY (`order_id`)
);
INSERT INTO `ordersnew` VALUES (1,1,1,1,'PAYTM',1,48585,'PENDING','abc');
select * from restaurants;
select * from menu;
select * from wallet;