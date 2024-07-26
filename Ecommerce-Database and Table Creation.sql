create database Ecommerce;

use Ecommerce;

CREATE TABLE Customer (
    CustomerID int PRIMARY KEY AUTO_INCREMENT,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    DOB date NOT NULL,
    Email varchar(255) NOT NULL,
    Password varchar(255) NOT NULL,
    Contact varchar(255) NOT NULL
);

CREATE TABLE Country (
    CountryID int PRIMARY KEY AUTO_INCREMENT,
    CountryName varchar(255) NOT NULL
);

CREATE TABLE Province (
    ProvinceID int PRIMARY KEY AUTO_INCREMENT,
    ProvinceName varchar(255) NOT NULL
);

CREATE TABLE City (
    CityID int PRIMARY KEY AUTO_INCREMENT,
    CityName varchar(255) NOT NULL
);

CREATE TABLE ZipCode (
    ZipCodeID int PRIMARY KEY AUTO_INCREMENT,
    CityID int NOT NULL,
    ProvinceID int NOT NULL,
    CountryID int NOT NULL,
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE Address (
    AddressID int PRIMARY KEY AUTO_INCREMENT,
    HouseNo varchar(255) NOT NULL,
    Street int NOT NULL,
    CustomerID int NOT NULL,
    ZipCodeID int NOT NULL,
    Area varchar(255) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ZipCodeID) REFERENCES ZipCode(ZipCodeID)
);

CREATE TABLE Category (
    CategoryID int PRIMARY KEY AUTO_INCREMENT,
    CategoryName varchar(255) NOT NULL
);

CREATE TABLE Vendor (
    VendorID int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    Address text NOT NULL,
    Email varchar(255) NOT NULL,
    Password varchar(255) NOT NULL,
    Contact varchar(255) NOT NULL
);

CREATE TABLE Product (
    ProductID int PRIMARY KEY AUTO_INCREMENT,
    ProductName varchar(255) NOT NULL,
    CategoryID int NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE VendorProduct (
    VendorProductID int PRIMARY KEY AUTO_INCREMENT,
    VendorID int NOT NULL,
    ProductID int NOT NULL,
    Price decimal(19, 2) NOT NULL,
    Quantity int NOT NULL,
    Description text NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Courier (
    CourierID int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    Contact varchar(255) NOT NULL
);

CREATE TABLE VendorCourier (
    VendorCourierID int PRIMARY KEY AUTO_INCREMENT,
    VendorID int NOT NULL,
    CourierID int NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);

CREATE TABLE Orders (
    OrderID int PRIMARY KEY AUTO_INCREMENT,
    CustomerID int NOT NULL,
    OrderDate date NOT NULL,
    AddressID int NOT NULL,
    VendorCourierID int NOT NULL,
    TrackingID varchar(255) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (VendorCourierID) REFERENCES VendorCourier(VendorCourierID)
);

CREATE TABLE OrderedProduct (
    OrderedProductID int PRIMARY KEY AUTO_INCREMENT,
    VendorProductID int NOT NULL,
    OrderID int NOT NULL,
    Quantity int NOT NULL,
    FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Review (
    ReviewID int PRIMARY KEY AUTO_INCREMENT,
    Rating tinyint NOT NULL,
    Comment text,
    CustomerID int NOT NULL,
    OrderedProductID int NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (OrderedProductID) REFERENCES OrderedProduct(OrderedProductID)
);

CREATE TABLE Cart (
    CartID int PRIMARY KEY AUTO_INCREMENT,
    DateCreated date NOT NULL,
    CustomerID int NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CartProduct (
    CartProductID int PRIMARY KEY AUTO_INCREMENT,
    VendorProductID int NOT NULL,
    Quantity int NOT NULL,
    CartID int NOT NULL,
    FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);
