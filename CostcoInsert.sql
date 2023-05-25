USE CostcoDatabase;

INSERT INTO Members ( FirstName, MiddleName, LastName, PhoneNumber, StreetAddress, City, State, ZipCode, MemberType )
VALUES ( 'Leslie', 'Barbara', 'Knope', '7655552890', '2547  Kimberly Way', 'Pawnee', 'IN', '47302', 'Executive' ),
	   ( 'Ann', 'Meredith', 'Perkins', '7655552738', '4747  Goldie Lane', 'Pawnee', 'IN','47305', 'GoldStar' ),
	   ( 'Ron', 'Ulysses', 'Swanson', '765552352', '2795  Private Lane','Pawnee', 'IN', '47308', 'Business' ),
	   ( 'Tom', NULL, 'Haverford', '7655551509', '142 Quary Lane', 'Pawnee', 'IN', '47302', 'Executive' ),
	   ( ' Donna', NULL, 'Meagle', '7655556768', '2565  Murphy Court','Pawnee', 'IN', '47305', 'GoldStar' ),
	   ( 'Garry', NULL, 'Gergich', '9305551753', '112  Paradise Lane', 'Pawnee', 'IN', '47317', 'Business' ),
	   ( 'April', 'Roberta', 'Ludgate', '9305558090', '2357  Bassell Avenue', 'Pawnee', 'IN', '47320', 'GoldStar' ),
	   ( 'Andy', 'Maxwell', 'Dwyer', '9305554109', '2357  Bassell Avenue', 'Pawnee', 'IN', '47320', 'GoldStar' ),
	   ( 'Ben', NULL, 'Wyatt', '9305558324', '3760  Parrill Court', 'Indianapolis', 'IN', '46077', 'Business' ),
	   ( 'Chris', NULL, 'Traeger', '9305558039', '4963  Ashcraft Court', 'Indianapolis', 'IN', '46088', 'Executive' ),
	   ( 'Craig', NULL, 'Middlebrooks', '4635556525', '891  Park Avenue', 'Eagleton', 'IN', '47315', 'GoldStar' ),
	   ( 'Jean-Ralphio', NULL, 'Saperstein', '4635558634', '1546  Fort Street', 'Pawnee', 'IN', '47302', 'Business' ),
	   ( 'Lucy', NULL, 'Santo Domingo', '4635558634', '4025  Capitol Avenue', 'Pawnee', 'IN', '47305', 'Executive' ),
	   ( 'Diane', NULL, 'Lewis', '4635556935', '2706  Brookview Drive', 'Pawnee', 'IN', '47308', 'GoldStar' ),
	   ( 'Tammy', 'Two', 'Swanson', '4635557635', '2770  Lynn Ogden Lane', 'Pawnee', 'IN', '47305', 'Business' );

INSERT INTO Executive ( MemberID, PercentBack )
VALUES ( '1', '2' ),
	   ( '4', '2' ),
	   ( '10', '2' ),
	   ( '13', '2' );

INSERT INTO GoldStar ( MemberID, Cards )
VALUES ( '2', '1' ),
	   ( '5', '1' ),
	   ( '7', '2' ),
	   ( '8', '2' ),
	   ( '11', '1' ),
	   ( '14', '1' );

INSERT INTO Business ( MemberID, BusinessName )
VALUES ( '3', 'Very Good'),
	   ( '6', 'Painters LLC.'),
	   ( '9', 'Ice Town'),
	   ( '12', 'Entertainment 720'),
	   ( '15', 'Library Inc.');

INSERT INTO MemberEmails ( MemberID, EmailAddress, PrimaryEmailFlag )
VALUES ( '1', 'leslieknope@indiana.gov', 'Y' ),
	   ( '1', 'leslieknope@gmail.com', 'N' ),
	   ( '2', 'annperkins@gmail.com', 'Y' ),
	   ( '4', 'tommyhaverford@indiana.gov', 'Y' ),
	   ( '5', 'donnameagle@indiana.gov', 'Y' ),
	   ( '6', 'jerrygergich@indiana.gov', 'Y' ),
	   ( '9', 'benwyatt@indiana.gov', 'Y' ),
	   ( '9', 'benwyatt@gmail.com' , 'N' ),
	   ( '10', 'christraeger@indiana.gov', 'Y' ),
	   ( '10', 'christraeger@gmail.com', 'N' ),
	   ( '11', 'craigmiddlebrooks@indiana.gov', 'Y' ),
	   ( '12', 'baddysaperstein@hotmail.com', 'Y' ),
	   ( '13', 'lucysd@gmail.com', 'Y' ),
	   ( '14', 'dianeswanson@gmail.com', 'Y' ),
	   ( '15', 'tammytwo@indiana.gov', 'Y' );

