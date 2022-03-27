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

#Thêm 10 bản ghi trong Student
insert into Students (id, fullName, address_id, age, phone, class_id) values (1, 'Tô Việt Anh', 1, 20,'0329605770',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (2, 'Nguyễn Văn Thành', 5, 18,'0961742730',5);
insert into Students (id, fullName, address_id, age, phone, class_id) values (3, 'Hoàng Thanh Trúc', 3, 25,'0941900498',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (4, 'Lê Hải Sơn', 2, 15,'0966061882',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (5, 'Bùi Hoàng Nam', 1, 15,'0944414186',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (6, 'Vũ Xuân Long', 5, 16,'0964330330',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (7, 'Tô Thị Việt Linh', 1, 17,'0388394394',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (8, 'Trương Thành Công', 2, 70,'0375688626',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (9, 'Nguyễn Thành Công', 3, 36,'0796661990',1);
insert into Students (id, fullName, address_id, age, phone, class_id) values (10, 'Nguyễn Thành Công', 1, 25,'0389928310',1);
select * from Students;

# Thêm 1 bản ghi trong Course
insert into Course (id, name, description) values (1, 'Học cách học', 'Học chăm vào');
insert into Course (id, name, description) values (2, 'Bootcamping', 'JavaCore');
select * from Course;

# Thêm 15 bản ghi trong Point
insert into Point (id, course_id, student_id, point) values (1, 1, 1, 5.0);
insert into Point (id, course_id, student_id, point) values (2, 2, 2, 6.0);
insert into Point (id, course_id, student_id, point) values (3, 2, 3, 7.0);
insert into Point (id, course_id, student_id, point) values (4, 1, 4, 1.0);
insert into Point (id, course_id, student_id, point) values (5, 2, 5, 5.5);
insert into Point (id, course_id, student_id, point) values (6, 1, 6, 9.5);
insert into Point (id, course_id, student_id, point) values (7, 2, 7, 10.0);
select * from Point;

# Tìm kiếm HV có họ Nguyen
select * from Students where Students.fullName like 'Nguyễn%';

# Tìm kiếm HV có tên Anh
select * from Students where Students.fullName like '%Anh';

# Tìm kiếm HV có độ tuổi từ 18 - 25
select * from Students where age between 15 and 25;

# Tìm kiếm HV có id là 12 hoặc 12
select * from Students where id = 12 or id like '12';

# Thống kê số lượng HV các lớp
select count(id) as SOLUONGHV  from Students;

# Thống kê số lượng HV tại các tỉnh

# Tính điểm trung bình của các khóa học

# Đưa ra khóa học có điểm trung bình cao nhất
(select name, avg(point) as AVERAGE from Course
join Point on Course.id = Point.course_id
group by name);

select name, avg(point) as AVERAGE from Course
join Point on Course.id = Point.course_id
group by name
having AVERAGE >= all(select avg(point) as AVERAGE from Course join Point on Course.id = Point.course_id group by name);