SOAL 2.3

1.	Tampilkan produk yang kode awalnya huruf K dan huruf M
query
SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
Hasil 
+------+----------------+
| kode | nama           |
+------+----------------+
| K001 | Kulkas 2 pintu |
| M001 | Meja Makan     |
+------+----------------+

2.	Tampilkan produk yang kode awalnya bukan huruf M
query
SELECT kode,nama from produk where kode not like 'm%';
Hasil :
+--------+-------------------+
| kode   | nama              |
+--------+-------------------+
| TV01   | Televisi 21 inchs |
| TV02   | Televisi 40 inch  |
| K001   | Kulkas 2 pintu    |
| TK01   | Teh Kotak         |
| PC01   | PC Desktop HP     |
| TB01   | Teh Botol         |
| AC01   | Notebook Acer S   |
| LN01   | Notebook Lenovo   |
| L005   | Laptop Lenovo     |
| L112   | Kopi              |
| L113   | Teh Sosro 2       |
| L0015  | Laptop Asus       |
| TV0115 | Televisi 22 inc`  |
| TV0116 | Televisi 23 inc   |
| TV0117 | Televisi 24 inc   |
| TV0118 | Televisi 25 inc   |
| TV0120 | Televisi 27 inc   |
| TV0121 | Televisi 28 inc   |
| TV0122 | Televisi 29 inc   |
| THP001 | Teh Pucuk         |
| THP002 | Teh Pucuk2        |
+--------+-------------------+

3.	Tampilkan produk-produk televisi
query
select kode,nama from produk where nama like 'televisi%';
Hasil:
+--------+-------------------+
| kode   | nama              |
+--------+-------------------+
| TV01   | Televisi 21 inchs |
| TV02   | Televisi 40 inch  |
| TV0115 | Televisi 22 inc`  |
| TV0116 | Televisi 23 inc   |
| TV0117 | Televisi 24 inc   |
| TV0118 | Televisi 25 inc   |
| TV0120 | Televisi 27 inc   |
| TV0121 | Televisi 28 inc   |
| TV0122 | Televisi 29 inc   |
+--------+-------------------+

4.	Tampilkan pelanggan mengandung huruf 'SA'
query
SELECT nama from pelanggan where nama like '%SA%';
Hasil :
+-------------+
| nama        |
+-------------+
| Ahmad Hasan |
| Cassanndra  |
+-------------+

5.	Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
query
SELECT nama, tmp_lahir from pelanggan where tmp_lahir NOT LIKE '%Jakarta%' AND nama LIKE '%yo%';
Hasil :
Empty set (0.000 sec)

6.	Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
query
MariaDB [dbpos_sib6]> SELECT nama from pelanggan where nama like '_A%';
Hasil :
+--------------+
| nama         |
+--------------+
| Cassanndra   |
| Gayatri Dwi  |
| Pandan Wangi |
+--------------+