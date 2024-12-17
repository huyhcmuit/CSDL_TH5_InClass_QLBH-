--23520622 NGO LE TAN HUY
-- Tao bang KHACHHANG
CREATE DATABASE QUANLIBANHANG
CREATE TABLE KHACHHANG 
(
	MAKH char(4) primary key,
	HOTEN varchar(40), 
	DCHI varchar(50), 
	SODT varchar(20), 
	NGSINH smalldatetime, 
	NGDK smalldatetime, 
	DOANHSO money,
	LOAIKH varchar(40)
);
-- Tao bang NHANVIEN
CREATE TABLE NHANVIEN
(
	MANV char(4) primary key, 
	HOTEN varchar(40), 
	SODT varchar(20), 
	NGVL smalldatetime
);
-- Tao bang SANPHAM
CREATE TABLE SANPHAM
(
	MASP char(4) primary key, 
	TENSP varchar(40),
	DVT varchar(20), 
	NUOCSX varchar(40),
	GIA money
);
-- Tao bang HOADON
CREATE TABLE HOADON
(
	SOHD int primary key, 
	NGHD smalldatetime,
	MAKH char(4), 
	MANV char(4), 
	TRIGIA money, 
	FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH), 
	FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);
-- Tao bang CTHD
CREATE TABLE CTHD
(
	SOHD int, 
	MASP char(4),
	SL int, 
	primary key (SOHD, MASP),
	FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD),
	FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