INSERT INTO Products ( ProductName, ProductDescription, SalesPrice, InventoryOnHand )
VALUES ( 'Beet Juice', 'The beetiest of juices.', '14.15', '45'),
	   ( 'Duke Silver T-shirt', 'A shirt with the face of Duke Silver', '12.95', '30'),
	   ( 'Lil Sebastian stuffed animal', 'To commemorate the loss of the magnificent Lil Sebastian', '35.99', '4'),
	   ( 'Worlds Best Boss Mug', 'Be the boss of you with this classic white coffee mug.', '13.99', '150'),
	   ( 'Schrute Farms Shirt', 'The best beet farm and bed & breakfast', '18.99', '204'),
	   ( 'Bobble head', 'Own a replica of Dwight K. Schrute', '20.99', '18' ),
	   ( 'Bonfire Candle', 'Enjoy the scent of a bonfire in your home', '22.99', '30'),
	   ( 'Paper (150 ct.)', 'White paper', '10.99', '19'),
	   ( 'Waffle Mix', 'Waffles made by JJ, great dog laxatives', '8.99', '34'),
	   ( 'Printer', 'Absolutely non-flammable printer', '50.99', '20'),
	   ( 'Cones of Dunshire', 'A board game of elaborate gameplay and rules', '100.99', '20'),
	   ( 'Unity Quilt', 'Great for weaving dsyfunctional family lives together', '5.99', '39'),
	   ( 'Snake Juice', 'High-end Kahlua-style Liquer', '8.99', '42'),
	   ( 'Mouse Rat T-Shirt', 'Formerly known as Phil Collins Dad', '1.95', '100'),
	   ( 'Allergic for Men Scent', 'Causes a reaction', '15.99', '66');


INSERT INTO Vendors ( VendorName, VendorDescription )
VALUES ( 'Schrute Farms', 'The best beet farm and bed & breakfast' ),
	   ( 'Duke Silver', 'Come love with me and maybe we can walk through fire together'),
	   ( 'Entertainment 720', 'A premiere, high-end, all-media entertainment conglomerate'),
	   ( 'Dunder Mifflin', 'A mid-range medium-sized paper company in Scranton, PA' ),
	   ( 'JJs Diner', 'Best breakfast food in Pawnee, IN.' ),
	   ( 'Prince Family Paper', 'A small family owned business that is very trusting of people.' ),
	   ( 'Serenity by Jan', 'All the scents and smells from Jan Levinson' ),
	   ( 'Sabre Printers', 'Printer company based out of Tallahassee, FL' ),
	   ( 'Michael Scott Paper Co.', 'Paper Company' ),
	   ( 'Threat Level Midnight LLC', 'Spy goods' ),
	   ( 'Leslie Knope Emporium', 'For all the historical Pawnee knowledge and goods.' ),
	   ( 'Gryzzl', 'Cringeworthy technology items.' ),
	   ( 'Toms Bistro', 'A classy, authentic new-world Italian restaurant.' ),
	   ( 'Rat Mouse', 'Currently known as Mouse Rat' ),
	   ( 'Dennis Feinstein', 'Formerly known as Dante Fiero' );


INSERT INTO ProductVendors ( ProductID, VendorID, UnitCost)
VALUES ( '1', '1', '10.61'),
	   ( '2', '2', '9.71'),
	   ( '3', '3', '26.99'),
	   ( '4', '4', '10.49'),
	   ( '5', '9', '14.24'),
	   ( '6', '10', '15.24'),
	   ( '7', '7', '17.24'),
	   ( '8', '6', '8.24'),
	   ( '9', '5', '6.74'),
	   ( '10', '8', '38.24'),
	   ( '11', '12', '75.74'),
	   ( '12', '11', '4.49'),
	   ( '13', '13', '6.74'),
	   ( '14', '14', '1.46'),
	   ( '15', '15', '11.99');


