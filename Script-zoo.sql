--TABEL
create table spesies (
	id_spesies SERIAL primary key,
	nama_spesies varchar(100),
	kategori_pakan varchar(50),
	habitat varchar(100)
);

create table keeper (
	id_keeper SERIAL primary key,
	nama_keeper varchar(100),
	pengalaman varchar(50),
	spesialisasi varchar(100)
);

create table hewan (
	id_hewan SERIAL primary key,
	nama_panggilan varchar(100),
	id_spesies INT,
	id_keeper INT,
	berat_kg INT,
	foreign key (id_spesies) references spesies(id_spesies),
	foreign key (id_keeper) references keeper(id_keeper)
);

create table jadwal_perawatan (
	id_jadwal SERIAL primary key,
	id_hewan INT,
	id_keeper INT,
	tanggal_kegiatan DATE,
	jenis_kegiatan varchar(100),
	biaya_operasional INT,
	foreign key (id_hewan) references hewan(id_hewan),
	foreign key (id_keeper) references keeper(id_keeper)
);

--data dummy
INSERT INTO spesies (nama_spesies, kategori_pakan, habitat) VALUES
('Gajah Sumatera', 'Herbivora', 'Sabana Terbuka'),
('Rusa Tutul', 'Herbivora', 'Sabana Terbuka'),
('Flamingo', 'Omnivora', 'Area Air'),
('Iguana Hijau', 'Herbivora', 'Zona Eksotis'),
('Ular Sanca', 'Karnivora', 'Zona Eksotis'),
('Landak Mini', 'Omnivora', 'Zona Eksotis');

INSERT INTO keeper (nama_keeper, pengalaman, spesialisasi) VALUES
('Pak Anton', 'Senior', 'Mamalia Besar'),
('Bu Rina', 'Senior', 'Reptil & Eksotis'),
('Dimas', 'Part-time Mahasiswa', 'Asisten General');

INSERT INTO hewan (nama_panggilan, id_spesies, id_keeper, berat_kg) VALUES
('Bona', 1, 1, 3000), -- Gajah Sumatera
('Piko', 2, 1, 80),   -- Rusa Tutul
('Pinky', 3, 3, 3),   -- Flamingo
('Spike', 4, 2, 5),   -- Iguana Hijau
('Kaa', 5, 2, 15),    -- Ular Sanca
('Sonic', 6, 3, 1);   -- Landak Mini

INSERT INTO jadwal_perawatan (id_hewan, id_keeper, tanggal_kegiatan, jenis_kegiatan, biaya_operasional) VALUES
(1, 1, '2026-09-01', 'Feeding Rumput Gajah', 500000),
(1, 1, '2026-09-02', 'Medical Checkup', 1500000),
(2, 3, '2026-09-02', 'Feeding Sayuran', 200000),
(4, 2, '2026-09-03', 'Pemeriksaan Suhu Kadal', 100000),
(5, 2, '2026-09-04', 'Feeding Tikus Putih', 300000),
(6, 3, '2026-09-05', 'Pembersihan Kandang', 50000),
(3, 3, '2026-09-06', 'Feeding Pelet Khusus', 150000),
(1, 1, '2026-09-07', 'Feeding Rumput Gajah', 500000);
