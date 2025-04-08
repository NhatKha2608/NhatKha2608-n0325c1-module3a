create database quan_ly_truong_tieu_hoc;
use quan_ly_truong_tieu_hoc;

CREATE TABLE giao_vien (
    ma_gv CHAR(5) PRIMARY KEY,
    ho_ten_gv VARCHAR(255)
);


CREATE TABLE lop (
    ma_lop CHAR(5) PRIMARY KEY,
    ten_lop VARCHAR(255),
    ma_gvcn CHAR(5),
    nam_hoc VARCHAR(50),
    FOREIGN KEY (ma_gvcn) REFERENCES giao_vien(ma_gv)
);


CREATE TABLE hoc_sinh (
    ma_hs CHAR(5) PRIMARY KEY,
    ho_ten_hs VARCHAR(255),
    ho_ten_ph VARCHAR(255),
    gioi_tinh VARCHAR(10),
    dia_chi VARCHAR(255),
    ma_lop CHAR(5),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop)
);

CREATE TABLE mon_hoc (
    ma_mh CHAR(5) PRIMARY KEY,
    ten_mh VARCHAR(255)
);

CREATE TABLE ket_qua_hoc_tap (
    ma_hs CHAR(5),
    hoc_ky VARCHAR(10),
    ma_mh CHAR(5),
    diem_thi_giua_ky FLOAT,
    diem_thi_cuoi_ky FLOAT,
    ngay_gio_thi_cuoi_ky DATETIME,
    PRIMARY KEY (ma_hs, hoc_ky, ma_mh),
    FOREIGN KEY (ma_hs) REFERENCES hoc_sinh(ma_hs),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);


select *from ket_qua_hoc_tap;
CREATE TABLE phu_trach_bo_mon (
    ma_gvpt CHAR(5),
    ma_lop CHAR(5),
    ma_mh CHAR(5),
    hoc_ky VARCHAR(10),
    PRIMARY KEY (ma_gvpt, ma_lop, ma_mh, hoc_ky),
    FOREIGN KEY (ma_gvpt) REFERENCES giao_vien(ma_gv),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);



select *from giao_vien ;

select ho_ten_hs,gioi_tinh,ho_ten_ph from hoc_sinh;

select *from lop;

select *from hoc_sinh where gioi_tinh = 'Nam';

select ho_ten_hs, gioi_tinh, dia_chi from hoc_sinh where ho_ten_ph is null;

select * from lop where ma_gvcn is null;

select * from hoc_sinh where ma_lop is null;

select * from hoc_sinh where gioi_tinh = 'Nữ' and dia_chi = 'Thanh Khê';

select * from hoc_sinh 
where (gioi_tinh = 'Nam' and dia_chi = 'Hải Châu') 
   or (gioi_tinh = 'Nữ' and dia_chi = 'Thanh Khê');
   
select * from hoc_sinh where (gioi_tinh = 'Nam' and ho_ten_ph is null) or (gioi_tinh = 'Nữ' and ma_lop is null);

select * from hoc_sinh where gioi_tinh = 'Nam' and (ma_lop is null or ho_ten_ph is null);