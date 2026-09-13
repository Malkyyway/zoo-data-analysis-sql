--==============================================
-- Case 2 (biaya kategori pakan dan hewan terboros)
--==============================================

--Part A
select 
	s.kategori_pakan,
	sum(j.biaya_operasional) as biaya
from jadwal_perawatan j
join hewan h on j.id_hewan = h.id_hewan
join spesies s on h.id_spesies = s.id_spesies
group by s.kategori_pakan
order by biaya desc;

--Part B
select
	h.nama_panggilan,
	s.nama_spesies,
	sum(j.biaya_operasional) as biaya
from jadwal_perawatan j
join hewan h on j.id_hewan = h.id_hewan
join spesies s on h.id_spesies = s.id_spesies
group by h.nama_panggilan, s.nama_spesies
order by biaya desc
limit 3;
