﻿use MobileOnlineShop ;
INSERT INTO Store(S_ID , Name , Address)
VALUES (1 , 'MOBINO' , 'TEHRAN_VALIASR_ST') ,
       (2, 'MOBILEBAZA' , 'KASHAN_HAKIM SQ') , 
	   (3 , 'payetakht_mobile' , 'TEHRAN_DAMAVAND ST') ,
	   (4 , 'MOBTO' , 'TABRIZ_MOSADEGH ST') ,
	   (5 , 'DIGI MOBILE' , 'TEHRAN _ HAKIM ST') , 
	   (6 , 'MOBIMART'  , 'HAMEDAN BOALISINA SQ') , 
	   (7 , 'MOSIMOBILE' , 'TEHRAN-SARSABZ') ,
	   (8 , 'MOBILE-CITY'  , 'HAMEDAN - BABATAHER SQ') , 
	   (9 , 'ALVAND-MOBILE'  , 'HAMEDAN -ALVAND-ST'),
	   (10 , 'MOBMOB'  , 'TEHRAN-SARSABZ ') ;
INSERT INTO Branch (Branch_Number, StoreID, Address, MobileNumber)
VALUES
(1, 1, 'Address 1 - MOBINO', '02177231231'),
(2, 1, 'Address 2 - MOBINO', '02177324561'),
(3, 1, 'Address 3 - MOBINO', '02133124567'),
(4, 1, 'Address 4 - MOBINO', '02133129189'),
(1, 2, 'Address 1 - MOBILEBAZA', '03181234312'),
(2, 2, 'Address 2 - MOBILEBAZA', '03181245431'),
(3, 2, 'Address 3 - MOBILEBAZA', '03134325671'),
(4, 2, 'Address 4 - MOBILEBAZA', '03134336781'),
(1, 3, 'Address 1 - payetakht_mobile', '02177812312'),
(2, 3, 'Address 2 - payetakht_mobile', '02177123214'),
(3, 3, 'Address 3 - payetakht_mobile', '02166312787'),
(4, 3, 'Address 4 - payetakht_mobile', '02134521331'),
(1, 4, 'Address 1 - MOBTO', '04145657612'),
(2, 4, 'Address 2 - MOBTO', '04145657632'),
(3, 4, 'Address 3 - MOBTO', '04131212981'),
(4, 4, 'Address 4 - MOBTO', '04132659199'),
(1, 5, 'Address 1 - DIGI MOBILE', '02176767612'),
(2, 5, 'Address 2 - DIGI MOBILE', '02177777712'),
(3, 5, 'Address 3 - DIGI MOBILE', '02123324554'),
(4, 5, 'Address 4 - DIGI MOBILE', '02156657812'),
(1, 6, 'Address 1 - MOBIMART', '08198891221'),
(2, 6, 'Address 2 - MOBIMART', '08176666121'),
(3, 6, 'Address 3 - MOBIMART', '08172231211'),
(4, 6, 'Address 4 - MOBIMART', '08199991212'),
(1, 7, 'Address 1 - MOSIMOBILE', '02177546571'),
(2, 7, 'Address 2 - MOSIMOBILE', '02177459123'),
(3, 7, 'Address 3 - MOSIMOBILE', '02177651232'),
(4, 7, 'Address 4 - MOSIMOBILE', '02177691281'),
(1, 8, 'Address 1 - MOBILE-CITY', '08143431229'),
(2, 8, 'Address 2 - MOBILE-CITY', '08143431228'),
(3, 8, 'Address 3 - MOBILE-CITY', '08143431227'),
(4, 8, 'Address 4 - MOBILE-CITY', '08143431226'),
(1, 9, 'Address 1 - ALVAND-MOBILE', '08133334445'),
(2, 9, 'Address 2 - ALVAND-MOBILE', '08131212123'),
(3, 9, 'Address 3 - ALVAND-MOBILE', '08199001231'),
(4, 9, 'Address 4 - ALVAND-MOBILE', '08199001232'),
(1, 10, 'Address 1 - MOBMOB', '02177455461'),
(2, 10, 'Address 2 - MOBMOB', '02177456571'),
(3, 10, 'Address 3 - MOBMOB', '02177655112'),
(4, 10, 'Address 4 - MOBMOB', '02177901230');
INSERT INTO Buyer (B_ID, FirstName, LastName, Email, Password, Address, WalletBalance, PhoneNumber)
VALUES
(1, 'mohammad', 'sadeghi', 'mohammadsadeghi@gmail.com', '@MOSADEGHi', 'Kocheh 2, Kashani Square, Tehran', 12000000, '09123454121'),
(2, 'sadegh', 'rahimi', 'sdgrahim@gmail.com', '@sadeHi12', 'Plak 1, Hosseini Kocheh, Narmak Square, Tehran', 10000000, '09353332289'),
(3, 'sara', 'rezaii', 'sararez12@gmail.com', 'imsara31', 'Plak 12, Hosseini Street, Valiasr Square, Tehran', 1000000, '09101245618'),
(4, 'mohsen', 'moeinfar', 'mohsenmoein43far@gmail.com', 'mosione8711', 'Plak 32, Shahin Kocheh, Damavand Street, Tehran', 8000000, '09055901231'),
(5, 'iman', 'ghader', 'imgh32@gmail.com', 'im12imghW', 'Plak 1, Sharifi Kocheh, Nazamabad Square', 0, '09353332274'),
(6, 'roham', 'izadidoost', 'rohamizad12idoost@gmail.com', 'izadroham12', 'Plak 110, Sar Sabz Square, Tehran', 10000000, '09107685618'),
(7, 'dayana', 'yosefi', 'daya12y3@gmail.com', 'daya@yosefi12', 'Plak 10, Khorosvi Kocheh, Damavand Street, Tehran', 300000, '09109898990'),
(8, 'hamid', 'saeedi', 'hamsaeedi17@gmail.com', 'saeediham345', 'Plak 32, Saeedi Street, Bouali Square', 10000000, '09123121290'),
(9, 'diana', 'hosseini', 'dihoss34@gmail.com', 'dian32hoss', 'Plak 9, Kocheh 11, Beheshti Street, Azadi Square', 1000000, '09361236344'),
(10, 'mohammadreza', 'ebrahimi', 'mamadrzebi89@gmail.com', 'ebimamad12@1', 'Plak 1, Kocheh 32, Farjam Street, Resalat Square', 9000000, '09354490129'),
(11, 'romina', 'hasanzade', 'rominahasanzade79@gmail.com', 'rimn12has', 'Plak 144, Valiasr Street', 10000000, '09055678901'),
(12, 'marzie', 'jafari', 'marzi7812@gmail.com', 'marzijafari9', 'Plak 2, Shahidi Kocheh, Modarres Square', 0, '09121232456');
INSERT INTO Product(P_ID , Color , ModelName , Price , Image , SoftwareSpecifications , HardwareSpecifications , BranchNumber ,StID , Quantity)
VALUES 
(1, 'Black', 'iPhone 12', 20000000, 'iphone12.jpg', 'iOS 14', 'A14 Bionic chip', 1, 1 ,20),
(2, 'Silver', 'Samsung Galaxy S20', 10000000, 'galaxyS20.jpg', 'Android 10', 'Snapdragon 865', 2, 10 ,3),
(3, 'Blue', 'Google Pixel 5', 11000000, 'pixel5.jpg', 'Android 11', 'Snapdragon 765G', 1, 2 , 4),
(4, 'Red', 'Huawei P40 Pro', 15000000, 'huaweiP40Pro.jpg', 'EMUI 10.1', 'Kirin 990 5G', 2, 3 , 30),
(5, 'Gold', 'iPhone 11', 15000000, 'iphone11.jpg', 'iOS 13', 'A13 Bionic chip', 1, 3 , 12),
(6, 'White', 'Samsung Galaxy Note 20 Ultra', 20000000, 'galaxyNote20Ultra.jpg', 'Android 10', 'Snapdragon 865+', 2, 9 , 12),
(7, 'Black', 'OnePlus 8 Pro', 9000000, 'oneplus8pro.jpg', 'OxygenOS 10', 'Snapdragon 865', 1, 4 , 0),
(8, 'Silver', 'Google Pixel 4a', 15000000, 'pixel4a.jpg', 'Android 10', 'Snapdragon 730G', 2, 2 ,1),
(9, 'Blue', 'Xiaomi Mi 10', 12000000, 'xiaomiMi10.jpg', 'MIUI 11', 'Snapdragon 865', 1, 3 , 2),
(10, 'Black', 'iPhone SE', 8000000, 'iphoneSE.jpg', 'iOS 13', 'A13 Bionic chip', 2, 1 , 3),
(11, 'Purple', 'Samsung Galaxy S21 Ultra', 15000000, 'galaxyS21Ultra.jpg', 'Android 11', 'Exynos 2100', 1, 2 , 4),
(12, 'White', 'Huawei Mate 40 Pro', 10400000, 'huaweiMate40Pro.jpg', 'EMUI 11', 'Kirin 9000', 2, 3 , 5),
(13, 'Black', 'Google Pixel 4 XL', 12398000, 'pixel4XL.jpg', 'Android 10', 'Snapdragon 855', 1, 5 ,6),
(14, 'Blue', 'OnePlus 9', 12000000, 'oneplus9.jpg', 'OxygenOS 11', 'Snapdragon 888', 2, 2 , 7),
(15, 'Red', 'Xiaomi Redmi Note 9 Pro', 18000000, 'redmiNote9Pro.jpg', 'MIUI 11', 'Snapdragon 720G', 3, 7 , 8),
(16, 'Gold', 'iPhone XR', 14500000, 'iphoneXR.jpg', 'iOS 12', 'A12 Bionic chip', 2, 1 , 1),
(17, 'Silver', 'Samsung Galaxy A52', 16500000, 'galaxyA52.jpg', 'Android 11', 'Snapdragon 720G', 1, 2 ,2),
(18, 'Green', 'Huawei P30 Pro', 12350000, 'huaweiP30Pro.jpg', 'EMUI 10', 'Kirin 980', 2, 2 , 3),
(19, 'Black', 'Google Pixel 3a', 7000000, 'pixel3a.jpg', 'Android 9', 'Snapdragon 670', 1, 3 , 4),
(20, 'White', 'OnePlus Nord', 8500000, 'oneplusNord.jpg', 'OxygenOS 10', 'Snapdragon 765G', 2, 5 , 0),
(21, 'Blue', 'Xiaomi Mi 11', 8700000, 'xiaomiMi11.jpg', 'MIUI 12', 'Snapdragon 888', 4, 2 , 0),
(22, 'Black', 'iPhone X', 8100000, 'iphoneX.jpg', 'iOS 11', 'A11 Bionic chip', 1, 3 , 0),
(23, 'Silver', 'Samsung Galaxy A71', 9700000, 'galaxyA71.jpg', 'Android 10', 'Snapdragon 730', 2, 1 ,1),
(24, 'Blue', 'Huawei Nova 7i', 9000000, 'huaweiNova7i.jpg', 'EMUI 10', 'Kirin 810', 1, 2 , 2),
(25, 'Red', 'Google Pixel 2 XL', 9700000, 'pixel2XL.jpg', 'Android 8', 'Snapdragon 835', 2, 2 ,4),
(26, 'Gold', 'OnePlus 7 Pro', 11500000, 'oneplus7pro.jpg', 'OxygenOS 9', 'Snapdragon 855', 1, 3 , 8),
(27, 'Black', 'Xiaomi Redmi Note 8', 12256789, 'redmiNote8.jpg', 'MIUI 10', 'Snapdragon 665', 2, 6 ,16),
(28, 'Purple', 'iPhone 11 Pro', 22000000, 'iphone11Pro.jpg', 'iOS 13', 'A13 Bionic chip', 3, 5 ,8),
(29, 'White', 'Samsung Galaxy S10', 12500000, 'galaxyS10.jpg', 'Android 9', 'Snapdragon 855', 2, 3 ,4),
(30, 'Black', 'Huawei P20 Pro', 16400000, 'huaweiP20Pro.jpg', 'EMUI 9', 'Kirin 970', 3, 6 ,2),
(31, 'Blue', 'Google Pixel 3 XL', 9100000, 'pixel3XL.jpg', 'Android 9', 'Snapdragon 845', 2, 2 ,1),
(32, 'Red', 'OnePlus 6T', 10000000, 'oneplus6T.jpg', 'OxygenOS 9', 'Snapdragon 845', 1, 3 ,1),
(33, 'Gold', 'Xiaomi Mi 9', 15000000, 'xiaomiMi9.jpg', 'MIUI 10', 'Snapdragon 855', 2, 8 , 5),
(34, 'Silver', 'iPhone 8 Plus', 13410000, 'iphone8Plus.jpg', 'iOS 11', 'A11 Bionic chip', 1, 4 ,12),
(35, 'Black', 'Samsung Galaxy Note 10', 13456900, 'galaxyNote10.jpg', 'Android 9', 'Snapdragon 855', 2, 3 ,24),
(36, 'White', 'Huawei P10 Plus', 14600000, 'huaweiP10Plus.jpg', 'EMUI 5', 'Kirin 960', 1, 1 ,9),
(37, 'Blue', 'Google Pixel 2', 8700000, 'pixel2.jpg', 'Android 8', 'Snapdragon 835', 2, 9 ,29),
(38, 'Red', 'OnePlus 5T', 12000000, 'oneplus5T.jpg', 'OxygenOS 4', 'Snapdragon 835', 1, 6 ,16),
(39, 'Gold', 'Xiaomi Mi 8', 8000000, 'xiaomiMi8.jpg', 'MIUI 10', 'Snapdragon 845', 2, 1 ,21),
(40, 'Silver', 'iPhone 7 Plus', 12000000, 'iphone7Plus.jpg', 'iOS 10', 'A10 Fusion chip', 2, 7 ,27),
(41, 'Black', 'Samsung Galaxy S9', 12600000, 'galaxyS9.jpg', 'Android 8', 'Exynos 9810', 2, 3 ,32),
(42, 'White', 'Huawei P9 Plus', 16900000, 'huaweiP9Plus.jpg', 'EMUI 5', 'Kirin 955', 1, 1 , 1),
(43, 'Blue', 'Google Pixel', 8000000, 'pixel.jpg', 'Android 7', 'Snapdragon 821', 2, 8 ,0),
(44, 'Red', 'OnePlus 5', 9000000, 'oneplus5.jpg', 'OxygenOS 4', 'Snapdragon 835', 1, 9 ,0),
(45, 'Gold', 'Xiaomi Mi 6', 12000000, 'xiaomiMi6.jpg', 'MIUI 8', 'Snapdragon 835', 2, 7 ,12),
(46, 'Silver', 'iPhone 6s Plus', 13000000, 'iphone6sPlus.jpg', 'iOS 9', 'A9 chip', 1, 6 ,13),
(47, 'Black', 'Samsung Galaxy S8', 11000000, 'galaxyS8.jpg', 'Android 7', 'Snapdragon 835', 2, 3 ,4),
(48, 'White', 'Huawei P8', 9900900, 'huaweiP8.jpg', 'EMUI 3', 'Kirin 930', 4, 7 , 0),
(49, 'Blue', 'Google Nexus 6P', 12000000, 'nexus6P.jpg', 'Android 6', 'Snapdragon 810', 2, 2 ,12),
(50, 'Red', 'OnePlus 3T', 13000000 , 'oneplus3T.jpg', 'OxygenOS 3', 'Snapdragon 821', 1, 3 ,1),
(51, 'Gold', 'Xiaomi Mi 5', 7400000, 'xiaomiMi5.jpg', 'MIUI 7', 'Snapdragon 820', 2, 1 ,2),
(52, 'Silver', 'iPhone 6 Plus', 10000000, 'iphone6Plus.jpg', 'iOS 8', 'A8 chip', 1, 2 ,3),
(53, 'Black', 'Samsung Galaxy S7', 12666000, 'galaxyS7.jpg', 'Android 6', 'Exynos 8890', 2, 5 ,100),
(54, 'White', 'Huawei P7', 14000000, 'huaweiP7.jpg', 'EMUI 2', 'Kirin 910T', 1, 5 ,200),
(55, 'Blue', 'Google Nexus 5X', 21000000, 'nexus5X.jpg', 'Android 6', 'Snapdragon 808', 2, 4 ,20),
(56, 'Red', 'OnePlus 2', 11000000, 'oneplus2.jpg', 'OxygenOS 2', 'Snapdragon 810', 1, 3 ,50),
(57, 'Gold', 'Xiaomi Mi 4', 7000000, 'xiaomiMi4.jpg', 'MIUI 6', 'Snapdragon 801', 2, 1 ,23),
(58, 'Silver', 'iPhone 6', 9000000, 'iphone6.jpg', 'iOS 8', 'A8 chip', 1, 2 ,120),
(59, 'Black', 'Samsung Galaxy S6', 10910000, 'galaxyS6.jpg', 'Android 5', 'Exynos 7420', 2, 3 ,120),
(60, 'White', 'Huawei P6', 12000000, 'huaweiP6.jpg', 'EMUI 1', 'K3V2E', 1, 1 ,12),
(61, 'Blue', 'Google Nexus 6', 4000000, 'nexus6.jpg', 'Android 5', 'Snapdragon 805', 2, 4 ,12),
(62, 'Red', 'OnePlus One', 9000000, 'oneplusOne.jpg', 'CyanogenMod 11', 'Snapdragon 801', 1, 3 ,12),
(63, 'Gold', 'Xiaomi Mi 3', 6000000, 'xiaomiMi3.jpg', 'MIUI 5', 'Snapdragon 800', 2, 10 ,11),
(64, 'Silver', 'iPhone 5s', 12000000, 'iphone5s.jpg', 'iOS 7', 'A7 chip', 1, 2 , 0);

