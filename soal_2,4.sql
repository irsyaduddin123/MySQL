1.	Tampilkan 2 data produk termahal
query :
SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;
Hasil :
+----+------+-----------------+------------+------------+------+----------+------+-----------+-----------------+
| id | kode | nama            | harga_beli | harga_jual | stok | min_stok | foto | deskripsi | jenis_produk_id |
+----+------+-----------------+------------+------------+------+----------+------+-----------+-----------------+
| 11 | L005 | Laptop Lenovo   |   13000000 |   16000000 |    5 |        2 |      | NULL      |               1 |
|  9 | LN01 | Notebook Lenovo |    9000000 |   12480000 |    9 |        2 | NULL | NULL      |               5 |
+----+------+-----------------+------------+------------+------+----------+------+-----------+-----------------+
2 rows in set (0.000 sec)

2.	Tampilkan produk yang paling murah
query :
SELECT nama, MIN(harga_beli) AS produk_termurah FROM produk;
Hasil :
+-------------------+-----------------+
| nama              | produk_termurah |
+-------------------+-----------------+
| Televisi 21 inchs |            2000 |
+-------------------+-----------------+
1 row in set (0.000 sec)

3.	Tampilkan produk yang stoknya paling banyak
query :
SELECT MAX(stok) AS stok_terbanyak FROM produk;
Hasil :
+-------------------+----------------+
| nama              | stok_terbanyak |
+-------------------+----------------+
| Televisi 21 inchs |             53 |
+-------------------+----------------+
1 row in set (0.000 sec)

4.	Tampilkan dua produk yang stoknya paling sedikit
query :
 SELECT nama, stok
    -> FROM produk
    -> ORDER BY stok ASC
    -> LIMIT 2;
Hasil :
+------------------+------+
| nama             | stok |
+------------------+------+
| Televisi 40 inch |    4 |
| Meja Makan       |    4 |
+------------------+------+
2 rows in set (0.000 sec)

5.	Tampilkan pelanggan yang paling muda
query :
SELECT nama, tgl_lahir, TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur
    -> FROM pelanggan
    -> ORDER BY tgl_lahir DESC
    -> LIMIT 1;
 Hasil :
+------+------------+------+
| nama | tgl_lahir  | umur |
+------+------------+------+
| Ira  | 2023-11-07 |    0 |
+------+------------+------+
1 row in set (0.002 sec)

6.	Tampilkan pelanggan yang paling tua
query :
SELECT nama, tgl_lahir, TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur
    -> FROM pelanggan
    -> ORDER BY tgl_lahir asc
    ->
    -> LIMIT 1;
Hasil :
+--------------+------------+------+
| nama         | tgl_lahir  | umur |
+--------------+------------+------+
| Pandan Wangi | 1950-01-01 |   74 |
+--------------+------------+------+
1 row in set (0.000 sec)
