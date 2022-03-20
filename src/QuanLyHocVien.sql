create database QuanLyHocVienT1;

use QuanLyHocVienT1;
# Tạo bảng Address
create table Address(
    id int,
    address nvarchar(50),
    primary key (id)
);
# Tạo bảng Class
create table Classes(
    id int,
    name nvarchar(50),
    language nvarchar(50),
    description text,
    primary key (id)
);
# Tạo bảng Student
create table Students(
    id int,
    fullName nvarchar(30),
    address_id int,
    age int,
    phone nvarchar(10) unique,
    class_id int,
    primary key (id),
    foreign key (address_id) references Address(id),
    foreign key (class_id) references Classes(id)
);
# Tạo bảng Course
create table Course(
    id int,
    name nvarchar(50),
    description text,
    primary key (id)
);
# Tạo bảng Point
create table Point(
    id int,
    course_id int,
    student_id int,
    point double,
    primary key (id),
    foreign key (course_id) references Course(id),
    foreign key (student_id) references Students(id)
);

#Thêm 5 bản ghi vào bảng Address
insert into Address (id,address) values (1, 'Thái Bình');
insert into Address (id,address) values (2, 'Hà Nội');
insert into Address (id,address) values (3, 'Hà Nam');
insert into Address (id,address) values (4, 'Ninh Bình');
insert into Address (id,address) values (5, 'Hải Phòng');
select * from Address;

# Thêm 5 bản ghi trong bảng Class
insert into Classes (id, name, language, description) values (1,'Lớp 1', 'Java', 'abc');
insert into Classes (id, name, language, description) values (2,'Lớp 2', 'Python', 'abc');
insert into Classes (id, name, language, description) values (3,'Lớp 3', 'PHP', 'abc');
insert into Classes (id, name, language, description) values (4,'Lớp 4', 'C#', 'abc');
insert into Classes (id, name, language, description) values (5,'Lớp 5', 'Javascript', 'abc');
select * from Classes;

#
