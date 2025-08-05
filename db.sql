CREATE TABLE `users` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(100),
  `email` varchar(100) UNIQUE,
  `password` varchar(255),
  `role` enum(admin,penjaga,user),
  `created_at` datetime
);

CREATE TABLE `buku` (
  `buku_id` int PRIMARY KEY AUTO_INCREMENT,
  `judul` varchar(200),
  `penulis` varchar(100),
  `penerbit` varchar(100),
  `tahun_terbit` year,
  `kategori` varchar(50),
  `deskripsi` text,
  `tipe_buku` enum(online,fisik),
  `file_url` varchar(255),
  `stok` int,
  `uploader_id` int,
  `created_at` datetime
);

CREATE TABLE `peminjaman` (
  `pinjam_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `buku_id` int,
  `penjaga_id` int,
  `tanggal_pinjam` date,
  `tanggal_kembali` date,
  `status` enum(menunggu_acc,dipinjam,dikembalikan,ditolak),
  `created_at` datetime
);

CREATE TABLE `pengembalian` (
  `kembali_id` int PRIMARY KEY AUTO_INCREMENT,
  `pinjam_id` int,
  `penjaga_id` int,
  `tanggal_dikembalikan` date,
  `denda` decimal(10,2),
  `created_at` datetime
);

ALTER TABLE `buku` ADD FOREIGN KEY (`uploader_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `peminjaman` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `peminjaman` ADD FOREIGN KEY (`buku_id`) REFERENCES `buku` (`buku_id`);

ALTER TABLE `peminjaman` ADD FOREIGN KEY (`penjaga_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `pengembalian` ADD FOREIGN KEY (`pinjam_id`) REFERENCES `peminjaman` (`pinjam_id`);

ALTER TABLE `pengembalian` ADD FOREIGN KEY (`penjaga_id`) REFERENCES `users` (`user_id`);
