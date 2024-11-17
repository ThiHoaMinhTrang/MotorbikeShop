CREATE DATABASE MotorBike
use MotorBike
drop database UserManagement
CREATE TABLE tbl_Users(
	[Fullname] [nvarchar](50) NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Role] [varchar](20) ,
	--[Email] [varchar](20),
	--[Address] [nvarchar](20),
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT INTO tbl_Users([Fullname],[UserID],[Password],[Role])VALUES('Thi Trang','ad01','01','AD')
INSERT INTO tbl_Users([Fullname],[UserID],[Password],[Role])VALUES('Bob Smith','us02','02','US')
INSERT INTO tbl_Users([Fullname],[UserID],[Password],[Role])VALUES('Hank King','us03','03','US')
INSERT INTO tbl_Users([Fullname],[UserID],[Password],[Role])VALUES('Dang Hoan','us04','04','US')
INSERT INTO tbl_Users([Fullname],[UserID],[Password],[Role])VALUES('Anh Hoang','us05','05','US')
select * from tbl_Users
drop table tbl_Users
	CREATE TABLE tbl_Items(
		[ItemID] [nvarchar](10) NOT NULL,
		[ItemName] [nvarchar](20) NOT NULL, 
		[Brand] [nvarchar](20),
		[Price] [float] NOT NULL,
		[Quantity] [int] ,
		[Image] [varchar](50),
		[Discount] int,
	PRIMARY KEY CLUSTERED 
	(
		[ItemID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]																									
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0001',N'SH350i',N'Honda',5599,10,'1.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0002',N'VinFast Vento S',N'VinFast',1899,16,'2.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0003',N'Yadea Ocean',N'Yadea',699,18,'3.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0004',N'Yamaha YZF-R3',N'Yamaha',5199,17,'4.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0005',N'Freego',N'Yamaha',1299,10,'5.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0006',N'Vision',N'Honda',1199,11,'6.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0007',N'Vario 160',N'Honda',2199,12,'7.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0008',N'Air Blade 2025',N'Honda',1499,13,'8.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0009',N'Kawasaki Z400 ABS',N'Kawasaki',5499,14,'9.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0010',N'Super Cub C125',N'Honda',3199,15,'10.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0011',N'Future 125 FI',N'Honda',1099,16,'11.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0012',N'Wave RSX',N'Honda',799,17,'12.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0013',N'Shark 50',N'SYM',899,18,'13.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0014',N'Impulse 125 FI',N'Suzuki',1199,19,'14.jpg',0)
	INSERT INTO tbl_Items([ItemID],[ItemName],[Brand],[Price],[Quantity],[Image],[Discount])VALUES(N'H0015',N'Kymco Like 50cc',N'Kymco',899,10,'15.jpg',0)
	select * from tbl_Items
drop table tbl_Items

