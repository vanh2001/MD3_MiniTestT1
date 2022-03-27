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
create table orrders(
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
    foreign key (idOrder) references orrders(id)
);
# Tạo bảng Phiếu xuất
create table DeliveryBill(
    id int auto_increment,
    codeDeliveryBill varchar(20),
    dateDelivery date,
    nameCustomer nvarchar(50),
    primary key (id)
);
# Tạo bảng Chi tiết đơn hàng
create table OrderDetail(
    id int auto_increment,
    idOrder int,
    idMaterial int,
    orderQuantity int,
    primary key (id),
    foreign key (idOrder) references orrders(id),
    foreign key (idMaterial) references Materials(id)
);
# Tạo bảng Chi tiết phiếu nhập
create table EnterCouponDetail(
    id int auto_increment,
    idEnterCoupon int,
    idMaterial int,
    importQuantity int,
    importUnitPrice double,
    note text,
    primary key (id),
    foreign key (idEnterCoupon) references EnterCoupon(id),
    foreign key (idMaterial) references Materials(id)
);
# Tạo bảng Chi tiết phiếu xuất
create table DeliveryBillDetail(
    id int auto_increment,
    idDeliveryBill int,
    idMaterial int,
    exportQuantity int,
    exportUnitPrice double,
    note text,
    primary key (id),
    foreign key (idDeliveryBill) references DeliveryBill(id),
    foreign key (idMaterial) references Materials(id)
);

insert into Materials (codeMaterial, nameMaterial, unitMaterial, priceMaterial) values ('VL01','Mỳ Chính', 'Cân', 20000);
insert into Materials (codeMaterial, nameMaterial, unitMaterial, priceMaterial) values ('VL02','Bột Mì', 'Cân', 15000);
insert into Materials (codeMaterial, nameMaterial, unitMaterial, priceMaterial) values ('VL03','Bò Húc', 'Lon', 10000);
insert into Materials (codeMaterial, nameMaterial, unitMaterial, priceMaterial) values ('VL04','Bim Bim', 'Gói', 5000);
insert into Materials (codeMaterial, nameMaterial, unitMaterial, priceMaterial) values ('VL05','Dầu gội', 'Chai', 85000);

insert into Inventory (idMaterial, inputQuantity, sumEnterQuantity, sumExportQuantity) VALUES (1,5,10,7);
insert into Inventory (idMaterial, inputQuantity, sumEnterQuantity, sumExportQuantity) VALUES (2,3,7,5);
insert into Inventory (idMaterial, inputQuantity, sumEnterQuantity, sumExportQuantity) VALUES (3,2,20,8);
insert into Inventory (idMaterial, inputQuantity, sumEnterQuantity, sumExportQuantity) VALUES (4,10,20,5);
insert into Inventory (idMaterial, inputQuantity, sumEnterQuantity, sumExportQuantity) VALUES (5,1,10,6);

insert into Supplier (codeSupplier, nameSupplier, address, phoneNumber) VALUES ('NCC01', 'Công ty Ajinomoto Việt Nam', 'Thành Phố Hồ Chí Minh', '0283930878');
insert into Supplier (codeSupplier, nameSupplier, address, phoneNumber) VALUES ('NCC02', 'Công ty sản xuất mỹ phẩn độc quyền ResHPCos', 'Hà Nội', '0949996969');
insert into Supplier (codeSupplier, nameSupplier, address, phoneNumber) VALUES ('NCC03', 'Nhà phân phối tạp hóa Chuyển Mận', 'Thái Bình', '0968988269');

insert into orrders (codeOrder, dateOrder, idSupplier) VALUES ('DH01', '2022-03-10', 1);
insert into orrders (codeOrder, dateOrder, idSupplier) VALUES ('DH02', '2022-03-20', 2);
insert into orrders (codeOrder, dateOrder, idSupplier) VALUES ('DH03', '2022-03-15', 3);

insert into EnterCoupon (codeEnterCoupon, dateCoupon, idOrder) VALUES ('PN01', '2022-03-10',1);
insert into EnterCoupon (codeEnterCoupon, dateCoupon, idOrder) VALUES ('PN02', '2022-03-20',2);
insert into EnterCoupon (codeEnterCoupon, dateCoupon, idOrder) VALUES ('PN03', '2022-03-15',3);

insert into DeliveryBill (codeDeliveryBill, dateDelivery, nameCustomer) VALUES ('PX01', NOW(),'Tô Việt Anh');
insert into DeliveryBill (codeDeliveryBill, dateDelivery, nameCustomer) VALUES ('PX02', '2022-03-26','Hoàng Thanh Trúc');
insert into DeliveryBill (codeDeliveryBill, dateDelivery, nameCustomer) VALUES ('PX03', '2022-03-25','Bùi Thu Huyền');

insert into OrderDetail (idOrder, idMaterial, orderQuantity) VALUES (1,2,5);
insert into OrderDetail (idOrder, idMaterial, orderQuantity) VALUES (2,3,6);
insert into OrderDetail (idOrder, idMaterial, orderQuantity) VALUES (3,1,7);
insert into OrderDetail (idOrder, idMaterial, orderQuantity) VALUES (3,5,8);
insert into OrderDetail (idOrder, idMaterial, orderQuantity) VALUES (2,4,9);
insert into OrderDetail (idOrder, idMaterial, orderQuantity) VALUES (1,1,4);

