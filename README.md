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