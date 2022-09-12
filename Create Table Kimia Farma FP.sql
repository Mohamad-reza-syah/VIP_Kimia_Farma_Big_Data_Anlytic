CREATE TABLE pelanggan (
	id_customer VARCHAR,
	levels VARCHAR,
	nama VARCHAR,
	id_cabang_sales VARCHAR,
	cabang_sales VARCHAR,
	id_group VARCHAR,
	group_ak VARCHAR
);

ALTER TABLE pelanggan
ADD PRIMARY KEY (id_customer);

COPY pelanggan (
	id_customer,
	levels,
	nama,
	id_cabang_sales,
	cabang_sales,
	id_group,
	group_ak
)
FROM 'E:\Rakamin\JAP\Virtual Internship Program\Kimia Farma Big Data Anlytic (VIP)\Week 4\Final Task\Data\pelanggan.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE barang (
	kode_barang VARCHAR,
	sektor CHAR,
	nama_barang VARCHAR,
	tipe VARCHAR,
	nama_tipe VARCHAR,
	kode_lini INT,
	lini VARCHAR,
	kemasan VARCHAR
);

ALTER TABLE barang
ADD PRIMARY KEY (kode_barang);

COPY barang (
	kode_barang,
	sektor,
	nama_barang,
	tipe,
	nama_tipe,
	kode_lini,
	lini,
	kemasan
)
FROM 'E:\Rakamin\JAP\Virtual Internship Program\Kimia Farma Big Data Anlytic (VIP)\Week 4\Final Task\Data\barang.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE penjualan (
	id_distributor VARCHAR,
	id_cabang VARCHAR,
	id_invoice VARCHAR,
	tanggal TIMESTAMP,
	id_customer VARCHAR,
	id_barang VARCHAR,
	jumlah_barang INT,
	unit VARCHAR,
	harga REAL,
	mata_uang VARCHAR,
	brand_id VARCHAR,
	lini VARCHAR
);

ALTER TABLE penjualan
ADD PRIMARY KEY (id_invoice);

ALTER TABLE penjualan
ADD FOREIGN KEY (id_customer) REFERENCES pelanggan(id_customer),
ADD FOREIGN KEY (id_barang) REFERENCES barang(kode_barang);

COPY penjualan (
	id_distributor,
	id_cabang,
	id_invoice,
	tanggal,
	id_customer,
	id_barang,
	jumlah_barang,
	unit,
	harga,
	mata_uang,
	brand_id,
	lini
)
FROM 'E:\Rakamin\JAP\Virtual Internship Program\Kimia Farma Big Data Anlytic (VIP)\Week 4\Final Task\Data\penjualan.csv'
DELIMITER ','
CSV HEADER;



