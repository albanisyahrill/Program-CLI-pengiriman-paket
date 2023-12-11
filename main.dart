// Import library dart:io untuk interaksi dengan terminal
import 'dart:io';

// Definisikan kelas Paket untuk merepresentasikan informasi paket
class Paket {
  String namaPaket;
  int berat;
  String jenisPengiriman;

  Paket(this.namaPaket, this.berat, this.jenisPengiriman);
}

// Definisikan kelas Pengiriman untuk mengelola pengiriman paket
class Pengiriman {
  int biayaExpress = 10000;
  int biayaReguler = 5000;
  List<Paket> daftarPaket =
      []; // List daftar paket yang akan menampung nama, berat dan layanan pengiriman paket yang diinput

  // Metode untuk menambahkan paket yg diinput ke list daftarPaket
  void kirimPaket(String namaPaket, int berat, String jenisPengiriman) {
    var paket = Paket(namaPaket, berat, jenisPengiriman);
    daftarPaket.add(paket);

    print('Paket "$namaPaket" dengan berat $berat kg berhasil ditambahkan.');
  }

  // Metode untuk menghitung biaya pengiriman paket menggunakan rumus dibawah
  int hitungBiaya(Paket paket) {
    // Jika jenis pengiriman express, gunakan biayaExpress; jika tidak, gunakan biayaReguler
    if (paket.jenisPengiriman.toLowerCase() == 'express') {
      return paket.berat * biayaExpress;
    } else {
      return paket.berat * biayaReguler;
    }
  }

  // Metode untuk menampilkan biaya layanan
  void cekBiaya() {
    print('Biaya Layanan Reguler : Rp.$biayaReguler/Kg');
    print('Biaya Layanan Express : Rp.$biayaExpress/Kg');
  }

  // Metode untuk menampilkan nama dan biaya pengiriman semua paket dalam list daftarPaket
  void tampilkanBiaya() {
    // Jika belum ada paket yang diinput, eksekusi kode didalam blok kode if
    if (daftarPaket.isEmpty) {
      print('Belum ada paket untuk dihitung biayanya.');
      return;
    }

    print('Biaya Pengiriman:');
    for (var paket in daftarPaket) {
      var biaya = hitungBiaya(paket);
      print('${paket.namaPaket}: \Rp.${biaya.toString()}');
    }
  }
}

// Fungsi utama program
void main() {
  var pengiriman = Pengiriman();

  // While loop
  while (true) {
    print('\nMenu:');
    print('1. Kirim Paket');
    print('2. Cek Biaya Layanan');
    print('3. Hitung Biaya Pengiriman');
    print('4. Keluar');
    stdout.write('Pilih opsi (1/2/3/4): ');

    // Membaca opsi yang dimasukkan pengguna
    var opsi = stdin.readLineSync();

    // Menggunakan struktur switch untuk menanggapi opsi yang dipilih
    switch (opsi) {
      case '1':
        while (true) {
          // Input nama paket
          stdout.write('Masukkan nama paket: ');
          var namaPaket = stdin.readLineSync()!;
          // Input berat paket
          stdout.write('Masukkan berat paket (kg): ');
          var berat = int.parse(stdin.readLineSync()!);
          // Input layanan pengiriman
          stdout.write('Pilih jenis pengiriman (Express/Reguler): ');
          var jenisPengiriman = stdin.readLineSync()!;

          // Memanggil metode kirimPaket dari objek pengiriman
          pengiriman.kirimPaket(namaPaket, berat, jenisPengiriman);

          // Menanyakan apakah pengguna ingin menambahkan paket lagi
          stdout.write(
              '\nApakah masih ada paket yang akan ditambahkan(Iya/Tidak): ');
          String namaItem = stdin.readLineSync()!;

          // Jika pengguna mengetik 'tidak', keluar dari loop
          if (namaItem.toLowerCase() == 'tidak') {
            break;
          }
        }
        break;
      case '2':
        // Cek Biaya Layanan
        pengiriman.cekBiaya();
        break;
      case '3':
        // Hitung Biaya Pengiriman
        pengiriman.tampilkanBiaya();
        break;
      case '4':
        // Keluar dari program
        print('Keluar dari program. Sampai jumpa!');
        exit(0);
      default:
        // Jika user menginput nomor selain 1,2,3,4 maka eksekusi kode dibawah
        print('Opsi tidak valid. Silakan pilih opsi yang benar.');
    }
  }
}
