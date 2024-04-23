1.	Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> SELECT SUM(harga_beli * stok) as total from produk;
+-----------+
| total     |
+-----------+
| 480504000 |
+-----------+
1 row in set (0.022 sec)

SELECT * FROM produk WHERE harga_beli * stok > 20000000;
Hasil :
+----+-------+------------------+------------+------------+------+----------+------------------------+-----------+-----------------+
| id | kode  | nama             | harga_beli | harga_jual | stok | min_stok | foto                   | deskripsi | jenis_produk_id |
+----+-------+------------------+------------+------------+------+----------+------------------------+-----------+-----------------+
|  2 | TV02  | Televisi 40 inch |    5500000 |    7440000 |    4 |        2 | NULL                   | NULL      |               1 |
|  3 | K001  | Kulkas 2 pintu   |    3500000 |    4680000 |    6 |        2 |                        | NULL      |               1 |
|  6 | PC01  | PC Desktop HP    |    7000000 |    9984000 |    9 |        2 | NULL                   | NULL      |               5 |
|  8 | AC01  | Notebook Acer S  |    8000000 |   11232000 |    7 |        2 | NULL                   | NULL      |               5 |
|  9 | LN01  | Notebook Lenovo  |    9000000 |   12480000 |    9 |        2 | NULL                   | NULL      |               5 |
| 11 | L005  | Laptop Lenovo    |   13000000 |   16000000 |    5 |        2 |                        | NULL      |               1 |
| 18 | L0015 | Laptop Asus      |    3000000 |    5000000 |   10 |       20 | foto-65542ffa66604.jpg | NULL      |               1 |
+----+-------+------------------+------------+------------+------+----------+------------------------+-----------+-----------------+
7 rows in set (0.000 sec)

2.	Tampilkan data produk beserta selisih stok dengan minimal stok
SELECT SUM(stok - min_stok) as selisih from produk;
Hasil :
+---------+
| selisih |
+---------+
|      91 |
+---------+
1 row in set (0.000 sec)

3.	Tampilkan total asset produk secara keseluruhan
SELECT sum(stok) as total_asset from produk;
Hasil :
+-------------+
| total_asset |
+-------------+
|         193 |
+-------------+
1 row in set (0.000 sec)

4.	Tampilkan data pelanggan yang lahirnya antara tahun 1980 sampai 1990
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1980 AND 1990;
Hasil :
+----+------+---------------+----+-----------+------------+----------------------+----------+
| id | kode | nama          | jk | tmp_lahir | tgl_lahir  | email                | kartu_id |
+----+------+---------------+----+-----------+------------+----------------------+----------+
|  3 | C003 | Sekar Mirah   | P  | Kediri    | 1983-02-20 | mirah@yahoo.com      |        1 |
|  4 | C004 | Swandaru Geni | L  | Kediri    | 1981-01-04 | swandaru@yahoo.com   |        4 |
|  5 | C005 | Pradabashu    | L  | Pati      | 1985-04-02 | prada85@gmail.com    |        2 |
|  6 | C006 | Gayatri Dwi   | P  | Jakarta   | 1987-11-28 | gaya87@gmail.com     |        1 |
|  7 | C007 | Dewi Gyat     | P  | Jakarta   | 1988-12-01 | giyat@gmail.com      |        1 |
|  8 | C008 | Andre Haru    | L  | Surabaya  | 1990-07-15 | andre.haru@gmail.com |        4 |
| 10 | C010 | Cassanndra    | P  | Belfast   | 1990-11-20 | casa90@gmail.com     |        1 |
+----+------+---------------+----+-----------+------------+----------------------+----------+
7 rows in set (0.000 sec)

5.	Tampilkan data pelanggan yang lahirnya tahun 1998
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
Hasil :
Empty set (0.000 sec)

6.	Tampilkan data pelanggan yang berulang tahun bulan agustus
SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
Hasil :
Empty set (0.000 sec)

7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
Hasil :
+--------------------+------------+------------+------+
| nama               | tmp_lahir  | tgl_lahir  | umur |
+--------------------+------------+------------+------+
| Agung Sedayu Group | Solo       | 2010-01-01 |   14 |
| Pandan Wangi       | Yogyakarta | 1950-01-01 |   74 |
| Sekar Mirah        | Kediri     | 1983-02-20 |   41 |
| Swandaru Geni      | Kediri     | 1981-01-04 |   43 |
| Pradabashu         | Pati       | 1985-04-02 |   39 |
| Gayatri Dwi        | Jakarta    | 1987-11-28 |   37 |
| Dewi Gyat          | Jakarta    | 1988-12-01 |   36 |
| Andre Haru         | Surabaya   | 1990-07-15 |   34 |
| Ahmad Hasan        | Surabaya   | 1992-10-15 |   32 |
| Cassanndra         | Belfast    | 1990-11-20 |   34 |
| Andi Wijaya        | Tangerang  | 2023-11-07 |    1 |
| Ira                | Jakarta    | 2023-11-07 |    1 |
+--------------------+------------+------------+------+
12 rows in set (0.000 sec)
