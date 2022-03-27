create database QuanLyVatLieu;

use QuanLyVatLieu;

# Tạo bảng Vật Liệu
create table Materials(
    id int auto_increment,
    codeMaterial nvarchar(20),
    nameMaterial nvarchar(50),
    unitMaterial nvarchar(20),
    priceMaterial int,
    primary key (id)
);
# Tạo bảng Tồn Kho
create table Inventory(
    id int auto_increment,
    idMaterial int,
    inputQuantity int,
    sumEnterQuantity int,
    sumExportQuantity int,
    primary key (id),
    foreign key (idMaterial) references Materials (id)
);
# Tạo bảng Nhà cung cấp
create table Supplier(
    id int auto_increment,
    codeSupplier nvarchar(20),
    nameSupplier nvarchar(50),
    address nvarchar(50),
    phoneNumber nvarchar(10),
    primary key (id)
);
# Tạo bảng Đơn đặt hàng
create table orrder(
    id int auto_increment,
    codeOrder nvarchar(20),
    dateOrder date,
    idSupplier int,
    primary key (id),
    foreign key (idSupplier) references Supplier (id)
);
# Tạo bảng Phiếu Nhập
create table EnterCoupon(
    id int auto_increment,
    codeEnterCoupon nvarchar(20),
    dateCoupon date,
    idOrder int,
    primary key (id),
    foreign key (idOrder) references orrder(id)
);
# Tạo bảng Phiếu xuất
create table DeliveryBill(
    id int auto_increment,
    codeDeliveryBill varchar(20),

);