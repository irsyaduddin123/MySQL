-- 1. Pelanggan memesan didalam table pesanan
SELECT * FROM pesanan;
Didalam table pembayaran tambahkan kolom status_pembayaran
ALTER TABLE pembayaran ADD status_pembayaran varchar(25);
-- 2. Dilanjutkan dengan proses pembayaran di table pembayaran
DELIMITER $$
CREATE TRIGGER cek_pembayaran BEFORE INSERT ON pembayaran
FOR EACH ROW
BEGIN
DECLARE total_bayar DECIMAL(10, 2);
DECLARE total_pesanan DECIMAL(10, 2);
SELECT SUM(jumlah) INTO total_bayar FROM pembayaran WHERE pesanan_id = NEW.pesanan_id;
SELECT total INTO total_pesanan FROM pesanan WHERE id = NEW.pesanan_id;


--4. Jika pesanan sudah dibayar maka status pembayaran akan berubah menjadi lunas
IF total_bayar + NEW.jumlah >= total_pesanan THEN
SET NEW.status_pembayaran = 'Lunas';
END IF;
END $$
DELIMITER ;
INSERT INTO pembayaran (no_kuitansi, tanggal, jumlah, ke, pesanan_id, status_pembayaran)
VALUES ('MD006', '2023-03-03', 200000, 1, 12);

-- No 2

DELIMITER $$
CREATE PROCEDURE kurangi_stok(IN produk_id INT, IN jumlah_pesanan INT)
BEGIN
  DECLARE stok_produk INT;
  
  -- Dapatkan jumlah stok produk saat ini
  SELECT stok INTO stok_produk FROM produk WHERE id = produk_id;
  
  -- Kurangi stok dengan jumlah pesanan
  SET stok_produk = stok_produk - jumlah_pesanan;
  
  -- Pastikan stok tidak negatif
  IF stok_produk < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Stok produk tidak mencukupi';
  END IF;
  
  -- Update stok produk yang telah dikurangi
  UPDATE produk SET stok = stok_produk WHERE id = produk_id;
END $$
DELIMITER ;


-- No 3

DELIMITER $$
CREATE TRIGGER trig_kurangi_stok AFTER INSERT ON pesanan_items
FOR EACH ROW
BEGIN
  -- Memanggil stored procedure kurangi_stok untuk mengurangi stok produk
  CALL kurangi_stok(NEW.produk_id, NEW.qty);
END $$
DELIMITER ;
