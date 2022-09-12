CREATE TABLE total_penjualan_Apotek AS
SELECT 
	CASE
		WHEN date_part('month',pen.tanggal) = 1 THEN 'Januari'
		WHEN date_part('month',pen.tanggal) = 2 THEN 'Februari'
		WHEN date_part('month',pen.tanggal) = 3 THEN 'Maret'
		WHEN date_part('month',pen.tanggal) = 4 THEN 'April'
		WHEN date_part('month',pen.tanggal) = 5 THEN 'Mei'
		WHEN date_part('month',pen.tanggal) = 6 THEN 'Juni'
		WHEN date_part('month',pen.tanggal) = 7 THEN 'Juli'
		WHEN date_part('month',pen.tanggal) = 8 THEN 'Agustus'
		WHEN date_part('month',pen.tanggal) = 9 THEN 'September'
		WHEN date_part('month',pen.tanggal) = 10 THEN 'Oktober'
		WHEN date_part('month',pen.tanggal) = 11 THEN 'November'
		WHEN date_part('month',pen.tanggal) = 12 THEN 'Desember'
		ELSE 'Bulan Salah'
	END AS penjualan_bulan,
	pel.cabang_sales AS cabang_wilayah,
	bar.nama_barang AS barang_name,
	SUM(pen.harga) AS total_penjualan,
	SUM(pen.jumlah_barang) AS jumlah_terjual,
	date_part('month',pen.tanggal) AS id_bulan
FROM penjualan pen
LEFT JOIN pelanggan pel
ON pen.id_customer = pel.id_customer
LEFT JOIN barang bar
ON pen.id_barang = bar.kode_barang
WHERE SUBSTR(pel.nama, 1, 6) = 'APOTEK' 
GROUP BY 1,2,3,6
ORDER BY 6;

-- Altering order coloumn and show data
ALTER TABLE total_penjualan_Apotek
DROP COLUMN urutan_bulan;

SELECT * FROM total_penjualan_Apotek

-- Spesific for month and region
CREATE TABLE total_penjualan_Apotek_perbulan AS
SELECT 
		penjualan_bulan,
		cabang_wilayah,
		urutan_bulan,
		SUM(total_penjualan) AS total_jual,
		SUM(jumlah_terjual) AS total_jumlah
FROM total_penjualan_Apotek
GROUP BY 1,2,3
ORDER BY 3;

-- Altering order coloumn and show data spesific
ALTER TABLE total_penjualan_Apotek_perbulan
DROP COLUMN urutan_bulan;

SELECT * FROM total_penjualan_Apotek_perbulan

-- Drop Table 
DROP TABLE total_penjualan_Apotek;
DROP TABLE total_penjualan_Apotek_perbulan;