INSERT INTO Stores( StreetAddress, City, State, ZipCode)
VALUES ( '555  Cerullo Road', 'Pawnee', 'IN', '4703'),
	   ( '1890  Stark Hollow Road', 'Eagleton', 'IN', '4719'),
	   ( '2281  Todds Lane', 'Muncie', 'IN', '4705');


INSERT INTO Orders ( MemberID, StoreID, OrderDate, OrderTime, OrderStatus)
VALUES ( '1', '1', '2020-01-01', '22:03:24', 'Fulfilled'),
	   ( '2', '2', '2020-01-02', '12:05:04', 'Back Ordered'),
	   ( '3', '3', '2020-01-05', '02:07:54', 'Pending'),
	   ( '4', '2', '2020-01-20', '06:09:23', 'Fulfilled'),
	   ( '5', '3', '2020-01-20', '16:11:45', 'Back Ordered'),
	   ( '6', '1', '2020-02-19', '20:13:34', 'Pending'),
	   ( '7', '3', '2020-02-20', '12:17:24', 'Fulfilled'),
	   ( '8', '1', '2020-02-29', '04:21:58', 'Back Ordered'),
	   ( '9', '2', '2020-03-01', '14:19:01', 'Pending'),
	   ( '10', '1', '2020-03-12', '04:12:15', 'Fulfilled'),
	   ( '11', '2', '2020-03-12', '06:23:04', 'Back Ordered'),
	   ( '12', '3', '2020-03-15', '08:25:07', 'Pending'),
	   ( '13', '2', '2020-03-15', '10:27:33', 'Fulfilled'),
	   ( '14', '3', '2020-03-15', '12:29:13', 'Back Ordered'),
	   ( '15', '1', '2020-03-16', '02:31:35', 'Pending'),
	   ( '1', '3', '2020-03-16', '16:33:22', 'Fulfilled'),
	   ( '2', '1', '2020-03-17', '06:25:32', 'Back Ordered'),
	   ( '3', '2', '2020-03-17', '08:38:30', 'Pending'),
	   ( '4', '1', '2020-03-17', '10:39:24', 'Fulfilled'),
	   ( '5', '2', '2020-03-18', '14:48:34', 'Back Ordered'),
	   ( '6', '3', '2020-03-18', '15:24:55', 'Pending'),
	   ( '7', '2', '2020-03-18', '17:33:22', 'Fulfilled'),
	   ( '8', '3', '2020-03-19', '20:32:51', 'Back Ordered'),
	   ( '9', '1', '2020-03-19', '22:01:11', 'Pending'),
	   ( '10', '3', '2020-03-19', '23:44:34', 'Fulfilled'),
	   ( '11', '1', '2020-03-22', '09:24:48', 'Back Ordered'),
	   ( '12', '2', '2020-03-22', '11:34:55', 'Pending'),
	   ( '13', '1', '2020-03-26', '14:22:44', 'Fulfilled'),
	   ( '14', '2', '2020-03-26', '15:53:33', 'Back Ordered'),
	   ( '15', '3', '2020-03-26', '20:33:11', 'Pending'),
	   ( '1', '2', '2020-04-03', '04:22:46', 'Fulfilled'),
	   ( '2', '3', '2020-04-03', '09:17:29', 'Back Ordered'),
	   ( '3', '1', '2020-04-03', '11:43:17', 'Pending'),
	   ( '4', '3', '2020-04-03', '11:45:33', 'Fulfilled'),
	   ( '5', '2', '2020-04-04', '14:46:43', 'Back Ordered'),
	   ( '6', '1', '2020-04-04', '15:33:22', 'Pending'),
	   ( '7', '1', '2020-04-05', '20:32:11', 'Fulfilled'),
	   ( '8', '1', '2020-04-07', '07:33:56', 'Back Ordered'),
	   ( '9', '3', '2020-04-07', '15:21:45', 'Pending'),
	   ( '10', '2', '2020-04-07', '19:39:51', 'Fulfilled');
	   
