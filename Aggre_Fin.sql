WITH pen_apotek_perbulan  AS(
SELECT 
	CASE
		WHEN date_part('month',pen.tanggal) = 1 THEN 'January'
		WHEN date_part('month',pen.tanggal) = 2 THEN 'February'
		WHEN date_part('month',pen.tanggal) = 3 THEN 'March'
		WHEN date_part('month',pen.tanggal) = 4 THEN 'April'
		WHEN date_part('month',pen.tanggal) = 5 THEN 'May'
		WHEN date_part('month',pen.tanggal) = 6 THEN 'June'
		WHEN date_part('month',pen.tanggal) = 7 THEN 'July'
		WHEN date_part('month',pen.tanggal) = 8 THEN 'August'
		WHEN date_part('month',pen.tanggal) = 9 THEN 'September'
		WHEN date_part('month',pen.tanggal) = 10 THEN 'October'
		WHEN date_part('month',pen.tanggal) = 11 THEN 'November'
		WHEN date_part('month',pen.tanggal) = 12 THEN 'December'
		ELSE 'Bulan Salah'
	END AS penjualan_bulan,
	pel.cabang_sales AS cabang_wilayah,
	bar.nama_barang AS barang_name,
	SUM(pen.harga) AS total_penjualan,
	SUM(pen.jumlah_barang) AS jumlah_terjual
FROM penjualan pen
LEFT JOIN pelanggan pel
ON pen.id_customer = pel.id_customer
LEFT JOIN barang bar
ON pen.id_barang = bar.kode_barang
WHERE SUBSTR(pel.nama, 1, 6) = 'APOTEK' 
GROUP BY 1,2,3
)

SELECT *
FROM pen_apotek_perbulan
ORDER BY EXTRACT(MONTH FROM TO_DATE(penjualan_bulan, 'Month'))
