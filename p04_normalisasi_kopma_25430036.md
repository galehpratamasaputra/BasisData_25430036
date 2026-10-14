D.  LANGKAH PERCOBAAN

D.1 

1. Dari UNF ke 1NF

NOTA_UNF (no_nota_penjualan, tgl_penjualan, kode_petugas, nama_petugas, no_anggota, nama_anggota,
{ kode_barang, nama_barang, qty_detail_penjualan, harga_satuan_detail_penjualan, subtotal_detail_penjualan },
jumlah_penjualan, diskon_penjualan, total_penjualan)

2. Bentuk 1NF

NOTA_1NF (no_nota_penjualan, kode_barang, tgl_penjualan, kode_petugas, nama_petugas, no_anggota,
nama_anggota, nama_barang, qty_detail_penjualan, harga_satuan_detail_penjualan, subtotal_detail_penjualan, jumlah_penjualan, diskon_penjualan, total_penjualan)

D.2 Menuliskan dependensi fungsional

FD1: no_nota_penjualan -> tgl_penjualan, kode_petugas, no_anggota (AB-01)
FD2: kode_petugas -> nama_petugas
FD3: no_anggota -> nama_anggota (AB-05)
FD4: kode_barang -> nama_barang
FD5: (no_nota_penjualan, kode_barang)
-> qty_detail_penjualan, harga_satuan_detail_penjualan (AB-04)
FD6: qty_detail_penjualan, harga_satuan_detail_penjualan
-> subtotal_detail_penjualan (turunan)

D.3 Menuju 2NF dan 3NF


1. Bentuk normal kedua (2NF)
   FD1 dan FD4 hanya bergantung pada Sebagian kunci komposit.Oleh karena itu data dipisahkan menjadi relasi PENJUALAN dengan kunci no_nota_penjualan dan relasi BARANG dengan kunci kode_barang. Atribut lainnya dimasukkan ke relasi DETAIL_PENJUALAN
2. Bentuk normal ketiga (3NF)
   Pada relasi PENJUALAN terdapat ketergantungan kode_petugas → nama_petugas dan no_anggota → nama_anggota.Oleh karena itu data petugas dan anggota dipisihkan ke relasi masing-masing.
3. Nilai turunan
   Atribut subtotal_detail_penjualan,jumlah_penjualan dan total_penjualan dapat di hitung dari detail transaksi dan status anggota.Nilai tersebut tidak di simpan dalam tabel operasional agar tidak terjadi ketidaksesuaikan data.
   Hasil akhir relasi 3NF
   Relasi	Atribut
   PENJUALAN	No_nota_penjualan, tgl_penjualan, kode_petugas*, no_anggota*,bayar_penjualan
   DETAIL_PENJUALAN	No_nota_penjualan*. Kode_barang*,qty_detail_penjualan,harga_satuan_detail_penjualan
   BARANG	Kode_barang,nama_barang,kategori_barang,harga_jual_barang,stok_barang,stok_min_barang
   PETUGAS	Kode_petugas,nama_petugas,peran_petugas
   ANGGOTA	No_anggota,nim_anggota,nama_anggota,prodi_anggota,no_hp_anggota,status_anggota,tgl_daftar_anggota
   Keterangan:
   Tanda * menenjukkan foreign key (kunci tamu) yang menghubungkan satu tabel dengan tabel lainnya.

D.4 Mencocokkan dengan skema kanonik


1. Perbandingan dengan skema kanonik
   Hasil normalisasi dibandingkan dengan skema kanonik kopma pada tabel 4.2.Perbedaan utamanya adalah penggunaan id_* sebagai kunci primer,sedangkan kode alami tetap digunakan sebagai kunci unik.

| Tabel            | Primary Key (PK)                  | Kunci Unik                      | Foreign Key (FK)                            |
| ---------------- | --------------------------------- | ------------------------------- | ------------------------------------------- |
| Petugas          | `id_petugas`                    | `kode_petugas`                | -                                           |
| Anggota          | `id_anggota`                    | `no_anggota`, `nim_anggota` | -                                           |
| Barang           | `id_barang`                     | `kode_barang`                 | -                                           |
| Pemasok          | `id_pemasok`                    | -                               | -                                           |
| Penjualan        | `id_penjualan`                  | `no_nota_penjualan`           | `id_petugas`, `id_anggota` (boleh NULL) |
| Detail_penjualan | (`id_penjualan`, `id_barang`) | -                               | `id_penjualan`, `id_barang`             |
| Pembelian        | `id_pembelian`                  | -                               | `id_pemasok`                              |
| Detail_pembelian | (`id_pembelian`, `id_barang`) | -                               | `id_pembelian`, `id_barang`             |


2. Pemeriksaan BCNF

| Tabel            | Penentu yang Diperiksa                          | Hasil         |
| ---------------- | ----------------------------------------------- | ------------- |
| Petugas          | `id_petugas`, `kode_petugas`                | Memenuhi BCNF |
| Anggota          | `id_anggota`, `no_anggota`, `nim_anggota` | Memenuhi BCNF |
| Barang           | `id_barang`, `kode_barang`                  | Memenuhi BCNF |
| Pemasok          | `id_pemasok`                                  | Memenuhi BCNF |
| Penjualan        | `id_penjualan`, `no_nota_penjualan`         | Memenuhi BCNF |
| Detail_penjualan | `id_penjualan` + `id_barang`                | Memenuhi BCNF |
| Pembelian        | `id_pembelian`                                | Memenuhi BCNF |
| Detail_pembelian | `id_pembelian` + `id_barang`                | Memenuhi BCNF |
