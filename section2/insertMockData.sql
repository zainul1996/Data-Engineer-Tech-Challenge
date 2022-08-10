-- INSERT MOCK DATA
INSERT INTO public."Manufacturer"(name)
	VALUES ('Tesla'), ('BMW'), ('Ford'), ('Toyota'), ('Rivian');

INSERT INTO public."CarModel"(name, "manufacturerId")
	VALUES ('Model S', 1), ('Model 3', 1), ('Model X', 1),
	('E30 M3', 2), ('I8', 2), ('4 Series', 2),
	('Ford Mustang', 3), ('Fusion Sport', 3),
	('Prius', 4), ('Corolla Hybrid', 4),
	('R1S', 5), ('R1T', 5);

INSERT INTO public."Salesperson"(name)
	VALUES ('Justin'),('YuanWei'),('Zainul'),('Wendy');

INSERT INTO public."Customer"(name, "mobileNo")
	VALUES ('Khloe', 91234567), 
	('KokFong', 91234568), 
	('Ivan', 91234569), 
	('Benedict', 91234570), 
	('David', 91234571);

INSERT INTO public."Transaction"("salespersonId", "customerId", "datetimeCreated")
	VALUES (1, 1, now()),(2, 1, now()),(3, 2, now()),(4, 2, now()),(1, 3, now()),
	(2, 3, now()),(3, 4, now()),(4, 5, now()),(1, 5, now());

INSERT INTO public."Cars"(
"serialNo", "carModelId", price, weight)
	VALUES ('SG10001’, 1, 100000, 1500),(‘SG10002', 1, 100000, 1505),('SG10003', 1, 100000, 1704),('SG10004', 1, 100000, 1608),
	('SG10005', 1, 100000, 1515),('SG10006', 2, 104899, 1519),('SG10007', 2, 104899, 1530),
	('SG10008', 2, 104899, 1583),('SG10009', 2, 104899, 1618),('SG10010', 2, 104899, 1553),
	('SG10011', 3, 128452, 1625),('SG10012', 3, 128452, 1627),('SG10013', 3, 128452, 1579),
	('SG10014', 3, 128452, 1675),('SG10015', 3, 128452, 1659),('SG10016', 4, 146218, 1657),
	('SG10017', 4, 146218, 1557),('SG10018', 4, 146218, 1597),('SG10019', 4, 146218, 1561),
	('SG10020', 4, 146218, 1548),('SG10021', 5, 147236, 1664),('SG10022', 5, 147236, 1512),
	('SG10023', 5, 147236, 1526),('SG10024', 5, 147236, 1572),('SG10025', 5, 147236, 1660),
	('SG10026', 6, 175463, 1621),('SG10027', 6, 175463, 1608),('SG10028', 6, 175463, 1518),
	('SG10029', 6, 175463, 1554),('SG10030', 6, 175463, 1509),('SG10031', 7, 183228, 1674),
	('SG10032', 7, 183228, 1520),('SG10033', 7, 183228, 1604),('SG10034', 7, 183228, 1575),
	('SG10035', 7, 183228, 1559),('SG10036', 8, 194049, 1543),('SG10037', 8, 194049, 1540),
	('SG10038', 8, 194049, 1533),('SG10039', 8, 194049, 1576),('SG10040', 8, 194049, 1628),
	('SG10041', 9, 186556, 1550),('SG10042', 9, 186556, 1606),('SG10043', 9, 186556, 1515),
	('SG10044', 9, 186556, 1560),('SG10045', 9, 186556, 1687),('SG10046', 10, 159186, 1652),
	('SG10047', 10, 159186, 1587),('SG10048', 10, 159186, 1673),('SG10049', 10, 159186, 1568),
	('SG10050', 10, 159186, 1530),('SG10051', 11, 164873, 1563),('SG10052', 11, 164873, 1556),
	('SG10053', 11, 164873, 1637),('SG10054', 11, 164873, 1583),('SG10055', 11, 164873, 1618),
	('SG10056', 12, 175043, 1528),('SG10057', 12, 175043, 1529),('SG10058', 12, 175043, 1553),
	('SG10059', 12, 175043, 1625),('SG10060', 12, 175043, 1680);
	
-- 	UPDATE CARS TABLE TO INCLUDE TRANSACTION DETAILS
UPDATE public."Cars"
	SET "transactionId"= 1
	WHERE "serialNo" = 'SG10031';

UPDATE public."Cars"
	SET "transactionId"= 2
	WHERE "serialNo" = 'SG10051';

UPDATE public."Cars"
	SET "transactionId"= 3
	WHERE "serialNo" = 'SG10006';
	
UPDATE public."Cars"
	SET "transactionId"= 4
	WHERE "serialNo" = 'SG10041';
	
UPDATE public."Cars"
	SET "transactionId"= 5
	WHERE "serialNo" = 'SG10001';

UPDATE public."Cars"
	SET "transactionId"= 5
	WHERE "serialNo" = 'SG10002';

UPDATE public."Cars"
	SET "transactionId"= 6
	WHERE "serialNo" = 'SG10007';
	
UPDATE public."Cars"
	SET "transactionId"= 7
	WHERE "serialNo" = 'SG10036';

UPDATE public."Cars"
	SET "transactionId"= 8
	WHERE "serialNo" = 'SG10021';

UPDATE public."Cars"
	SET "transactionId"= 9
	WHERE "serialNo" = 'SG10026';