INSERT INTO Cart(C_ID , BuyerID , TotalPrice)
VALUES 
(1,1,0) ,
(2,2,0) ,
(3,3,0) , 
(4,4,0) , 
(5,5 ,0) , 
(6,6, 0) ,
(7,7, 0) , 
(8,8, 0) , 
(9,9, 0) , 
(10,10, 0) , 
(11,11,0) , 
(12,12,0) ; 
INSERT INTO Product_Cart(ProductID , CartID , Quantity)
VALUES 
(1 , 1 , 2) , 
(2 , 1 , 1) ,
(2 , 2 , 1) ,
(24 , 2 , 1) ,
(61 , 3 , 1) ,
(61 , 4 , 2) ,
(61 , 5 , 3) ,
(61 , 6 , 4) ,
(63 , 7 , 3) ,
(45 , 8 , 4) ,
(46 , 9 , 3) ,
(45 , 10 , 4) ;
INSERT INTO Payment(PaymentID , Amount  , PaymentDate , BuyerID)
VALUES
(1 ,20000000 ,'2024-05-03' , 1 ) , 
(2 ,10000000 ,'2023-05-03' , 4 ) , 
(3 , 5000000 , '2023-05-03' , 3) , 
(4 , 12000000 ,  '2023-05-04' , 3) , 
(5 , 13000000 ,  '2023-08-03' , 9)  ; 