-----------------END1------------------------
--Cau 2
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20);
-----------------END2------------------------
--Cau 3
ALTER TABLE KHACHHANG ADD LOAIKH tinyint;
-----------------END3------------------------
--Cau 4
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100);
-----------------END4------------------------
--Cau 5
ALTER TABLE SANPHAM DROP COLUMN GHICHU;
-----------------END5------------------------
--Cau 6
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH varchar(40);
ALTER TABLE KHACHHANG
ADD CONSTRAINT check_loaikh CHECK (LOAIKH IN ( 'Vang lai', 'Thuong xuyen', 'Vip'));
-----------------END6------------------------
--Cau 7
ALTER TABLE SANPHAM
ADD CONSTRAINT check_dvt CHECK(DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'));
-----------------END7------------------------
--Cau 8
ALTER TABLE SANPHAM
ADD CONSTRAINT check_gia CHECK (GIA >=500); 
-----------------END8------------------------
--Cau 9
ALTER TABLE CTHD 
ADD CONSTRAINT check_sl CHECK (SL>=1);
-----------------END9------------------------
--Cau 10
ALTER TABLE KHACHHANG 
ADD CONSTRAINT check_ngaydk_ngays CHECK (NGDK > NGSINH);
-----------------END10------------------------
--Bai tap 2
-------INSERT NHANVIEN
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES
('NV01', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13'),
('NV02', 'Le Thi Phi Yen', '0987567390', '2006-04-21'),
('NV03', 'Nguyen Van B', '0997047382', '2006-04-27'),
('NV04', 'Ngo Thanh Tuan', '0913758498', '2006-06-24'),
('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');
-------INSERT KHACHHANG
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES
('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '1960-10-22', 13060000, '2006-07-22'),
('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', 280000, '2006-07-30'),
('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-06-12', 3860000, '2006-08-05'),
('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-03-09', 250000, '2006-10-02'),
('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950-03-10', 21000, '2006-10-28'),
('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981-12-31', 915000, '2006-11-24'),
('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-04-06', 12500, '2006-12-01'),
('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-01-10', 365000, '2006-12-13'),
('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-09-03', 70000, '2007-01-14'),
('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983-05-02', 67500, '2007-01-16');
-------INSERT SANPHAM
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES 
('BC01', 'But chi cay', 'cay', 'Singapore', 3000),
('BC02', 'But chi cay', 'cay', 'Singapore', 5000),
('BC03', 'But chi cay', 'cay', 'Viet Nam', 3500),
('BC04', 'But chi hop', 'hop', 'Viet Nam', 30000),
('BB01', 'But bi cay', 'cay', 'Viet Nam', 5000),
('BB02', 'But bi cay', 'cay', 'Trung Quoc', 7000),
('BB03', 'But bi hop', 'hop', 'Thai Lan', 100000),
('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500),
('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500),
('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000),
('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500),
('TV05', 'Tap 100 trang chuc', 'quyen', 'Viet Nam', 23000),
('TV06', 'Tap 200 trang chuc', 'quyen', 'Viet Nam', 53000),
('TV07', 'Tap 100 trang chuc', 'quyen', 'Trung Quoc', 34000),
('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
('ST09', 'But long', 'cay', 'Viet Nam', 5000),
('ST10', 'But long', 'cay', 'Trung Quoc', 7000);
-------INSERT HOADON
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES
(1001, '2006-07-23', 'KH01', 'NV01', 320000),
(1002, '2006-08-12', 'KH01', 'NV02', 840000),
(1003, '2006-08-23', 'KH02', 'NV01', 100000),
(1004, '2006-09-01', 'KH02', 'NV01', 180000),
(1005, '2006-10-20', 'KH01', 'NV02', 3800000),
(1006, '2006-10-16', 'KH01', 'NV03', 2430000),
(1007, '2006-10-28', 'KH03', 'NV03', 510000),
(1008, '2006-10-28', 'KH01', 'NV03', 440000),
(1009, '2006-10-28', 'KH03', 'NV04', 200000),
(1010, '2006-11-01', 'KH01', 'NV01', 5200000),
(1011, '2006-11-04', 'KH04', 'NV03', 250000),
(1012, '2006-11-30', 'KH05', 'NV03', 21000),
(1013, '2006-12-12', 'KH06', 'NV01', 5000),
(1014, '2006-12-31', 'KH03', 'NV02', 3150000),
(1015, '2007-01-01', 'KH06', 'NV01', 910000),
(1016, '2007-01-01', 'KH07', 'NV02', 12500),
(1017, '2007-01-02', 'KH08', 'NV03', 35000),
(1018, '2007-01-13', 'KH08', 'NV03', 330000),
(1019, '2007-01-13', 'KH01', 'NV03', 30000),
(1020, '2007-01-14', 'KH09', 'NV04', 70000),
(1021, '2007-01-16', 'KH10', 'NV03', 67500),
(1022, '2007-01-16', NULL, 'NV03', 7000),
(1023, '2007-01-17', NULL, 'NV01', 330000);
-------INSERT CTHD
INSERT INTO CTHD (SOHD, MASP, SL)
VALUES
(1001, 'TV02', 10),
(1001, 'ST01', 5),
(1001, 'BC01', 5),
(1001, 'BC02', 10),
(1001, 'ST08', 10),
(1002, 'BC04', 20),
(1002, 'BB01', 20),
(1002, 'BB02', 20),
(1003, 'BB03', 10),
(1004, 'TV01', 20),
(1004, 'TV02', 10),
(1004, 'TV03', 10),
(1004, 'TV04', 10),
(1005, 'TV05', 50),
(1005, 'TV06', 50),
(1006, 'TV07', 20),
(1006, 'ST01', 30),
(1006, 'ST02', 10),
(1007, 'ST03', 10),
(1008, 'ST04', 8),
(1009, 'ST05', 10),
(1010, 'TV07', 50),
(1010, 'ST07', 50),
(1010, 'ST08', 100),
(1010, 'ST04', 50),
(1010, 'TV03', 100),
(1011, 'ST06', 50),
(1012, 'ST07', 3),
(1013, 'ST08', 5),
(1014, 'BC02', 80),
(1014, 'BB02', 100),
(1014, 'BC04', 60),
(1014, 'BB01', 50),
(1015, 'BB02', 30),
(1015, 'BB03', 7),
(1016, 'TV01', 5),
(1017, 'TV02', 1),
(1017, 'TV03', 1),
(1017, 'TV04', 5),
(1018, 'ST04', 6),
(1019, 'ST05', 1),
(1019, 'ST06', 2),
(1020, 'ST07', 10),
(1021, 'ST08', 5),
(1021, 'TV01', 7),
(1021, 'TV02', 10),
(1022, 'ST07', 1),
(1023, 'ST04', 6);
--Bai tap 3 cau 2: 
SELECT * INTO SANPHAM1 FROM SANPHAM; 
SELECT * INTO KHACHHANG1 FROM KHACHHANG; 
--Bai tap 3 cau 3: 
UPDATE SANPHAM1
SET GIA = GIA * 1.05 WHERE NUOCSX = 'Thai Lan'; 
--Bai tap 3 cau 4:
UPDATE SANPHAM1 SET GIA = GIA * 0.95
WHERE NUOCSX = 'Trung Quoc' AND GIA <=10000; 
--Bai tap 3 cau 5: 
UPDATE KHACHHANG1 SET LOAIKH = 'Vip'
WHERE (NGDK < '2007-01-01' AND DOANHSO >= 10000000) 
   OR (NGDK >= '2007-01-01' AND DOANHSO >= 2000000);
--Bai tap 5 cau 1: 
SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX = 'Trung Quoc'; 
--Bai tap 5 cau 2:
SELECT MASP, TENSP FROM SANPHAM WHERE DVT IN ('cay', 'quyen');
--Bai tap 5 cau 3:
SELECT MASP, TENSP FROM SANPHAM WHERE MASP LIKE 'B%01';
--Bai tap 5 cau 4:
SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' 
AND GIA BETWEEN 30000 AND 40000;
--Bai tap 5 cau 5:
SELECT MASP, TENSP FROM SANPHAM
WHERE (NUOCSX = 'Trung Quoc' OR NUOCSX = 'Thai Lan')
AND GIA BETWEEN 30000 AND 40000;
--Bai tap 5 cau 6:
SELECT SOHD, TRIGIA FROM HOADON WHERE NGHD IN ('2007-01-01', '2007-01-02');
--Bai tap 5 cau 7:
SELECT SOHD, TRIGIA FROM HOADON WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC; 
--Bai tap 5 cau 8:
SELECT DISTINCT KH.MAKH, KH.HOTEN FROM KHACHHANG KH
JOIN HOADON HD ON KH.MAKH = HD.MAKH WHERE HD.NGHD = '2007-01-01';
--Bai tap 5 cau 9:
SELECT HD.SOHD, HD.TRIGIA FROM HOADON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
WHERE NV.HOTEN = 'Nguyen Van B' AND HD.NGHD = '2006-10-28';
--Bai tap 5 cau 10:
SELECT DISTINCT SP.MASP, SP.TENSP 
FROM SANPHAM SP 
JOIN CTHD CTHD ON SP.MASP = CTHD.MASP 
JOIN HOADON HD ON CTHD.SOHD = HD.SOHD 
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH 
WHERE KH.HOTEN = 'Nguyen Van A' 
AND MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006;
--Bai tap 5 cau 11:
SELECT DISTINCT SOHD FROM CTHD WHERE MASP IN ('BB01', 'BB02');
--Buoi 3 - Homework 
--Phan 3 cau 12: 
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')
  AND SL BETWEEN 10 AND 20;
--Phan 3 cau 13
SELECT SOHD
FROM CTHD
WHERE (MASP = 'BB01' AND SL BETWEEN 10 AND 20)
   OR (MASP = 'BB02' AND SL BETWEEN 10 AND 20)
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) = 2;
--Phan 3 cau 14: 
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
   OR MASP IN 
   (
       SELECT MASP
       FROM CTHD
       JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
       WHERE NGHD = '2007-01-01'
   );
--Phan 3 cau 15: 
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN 
   (
       SELECT DISTINCT MASP
       FROM CTHD
   );
--Phan 3 cau 16:
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN 
   (
       SELECT DISTINCT MASP
       FROM CTHD
       JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
       WHERE YEAR(NGHD) = 2006
   );
--Phan 3 cau 17: 
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
   AND MASP NOT IN 
   (
       SELECT DISTINCT MASP
       FROM CTHD
       JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
       WHERE YEAR(NGHD) = 2006
   );
--Phan 3 cau 18: 
SELECT SOHD
FROM HOADON
WHERE YEAR(NGHD) = 2006
  AND SOHD IN 
  (
      SELECT CTHD.SOHD
      FROM CTHD
      WHERE MASP IN 
	  (
          SELECT MASP
          FROM SANPHAM
          WHERE NUOCSX = 'Singapore'
      )
      GROUP BY CTHD.SOHD
      HAVING COUNT(DISTINCT MASP) = (SELECT COUNT(MASP)
                                     FROM SANPHAM
                                     WHERE NUOCSX = 'Singapore')
  );
--------------------------------END----------------------------------
--TH4 
--Phan III
--Cau 19 
SELECT COUNT(*)
FROM HOADON H
JOIN KHACHHANG K ON H.MAKH = K.MAKH
WHERE K.LOAIKH IS NULL OR K.LOAIKH <> 'thành viên';
--Cau 20
SELECT COUNT(DISTINCT C.MASP) AS SoSanPham
FROM CTHD C
JOIN HOADON H ON C.SOHD = H.SOHD
WHERE YEAR(H.NGHD) = 2006;
--Cau 21 
SELECT MAX(TRIGIA) AS TriGiaCaoNhat, MIN(TRIGIA) AS TriGiaThapNhat
FROM HOADON;
--Cau 22 
SELECT AVG(TRIGIA) AS TriGiaTrungBinh
FROM HOADON
WHERE YEAR(NGHD) = 2006;
--Cau 23 
SELECT SUM(TRIGIA) AS DoanhThuNam2006
FROM HOADON
WHERE YEAR(NGHD) = 2006;
--Cau 24 
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD) = 2006)
  AND YEAR(NGHD) = 2006;
--Cau 25
SELECT K.HOTEN
FROM HOADON H
JOIN KHACHHANG K ON H.MAKH = K.MAKH
WHERE H.TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD) = 2006)
  AND YEAR(H.NGHD) = 2006;
--Cau 26
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC;
--Cau 27 
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC);
--Cau 28
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' 
  AND GIA IN (SELECT DISTINCT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC);
--Cau 29
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' 
  AND GIA IN (SELECT DISTINCT TOP 3 GIA FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' ORDER BY GIA DESC);
--Cau 30
SELECT MAKH, HOTEN, DOANHSO,
       RANK() OVER (ORDER BY DOANHSO DESC) AS XepHang
FROM KHACHHANG
WHERE RANK() OVER (ORDER BY DOANHSO DESC) <= 3;
--Part 2, cau 31
SELECT COUNT(*) AS TongSoSanPham
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc';
--Cau 32 
SELECT NUOCSX, COUNT(*) AS TongSoSanPham
FROM SANPHAM
GROUP BY NUOCSX;
--Cau 33 
SELECT NUOCSX, 
       MAX(GIA) AS GiaCaoNhat,
       MIN(GIA) AS GiaThapNhat,
       AVG(GIA) AS GiaTrungBinh
FROM SANPHAM
GROUP BY NUOCSX;
--Cau 34 
SELECT NGHD, SUM(TRIGIA) AS DoanhThu
FROM HOADON
GROUP BY NGHD
ORDER BY NGHD;
--Cau 35
SELECT C.MASP, SUM(C.SL) AS TongSoLuong
FROM CTHD C
JOIN HOADON H ON C.SOHD = H.SOHD
WHERE MONTH(H.NGHD) = 10 AND YEAR(H.NGHD) = 2006
GROUP BY C.MASP;
--Cau 36
SELECT MONTH(NGHD) AS Thang, SUM(TRIGIA) AS DoanhThu
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY Thang;
--Cau 37
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4;
--Cau 38
SELECT C.SOHD
FROM CTHD C
JOIN SANPHAM S ON C.MASP = S.MASP
WHERE S.NUOCSX = 'Viet Nam'
GROUP BY C.SOHD
HAVING COUNT(DISTINCT C.MASP) = 3;
--Cau 39 
SELECT TOP 1 K.MAKH, K.HOTEN, COUNT(H.SOHD) AS SoLanMuaHang
FROM KHACHHANG K
JOIN HOADON H ON K.MAKH = H.MAKH
GROUP BY K.MAKH, K.HOTEN
ORDER BY SoLanMuaHang DESC;
--Cau 40 
SELECT TOP 1 MONTH(NGHD) AS Thang, SUM(TRIGIA) AS DoanhThu
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY DoanhThu DESC;
--Cau 41 
SELECT TOP 1 S.MASP, S.TENSP, SUM(C.SL) AS TongSoLuong
FROM SANPHAM S
JOIN CTHD C ON S.MASP = C.MASP
JOIN HOADON H ON C.SOHD = H.SOHD
WHERE YEAR(H.NGHD) = 2006
GROUP BY S.MASP, S.TENSP
ORDER BY TongSoLuong ASC;
--Cau 42
SELECT NUOCSX, MASP, TENSP, GIA
FROM SANPHAM S
WHERE GIA = (SELECT MAX(GIA) FROM SANPHAM WHERE NUOCSX = S.NUOCSX);
--Cau 43
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3;
--Cau 44
WITH Top10KhachHang AS (
    SELECT TOP 10 MAKH, HOTEN
    FROM KHACHHANG
    ORDER BY DOANHSO DESC
)
SELECT TOP 1 K.MAKH, K.HOTEN, COUNT(H.SOHD) AS SoLanMuaHang
FROM Top10KhachHang K
JOIN HOADON H ON K.MAKH = H.MAKH
GROUP BY K.MAKH, K.HOTEN
ORDER BY SoLanMuaHang DESC;
--Em khong thay cau 45 a ^^
--Thuc hanh 5 
--Phan I 
--Cau 11 
GO
CREATE TRIGGER trg_Check_NGHD_NGDK
ON HOADON
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED I
        JOIN KHACHHANG K ON I.MAKH = K.MAKH
        WHERE I.NGHD < K.NGDK
    )
    BEGIN
        RAISERROR (N'Ngay mua hang khong ðuoc nho hon ngay dang ky thanh vien.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
--Cau 12 
GO
CREATE TRIGGER trg_Check_NGHD_NGVL
ON HOADON
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED I
        JOIN NHANVIEN N ON I.MANV = N.MANV
        WHERE I.NGHD < N.NGVL
    )
    BEGIN
        RAISERROR (N'Ngay ban hang khong duoc nho hon ngay vao lam cua nhan vien.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
--Cau 13 
GO
CREATE TRIGGER trg_Update_TRIGIA
ON CTHD
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE H
    SET TRIGIA = (
        SELECT SUM(C.SL * S.GIA)
        FROM CTHD C
        JOIN SANPHAM S ON C.MASP = S.MASP
        WHERE C.SOHD = H.SOHD
    )
    FROM HOADON H
    WHERE EXISTS (
        SELECT 1 FROM CTHD WHERE CTHD.SOHD = H.SOHD
    );
END;
GO
--Cau 14 
GO
CREATE TRIGGER trg_Update_DOANHSO
ON HOADON
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE K
    SET DOANHSO = (
        SELECT SUM(H.TRIGIA)
        FROM HOADON H
        WHERE H.MAKH = K.MAKH
    )
    FROM KHACHHANG K
    WHERE EXISTS (
        SELECT 1 FROM HOADON WHERE HOADON.MAKH = K.MAKH
    );
END;
GO
---------------------END----------------------------------







