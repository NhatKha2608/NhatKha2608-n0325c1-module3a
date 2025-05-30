create database quan_ly_truong_tieu_hoc;
use quan_ly_truong_tieu_hoc;

drop database quan_ly_truong_tieu_hoc;
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

select * from hoc_sinh where ho_ten_hs like 'Nguyễn%';

select * from hoc_sinh where ho_ten_hs like '% Nở';

select * from hoc_sinh where ho_ten_hs like '%Thị%';

select * from hoc_sinh where ho_ten_hs like '%Thị%' and ho_ten_hs not like '%Thị' and ho_ten_hs not like 'Thị%' ;

select * from hoc_sinh where char_length(ho_ten_hs) = 30 ;

select * from hoc_sinh where char_length(ho_ten_hs) <= 30 ;

select * from hoc_sinh where char_length(ho_ten_hs) <= 30 and ho_ten_hs like 'N%';

select * from hoc_sinh where ho_ten_hs like 'N%' or ho_ten_hs like 'T%' or ho_ten_hs like 'V%';

select * from hoc_sinh where ho_ten_hs not like 'N%' and ho_ten_hs not like 'T%' and ho_ten_hs not like 'V%';

select * from hoc_sinh where char_length(substring_index(ho_ten_hs, ' ', 1)) = 4;

select * from hoc_sinh order by ho_ten_hs;

select * from hoc_sinh order by dia_chi;

select * from hoc_sinh order by ho_ten_hs, dia_chi desc;

select * from hoc_sinh order by ho_ten_hs, dia_chi;

select * from hoc_sinh order by ho_ten_hs desc , dia_chi desc;

select * from hoc_sinh order by ho_ten_hs desc , dia_chi desc, ho_ten_ph;

select * from hoc_sinh order by substring_index(ho_ten_hs,' ',1 );

select substring_index(substring_index(ho_ten_hs,' ',2 ),' ',-1) from hoc_sinh order by substring_index(ho_ten_hs,' ',1 );

select ma_hs, ho_ten_hs, gioi_tinh, hoc_sinh.ma_lop, ten_lop, ma_gvcn from hoc_sinh inner join lop on hoc_sinh.ma_lop = lop.ma_lop;

select hoc_sinh.ma_hs, ho_ten_hs, hoc_ky, ma_mh, diem_thi_giua_ky, diem_thi_cuoi_ky from hoc_sinh inner join ket_qua_hoc_tap on hoc_sinh.ma_hs = ket_qua_hoc_tap.ma_hs;

select ma_gv, ho_ten_gv, ma_lop, ma_mh, hoc_ky from giao_vien inner join phu_trach_bo_mon on giao_vien.ma_gv = phu_trach_bo_mon.ma_gvpt ;

select ma_hs, ho_ten_hs, gioi_tinh, hoc_sinh.ma_lop, ten_lop, ma_gvcn from hoc_sinh left join lop on hoc_sinh.ma_lop = lop.ma_lop;

select ma_hs, ho_ten_hs, gioi_tinh, hoc_sinh.ma_lop, ten_lop, nam_hoc, ma_gvcn, ho_ten_gv from hoc_sinh inner join lop on hoc_sinh.ma_lop = lop.ma_lop inner join giao_vien on lop.ma_gvcn = giao_vien.ma_gv;

select hoc_sinh.ma_hs, ho_ten_hs, hoc_ky,mon_hoc.ma_mh, ten_mh, diem_thi_giua_ky, diem_thi_cuoi_ky from hoc_sinh inner join ket_qua_hoc_tap on hoc_sinh.ma_hs = ket_qua_hoc_tap.ma_hs inner join mon_hoc on  mon_hoc.ma_mh = ket_qua_hoc_tap.ma_mh;

SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,l.ma_lop, gvpt.ho_ten_gv AS giao_vien_phu_trach, gvcn.ho_ten_gv AS giao_vien_chu_nhiem
FROM hoc_sinh hs
JOIN lop l ON hs.ma_lop = l.ma_lop
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
LEFT JOIN phu_trach_bo_mon pt ON pt.ma_lop = l.ma_lop AND pt.ma_mh = mh.ma_mh AND pt.hoc_ky = kq.hoc_ky
LEFT JOIN giao_vien gvpt ON pt.ma_gvpt = gvpt.ma_gv
LEFT JOIN giao_vien gvcn ON l.ma_gvcn = gvcn.ma_gv;

