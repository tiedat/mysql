CREATE DATABASE ex92;
USE ex92;

CREATE TABLE tblSinhVien(
sv_Maso INT(4) PRIMARY KEY,
sv_Hodem NVARCHAR(30),
sv_Ten NVARCHAR(15),
sv_Ngaysinh DATE,
sv_Lop INT(4),
sv_DiemTB DOUBLE(2,1));

ALTER TABLE tblSinhVien ADD FOREIGN KEY(sv_Lop) REFERENCES tblLop(l_ID);

CREATE TABLE tblLop(
l_ID INT(4) PRIMARY KEY,
l_Ten NVARCHAR(20),
l_Khoa INT(4));

ALTER TABLE tblLop ADD FOREIGN KEY(l_Khoa) REFERENCES tblKhoa(k_ID);

CREATE TABLE tblKhoa(
k_ID INT(4) PRIMARY KEY,
k_Ten NVARCHAR(20));


INSERT INTO tblKhoa(k_ID,k_Ten) VALUES(1,'CONG NGHE THONG TIN');
INSERT INTO tblKhoa(k_ID,k_Ten) VALUES(2,'QUAN TRI KINH DOANH');
INSERT INTO tblKhoa(k_ID,k_Ten) VALUES(3,'MY THUAT DO HOA');

INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(1,'CNTT201',1);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(2,'CNTT202',1);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(3,'CNTT301',1);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(4,'QTKD404',2);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(5,'QTKD500',2);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(6,'MTDH200',3);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(7,'MTDH405',3);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(8,'MTDH205',3);
INSERT INTO tblLop(l_ID,l_Ten,l_Khoa) VALUES(9,'MTDH300',3);

INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(1,'NGUYEN NHAT','MINH','2000-06-03',1,9.9);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(2,'NGUYEN TIEN','DAT','1999-07-03',3,4.0);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(3,'NGUYEN NHAT','DUNG','1999-07-03',1,7.8);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(4,'PHAM XUAN','HINH','1998-10-10',3,2.3);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(5,'UNG DUC','LONG','2001-06-12',4,7.0);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(6,'PHAM QUANG','DONG','2000-02-29',5,5.6);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(7,'PHAM HUY','VY','1996-08-03',4,8.2);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(8,'TRAN THANH','HAI','1997-03-06',6,6.1);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(9,'LE THANH','HAI','1996-09-22',7,7.3);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(10,'DO THU','HUONG','1998-04-23',8,7.4);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(11,'TO THU','TRANG','2000-06-13',9,8.0);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(12,'NGUYEN LAC','NAM','2002-01-24',5,5.6);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(13,'THAN THU','TRANG','2003-02-22',2,6.4);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(14,'BUI QUOC','TUAN','2001-07-03',5,7.2);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(15,'DO MINH','NHAT','1999-05-29',6,7.1);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(16,'KIEU THI','LY','1996-04-18',7,6.8);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(17,'PATRICK','JOHNWICK','1997-08-01',2,8.3);
INSERT INTO tblSinhVien(sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh,sv_Lop,sv_DiemTB) VALUES(18,'OM PHAN LAO RA','BIEN','2000-03-03',1,9.0);

-- Liệt kê danh sách các sinh viên
SELECT sv_Hodem,sv_Ten FROM tblSinhVien;

-- Liệt kê danh sách các sinh viên (họ tên viết liền)
SELECT CONCAT(sv_Hodem,' ',sv_Ten) FROM tblSinhVien;

-- Liệt kê danh sách sinh viên: Mã số, họ đệm, tên, tuổi
SELECT sv_Maso,sv_Hodem,sv_Ten,FLOOR(DATEDIFF(CURDATE(),sv_Ngaysinh)/365) FROM tblSinhVien;

-- Liệt kê danh sách các lớp
SELECT l_Ten FROM tblLop;

-- Liệt kê danh sách các khoa
SELECT k_Ten FROM tblKhoa;

