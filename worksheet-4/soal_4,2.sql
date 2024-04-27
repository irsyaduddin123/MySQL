/* NO 1 */
CREATE VIEW pesanan_pelanggan_kartu_test2 AS SELECT pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.kode, pelanggan.nama,
kartu.nama as nama_kartu, kartu.diskon
FROM pesanan INNER JOIN pelanggan ON pesanan.pelanggan_id = pesanan.id 
INNER JOIN kartu on pelanggan.kartu_id = kartu.id;

select * from pesanan_pelanggan_kartu_test2

/* NO 2 */
CREATE View pembelian_produk_vendor AS SELECT p.id, p.tanggal, p.nomor, p.harga, pr.nama, v.nama as nama_vendor, v.kontak 
FROM pembelian p INNER JOIN produk pr ON p.produk_id=pr.id
INNER JOIN vendor v ON p.vendor_id = v.id;

SELECT*FROM pembelian_produk_vendor

/* NO 3 */

CREATE VIEW tabel_no_3 AS 
SELECT ps.id, ps.tanggal, ps.total, p.nama AS nama_pelanggan, 
       pr.kode, pr.nama AS nama_produk, jp.nama AS jenis_produk, 
       psi.qty, psi.harga AS harga_jual 
FROM pesanan ps 
INNER JOIN pelanggan p ON ps.pelanggan_id = p.id
INNER JOIN pesanan_items psi ON ps.id = psi.pesanan_id
INNER JOIN produk pr ON psi.produk_id = pr.id 
INNER JOIN jenis_produk jp ON pr.jenis_produk_id = jp.id;

SELECT*FROM tabel_no_3;
