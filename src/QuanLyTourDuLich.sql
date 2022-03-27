create database QuanLyTourDuLich;

use QuanLyTourDuLich;

create table City(
    Id int auto_increment,
    CityName nvarchar(50),
    primary key (Id)
);

create table Destination(
    Id int auto_increment,
    DestinationName nvarchar(50),
    PriceAvg float,
    CityID int,
    primary key (id),
    foreign key (CityID) references City(Id)
);
alter table Destination add Decription text;

create table Customer(
    Id int auto_increment,
    CustomerName nvarchar(50),
    IdentityCard nvarchar(20),
    BirthOfDay datetime,
    CityId int,
    primary key (Id),
    foreign key (CityId) references City(Id)
);

create table TypeTour(
    id int auto_increment,
    codeType nvarchar(20),
    NameType nvarchar(50),
    primary key (id)
);

create table Tour(
    id int auto_increment,
    codeTourId int,
    typeTourId int,
    priceDestination float,
    startDate date,
    endDate date,
    primary key (id),
    foreign key (typeTourId) references TypeTour(id),
    foreign key (codeTourId) references TypeTour(id)
);

create table BillTour(
     id int auto_increment,
     tour_id int,
     customer_id int,
     status boolean,
     primary key (id),
     foreign key (tour_id) references Tour(id),
     foreign key (customer_id) references Customer(Id)
);

insert into City (CityName) values ('Hà Nội');
insert into City (CityName) values ('Thái Bình');
insert into City (CityName) values ('Hồ Chí Minh');
insert into City (CityName) values ('Đà Nẵng');
insert into City (CityName) values ('Hải Phòng');

insert into Destination (DestinationName, PriceAvg, CityID, Decription) VALUES ('Hà Nội',10000,1,'Hồ Gươm');
insert into Destination (DestinationName, PriceAvg, CityID, Decription) VALUES ('Thái Bình',75237,2,'Chùa Một Cột');
insert into Destination (DestinationName, PriceAvg, CityID, Decription) VALUES ('Hồ Chí Minh',414141,3,'Sài Gòn Hoa Lệ');
insert into Destination (DestinationName, PriceAvg, CityID, Decription) VALUES ('Đà Nẵng',34534534,4,'Cầu Sông Hàn');
insert into Destination (DestinationName, PriceAvg, CityID, Decription) VALUES ('Hải Phòng',53453,1,'Cát Bà');

insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Tô Việt Anh', '1246186481641', '2001-09-17', 2);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Hoàng Thanh Trúc', '124816423652', '2002-10-12', 2);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Nguyễn Công Quân', '98795734578336', '2000-01-12', 5);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Bùi Hoàng Nam', '90849234', '2001-04-12', 1);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Lê Hải Sơn', '423874923', '2001-01-14', 4);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Bùi Thu Huyền', '328469237932', '2006-08-12', 3);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Nguyễn Văn Lương', '96349293259', '2008-08-20', 1);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Tạ Văn Tuấn', '2357296592739', '2004-06-02', 3);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Nguyễn Quang Trung', '2357927523', '1999-10-30', 5);
insert into Customer (CustomerName, IdentityCard, BirthOfDay, CityId) VALUES ('Nguyễn Đức Trọng', '2983759275', '1998-05-25', 4);

insert into TypeTour (codeType, NameType) VALUES ('LT01','Gia Đình');
insert into TypeTour (codeType, NameType) VALUES ('LT02','Công Ty');
insert into TypeTour (codeType, NameType) VALUES ('LT03','Bạn Bè');

insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (1,1,42342,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (2,3,52342,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (3,2,345345,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (1,1,12341,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (2,3,43252,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (3,2,45436,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (3,1,5756,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (2,3,56756,current_date,'2022-04-30');
insert into Tour (codeTourId, typeTourId, priceDestination, startDate, endDate) VALUES (1,2,76978,current_date,'2022-04-30');

insert into BillTour (tour_id, customer_id, status) VALUES (1,1,1);
insert into BillTour (tour_id, customer_id, status) VALUES (2,2,0);
insert into BillTour (tour_id, customer_id, status) VALUES (3,5,1);
insert into BillTour (tour_id, customer_id, status) VALUES (4,4,1);
insert into BillTour (tour_id, customer_id, status) VALUES (5,3,0);
insert into BillTour (tour_id, customer_id, status) VALUES (6,6,0);
insert into BillTour (tour_id, customer_id, status) VALUES (7,7,1);
insert into BillTour (tour_id, customer_id, status) VALUES (8,8,1);

# Thống kê số lượng tour của các thành phố

# Tính số tour có ngày bắt đầu trong tháng 3 năm 2020 (dùng count)

# Tính số tour có ngày kết thúc trong tháng 4 năm 2020