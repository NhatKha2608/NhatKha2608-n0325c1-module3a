INSERT INTO giao_vien (ma_gv, ho_ten_gv)
VALUES ('GV003', 'Lê Thị Lan'),
       ('GV004', 'Phạm Minh Đức'),
       ('GV005', 'Võ Văn Nghĩa'),
       ('GV006', 'Huỳnh Thị Hoa'),
       ('GV007', 'Nguyễn Hoàng Nam'),
       ('GV008', 'Trần Văn Khánh'),
       ('GV009', 'Lê Thị Mai'),
       ('GV010', 'Hoàng Xuân Thanh');

insert into lop(ma_lop, ten_lop, ma_gvcn, nam_hoc)
values
    ('L0001','Lớp 1A','GV001','2022-2023'),
    ('L0002','Lớp 2A','GV002','2022-2023'),
    ('L0003', 'Lớp 1B', 'GV002', '2022-2023'),
    ('L0004', 'Lớp 2B', 'GV005', '2022-2023'),
    ('L0005', 'Lớp 3A', 'GV004', '2022-2023'),
    ('L0006', 'Lớp 4A', 'GV006', '2022-2023'),
    ('L0007', 'Lớp 3B', 'GV008', '2022-2023'),
    ('L0008', 'Lớp 4B', 'GV010', '2022-2023'),
    ('L0009', 'Lớp 5A', 'GV007', '2022-2023'),
    ('L0010', 'Lớp 5B', 'GV009', '2022-2023');
    
INSERT INTO hoc_sinh (ma_hs, ho_ten_hs, ho_ten_ph, gioi_tinh, dia_chi, ma_lop)
VALUES ('HS001', 'Nguyễn Văn Minh', 'Nguyễn Hoàng Linh', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS002', 'Trần Thị Mai', 'Trần Văn Tuyến', 'Nữ', 'Hải Châu', 'L0002'),
       ('HS003', 'Lê Tuấn Anh', 'Lê Văn Tường', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS004', 'Phạm Thị Hoa', '', 'Nữ', 'Sơn Trà', 'L0003'),
       ('HS005', 'Võ Minh Tuấn', 'Võ Văn Đại', 'Nam', 'Liên Chiểu', ''),
       ('HS006', 'Huỳnh Thị Lan', 'Huỳnh Văn Sơn', 'Nữ', 'Cẩm Lệ', ''),
       ('HS007', 'Nguyễn Hoàng Nam', 'Nguyễn Văn Quang', 'Nam', 'Hòa Vang', 'L0006'),
       ('HS008', 'Trần Minh Trí', '', 'Nam', 'Hải Châu', 'L0007'),
       ('HS009', 'Lê Thị Thanh', 'Lê Văn Tâm', 'Nữ', 'Thanh Khê', 'L0008'),
       ('HS010', 'Hoàng Quốc Bảo', 'Hoàng Văn Lâm', 'Nam', 'Cẩm Lệ', 'L0009');
       
insert into mon_hoc (ma_mh, ten_mh)
values
('MH001', 'toán học'),
('MH002', 'ngữ văn'),
('MH003', 'lịch sử'),
('MH004', 'địa lý'),
('MH005', 'sinh học'),
('MH006', 'vật lí'),
('MH007', 'hóa học'),
('MH008', 'giáo dục công dân'),
('MH009', 'thể dục'),
('MH010', 'âm nhạc');

insert into ket_qua_hoc_tap (ma_hs, hoc_ky, ma_mh, diem_thi_giua_ky, diem_thi_cuoi_ky, ngay_gio_thi_cuoi_ky) values 
('HS001', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
('HS002', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
('HS003', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
('HS004', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
('HS005', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
('HS006', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
('HS007', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
('HS008', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
('HS009', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
('HS010', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
('HS011', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
('HS012', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
('HS013', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
('HS014', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
('HS015', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00');


INSERT INTO phu_trach_bo_mon (ma_gvpt, ma_lop, ma_mh, hoc_ky)
VALUES 
('GV001', 'L001', 'MH001', 'Học kỳ 1'),
('GV002', 'L003', 'MH002', 'Học kỳ 1'),
('GV003', 'L002', 'MH003', 'Học kỳ 1'),
('GV004', 'L004', 'MH004', 'Học kỳ 1'),
('GV005', 'L005', 'MH005', 'Học kỳ 1'),
('GV006', 'L006', 'MH006', 'Học kỳ 1'),
('GV007', 'L007', 'MH007', 'Học kỳ 1'),
('GV008', 'L008', 'MH008', 'Học kỳ 1'),
('GV009', 'L009', 'MH009', 'Học kỳ 1'),
('GV010', 'L010', 'MH010', 'Học kỳ 1'),
('GV001', 'L001', 'MH001', 'Học kỳ 2'),
('GV002', 'L003', 'MH002', 'Học kỳ 2'),
('GV003', 'L002', 'MH003', 'Học kỳ 2'),
('GV004', 'L004', 'MH004', 'Học kỳ 2'),
('GV005', 'L005', 'MH005', 'Học kỳ 2'),
('GV006', 'L006', 'MH006', 'Học kỳ 2'),
('GV007', 'L007', 'MH007', 'Học kỳ 2'),
('GV008', 'L008', 'MH008', 'Học kỳ 2'),
('GV009', 'L009', 'MH009', 'Học kỳ 2'),
('GV010', 'L010', 'MH010', 'Học kỳ 2');