insert into EnterCouponDetail (idEnterCoupon, idMaterial, importQuantity, importUnitPrice, note) VALUES (1,1,4,20.500, 'abc');
insert into EnterCouponDetail (idEnterCoupon, idMaterial, importQuantity, importUnitPrice, note) VALUES (2,2,3,15.000, 'hi');
insert into EnterCouponDetail (idEnterCoupon, idMaterial, importQuantity, importUnitPrice, note) VALUES (3,3,2,50.000, 'kjk');
insert into EnterCouponDetail (idEnterCoupon, idMaterial, importQuantity, importUnitPrice, note) VALUES (2,4,6,100.000, 'da');
insert into EnterCouponDetail (idEnterCoupon, idMaterial, importQuantity, importUnitPrice, note) VALUES (3,5,7,40.000, 'gf');

insert into DeliveryBillDetail (idDeliveryBill, idMaterial, exportQuantity, exportUnitPrice, note) VALUES (1,1,4,10.000,'abc');
insert into DeliveryBillDetail (idDeliveryBill, idMaterial, exportQuantity, exportUnitPrice, note) VALUES (2,2,5,12.000,'hi');
insert into DeliveryBillDetail (idDeliveryBill, idMaterial, exportQuantity, exportUnitPrice, note) VALUES (3,3,6,13.000,'da');
insert into DeliveryBillDetail (idDeliveryBill, idMaterial, exportQuantity, exportUnitPrice, note) VALUES (1,4,7,14.000,'gfg');
insert into DeliveryBillDetail (idDeliveryBill, idMaterial, exportQuantity, exportUnitPrice, note) VALUES (3,5,8,15.000,'fhfg');

# Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư,
# số lượng nhập, đơn giá nhập, thành tiền nhập
create view vw_CTPNHAP as
select codeEnterCoupon ,idMaterial, importQuantity, importUnitPrice , importQuantity*importUnitPrice as THANHTIENNHAP
from EnterCoupon EC
join EnterCouponDetail ECD on EC.id = ECD.idEnterCoupon;


# Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư,
# tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập
create view vw_CTPNHAP_VT as
select codeEnterCoupon, codeMaterial, nameMaterial , importQuantity, importUnitPrice , importQuantity*importUnitPrice as THANHTIENNHAP
from EnterCoupon EC
join EnterCouponDetail ECD on EC.id = ECD.idEnterCoupon
join Materials M on ECD.idMaterial = M.id;


# Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng,
# số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN as
select codeEnterCoupon, dateCoupon, idOrder, idMaterial, nameMaterial, importQuantity, importUnitPrice, importQuantity*importUnitPrice as THANHTIENNHAP
from EnterCoupon EC
join EnterCouponDetail ECD on EC.id = ECD.idEnterCoupon
join Materials M on ECD.idMaterial = M.id;


# Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp,
# mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập
create VIEW vw_CTPNHAP_VT_PN_DH as
select codeEnterCoupon, dateCoupon, codeOrder, codeSupplier, codeMaterial, nameMaterial, importQuantity, importUnitPrice, importQuantity*importUnitPrice as THANHTIENNHAP
from Materials M
join EnterCouponDetail ECD on M.id = ECD.idMaterial
join EnterCoupon EC on ECD.idEnterCoupon = EC.id
join orrders o on EC.idOrder = o.id
join Supplier S on o.idSupplier = S.id;

select * from vw_CTPNHAP_VT_PN_DH;

# Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập,
# đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
create view vw_CTPNHAP_loc as
select codeEnterCoupon, codeMaterial, importQuantity, importUnitPrice, importQuantity*importUnitPrice as THANHTIENNHAP
from Materials M
join EnterCouponDetail ECD on M.id = ECD.idMaterial
join EnterCoupon EC on ECD.idEnterCoupon = EC.id
where importQuantity > 5;

# Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập,
# đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ
create view vw_CTPNHAP_VT_loc as
select *
from vw_CTPNHAP_VT;

# Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
create view vw_CTPXUAT as
select codeDeliveryBill, codeMaterial, exportQuantity, exportUnitPrice, exportQuantity*exportUnitPrice as THANHTIENXUAT
from DeliveryBill DB
join DeliveryBillDetail DBD on DB.id = DBD.idDeliveryBill
join Materials M on M.id = DBD.idMaterial;

# Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất
create view vw_CTPXUAT_VT as
select codeDeliveryBill, codeMaterial, nameMaterial, exportQuantity, exportUnitPrice
from DeliveryBill DB
join DeliveryBillDetail DBD on DB.id = DBD.idDeliveryBill
join Materials M on M.id = DBD.idMaterial;

# Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất
create view vw_CTPXUAT_VT_PX as
select codeDeliveryBill, nameCustomer, codeMaterial, nameMaterial, exportQuantity, exportUnitPrice
from DeliveryBill DB
join DeliveryBillDetail DBD on DB.id = DBD.idDeliveryBill
join Materials M on M.id = DBD.idMaterial;

#  Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào
DELIMITER //
create procedure


DELIMITER;