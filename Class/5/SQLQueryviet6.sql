/*Bảng hàng hóa*/
create table TenHang(
   MaSoHang varchar(50)not null primary key,
   TenHang varchar(50)not null,
   DiaChi varchar(255) not null, 
   SoDT varchar(11) not null unique
);
create table TenHangHoa(
   MaHangHoa varchar (50) not null primary key,
   TenHangHoa varchar(255) not null,
   MoTa text not null,
   DonVi varchar(20) not null
);
create table Gia_SoLuong(
   MaSoHang varchar(50) not null foreign key references TenHang(MaSoHang),
   MaHangHoa varchar(50) not null foreign key references TenHangHoa(MaHangHoa),
   Gia decimal (12,4) not null check (Gia > 0),
   SoLuongHienCo int not null
);


/*Truy vấn*/
-- Câu 4
-- a,
insert into TenHang(MaSoHang,TenHang,DiaChi,SoDT)
values (123,'Asus','USA','9832322'),
(124,'Bsus','BSA','9832323')

select * from TenHang;

-- b,
insert into TenHangHoa(MaHangHoa,TenHangHoa,MoTa,DonVi)
values (111,'Máy Tính T450','Máy nhập cũ','Chiếc'),
(112,'Điện thoại Nokia 5670','Điện thoại đang hot','Chiếc'),
(113,'Máy in samsung 450','Máy in đang loại bình','Chiếc'),
(114,'Điện thoại','Ddiejn thoại hỏng','chiếc')


select * from TenHangHoa;

insert into Gia_SoLuong(MaSoHang,MaHangHoa,Gia,SoLuongHienCo)
values (123,111,'1000',10),(123,112,'200',200),(123,113,'100',100),(124,114,'5000',10)

select * from Gia_SoLuong;



-- Câu 5 
-- a 
select * from TenHang order by TenHang desc;

-- b
select * from Gia_SoLuong,TenHang order by Gia desc;

-- c 
select TH.MaSoHang,TenHang,DiaChi,SoDT from TenHang TH
    inner join Gia_SoLuong GSL
	   on GSL.MaSoHang = TH.MaSoHang

-- d 
select * from Gia_SoLuong where SoLuongHienCo >11


-- e 
select * from TenHang where MaSoHang 
in ( select MaSoHang from Gia_SoLuong where TenHang = 'Asus')

--Câu 6 
-- a 
select Count(MaSoHang) as HangSanPham from TenHang;
-- b 
select count(MaHangHoa) as đạ from TenHangHoa 

-- c
	select SoLuongHienCo,MaSoHang,
	   count(SoLuongHienCo) as [Số lượng],
	   avg(Gia) as [Thành tiền],
	   sum(Gia) as [Giá]
	from Gia_SoLuong
	group by SoLuongHienCo,MaSoHang 


SELECT TenHangHoa AS [Product Name], 
       Gia AS [Price], 
       TenHang AS [Companyư]
   FROM  TenHanghoa,TenHang,Gia_SoLuong
   WHERE TenHang = Gia
     AND Gia =
     (
       SELECT MAX(Gia)
         FROM TenHangHoa
         WHERE MaHangHoa = Gia
     )
 
select MSH.MaSoHang, MSH.TongSoSanPham, TH.TenHang
from (select MaSoHang, count(MaHangHoa) as TongSoSanPham
from Gia_SoLuong
group by MaSoHang) as MSH
JOIN TenHang TH
	on MSH.MaSoHang = TH.MaSoHang;

-- d 
select sum(SoLuongHienCo) as [Tổng số đầu sản phẩm]
from Gia_SoLuong