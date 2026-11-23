Nama : Arya Dwipa Wicaksana NPM : 2506623111 Kelas : PBP E

### Tugas 7
Saya menggunakan Gemini untuk membantu memahami penggunaan widget flutter

1. Widget tree adalah struktur yang menggambarkan bagaimana UI disusun didalam Flutter. Hubungan parent-child berarti suatu widget, yang sebagai parent, dapat memiliki widget lain di dalamnya sebagai child. Biasanya, parent sebagai wadah atau tempat menampung widget di bawahnya dan child berada di dalam wadah parentnya.

2. Widget yang digunakan:
- MaterialApp: Menjadi root yang mengatur theme, title, dan halaman awal aplikasi.
- Scaffold: Menyediakan Struktur dasar halaman Appbar dan Body.
- AppBar: menampilkan bar dibagian atas halaman aplikasi dengan title MyPortofolio.
- Text: Menampilakn text.
- Padding: Memberikan jarak di dalam widget.
- Column: menyusun child widget secara vertikal.
- Row: menyusun child widget secara horizontal.
- InfoCard: Menampilan nama, NPM, dan kelas.
- Card: Menampikan data dalam bentuk kartu.
- Center: Meletakkan widget dibagian tengah.
- ItemCard: Menampilkan tombol tambah, lihat, dan logout.
- InkWell: Membuat area widget dapat merespons saat diklik.
- Icon: Menampilkan icon.
- SnackBar: Menampilkan pesan popup sebentar di bawah layar.

3. MaterialApp berfungsi sebagai widget utama yang mengatur konfigurasi dasar Flutter, seperti title dan theme. Widget ini biasa digunakan sebagai root widget karena menjadi dasar dari struktur widget tree. Dengan MaterialApp menjadi root, widget-widget lainnya bisa mewarisi apa yang sudah ada di root.

4. StatelessWidget adalah widget yang tidak dapat diubah sehingga setelah di render, isi widget tidak akan berubah. Jika ingin menampilkan atau mengubah sesuatu, harus diganti dengan widget baru. Sedangkan, StatefulWidget adalah widget yang dapat diubah isi atau tampilannya secara dinamis tanpa harus mengganti dengan widget baru. 

StatelessWidget sebaiknya dipakai jiga tampilan widget ingin tetap dan tidak berubah, seperti untuk menampilkan nama, npm, atau hal lainnya yang tetap. Sedangkan StatefullWidget digunakan saat ingin isi atau tampilan widget dapat berubah secara dinamis jika ada interaksi atau ketentuan tertentu, seperti tampilan awal menampilkan 0 dan tombol tambah yang mana saat tombol tambah dipencet angka akan increment dan tampilan di layar mengikuti angka terbaru.

5. BuildContext adalah sebuah objek yang merpresentasikan lokasi suatu widget di dalam widget tree. BuildContext penting karena memungkinkan sebuah widget mengakses data-data yang disediakan oleh widget di atasnya. Penggunaannya seperti dapat mengakses warna yang sudah di sediakan di root seperti backgroundColor: Theme.of(context).colorScheme.primary yang ada di menu.dart MyHomePage fungsi build.

6. Hot reload adalah fitur Flutter untuk merefresh aplikasi untuk melihat perubahan yang sudah diimplementasikan di code tanpa harus menjalankan ulang aplikasi sepenuhnya, sedangkan hot restart akan menjalankan ulang aplikasi dari awal. Hot restart dipakai saat melakukan perubahan pada fungsi main() dan Full restart digunakan saat mengubah kode atau konfigurasi native Android/iOS, atau konfigurasi aplikasi web yang membutuhkan proses kompilasi ulang.

### Tugas 8
Saya Menggunakan Gemini AI untuk pengerjaan tugas ini di bagian bagaimana implementasi showDatePicker() dan logout.

1. Navigator.push menambahkan suatu route ke bagian paling atas dari stack route sehingga route yang baru saja ditambahkan akan ditampilkan ke user, Navigator.pushReplacement mirip seperti push tetapi dia juga menghapus route paling atas di stacknya dan menggantinya dengan route baru tanpa mengubah kondisi elemen stack yang berada di bawahnya, sedangkan Navigator.pop menghapus atau mengeluarkan route yang paling atas yang ditampilkan ke user dari stack route. 

Metode yang digunakan untuk membuka formulir adalah Navigator.push jika dari menu. Sedangkan, untuk ke Home menggunakan Navigator.pushReplacement yang menggantikan halaman sekarang ke Home melalui left drawer.

2. Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten karena mereka saling berkaitan, Scaffold berfungsi sebagai kerangka utama yang menyediakan tmpat untuk AppBar adn Drawer, AppBar Digunakan untuk menampilkan judul halaman dan mempertahankan navigasi bagian atas, sedangkan drawer membantu untuk berpindah halaman melalui menu. Contohnya, pada EducationForm saya menggunakan warna Colors.indigo untuk background AppBar dan Colors.white untuk foreground

3. Widget yang digunakan untuk mengatur formulir adalah column untuk menyusun input secara vertikal. Widget yang berfungsi mengatur jarak adalah Padding yang memberikan jarak di sekitar setiap input sehingga field tidak terlalu berdekatan dengan elemen lain. Widget penggulir ketika ruang layar terbatas adalah SsingleChildScrollView yang membuat layar bisa di scroll secara vertikal jika elemen tidak muat di layar.

4. GlobalKey<FormState> digunakan untuk mengakses dan mengelola state dari widget Form, seperti menjalankan validasi dan mereset form. Validator digunakan untuk memvalidasi input. Jika invalid, validator akan mengembalikan pesan kesalahan. Jika valid, validator akan mengembalikan null. Validate() digunankan untuk menjalankan validator yang terdapan di dalam Form. Method ini akan mengembalikan true jika valid atau false jika tidak.

Salah satu contohnya ada di validator untuk mengecek waktu mulai pendidikan yang valid, jika belum mamasukkan akan memberikan pesan wajib dimasukkan atau jika tanggal yang dimasukkan tidak valid seperti memasukkan tanggal di masa depan akan memberikan pesan bahwa harus tanggal hari ini atau sebelumnya, tidak bisa tanggal besok.

Validasi penting karena jika hanya mengandalkan jenis input atau papan ketik saja tidak menjamin data tersebut sesuai, valid, dan dapat diterima.