INSERT INTO OrderLines ( OrderID, ProductID, Price, Quantity)
VALUES ( '1', '9', '8.99', '7'),
	   ( '2', '1', '14.15', '1'),
	   ( '3', '3', '35.99', '1'),
	   ( '4', '13', '8.99', '15'),
	   ( '5', '7', '22.99', '3'),
	   ( '6', '8', '10.99', '1'),
	   ( '7', '2', '12.95', '1'),
	   ( '8', '14', '1.95', '10'),
	   ( '9', '11', '100.99', '1'),
	   ( '10', '4', '13.99', '1'),
	   ( '11', '10', '50.99', '1'),
	   ( '12', '13', '8.99', '1'),
	   ( '13', '13', '8.99', '1'),
	   ( '14', '2', '12.95', '1'),
	   ( '15', '2', '12.95', '1'),
	   ( '16', '12', '5.99', '1'),
	   ( '17', '6', '20.99', '1'),
	   ( '18', '8', '10.99', '1'),
	   ( '19', '15', '15.99', '1'),
	   ( '20', '3', '35.99', '1'),
	   ( '21', '6', '20.99', '1'),
	   ( '22', '14', '1.95', '1'),
	   ( '23', '3', '12.95', '1'),
	   ( '24', '9', '8.99', '1'),
	   ( '25', '7', '22.99', '1'),
	   ( '26', '1', '14.15', '1'),
	   ( '27', '15', '15.99', '1'),
	   ( '28', '15', '15.99', '1'),
	   ( '29', '4', '14.99', '1'),
	   ( '30', '15', '15.99', '1'),
	   ( '31', '14', '1.95', '15'),
	   ( '32', '8', '10.99', '1'),
	   ( '33', '2', '12.95', '1'),
	   ( '34', '10', '50.99', '1'),
	   ( '35', '13', '8.99', '1'),
	   ( '36', '8', '22.99', '1'),
	   ( '37', '6', '20.99', '1'),
	   ( '38', '1', '14.15', '1'),
	   ( '39', '10', '50.99', '1'),
	   ( '40', '3', '35.99', '1');


INSERT INTO Employees ( StoreID, SSN, FirstName, MiddleName, LastName, StreetAddress, City, State, ZipCode, HourlyWage, EmployeeType )
VALUES ( '1', '502247970', 'Michael', 'Gary', 'Scott', '183 Badger Pond', 'Scranton', 'PA', '18503', '15', 'Administrator'),
	   ( '2', '308326053', 'James', NULL, 'Halpert', '415 Aspen Court', 'Scranton', 'PA', '18519', '17', 'Administrator'),
	   ( '1', '307119212', 'Pamela', 'Morgan', 'Beesley', '415 Aspen Court', 'Scranton', 'PA', '18519', '14', 'Cashier'),
	   ( '1', '875360106', 'Dwight', 'Kurt', 'Schrute', '3812 Hillhaven Drive', 'Scranton', 'PA', '18529', '15', 'Administrator'),
	   ( '3', '924536678', 'Angela', 'Noelle', 'Martin', '4231 Emeral Dreams Drive', 'Scranton', 'PA', '18521', '14', 'FoodService'),
	   ( '3', '154356538', 'Oscar', NULL, 'Martinez', '2889 Memory Lane', 'Scranton', 'PA', '18521', '14', 'FoodService'),
	   ( '1', '136853249', 'Kevin', NULL, 'Malone', '3849 Martha Street', 'Scranton', 'PA', '18505', '14', 'FoodService'),
	   ( '2', '916585470', 'Phyllis', 'Lapin', 'Vance', '3075 Mandan Road', 'Scranton', 'PA', '18513', '15', 'Cashier'),
	   ( '3', '798298976', 'Stanley', NULL, 'Hudson', '241 Meadow Lane', 'Scranton', 'PA', '18531', '15', 'Cashier'),
	   ( '1','658294885', 'Toby', NULL, 'Flenderson', '471 Murry Street', 'Scranton', 'PA', '18504', '14', 'FoodService'),
	   ( '2', '209599899', 'Kelly', 'Rajnigandha', 'Kapoor', '3388 Francis Mine', 'Scranton', 'PA', '18490', '14', 'FoodService'),
	   ( '2', '284911802', 'Ryan', 'Bailey', 'Howard', '2851 Romano Street', 'Scranton', 'PA', '18530', '14', 'FoodService'),
	   ( '3', '633964491', 'Andrew', 'Baines', 'Bernard', '124 Cornell Street', 'Stamford', 'CT', '06831', '14', 'Cashier'),
	   ( '2', '464650896', 'Kelly', 'Erin', 'Hannon', '3352 Lucky Duck Drive', 'Scranton', 'PA', '18532', '14', 'Cashier'),
	   ( '3', '584759921', 'Creed', NULL, 'Bratton', 'Unknown', 'Scranton', 'PA', '18500', '18', 'FoodService');

