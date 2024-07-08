use MobileOnlineShop ;
DROP TABLE IF EXISTS Payment ; 
DROP TABLE IF EXISTS Orders ; 
DROP TABLE IF EXISTS Product_Cart ; 
DROP TABLE IF EXISTS Cart ;
DROP TABLE IF EXISTS Product ; 
DROP TABLE IF EXISTS Branch ; 
DROP TABLE IF EXISTS Store  ;
DROP TABLE IF EXISTS Buyer ; 






CREATE TABLE Store (
    S_ID INT PRIMARY KEY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Address NVARCHAR(100) NOT NULL
);

CREATE TABLE Branch (
    Branch_Number INT NOT NULL,
    StoreID INT NOT NULL,
    Address NVARCHAR(100) NOT NULL,
    MobileNumber NVARCHAR(20) NOT NULL,  
    PRIMARY KEY (Branch_Number, StoreID),
    FOREIGN KEY (StoreID) REFERENCES Store(S_ID)
);

CREATE TABLE Buyer (
    B_ID INT PRIMARY KEY NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Address NVARCHAR(100) NOT NULL,
    WalletBalance DECIMAL(10, 2) NOT NULL,
    PhoneNumber NVARCHAR(11) NOT NULL  /*FORMAT 09.........*/
);

CREATE TABLE Product (
    P_ID INT PRIMARY KEY NOT NULL,
    Color NVARCHAR(20) NOT NULL,
    ModelName NVARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Image NVARCHAR(200),
    SoftwareSpecifications NVARCHAR(MAX),
    HardwareSpecifications NVARCHAR(MAX),
    BranchNumber INT NOT NULL,
    StID INT NOT NULL,
	Quantity INT NOT NULL , 
    FOREIGN KEY (BranchNumber , StID) REFERENCES Branch(Branch_Number , StoreID),
);

CREATE TABLE Cart (
    C_ID INT PRIMARY KEY NOT NULL,
    BuyerID INT NOT NULL,
    TotalPrice DECIMAL(10, 2)  ,
    FOREIGN KEY (BuyerID) REFERENCES Buyer(B_ID)
);

CREATE TABLE Product_Cart (
    ProductID INT NOT NULL,
    CartID INT NOT NULL,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Product(P_ID),
    FOREIGN KEY (CartID) REFERENCES Cart(C_ID),
	PRIMARY KEY (ProductID , CartID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    BuyerID INT NOT NULL,
    FOREIGN KEY (BuyerID) REFERENCES Buyer(B_ID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus NVARCHAR(50) NOT NULL,
	ShippingType NVARCHAR(50) NOT NULL ,
    ShippingCost DECIMAL(10, 2) NOT NULL,
    BuyerID INT NOT NULL,
	CartId INT NOT NULL ,
	TotalPrice INT , 
	FOREIGN KEY (CartId) REFERENCES Cart(C_ID) , 
    FOREIGN KEY (BuyerID) REFERENCES Buyer(B_ID)
);