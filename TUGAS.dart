import 'dart:io';

// Kelas Dosen
class Dosen {
  String nidn;
  String nama;
  String jurusan;

  Dosen(this.nidn, this.nama, this.jurusan);
}

// Kelas Mahasiswa
class Mahasiswa {
  String npm;
  String nama;
  String jurusan;
  String kelas;
  String angkatan;
  Dosen dosenPa;

  Mahasiswa(this.npm, this.nama, this.jurusan, this.kelas, this.angkatan, this.dosenPa);
}

// Data dosen
var daftarDosen = [
  Dosen("1987654321", "HAIRIL KURNIADI SIRADJUDDIN S.KOM.,M.KOM", "INFORMATIKA"),
  Dosen("1987123456", "YASIR MUIN S.T.,M.KOM.", "INFORMATIKA"),
  Dosen("1990012345", "SAIFUL DO ABDULLAH S.T., M.T.", "INFORMATIKA"),
];

// Data mahasiswa
var daftarMahasiswa = <Mahasiswa>[];

void isiDataMahasiswa() {
  daftarMahasiswa = [
    Mahasiswa("07352311124", "NURUL HUSNI HUSEN", "INFORMATIKA", "5IF3", "2023", daftarDosen[0]),
    Mahasiswa("07352311105", "INDRIANI RAIS", "INFORATIKA", "5IF2", "2023", daftarDosen[0]),
    Mahasiswa("07352311059", "PUTRI HAILDA", "INFORMATIKA", "5IF3", "2022", daftarDosen[1]),
    Mahasiswa("07352311123", "NURSAN ANUR", "INFORMATIKA", "5IF2", "2023", daftarDosen[2]),
    Mahasiswa("07352311121", "NAILAH RAHMAWATI", "INFORMTIKA", "IF-2A", "2023", daftarDosen[0]),
  ];
}

// Tampilkan daftar dosen
void tampilDosen() {
  print("\n=== DAFTAR DOSEN PA ===");
  for (var d in daftarDosen) {
    print("NIDN: ${d.nidn} | Nama: ${d.nama} | Jurusan: ${d.jurusan}");
  }
}

// Tampilkan daftar mahasiswa
void tampilMahasiswa() {
  print("\n=== DAFTAR MAHASISWA ===");
  for (var m in daftarMahasiswa) {
    print("\nNama      : ${m.nama}");
    print("NPM       : ${m.npm}");
    print("Jurusan   : ${m.jurusan}");
    print("Kelas     : ${m.kelas}");
    print("Angkatan  : ${m.angkatan}");
    print("Dosen PA  : ${m.dosenPa.nama}");
  }
}

// Cari data mahasiswa
void cariMahasiswa() {
  stdout.write("\nMasukkan nama / NPM / jurusan / kelas: ");
  var keyword = stdin.readLineSync()?.toLowerCase() ?? "";
  bool ditemukan = false;

  for (var m in daftarMahasiswa) {
    if (m.nama.toLowerCase().contains(keyword) ||
        m.npm.toLowerCase().contains(keyword) ||
        m.jurusan.toLowerCase().contains(keyword) ||
        m.kelas.toLowerCase().contains(keyword)) {
      print("\nData ditemukan:");
      print("Nama      : ${m.nama}");
      print("NPM       : ${m.npm}");
      print("Jurusan   : ${m.jurusan}");
      print("Kelas     : ${m.kelas}");
      print("Angkatan  : ${m.angkatan}");
      print("Dosen PA  : ${m.dosenPa.nama}");
      ditemukan = true;
    }
  }

  if (!ditemukan) {
    print("Data mahasiswa tidak ditemukan!");
  }
}

// Menu utama
void main() {
  isiDataMahasiswa(); // isi data langsung di awal

  while (true) {
    print("\n========== MENU ==========");
    print("1. Lihat Daftar Dosen");
    print("2. Lihat Daftar Mahasiswa");
    print("3. Cari Data Mahasiswa");
    print("0. Keluar");
    stdout.write("Pilih menu: ");
    var pilih = stdin.readLineSync();

    switch (pilih) {
      case '1':
        tampilDosen();
        break;
      case '2':
        tampilMahasiswa();
        break;
      case '3':
        cariMahasiswa();
        break;
      case '0':
        print("Program selesai. Terima kasih 🙌");
        return;
      default:
        print("Pilihan tidak valid!");
    }
  }
}
