SELECT pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.kode,pelanggan.nama, kartu.nama as nama_kartu,
kartu.diskon FROM pesanan INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id INNER JOIN kartu on pelanggan.kartu_id = kartu.id; /* NO 1 */
select pembelian.id, pembelian.tanggal, pembelian.nomor, pembelian.jumlah, pembelian.harga,
produk.nama, vendor.nama, vendor.kontak from pembelian inner JOIN produk on pembelian.produk_id = produk.id INNER JOIN vendor ON pembelian.vendor_id = vendor.id; /* NO 2 */

/* NO 3 */
SELECT pesanan.id,pesanan.tanggal, pesanan.total, pelanggan.nama, produk.kode, produk.nama, jenis_produk.nama, pesanan_items.qty, pesanan_items.harga AS harga_jual 
FROM pesanan INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id 
INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id 
INNER JOIN produk ON pesanan_items.produk_id = produk.id 
INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;