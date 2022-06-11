
create database	Assignmentsz2
go
use Assignmentsz2
go
create table Brand_Name (
	MaBrand int primary key,
	Namebrand nvarchar(50),
	address nvarchar(50),
	tel varchar(50)
	)
	go

create table Products (
	MaProduct int primary key,
	NameProduct nvarchar(50),
	MaBrand int,
	price money,
	Namebrand nvarchar(50),
	classification nvarchar(50),
	amount int ,
	unit int
)
go
create table Nameproducts (
	MaProduct int ,
	MaBrand int,
	classification nvarchar(50),
)
go
-----link bảng 2 đén bảng 1
ALTER TABLE Products
ADD CONSTRAINT khoangoai2_1 
  FOREIGN KEY (MaBrand)
  REFERENCES Brand_Name (MaBrand);
  -----link bảng 3 
ALTER TABLE Nameproducts
ADD CONSTRAINT khoangoai3_1 
  FOREIGN KEY (MaBrand)
  REFERENCES Brand_Name (MaBrand);
    -----link bảng 3 
ALTER TABLE Nameproducts
ADD CONSTRAINT khoangoai3_2 
  FOREIGN KEY (MaProduct)
  REFERENCES Products (MaProduct);
---bảng Name_brand
INSERT INTO Brand_Name(MaBrand,Namebrand ,address,tel)
    VALUES(1,'samsung',N'hàn quốc','099999')
INSERT INTO Brand_Name(MaBrand,Namebrand ,address,tel)
    VALUES(2,'oppo',N'hàn quốc','088888')
INSERT INTO Brand_Name(MaBrand,Namebrand ,address,tel)
    VALUES(3,'iphone',N'viet nam','066666')
INSERT INTO Brand_Name(MaBrand,Namebrand ,address,tel)
    VALUES(4,'asus',N'trung quốc','077777')
INSERT INTO Brand_Name(MaBrand,Namebrand ,address,tel)
    VALUES(5,'lenovo',N'trung quốc','055555')
select * from Brand_Name
----bảng product-----
INSERT INTO Products (MaProduct ,NameProduct ,MaBrand,price ,Namebrand ,classification)
    VALUES(101,N'ss22',1,1001,N'samsung','chiec')
INSERT INTO Products (MaProduct ,NameProduct ,MaBrand,price ,Namebrand ,classification)
    VALUES(102,N'oppo1',2,1002,N'opp','chiec')
INSERT INTO Products (MaProduct ,NameProduct ,MaBrand,price ,Namebrand ,classification)
    VALUES(103,N'ip12',3,2001,N'ip','chiec')
INSERT INTO Products (MaProduct ,NameProduct ,MaBrand,price ,Namebrand ,classification)
    VALUES(104,N'fx503',4,2002,N'asus','chiec')
INSERT INTO Products (MaProduct ,NameProduct ,MaBrand,price ,Namebrand ,classification)
    VALUES(105,N'fx504',4,2002,N'asus','chiec')
INSERT INTO Products (MaProduct ,NameProduct ,MaBrand,price ,Namebrand ,classification)
    VALUES(106,N'legion5',4,2002,N'lenovo','chiec')
select * from products
--------------------bang 3-----------------
INSERT INTO Nameproducts (MaProduct ,MaBrand ,classification)
    VALUES(101,1,'chiec')
INSERT INTO Nameproducts (MaProduct ,MaBrand ,classification)
    VALUES(102,2,'chiec')
INSERT INTO Nameproducts (MaProduct ,MaBrand ,classification)
    VALUES(103,3,'chiec')
INSERT INTO Nameproducts (MaProduct ,MaBrand ,classification)
    VALUES(104,4,'chiec')
INSERT INTO Nameproducts (MaProduct ,MaBrand ,classification)
    VALUES(105,4,'chiec')
INSERT INTO Nameproducts (MaProduct ,MaBrand ,classification)
    VALUES(106,4,'chiec')
select * from Nameproducts
-------------in ra cac nha sx---------------
Select MaBrand, Namebrand From Brand_Name 
--------ok-------
-------------in ra cac san pham---------------
Select MaProduct,NameProduct From products
--------ok-------
Select MaBrand, Namebrand From Brand_Name  Order By  Namebrand DESC
--------ok-------
----------------Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.--------
Select price From products Order By price DESC
-----------ok
--------Hiển thị thông tin của hãng Asus.
Select * From Products
where MaBrand=4
Select * From Products 
where MaBrand=4
Select count (distinct MaBrand) from Brand_Name
Select count (distinct MaProduct) from Products
-------------********************

ALTER TABLE Products
ADD CONSTRAINT checkgia CHECK (price > 0) 
-------------Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.------

ALTER TABLE Brand_Name
ADD CONSTRAINT telcheck CHECK (tel LIKE '0%' ) ------varchar