-- Tìm những sinh viên thuộc khoa CNTT
SELECT sv_Hodem,sv_Ten,k_Ten FROM tblSinhVien
JOIN tblLop ON tblSinhVien.sv_Lop=tblLop.l_ID
JOIN tblKhoa ON tblLop.l_Khoa=tblKhoa.k_ID
WHERE k_Ten='CONG NGHE THONG TIN';

-- Số lượng sinh viên loại giỏi, loại khá, loại trung bình (trong cùng 1 query)
SELECT COUNT(s1.sv_Maso) AS 'GIOI',COUNT(s2.sv_Maso) AS 'KHA',COUNT(s3.sv_Maso) AS 'TRUNG BINH'
FROM (SELECT sv_Maso FROM tblSinhVien WHERE sv_DiemTB>=8) s1
LEFT OUTER JOIN (SELECT  sv_Maso FROM tblSinhVien WHERE sv_DiemTB<8 AND sv_DiemTB>=6 ) s2 ON s1.sv_Maso=s2.sv_Maso
LEFT OUTER JOIN (SELECT sv_Maso FROM tblSinhVien WHERE sv_DiemTB<6) s3 ON s2.sv_Maso=s3.sv_Maso
UNION
SELECT COUNT(s1.sv_Maso) AS 'GIOI',COUNT(s2.sv_Maso) AS 'KHA',COUNT(s3.sv_Maso) AS 'TRUNG BINH'
FROM (SELECT  sv_Maso FROM tblSinhVien WHERE sv_DiemTB<8 AND sv_DiemTB>=6 ) s2
LEFT OUTER JOIN (SELECT sv_Maso FROM tblSinhVien WHERE sv_DiemTB>=8) s1 ON s1.sv_Maso=s2.sv_Maso
LEFT OUTER JOIN (SELECT sv_Maso FROM tblSinhVien WHERE sv_DiemTB<6) s3 ON s1.sv_Maso=s3.sv_Maso
UNION
SELECT COUNT(s1.sv_Maso) AS 'GIOI',COUNT(s2.sv_Maso) AS 'KHA',COUNT(s3.sv_Maso) AS 'TRUNG BINH'
FROM (SELECT sv_Maso FROM tblSinhVien WHERE sv_DiemTB<6) s3
LEFT OUTER JOIN (SELECT sv_Maso FROM tblSinhVien WHERE sv_DiemTB>=8) s1 ON s1.sv_Maso=s3.sv_Maso
LEFT OUTER JOIN (SELECT  sv_Maso FROM tblSinhVien WHERE sv_DiemTB<8 AND sv_DiemTB>=6 ) s2 ON s1.sv_Maso=s2.sv_Maso;

SELECT COUNT(s1.sv_Maso) AS 'GIOI',COUNT(s2.sv_Maso) AS 'KHA',COUNT(s3.sv_Maso) AS 'TRUNG BINH' INTO newtable IN 
FROM (SELECT  sv_Maso FROM tblSinhVien WHERE sv_DiemTB<8 AND sv_DiemTB>=6 ) s2,
(SELECT sv_Maso FROM tblSinhVien WHERE sv_DiemTB>=8) s1
(SELECT  sv_Maso FROM tblSinhVien WHERE sv_DiemTB<6 )s3;

