--===============================================
--case 1(cari keeper dengan workload terbanyak)
--===============================================

with rekap_tugas as (
    select 
        k.nama_keeper,
        count(j.id_jadwal) as total_jadwal_perawatan
    from keeper k
    join jadwal_perawatan j on k.id_keeper = j.id_keeper
    group by k.nama_keeper
),
ranking_workload as (
    select
        nama_keeper,
        total_jadwal_perawatan,
        -- Kolom 1: Hasil 1, 1, 3 (angka diskip)
        rank() over(order by total_jadwal_perawatan desc) as rank_biasa,
        
        -- Kolom 2: Hasil 1, 1, 2 (angka lanjut)
        dense_rank() over(order by total_jadwal_perawatan desc) as rank_padat,
        
        -- Kolom 3: Hasil 1, 2, 3 (pasti berurutan unik)
        row_number() over(order by total_jadwal_perawatan desc) as nomor_baris
    from rekap_tugas
)
select * from ranking_workload;