SELECT hs.ma_hs, hs.ho_ten_hs, l.ma_lop, gvcn.ho_ten_gv AS gv_chu_nhiem, kq.hoc_ky, mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, gvpt.ho_ten_gv AS gv_phu_trach
FROM hoc_sinh hs
JOIN lop l ON hs.ma_lop = l.ma_lop
JOIN giao_vien gvcn ON l.ma_gvcn = gvcn.ma_gv
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
JOIN phu_trach_bo_mon pt ON pt.ma_lop = l.ma_lop AND pt.ma_mh = mh.ma_mh AND pt.hoc_ky = kq.hoc_ky
JOIN giao_vien gvpt ON pt.ma_gvpt = gvpt.ma_gv;

SELECT hs.ma_hs, hs.ho_ten_hs, l.ma_lop, gvcn.ho_ten_gv AS gv_chu_nhiem, kq.hoc_ky, mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,gvpt.ho_ten_gv AS gv_phu_trach
FROM hoc_sinh hs
JOIN lop l ON hs.ma_lop = l.ma_lop
JOIN giao_vien gvcn ON l.ma_gvcn = gvcn.ma_gv
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
JOIN phu_trach_bo_mon pt ON pt.ma_lop = l.ma_lop AND pt.ma_mh = mh.ma_mh AND pt.hoc_ky = kq.hoc_ky
JOIN giao_vien gvpt ON pt.ma_gvpt = gvpt.ma_gv
WHERE hs.gioi_tinh = 'Nữ'  AND (kq.diem_thi_giua_ky >= 9 OR kq.diem_thi_cuoi_ky >= 9);

SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, l.ma_lop, gvpt.ho_ten_gv AS giao_vien_phu_trach
FROM hoc_sinh hs
JOIN lop l ON hs.ma_lop = l.ma_lop
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
JOIN phu_trach_bo_mon pt ON pt.ma_lop = l.ma_lop AND pt.ma_mh = mh.ma_mh AND pt.hoc_ky = kq.hoc_ky
JOIN giao_vien gvpt ON pt.ma_gvpt = gvpt.ma_gv
WHERE pt.ma_gvpt = l.ma_gvcn;

SELECT DISTINCT mh.ma_mh, mh.ten_mh, l.ma_lop, kq.hoc_ky FROM ket_qua_hoc_tap kq
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop l ON hs.ma_lop = l.ma_lop
WHERE YEAR(kq.ngay_gio_thi_cuoi_ky) = 2023;

SELECT DISTINCT mh.ma_mh, mh.ten_mh, l.ma_lop, kq.hoc_ky FROM ket_qua_hoc_tap kq
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop l ON hs.ma_lop = l.ma_lop
WHERE YEAR(kq.ngay_gio_thi_cuoi_ky) = 2023 AND MONTH(kq.ngay_gio_thi_cuoi_ky) = 8;

SELECT DISTINCT kq.ma_mh, hs.ma_lop, kq.hoc_ky FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky < '2023-08-20';


SELECT DISTINCT kq.ma_mh, hs.ma_lop, kq.hoc_ky FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky = '2023-08-13';

SELECT DISTINCT  kq.ma_mh, hs.ma_lop, kq.hoc_ky FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky > '2023-08-20';

SELECT DISTINCT ho_ten_hs FROM hoc_sinh;

SELECT DISTINCT ma_lop FROM hoc_sinh WHERE ma_lop IS NOT NULL AND ma_lop <> '';

SELECT DISTINCT ma_mh FROM phu_trach_bo_mon;

SELECT DISTINCT ma_mh FROM ket_qua_hoc_tap;

SELECT DISTINCT ma_gvcn FROM lop WHERE ma_gvcn IS NOT NULL;

-- Group by --
select ma_mh, avg(diem_thi_cuoi_ky) as diem_tb_cuoi_ky
from ket_qua_hoc_tap
group by ma_mh;

select ma_mh, avg(diem_thi_cuoi_ky) as diem_tb_cuoi_ky
from ket_qua_hoc_tap
group by ma_mh
having avg(diem_thi_cuoi_ky) > 8;

select* from hoc_sinh having gioi_tinh = 'Nam';

select dia_chi from hoc_sinh group by dia_chi;

select ho_ten_hs, gioi_tinh from hoc_sinh group by ho_ten_hs, gioi_tinh;

select ho_ten_hs from hoc_sinh group by ho_ten_hs;

select kq.ma_mh, ten_mh, diem_thi_cuoi_ky 
from ket_qua_hoc_tap kq 
join mon_hoc mh on kq.ma_mh = mh.ma_mh
where diem_thi_cuoi_ky is not null
group by kq.ma_mh, diem_thi_cuoi_ky ;


select ma_gv, ho_ten_gv
from giao_vien gv
join giao_vien_phu_trach;

select ho_ten_hs from hoc_sinh where ma_hs not in ( select distinct ma_hs from ket_qua_hoc_tap);