-- Số lượng sinh viên loại giỏi, khá, trung bình của từng lớp (trong cùng 1 query)
SELECT COUNT(s1.sv_Maso) AS 'GIOI',COUNT(s2.sv_Maso) AS 'KHA', COUNT(s3.sv_Maso) AS 'TRUNG BINH', ANY_VALUE(s1.sv_Lop)
FROM (SELECT sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB>=8) s1
LEFT OUTER JOIN (SELECT  sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB<8 AND sv_DiemTB>=6 ) s2 ON s1.sv_Maso=s2.sv_Maso
LEFT OUTER JOIN (SELECT sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB<6) s3 ON s2.sv_Maso=s3.sv_Maso
GROUP BY s1.sv_Lop
UNION
SELECT COUNT(s1.sv_Maso) AS 'GIOI',COUNT(s2.sv_Maso) AS 'KHA', COUNT(s3.sv_Maso) AS 'TRUNG BINH', ANY_VALUE(s2.sv_Lop)
FROM (SELECT  sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB<8 AND sv_DiemTB>=6 ) s2
LEFT OUTER JOIN (SELECT sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB>=8) s1 ON s1.sv_Maso=s2.sv_Maso
LEFT OUTER JOIN (SELECT sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB<6) s3 ON s1.sv_Maso=s3.sv_Maso
GROUP BY s2.sv_Lop
UNION
SELECT COUNT(s1.sv_Maso) AS 'GIOI',COUNT(s2.sv_Maso) AS 'KHA', COUNT(s3.sv_Maso) AS 'TRUNG BINH', ANY_VALUE(s3.sv_Lop)
FROM (SELECT sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB<6) s3
LEFT OUTER JOIN (SELECT  sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB<8 AND sv_DiemTB>=6 ) s2 ON s3.sv_Maso=s2.sv_Maso
LEFT OUTER JOIN (SELECT sv_Maso,sv_Lop FROM tblSinhVien WHERE sv_DiemTB>=8) s1 ON s1.sv_Maso=s2.sv_Maso
GROUP BY s3.sv_Lop;

-- Tên lớp, danh sách các sinh viên của lớp sắp xếp theo điểm trung bình giảm dần
SELECT l_Ten,sv_Hodem,sv_Ten,sv_DiemTB FROM tblSinhVien
JOIN tblLop ON tblLop.l_ID=tblSinhVien.sv_Lop
ORDER BY l_Ten, sv_DiemTB DESC;

-- Tên lớp, tổng số sinh viên của lớp
SELECT l_Ten,COUNT(sv_Maso) FROM tblSinhVien
JOIN tblLop ON tblLop.l_ID=tblSinhVien.sv_Lop
GROUP BY l_Ten;

-- Tên khoa, tổng số sinh viên của khoa
SELECT k_Ten,COUNT(sv_Maso) FROM tblSinhVien
JOIN tblLop ON tblSinhVien.sv_Lop=tblLop.l_ID
JOIN tblKhoa ON tblLop.l_Khoa=tblKhoa.k_ID
GROUP BY k_Ten;

-- Tên khoa, tên lớp, điểm trung bình của sinh viên (chú ý: liệt kê tất cả các khoa và lớp, kể cả khoa và lớp chưa có sinh viên)
SELECT k_Ten,l_Ten,sv_Hodem,sv_Ten,sv_DiemTB FROM tblSinhVien
JOIN tblLop ON tblSinhVien.sv_Lop=tblLop.l_ID
JOIN tblKhoa ON tblLop.l_Khoa=tblKhoa.k_ID
ORDER BY k_Ten,l_Ten;

-- Tên khoa, tên lớp, họ tên, ngày sinh, điểm trung bình của sinh viên có điểm trung bình cao nhất lớp 
SELECT ANY_VALUE(k_Ten),ANY_VALUE(l_Ten),ANY_VALUE(sv_Hodem),ANY_VALUE(sv_Ten),ANY_VALUE(sv_Ngaysinh),MAX(sv_DiemTB) FROM tblSinhVien
JOIN tblLop ON tblSinhVien.sv_Lop=tblLop.l_ID
JOIN tblKhoa ON tblLop.l_Khoa=tblKhoa.k_ID
GROUP BY l_Ten;

-- Tên khoa, Họ tên, ngày sinh, điểm trung bình của sinh viên có điểm trung bình cao nhất khoa
SELECT ANY_VALUE(k_Ten),ANY_VALUE(sv_Hodem),ANY_VALUE(sv_Ten),ANY_VALUE(sv_Ngaysinh),MAX(sv_DiemTB) FROM tblSinhVien
JOIN tblLop ON tblSinhVien.sv_Lop=tblLop.l_ID
JOIN tblKhoa ON tblLop.l_Khoa=tblKhoa.k_ID
GROUP BY l_Khoa;