INSERT INTO Orders(OrderID , OrderDate , OrderStatus , ShippingType , ShippingCost , BuyerID , CartId , TotalPrice)
VALUES
(1 , '2023-05-13' , 'Paid' , 'Express'  ,100000 , 1 , 1 ,50000000)  , 
(2 , '2023-04-13' , 'UnPaid' , 'Normal'  ,50000 , 2 , 2 ,19000000)  , 
(3 , '2023-05-12' , 'Paid' , 'Express'  ,100000 , 3 , 3 ,4000000)  , 
(4 , '2023-05-11' , 'UnPaid' , 'Normal'  ,50000 , 4 , 4 ,8000000)  , 
(5 , '2023-05-13' , 'Paid' , 'Express'  ,100000 , 5 , 5 ,12000000)  , 
(6 , '2023-05-12' , 'UnPaid' , 'Normal'  ,50000 , 6 , 6 ,16000000)  , 
(7 , '2023-05-11' , 'Paid' , 'Express'  ,100000 , 7 , 7 ,18000000)  , 
(8 , '2023-05-10' , 'UnPaid' , 'Normal'  ,50000 , 8 , 8 ,48000000)  , 
(9 , '2023-05-09' , 'Paid' , 'Express'  ,100000 , 9 , 9 , 39000000)  , 
(10 , '2023-05-13' , 'UnPaid' , 'Normal'  ,50000 , 10 , 10 ,48000000)   ; 