select ho_ten_gv from giao_vien where ma_gv not in (select distinct ma_gvpt from phu_trach_bo_mon);

select ho_ten_gv from giao_vien where ma_gv not in ( select distinct ma_gvcn from lop);

select ten_mh from mon_hoc where ma_mh not in (select distinct ma_mh from ket_qua_hoc_tap);

select dia_chi , count(*) as so_luong_hoc_sinh
from hoc_sinh
group by dia_chi
having so_luong_hoc_sinh > 3;

select ten_mh, avg(diem_thi_cuoi_ky) as diem_tb_cuoi_ky
from mon_hoc mh
join ket_qua_hoc_tap kq on mh.ma_mh = kq.ma_mh
group by mh.ma_mh , mh.ten_mh
having diem_tb_cuoi_ky between 5 and 10;


select ho_ten_hs as ho_ten , 'Học sinh' as nghiep_ngh from hoc_sinh
union
select ho_ten_gv as ho_ten , 'Giáo viên'as nghiep_ngh from giao_vien;

select month(ngay_gio_thi_cuoi_ky) as thang, avg((diem_thi_cuoi_ky +diem_thi_giua_ky)/2) as diem_trung_binh
from ket_qua_hoc_tap kq
where year(ngay_gio_thi_cuoi_ky) = 2023
group by thang
order by thang;

select kqht.ma_mh, mh.ten_mh, kqht.diem_thi_cuoi_ky
from ket_qua_hoc_tap kqht
join mon_hoc mh on kqht.ma_mh = mh.ma_mh
where kqht.diem_thi_cuoi_ky is not null
group by kqht.ma_mh, kqht.diem_thi_cuoi_ky;

select gv.ma_gv, gv.ho_ten_gv
from giao_vien gv
join phu_trach_bo_mon pt on gv.ma_gv = pt.ma_gvpt
group by gv.ma_gv;

select month(kqht.ngay_gio_thi_cuoi_ky) as thang, year(kqht.ngay_gio_thi_cuoi_ky) as nam
from ket_qua_hoc_tap kqht
where kqht.diem_thi_cuoi_ky is not null
group by month(kqht.ngay_gio_thi_cuoi_ky), year(kqht.ngay_gio_thi_cuoi_ky);

select hs.ho_ten_hs
from hoc_sinh hs
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
where hs.dia_chi like '%Hải Châu%' and (kq.diem_thi_giua_ky is not null or kq.diem_thi_cuoi_ky is not null)
group by hs.ho_ten_hs;

-- left join
select l.ma_lop, l.ten_lop, l.ma_gvcn, gv.ho_ten_gv
from lop l
left join giao_vien gv on l.ma_gvcn = gv.ma_gv;

select hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
from hoc_sinh hs
left join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
left join mon_hoc mh on kq.ma_mh = mh.ma_mh;

select hs.ma_hs, hs.ho_ten_hs, l.ma_lop, l.ten_lop, l.ma_gvcn, gv.ho_ten_gv
from hoc_sinh hs
left join lop l on hs.ma_lop = l.ma_lop
left join giao_vien gv on l.ma_gvcn = gv.ma_gv;

select gv.ma_gv, gv.ho_ten_gv, l.ma_lop, l.ten_lop, pt.ma_mh, pt.hoc_ky, mh.ten_mh
from giao_vien gv
left join phu_trach_bo_mon pt on gv.ma_gv = pt.ma_gvpt
left join lop l on pt.ma_lop = l.ma_lop
left join mon_hoc mh on pt.ma_mh = mh.ma_mh;

-- limit
select *
from hoc_sinh
where ma_lop = '1A'
order by ho_ten_hs
limit 5 offset 10;

select gv.ma_gv, gv.ho_ten_gv, pt.ma_lop, pt.ma_mh, mh.ten_mh
from phu_trach_bo_mon pt
join giao_vien gv on pt.ma_gvpt = gv.ma_gv
join mon_hoc mh on pt.ma_mh = mh.ma_mh
where pt.ma_lop = '5A'
order by mh.ten_mh
limit 5 offset 5;


select ho_ten_hs 
from hoc_sinh hs
where exists(
		select 1
        from ket_qua_hoc_tap kq
        where kq.ma_hs = hs.ma_hs and kq.ma_mh = 'MH001'
);

select ho_ten_gv
from giao_vien gv
where exists(
		select 1
        from phu_trach_bo_mon pt
        where gv.ma_gv = pt.ma_gvpt
);

select hs.ma_hs, hs.ho_ten_hs
from hoc_sinh hs 
where exists (
		select 1
        from lop l
        where hs.ma_lop = l.ma_lop and hs.ma_lop = 'L0001' or hs.ma_lop = 'L0005'
);