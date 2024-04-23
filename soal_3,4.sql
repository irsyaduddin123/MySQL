1.	Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbpos_sib6]> SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan
    -> FROM pelanggan
    -> GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Belfast    |                1 |
| Jakarta    |                3 |
| Kediri     |                2 |
| Pati       |                1 |
| Solo       |                1 |
| Surabaya   |                2 |
| Tangerang  |                1 |
| Yogyakarta |                1 |
+------------+------------------+
8 rows in set (0.000 sec)

2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbpos_sib6]> SELECT jenis_produk_id, COUNT(*) AS jumlah_produk
    -> FROM produk
    -> GROUP BY jenis_produk_id;
+-----------------+---------------+
| jenis_produk_id | jumlah_produk |
+-----------------+---------------+
|               1 |            13 |
|               2 |             1 |
|               4 |             5 |
|               5 |             3 |
+-----------------+--------

3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan
WHERE YEAR(CURDATE()) - YEAR(tgl_lahir) < (SELECT AVG(YEAR(CURDATE()) - YEAR(tgl_lahir)) FROM pelanggan);

+----+-------+--------------------+----+-----------+------------+------------------+----------+
| id | kode  | nama               | jk | tmp_lahir | tgl_lahir  | email            | kartu_id |
+----+-------+--------------------+----+-----------+------------+------------------+----------+
|  1 | C001  | Agung Sedayu Group | L  | Solo      | 2010-01-01 | sedayu@gmail.com |        1 |
|  9 | C009  | Ahmad Hasan        | L  | Surabaya  | 1992-10-15 | ahasan@gmail.com |        4 |
| 11 | K0010 | Andi Wijaya        | L  | Tangerang | 2023-11-07 | andi@gmail.com   |        2 |
| 12 | K0011 | Ira                | P  | Jakarta   | 2023-11-07 | ira@gmail.com    |        4 |
+----+-------+--------------------+----+-----------+------------+------------------+----------+
4 rows in set (0.001 sec)

4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbpos_sib6]> SELECT * FROM produk
    -> WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
+----+--------+-------------------+------------+------------+------+----------+------+-----------+-----------------+
| id | kode   | nama              | harga_beli | harga_jual | stok | min_stok | foto | deskripsi | jenis_produk_id |
+----+--------+-------------------+------------+------------+------+----------+------+-----------+-----------------+
|  1 | TV01   | Televisi 21 inchs |    3500000 |   50500000 |    5 |        2 |      | NULL      |               1 |
| 19 | TV0115 | Televisi 22 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 20 | TV0116 | Televisi 23 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 21 | TV0117 | Televisi 24 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 22 | TV0118 | Televisi 25 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 24 | TV0120 | Televisi 27 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 25 | TV0121 | Televisi 28 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 26 | TV0122 | Televisi 29 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
+----+--------+-------------------+------------+------------+------+----------+------+-----------+-----------------+
8 rows in set (0.000 sec)

5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan
    -> WHERE kartu_id IN (SELECT id FROM kartu WHERE iuran > 90000);
+----+-------+--------------------+----+------------+------------+-------------------+----------+
| id | kode  | nama               | jk | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
|  1 | C001  | Agung Sedayu Group | L  | Solo       | 2010-01-01 | sedayu@gmail.com  |        1 |
|  2 | C002  | Pandan Wangi       | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com   |        2 |
|  3 | C003  | Sekar Mirah        | P  | Kediri     | 1983-02-20 | mirah@yahoo.com   |        1 |
|  5 | C005  | Pradabashu         | L  | Pati       | 1985-04-02 | prada85@gmail.com |        2 |
|  6 | C006  | Gayatri Dwi        | P  | Jakarta    | 1987-11-28 | gaya87@gmail.com  |        1 |
|  7 | C007  | Dewi Gyat          | P  | Jakarta    | 1988-12-01 | giyat@gmail.com   |        1 |
| 10 | C010  | Cassanndra         | P  | Belfast    | 1990-11-20 | casa90@gmail.com  |        1 |
| 11 | K0010 | Andi Wijaya        | L  | Tangerang  | 2023-11-07 | andi@gmail.com    |        2 |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
8 rows in set (0.000 sec)

6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_produk,
    ->        MIN(harga_jual) AS harga_terendah,
    ->        MAX(harga_jual) AS harga_tertinggi,
    ->        AVG(harga_jual) AS rata_rata_harga
    -> FROM produk
    -> WHERE harga_jual < (SELECT AVG(harga_jual) FROM produk);
+---------------+----------------+-----------------+-------------------+
| jumlah_produk | harga_terendah | harga_tertinggi | rata_rata_harga   |
+---------------+----------------+-----------------+-------------------+
|            14 |           2500 |        16000000 | 4819785.714285715 |
+---------------+----------------+-----------------+-------------------+
1 row in set (0.000 sec)


7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan
    -> WHERE kartu_id IN (SELECT id  FROM kartu WHERE diskon > 0.03);
+----+-------+--------------------+----+------------+------------+-------------------+----------+
| id | kode  | nama               | jk | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
|  1 | C001  | Agung Sedayu Group | L  | Solo       | 2010-01-01 | sedayu@gmail.com  |        1 |
|  2 | C002  | Pandan Wangi       | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com   |        2 |
|  3 | C003  | Sekar Mirah        | P  | Kediri     | 1983-02-20 | mirah@yahoo.com   |        1 |
|  5 | C005  | Pradabashu         | L  | Pati       | 1985-04-02 | prada85@gmail.com |        2 |
|  6 | C006  | Gayatri Dwi        | P  | Jakarta    | 1987-11-28 | gaya87@gmail.com  |        1 |
|  7 | C007  | Dewi Gyat          | P  | Jakarta    | 1988-12-01 | giyat@gmail.com   |        1 |
| 10 | C010  | Cassanndra         | P  | Belfast    | 1990-11-20 | casa90@gmail.com  |        1 |
| 11 | K0010 | Andi Wijaya        | L  | Tangerang  | 2023-11-07 | andi@gmail.com    |        2 |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
8 rows in set (0.000 sec)
