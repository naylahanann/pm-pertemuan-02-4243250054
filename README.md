# Tugas Rutin 2 - Kasir Console
## Identitas
- Nama  : Nayla Luthfiah Hanan
- NIM   : 4243250054
- Kelas : Ilmu Komputer D 2024

## Tangkapan layar
### Skenario 1: pesanan valid
<img width="360" height="263" alt="image" src="https://github.com/user-attachments/assets/047c0714-4a8a-4c01-a7d3-db82fb3606dd" />

### Skenario 2: pesanan dengan kode salah
<img width="383" height="215" alt="image" src="https://github.com/user-attachments/assets/ac839904-b320-4ed1-a49d-3c15c319391f" />

## Penjelasan
Dalam program Kasir Console ini, var, final, dan const memiliki fungsi yang berbeda. var digunakan untuk membuat variabel yang nilainya masih bisa diubah. final digunakan untuk variabel yang nilainya hanya bisa diisi satu kali, contohnya pada bagian input, pesanan, dan diabaikan. Sedangkan const digunakan untuk menyimpan nilai yang sudah tetap dan tidak bisa diubah, seperti batasDiskon dan persenDiskon pada baris 8–9 serta katalog pada baris 11.
Null safety digunakan untuk mencegah terjadinya error ketika program menemukan nilai kosong atau null. Contohnya pada bagian input, terdapat penggunaan ?? '' agar ketika input tidak terbaca atau bernilai null, program tetap menggunakan string kosong. Selain itu, pada bagian pengecekan produk dan jumlah, program akan melewati pesanan jika salah satunya bernilai null atau jumlahnya tidak sesuai. Dengan begitu, program bisa berjalan lebih aman dan tidak mengalami error saat memproses pesanan yang dimasukkan pengguna.

## Penggunaan AI
Saya menggunakan AI pada tugas pertemuan 02 Kasir Console untuk membantu saya memahami langkah-langkah yang membuat saya bingung dan memastikan kodenya sudah sesuai atau belum.
