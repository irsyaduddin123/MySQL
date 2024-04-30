
DELIMITER $$

CREATE PROCEDURE pro_naikan_harga(
    IN jenis_produk_id INT,
    IN persentase_kenaikan INT
)
BEGIN
    UPDATE produk 
    SET harga_jual = harga_jual + (harga_jual * persentase_kenaikan / 100) 
    WHERE jenis_produk_id = jenis_produk_id;
END$$

DELIMITER ;

CALL pro_naik(1,4); 
--4 disini adalah 4%

-- No 2 --

CREATE FUNCTION umur(tgl_lahir DATE)
RETURNS INT
BEGIN
DECLARE umur INT;
SET umur = YEAR(CURDATE()) - YEAR(tgl_lahir);
RETURN umur;
END $$

SELECT nama, umur(tgl_lahir) AS umur FROM pelanggan;

-- NO 3 --
DELIMITER $$

CREATE FUNCTION kategori_harga(
    harga DOUBLE
)
RETURNS VARCHAR(20)
BEGIN
    DECLARE kategori VARCHAR(20);

    IF harga <= 500000 THEN
        SET kategori = 'murah';
    ELSEIF harga > 500000 AND harga <= 3000000 THEN
        SET kategori = 'sedang';
    ELSEIF harga > 3000000 AND harga <= 10000000 THEN
        SET kategori = 'mahal';
    ELSE
        SET kategori = 'sangat mahal';
    END IF;

    RETURN kategori;
END$$

DELIMITER ;

--- memanggil fungsinya ---
SELECT kategori_harga(200000);
SELECT kategori_harga(1000000); 

