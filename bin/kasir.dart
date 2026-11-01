import 'dart:io';

typedef Produk = ({String nama, String kategori, int harga});
typedef Baris = ({Produk produk, int jumlah});

const batasDiskon = 100000; // const: nilainya sudah pasti saat kompilasi
const persenDiskon = 10;

const katalog = <String, Produk>{
  'P01': (nama: 'Kopi Sidikalang 250 g', kategori: 'Minuman', harga: 45000),
  'P02': (nama: 'Teh Tarik Siantar', kategori: 'Minuman', harga: 25000),
  'P03': (nama: 'Keripik Ubi Medan', kategori: 'Makanan', harga: 30000),
  'P04': (nama: 'Bika Ambon', kategori: 'Kue', harga: 55000),
  'P05': (nama: 'Bolu Meranti', kategori: 'Kue', harga: 80000),
  'P06': (nama: 'Sirup Markisa', kategori: 'Minuman', harga: 35000),
};

String rp(int n) =>
    'Rp${n.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}';

String kolom(String kiri, String kanan) =>
    kiri.padRight(30) + kanan.padLeft(14);

void main() {
  print('=== TOKO OLEH-OLEH SUMUT ===');
  katalog.forEach((kode, p) {
    print(
      '$kode  ${p.nama.padRight(22)} ${p.kategori.padRight(8)} ${rp(p.harga).padLeft(10)}',
    );
  });

  stdout.write('\nPesanan (contoh: P01x2, P05x1): ');
  final input = stdin.readLineSync() ?? '';

  final pesanan = <Baris>[];
  final diabaikan = <String>[];

  for (final potong in input.split(',')) {
    final teks = potong.trim();
    if (teks.isEmpty) continue;

    final bagian = teks.toLowerCase().split('x');
    final produk = katalog[bagian.first.trim().toUpperCase()]; // Produk?
    final jumlah = bagian.length == 2 ? int.tryParse(bagian[1].trim()) : null;

    // Setelah pengecekan ini, produk dan jumlah otomatis non-null (type promotion).
    if (produk == null || jumlah == null || jumlah <= 0) {
      diabaikan.add(teks);
      continue;
    }
    pesanan.add((produk: produk, jumlah: jumlah));
  }

  cetakStruk(pesanan, diabaikan);
}

void cetakStruk(List<Baris> pesanan, List<String> diabaikan) {
  print('\n--- STRUK ---');
  if (pesanan.isEmpty) {
    print('Tidak ada pesanan yang valid.');
  } else {
    for (final b in pesanan) {
      print(
        kolom(
          '${b.produk.nama.padRight(22)} ${b.jumlah} x',
          rp(b.produk.harga * b.jumlah),
        ),
      );
    }
    final total = pesanan
        .map((b) => b.produk.harga * b.jumlah)
        .fold<int>(0, (s, n) => s + n);
    final diskon = total >= batasDiskon ? total * persenDiskon ~/ 100 : 0;
    final kategori = pesanan.map((b) => b.produk.kategori).toSet();

    print(kolom('Total', rp(total)));
    print(kolom('Diskon $persenDiskon%', rp(diskon)));
    print(kolom('BAYAR', rp(total - diskon)));
    print('Kategori dibeli: ${kategori.join(', ')}');
  }
  if (diabaikan.isNotEmpty) {
    print('Diabaikan: ${diabaikan.join(', ')}');
  }
}
