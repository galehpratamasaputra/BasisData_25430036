Dokumen kebutuhan data-kopma

1. Latar belakang dan Aktivitas organisasi

Koperasi mahasiswa sejahtera (Kopma) Merupakan mahasiswa fiktif merupakan unit usaha yang berada di lingkungan kampus.Kegiatanya adalah yang menjual alat tulis,Makanan ringan dan Minuman.pembeli biasanya berupa anggota kopma maupun mahasiswa atau pembeli umum lainnya.
aktivitas yang di lakukan meliputi pendaftaran anggota,Pengelolaan barang,Penjualan,Pemesanan barang kepada pemasok dan penerimaan barang.

2. Aktor dan proses bisnis

| Kode | Proses bisnis | Aktor | Pemicu |
| PB-01 | Mendaftarkan anggota | Kasir (atas permintaan mahasiswa) | Mahasiswa ingin menjadi anggota |
| PB-02 | Mencatat penjualan | Kasir | Pembeli membayar di kasir |
| PB-03 | Memesan barang ke pemasok | Petugas gudang | Stok di bawah batas minimum |
| PB-04 | Menerima barang dari pemasok | Petugas gudang | Barang datang bersama faktur |
| PB-05 | Menyusun laporan bulanan | Ketua koperasi | Awal bulan |

3. Dokumen sumber yang di anilisis

Pada nota penjualan terdapat beberapa elemen data seperti nomor nota,Tanggal dan waktu,Kasir,Anggota,Barang,qty,harga saat transaksi,Subtotal,diskon dan total.Data seperti nomor nota,tanggal dan waktu,kasir,anggota,barang,qty dan harga saat transaksi di simpan.Sedangkan subtotal dan total merupakan nilai turunan yang dapat di hitung dari qty,harga dan diskon.Harga dan transaksi tetap di simpan karena harga barang dapat berubah di kemudian hari.

4. Entitas kandidat dan elemen data

| Entitas Kandidat | Elemen Data Utama | Sumber |
| Anggota | nomor anggota, NIM, nama, program studi, nomor HP, status aktif,poin riyalitas | Formulir pendaftaran |
| Barang | kode, nama, kategori, harga jual, stok, batas minimum stok | Daftar barang, faktur |
| Penjualan | nomor nota, tanggal-jam, kasir, anggota (opsional), bayar | Nota penjualan |
| Detail penjualan | nomor nota, barang, qty, harga saat transaksi | Nota penjualan |

5. Aturan bisnis

| Kode | Aturan bisnis |
| AB-01 | Setiap nota memiliki nomor unik dan minimal satu baris barang. |
| AB-02 | Penjualan boleh tanpa anggota (pembeli umum); jika ada, anggota harus berstatus aktif untuk memperoleh diskon 5%. |
| AB-03 | Stok barang tidak boleh negatif; penjualan ditolak bila qty melebihi stok tersedia. |
| AB-04 | Harga jual yang dipakai pada nota disimpan per baris dan tidak berubah meski harga barang kemudian naik. |
| AB-05 | NIM anggota unik; pencarian anggota dapat dilakukan lewat nomor anggota atau NIM. |
| AB-06 | Pesanan pembelian dibuat bila stok kurang dari batas minimum barang tersebut. |
| AB-07 | Setiap kelipatan rp10.000 belanja anggota bernilai 1 poin loyalitas. |
| AB-08 | Setiap 50 poin loyalitas dapat di tukar dengan potongan rp5.000. |

6. Kebutuhan informasi

| Kode | Kebutuhan informasi | Data yang diperlukan |
| KI-01 | Omzet dan jumlah nota per hari dan per bulan | Penjualan, detail penjualan |
| KI-02 | Lima barang terlaris per bulan berdasarkan qty | Detail penjualan, barang |
| KI-03 | Barang dengan stok di bawah batas minimum | Barang |
| KI-04 | Sepuluh anggota dengan belanja terbesar per bulan | Penjualan, detail penjualan, anggota |
| KI-05 | Mengetahui jumlah poin loyalitas setiap anggota | Penjualan,detail penjualan,anggota |

7. Matriks CRUD
| Proses | Anggota | Barang | Penjualan | Detail | Pemasok | Pembelian |
| PB-01 Daftar anggota |  C  |     |     |     |     |     |
| PB-02 Catat penjualan|  R,U  |  R,U  |  C  |  C  |     |     |
| PB-03 Pesan ke pemasok |     |  R  |     |     |  R  |  C  |
| PB-04 Terima barang |    |  U  |     |     |  R  |  U  |
| PB-05 Laporan bulanan |  R  |  R  |  R  |  R  |     |  R  |

8. Kamus data awal

| Elemen | Arti | Contoh | Aturan | Penanggung jawab |
| no_anggota | Nomor anggota koperasi | A-0457 | Unik, format A-4 digit | Ketua |
| nim_anggota | NIM anggota | 2301010123 | Unik, 10 digit | Ketua |
| no_hp_anggota | Nomor HP anggota | 0812xxxx | Data pribadi, akses terbatas | Ketua |
| no_nota_penjualan | Nomor nota penjualan | PJ-2609-0142 | Unik per nota | Kasir |
| harga_satuan_detail_penjualan | Harga jual saat transaksi | 4000 | Bilangan bulat ≥ 0 (rupiah) | Kasir |
| stok_barang | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 (AB-03) | Petugas gudang |

9. Kebutuhan non-fungsional data

perkiraan ±150 nota per hari, data transaksi disimpan minimal lima tahun, dan nomor HP anggota hanya boleh dilihat oleh ketua. Pembatasan akses data pribadi seperti ini sejalan dengan kewajiban pengendali data dalam Undang-Undang Pelindungan Data Pribadi [17].

E.2 perbaikian kebutuhan yg kabur
Data anggota harus aman
Data anggota hanya boleh di akses oleh pihak yang punya izin akses.

Sistem harus cepat mencari barang
barang bisa di cari berdasarkan nama atau kode dan hasilnya muncul maksimal 2 detik.

Laporan stok harus akurat
Jumlah stok pada laporan harus sama dengan stok yang tercatat setelah ada barang masuk atau terjual.

10. Isu kualitas data yang di antisipasi

Beberapa masalah yang mungkin terjadi yaitu data pelanggan dobel, stok tidak sesuai, harga transaksi berubah, dan data transaksi kurang lengkap. Hal ini perlu dicek agar data tetap rapi dan sesuai.