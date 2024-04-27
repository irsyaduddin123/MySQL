SELECT * from produk;

DESC produk;

START TRANSACTION;

-- Insert data produk sebanyak 3 record
INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES ('PC02','PC ASUS A', 10000000, 20000000, 20, 5,5);
INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES ('KP01','Kopi Bubuk', 100000, 12000, 21, 10,4);
INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES ('M002','Meja Belajar', 10000000, 20000000, 15, 3,2);

-- Update data stok salah satu produk
UPDATE produk SET stok = 10 WHERE kode = '4';

-- check data
SELECT * from produk;

-- Buat savepoint
SAVEPOINT sp1;

SELECT*FROM pembayaran

-- Hapus salah satu data pembayaran
DELETE FROM pembayaran WHERE id = '5';

SELECT*FROM pembayaran

-- Kembali ke savepoint
ROLLBACK TO SAVEPOINT sp1;

SELECT*FROM kartu


-- Update data iuran salah satu kartu
UPDATE kartu SET iuran = 2500 WHERE kode = 'PGU';

COMMIT;