INSERT INTO Administrator ( EmployeeID, Department)
VALUES ( '1', 'Sales'),
	   ( '2', 'Sales'),
	   ( '4', 'Sales'),
	   ( '10', 'Human Resources');

INSERT INTO Cashier ( EmployeeID, RegisterID)
VALUES ( '3', '139'),
	   ( '8', '142'),
	   ( '9', '119'),
	   ( '13', '108'),
	   ( '14', '138');

INSERT INTO FoodService ( EmployeeID, Station)
VALUES ( '5', 'Floor'),
	   ( '6', 'Floor'),
	   ( '7', 'Floor'),
	   ( '11', 'Food Court'),
	   ( '12', 'Food Court'),
	   ( '15', 'Bakery');


INSERT INTO Schedule ( ScheduleID, EmployeeID, WorkDate, HoursWorked )
VALUES ( '1','1', '2020-02-01', '4'),
	   ( '1', '4', '2020-02-01', '8'),
	   ( '1', '5', '2020-02-01', '8'),
	   ( '1', '6', '2020-02-01', '8'),
	   ( '1', '11', '2020-02-01', '8'),
	   ( '1', '12', '2020-02-01', '8'),
	   ( '2', '2', '2020-02-02', '9'),
	   ( '2', '3', '2020-02-02', '9'),
	   ( '2', '7', '2020-02-02', '8'),
	   ( '2', '8', '2020-02-02', '8'),
	   ( '2', '9', '2020-02-02', '8'),
	   ( '2', '14', '2020-02-02', '8'),
	   ( '2', '10', '2020-02-02', '10'),
	   ( '3', '1', '2020-02-03', '5'),
	   ( '3', '5', '2020-02-03', '8'),
	   ( '3', '7', '2020-02-03', '8'),
	   ( '3', '13', '2020-02-03', '8'),
	   ( '3', '14', '2020-02-03', '8'),
	   ( '3', '15', '2020-02-03', '7'),
	   ( '3', '6', '2020-02-03', '8'),
	   ( '3', '8', '2020-02-03', '8'),
	   ( '3', '9', '2020-02-03', '8'),
	   ( '4', '2', '2020-02-04', '9'),
	   ( '4', '3', '2020-02-04', '9'),
	   ( '4', '4', '2020-02-04', '9'),
	   ( '4', '5', '2020-02-04', '9'),
	   ( '4', '10', '2020-02-04', '9'),
	   ( '4', '13', '2020-02-04', '9'),
	   ( '4', '14', '2020-02-04', '9'),
	   ( '4', '1', '2020-02-04', '4'),
	   ( '5', '10', '2020-02-05', '9'),
	   ( '5', '9', '2020-02-05', '9'),
	   ( '5', '8', '2020-02-05', '9'),
	   ( '5', '7', '2020-02-05', '9'),
	   ( '5', '6', '2020-02-05', '9'),
	   ( '5', '5', '2020-02-05', '9'),
	   ( '5', '15', '2020-02-05', '6'),
	   ( '5', '13', '2020-02-05', '7'),
	   ( '5', '12', '2020-02-05', '8'),
	   ( '5', '1', '2020-02-05', '4');
























	   

