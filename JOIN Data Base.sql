SELECT 
	pen.id_invoice,
	pen.tanggal AS penjualan_date,
	pen.jumlah_barang AS penjualan_num,
	pen.harga AS penjualan_price,
	pel.nama AS cabang_name,
	pel.cabang_sales AS cabang_wilayah,
	bar.nama_barang AS barang_name,
	bar.kemasan AS barang_package
FROM penjualan pen
LEFT JOIN pelanggan pel
ON pen.id_customer = pel.id_customer
LEFT JOIN barang bar
ON pen.id_barang = bar.kode_barang
WHERE SUBSTR(pel.nama, 1, 6) = 'APOTEK' 