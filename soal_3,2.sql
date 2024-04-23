1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_pelanggan
    -> FROM pelanggan
    -> WHERE YEAR(tgl_lahir) = 1998;
+------------------+
| jumlah_pelanggan |
+------------------+
|                0 |
+------------------+
1 row in set (0.002 sec)

2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_pelanggan_perempuan_jakarta
    -> FROM pelanggan
    -> WHERE jk = 'P' AND tmp_lahir LIKE '%Jakarta%';
+------------------------------------+
| jumlah_pelanggan_perempuan_jakarta |
+------------------------------------+
|                                  3 |
+------------------------------------+
1 row in set (0.000 sec)

3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbpos_sib6]> SELECT SUM(stok) AS total_stok_produk_dibawah_10rb
    -> FROM produk
    -> WHERE harga_jual < 10000;
+--------------------------------+
| total_stok_produk_dibawah_10rb |
+--------------------------------+
|                             79 |
+--------------------------------+
1 row in set (0.000 sec)

4.	Ada berapa produk yang mempunyai kode awal K
MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_produk_dengan_kode_awal_K
    -> FROM produk
    -> WHERE kode LIKE 'K%';
+----------------------------------+
| jumlah_produk_dengan_kode_awal_K |
+----------------------------------+
|                                1 |
+----------------------------------+
1 row in set (0.002 sec)

5.	Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbpos_sib6]> SELECT AVG(harga_jual) AS rata_rata_harga_jual_produk_diatas_1jt
    -> FROM produk
    -> WHERE harga_jual > 1000000;
+----------------------------------------+
| rata_rata_harga_jual_produk_diatas_1jt |
+----------------------------------------+
|                     31387733.333333332 |
+----------------------------------------+
1 row in set (0.000 sec)

MariaDB [dbpos_sib6]>

6.	Tampilkan jumlah stok yang paling besar
MariaDB [dbpos_sib6]> SELECT MAX(stok) AS jumlah_stok_terbanyak
    -> FROM produk;
+-----------------------+
| jumlah_stok_terbanyak |
+-----------------------+
|                    53 |
+-----------------------+
1 row in set (0.000 sec)


7.	Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_produk_dengan_stok_kurang_dari_minimal
    -> FROM produk
    -> WHERE stok < min_stok;
+-----------------------------------------------+
| jumlah_produk_dengan_stok_kurang_dari_minimal |
+-----------------------------------------------+
|                                             4 |
+-----------------------------------------------+
1 row in set (0.000 sec)


8.	Berapa total asset dari keseluruhan produk
MariaDB [dbpos_sib6]> SELECT SUM(harga_beli * stok) AS total_asset
    -> FROM produk;
+-------------+
| total_asset |
+-------------+
|   480504000 |
+-------------+
1 row in set (0.000 sec)
