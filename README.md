# uts

Penjelasan Projek
1. LoginScreen
<img width="365" height="733" alt="image" src="https://github.com/user-attachments/assets/5a1a7d13-5203-45ee-bd78-bc505368840c" />

Halaman login berfungsi sebagai gerbang utama aplikasi dan diatur sebagai initialRoute: '/login' di dalam file main.dart. Artinya, halaman ini merupakan tampilan pertama yang dilihat pengguna saat membuka aplikasi. Tujuan utamanya adalah untuk melakukan autentikasi pengguna, memastikan hanya pengguna yang memiliki akun yang dapat mengakses fitur utama aplikasi.

Secara teknis, halaman ini dibangun menggunakan struktur Scaffold yang diisi dengan Container berdekorasi gradasi warna biru—menggunakan BoxDecoration dengan LinearGradient dari Colors.blue[800] ke Colors.blue[400]—sehingga memberikan kesan elegan dan modern. Di bagian tengah terdapat kartu glassmorphism, yaitu Container transparan berwarna putih dengan opasitas 0.15 dan sudut melengkung (borderRadius.circular(30.0)). Efek ini menampilkan kesan kaca buram yang estetik dan menjadi wadah bagi formulir login.

Agar tampilan tetap responsif ketika keyboard muncul, seluruh elemen utama dibungkus dengan SingleChildScrollView, sehingga mencegah terjadinya overflow pada layar perangkat. Di dalamnya terdapat struktur Column yang menata komponen secara vertikal: logo aplikasi, judul, kolom input email dan password, serta tombol login. Komponen input dibuat menggunakan TextField yang diberi gaya khusus melalui InputDecoration. Setiap TextField menggunakan filled: true, fillColor: Colors.grey[200], serta ikon awalan (prefixIcon) seperti ikon email dan gembok, dengan border yang dihapus menggunakan OutlineInputBorder(borderSide: BorderSide.none) untuk menghasilkan tampilan minimalis dan bersih.

Untuk navigasi, terdapat ElevatedButton sebagai tombol “Masuk” dan teks interaktif Text.rich sebagai tautan “Daftar”. Tombol Masuk menjalankan fungsi:
Navigator.pushReplacementNamed(context, '/home');

Metode pushReplacementNamed digunakan agar halaman login tergantikan oleh halaman utama (/home), mencegah pengguna kembali ke halaman login setelah berhasil masuk. Sementara itu, teks “Belum punya akun? Daftar” menggunakan kombinasi TextSpan dan TapGestureRecognizer. Ketika bagian “Daftar” diklik, perintah:

Navigator.pushNamed(context, '/register');

akan memindahkan pengguna ke halaman registrasi tanpa menutup halaman login, sehingga pengguna masih dapat kembali menggunakan tombol “Kembali”.
Secara keseluruhan, halaman ini dirancang dengan prinsip modern, fungsional, dan responsif, memastikan pengalaman pengguna yang nyaman dan sesuai dengan estetika aplikasi mobile masa kini.

2. RegisterScreen
<img width="462" height="918" alt="image" src="https://github.com/user-attachments/assets/57b894b6-6e65-453f-bf2e-6198a8461b84" />

Halaman RegisterScreen ini diakses langsung dari LoginScreen dan berfungsi untuk mendaftarkan pengguna baru. Secara visual dan struktural, tampilan halaman ini sengaja dibuat hampir identik dengan LoginScreen agar pengguna merasakan kesan konsistensi desain dan navigasi yang intuitif. Penggunaan warna, tata letak, dan efek visual mengikuti pola yang sama sehingga pengalaman pengguna tetap nyaman dan seragam di seluruh aplikasi.

Struktur halaman dibangun menggunakan Scaffold sebagai wadah utama. Latar belakang halaman menampilkan gradasi biru elegan menggunakan Container dengan BoxDecoration dan LinearGradient yang sama seperti halaman login, yaitu perpaduan dari Colors.blue[800] ke Colors.blue[400]. Di tengah layar terdapat Container transparan dengan efek glassmorphism menggunakan Colors.white.withOpacity(0.15) dan sudut melengkung BorderRadius.circular(30.0), menciptakan tampilan kartu kaca yang modern. Seluruh elemen dibungkus dengan SingleChildScrollView agar tampilan tetap rapi saat keyboard muncul, serta dibungkus lagi oleh Center untuk memposisikan konten tepat di tengah layar.

Bagian utama halaman adalah formulir pendaftaran, yang disusun secara vertikal menggunakan Column. Berbeda dengan halaman login yang hanya memiliki dua kolom input, halaman ini memiliki tiga TextField, yaitu Nama Lengkap, Email, dan Password. Masing-masing dilengkapi dengan ikon pembeda: Icon(Icons.person) untuk nama, Icon(Icons.email) untuk email, dan Icon(Icons.lock) untuk password. Semua input diformat dengan gaya seragam menggunakan InputDecoration yang berisi properti seperti filled: true, fillColor: Colors.grey[200], serta OutlineInputBorder(borderSide: BorderSide.none) untuk menampilkan tampilan minimalis dan bersih tanpa garis tepi.

Dari sisi logika navigasi, halaman ini memiliki dua aksi utama, yaitu tombol “Daftar” dan tautan “Login”, keduanya berfungsi untuk kembali ke halaman login setelah proses pendaftaran. Tombol Daftar diimplementasikan menggunakan ElevatedButton, yang ketika ditekan akan mengambil data dari controller (nama, email, dan password), menampilkannya di konsol sebagai data dummy, lalu menutup halaman register dengan perintah:

Navigator.pop(context);

Begitu pula, tautan teks “Login” dibuat menggunakan Text.rich dengan kombinasi TextSpan dan TapGestureRecognizer, yang juga menjalankan perintah yang sama (Navigator.pop(context)) ketika diklik.

Penggunaan Navigator.pop(context) menjadi pilihan yang tepat karena memastikan alur navigasi terasa alami: halaman RegisterScreen dihapus dari tumpukan navigasi dan pengguna langsung kembali ke halaman LoginScreen yang ada di bawahnya. Pendekatan ini menjaga pengalaman pengguna tetap sederhana, efisien, dan sesuai dengan prinsip desain aplikasi modern yang mengutamakan konsistensi serta kemudahan dalam berpindah antarhalaman.

3. HomePage
<img width="460" height="937" alt="image" src="https://github.com/user-attachments/assets/7ec4970e-39f8-4251-abc5-9567c8cf5990" />

Halaman HomePage merupakan “jantung” dari aplikasi Hadist Digital, karena di sinilah pengguna disambut setelah berhasil login. Halaman ini terdaftar dengan rute /home di file main.dart dan berfungsi sebagai dasbor utama untuk mengakses berbagai konten hadits yang telah disediakan. Dengan tampilan yang konsisten terhadap tema biru elegan dan gaya glassmorphism, halaman ini menghadirkan pengalaman antarmuka yang bersih, modern, dan mudah digunakan.

Secara struktural, halaman ini menggunakan Scaffold sebagai kerangka utama. Latar belakangnya diatur menjadi Colors.blue[900] agar seragam dengan halaman lain seperti login dan register. Di dalam body, konten dibagi menjadi dua bagian besar: header dan content body (daftar hadits). Bagian header menampilkan sapaan dinamis “Assalamu’alaikum Fadhil”, sementara bagian body berisi daftar hadits yang disusun secara vertikal menggunakan ListView.

Bagian header dirancang dinamis dengan memanfaatkan ValueListenableBuilder. Widget ini terhubung langsung ke UserService.userName, sehingga setiap kali nama pengguna diperbarui melalui halaman pengaturan, tampilan header otomatis ikut berubah secara real-time tanpa perlu memuat ulang halaman. Cuplikan kodenya terlihat seperti berikut:

ValueListenableBuilder<String>(
  valueListenable: UserService.userName,
  builder: (context, name, child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Assalamu'alaikum", ...),
        Text(name, ...), // menampilkan nama pengguna
      ],
    );
  },
),

Selain itu, di pojok kanan atas header terdapat ikon logout (ikon panah keluar). Ketika ditekan, ikon ini menjalankan perintah:

Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);

Perintah ini sangat penting karena akan memindahkan pengguna ke halaman login sekaligus menghapus seluruh riwayat halaman sebelumnya. Dengan demikian, pengguna tidak dapat kembali ke aplikasi tanpa login ulang — langkah ini menjadi elemen keamanan dasar aplikasi.

Untuk kontennya, halaman ini menampilkan data hadits dummy yang disimpan langsung di dalam file home_page.dart. Data tersebut tersusun dalam bentuk List<Hadith> yang berisi objek dengan properti judul, sumber, teks Arab, dan terjemahan. Daftar hadits ini kemudian dirender menggunakan ListView, di mana setiap item ditampilkan melalui widget khusus bernama _buildHadithCard(). Desain setiap kartu tetap konsisten dengan tema aplikasi, menggunakan gaya glassmorphism dengan Container berwarna putih semi-transparan (Colors.white.withOpacity(0.15)), sehingga tampak menyatu dengan keseluruhan desain.

Masing-masing kartu hadits dibungkus dalam GestureDetector, yang memungkinkan interaksi sentuh. Saat kartu ditekan, aplikasi akan menavigasi ke halaman DetailPage menggunakan:

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(hadith: hadithData),
  ),
);

Penggunaan MaterialPageRoute (alih-alih named route) dipilih karena memungkinkan pengiriman objek hadits lengkap ke halaman detail — termasuk teks Arab dan terjemahannya — dengan cara yang efisien dan fleksibel.

Selain itu, di bagian bawah halaman terdapat BottomNavigationBar yang mempermudah navigasi antarhalaman utama: List, Home, dan Settings. Saat pengguna berpindah tab, fungsi _onItemTapped akan mengeksekusi Navigator.pushReplacementNamed(context, '/list') atau '/settings' tergantung tab yang dipilih. Metode pushReplacementNamed digunakan agar perpindahan antarhalaman terasa instan dan ringan, tanpa menumpuk riwayat halaman di tumpukan navigasi.

Secara keseluruhan, halaman HomePage tidak hanya berfungsi sebagai pusat tampilan hadits, tetapi juga sebagai penghubung utama antarfitur aplikasi. Dengan kombinasi desain responsif, navigasi efisien, dan integrasi data dinamis, halaman ini merepresentasikan inti pengalaman pengguna dalam aplikasi Hadist Digital.

4. DetailPage
<img width="462" height="929" alt="image" src="https://github.com/user-attachments/assets/4e7b2137-f92a-4a1b-bc54-a927ff34a279" />

Halaman DetailPage merupakan halaman dinamis yang menampilkan isi lengkap dari hadits yang dipilih pengguna. Halaman ini tidak terdaftar sebagai named route utama di main.dart, karena ia bersifat fleksibel dan selalu menerima data yang berbeda setiap kali dibuka. Data tersebut dikirim langsung dari halaman sebelumnya — baik dari HomePage maupun ListPage — sesuai dengan hadits yang dipilih oleh pengguna. Dengan demikian, halaman ini berperan sebagai tampilan detail kontekstual yang berubah tergantung pada interaksi pengguna.

Proses navigasi menuju halaman ini dilakukan menggunakan Navigator.push, bukan pushNamed. Saat pengguna menekan salah satu kartu hadits di halaman sebelumnya, aplikasi mengirimkan objek Hadith lengkap (berisi judul, sumber, teks Arab, dan terjemahan) melalui constructor. Cuplikannya seperti berikut:

class DetailPage extends StatefulWidget {
  final Hadith hadith; // Menerima data hadits dari halaman sebelumnya
  const DetailPage({Key? key, required this.hadith}) : super(key: key);
  // ...
}

Seluruh isi halaman, mulai dari judul seperti “Kebersihan” hingga sumber hadits “HR. Muslim”, diambil langsung dari properti widget.hadith. Misalnya, widget.hadith.title menampilkan judul hadits, sedangkan widget.hadith.translation menampilkan terjemahannya. Pendekatan ini menjamin bahwa halaman dapat menampilkan informasi yang berbeda setiap kali dibuka, tanpa perlu rute statis tambahan.

Sama seperti halaman lain, DetailPage memiliki header dinamis (_buildHeader) yang menampilkan sapaan “Assalamu’alaikum” diikuti dengan nama pengguna yang sedang login. Header ini dibangun menggunakan ValueListenableBuilder yang terhubung ke UserService, sehingga ketika pengguna mengganti nama di halaman pengaturan, nama di header akan otomatis berubah secara real-time di seluruh aplikasi. Ini menciptakan pengalaman pengguna yang konsisten dan personal.

Bagian isi halaman diatur menggunakan Column agar elemen-elemen seperti judul hadits, teks Arab, terjemahan, dan tombol interaktif tersusun secara vertikal dan mudah dibaca. Teks Arab (widget.hadith.arabic) diberi pengaturan khusus seperti textAlign: TextAlign.right dan ukuran huruf yang lebih besar untuk meningkatkan keterbacaan. Sementara teks terjemahan ditampilkan di bawahnya dengan gaya yang lebih sederhana agar tampak rapi dan kontras.

Untuk navigasi kembali, halaman ini memiliki teks atau tombol “Kembali” di bagian atas yang dibungkus dalam GestureDetector atau TextButton. Ketika ditekan, perintah Navigator.pop(context) dijalankan untuk “melepas” halaman Detail dari tumpukan navigasi, sehingga pengguna langsung kembali ke halaman sebelumnya (HomePage atau ListPage). Ini memastikan alur navigasi tetap natural dan tidak menumpuk halaman secara berlebihan.

Fungsi utama dari halaman ini adalah fitur “Tambah ke List”, yang memungkinkan pengguna menyimpan hadits favorit. Tombol ini diimplementasikan sebagai ElevatedButton, dan ketika ditekan, ia akan memanggil method statis dari FavoritesService untuk menambahkan objek hadits yang sedang dibuka ke dalam daftar favorit global:

ElevatedButton(
  onPressed: () {
    FavoritesService.addFavorite(widget.hadith);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.hadith.title} telah ditambahkan')),
    );
  },
  child: const Text("Tambah ke list"),
)

Setelah data ditambahkan, ScaffoldMessenger menampilkan SnackBar sebagai umpan balik, memberi tahu pengguna bahwa hadits tersebut berhasil disimpan ke daftar favorit.

Seperti halaman lain dalam aplikasi, DetailPage juga menyertakan BottomNavigationBar di bagian bawah. Komponen ini memungkinkan pengguna untuk langsung berpindah ke ListPage atau SettingsPage tanpa harus kembali ke halaman sebelumnya terlebih dahulu. Dengan kombinasi navigasi dinamis, tampilan yang konsisten, dan integrasi data reaktif, halaman ini menjadi bagian penting yang melengkapi pengalaman interaktif pengguna di dalam aplikasi Hadist Digital.

5. ListPage
<img width="462" height="915" alt="image" src="https://github.com/user-attachments/assets/3a31884b-43fd-4595-a56b-2b7af6193f7f" />

Halaman ListPage adalah bagian dari aplikasi yang berfungsi sebagai “Daftar Favorit” atau “Daftar Simpan” pengguna. Halaman ini terdaftar dengan rute /list di file main.dart dan menjadi salah satu komponen paling reaktif dan teknis dalam seluruh struktur aplikasi Hadist Digital. Tujuan utamanya adalah menampilkan daftar hadits yang telah disimpan oleh pengguna melalui fitur Tambah ke list di halaman DetailPage. Karena bersifat dinamis, tampilan halaman ini akan berubah secara otomatis setiap kali data di FavoritesService diperbarui.

Reaktivitas halaman ini dibangun menggunakan ValueListenableBuilder, yang menjadi inti dari seluruh logika tampilan. Body utama halaman dibungkus dengan widget ini agar dapat terus “mendengarkan” perubahan pada FavoritesService.favorites, sebuah objek ValueNotifier yang menyimpan daftar hadits favorit pengguna. Setiap kali ada hadits baru yang ditambahkan dari halaman DetailPage, FavoritesService akan memicu notifikasi (“berteriak”), dan ValueListenableBuilder akan segera “mendengar” perubahan itu untuk membangun ulang tampilan secara otomatis. Dengan demikian, pengguna selalu melihat data yang paling mutakhir tanpa perlu me-restart atau me-refresh halaman secara manual. Cuplikannya sebagai berikut:

Widget _buildBody() {
  return ValueListenableBuilder<List<Hadith>>(
    valueListenable: FavoritesService.favorites, // Mendengarkan perubahan data
    builder: (context, favoritesList, child) {
      if (favoritesList.isEmpty) {
        return _buildEmptyState(); // Tampilkan tampilan kosong
      } else {
        return Expanded(
          child: ListView.builder(
            itemCount: favoritesList.length,
            itemBuilder: (context, index) {
              final hadith = favoritesList[index];
              return _buildHadithCard(hadith);
            },
          ),
        );
      }
    },
  );
}

Ketika daftar favorit kosong, halaman akan menampilkan tampilan status kosong (empty state). Tampilan ini dirancang agar tetap elegan dan informatif, menggunakan Expanded dan Center untuk menempatkan pesan di tengah layar. Pesan terdiri dari dua baris teks yang menjelaskan bahwa daftar masih kosong dan mengajak pengguna untuk menambahkan hadits baru. Cuplikannya sebagai berikut:

Widget _buildEmptyState() {
  return Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Daftar list kosong",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12.0),
          Text(
            "Tambahkan hadist ke daftar favorit Anda dari halaman detail.",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    ),
  );
}

Selain fungsinya yang reaktif, halaman ini juga menjaga konsistensi visual dan pengalaman pengguna dengan menggunakan komponen yang sama seperti pada halaman lain. Bagian atas halaman menampilkan _buildHeader — widget yang menampilkan sapaan “Assalamu’alaikum” beserta nama pengguna yang sedang login. Header ini juga menggunakan ValueListenableBuilder yang terhubung ke UserService, sehingga nama pengguna akan diperbarui secara otomatis di seluruh aplikasi jika diubah melalui halaman pengaturan.

Jika daftar favorit tidak kosong, ListView.builder akan membuat ulang _buildHadithCard untuk setiap item di dalam favoritesList. Desain kartu ini tetap mempertahankan gaya glassmorphism yang menjadi ciri khas aplikasi, dengan Container berwarna putih semi-transparan (Colors.white.withOpacity(0.15)) dan sudut membulat lembut. Setiap kartu juga dibungkus dengan GestureDetector, memungkinkan pengguna menekan salah satu hadits favorit untuk kembali membuka detailnya di DetailPage. Navigasi ini dilakukan dengan Navigator.push dan MaterialPageRoute, membawa seluruh data hadits yang dipilih tanpa kehilangan konteks.

Pada bagian bawah halaman, terdapat BottomNavigationBar yang identik dengan halaman lain seperti HomePage dan SettingsPage. Di halaman ini, tab “List” berada pada posisi aktif (currentIndex: 0). Fungsi _onItemTapped digunakan untuk berpindah antarhalaman menggunakan:

Navigator.pushReplacementNamed(context, '/home');
Navigator.pushReplacementNamed(context, '/settings');

Pendekatan pushReplacementNamed memastikan perpindahan antarhalaman berlangsung cepat, ringan, dan tidak menumpuk riwayat navigasi, menjaga performa aplikasi tetap optimal.

Secara keseluruhan, ListPage berperan sebagai pusat data favorit yang reaktif, fungsional, dan konsisten dengan seluruh desain aplikasi. Dengan integrasi yang erat antara ValueNotifier, FavoritesService, dan sistem navigasi Flutter, halaman ini menghadirkan pengalaman pengguna yang interaktif, real-time, dan menyatu dengan seluruh ekosistem aplikasi Hadist Digital.

6. SettingsPage
<img width="465" height="927" alt="image" src="https://github.com/user-attachments/assets/7aa923ab-5ae6-4741-a551-457dabb6f3e9" />

Halaman SettingsPage (rute /settings) berfungsi sebagai pusat kontrol aplikasi dan menjadi halaman paling padat secara teknis karena terhubung langsung ke berbagai service untuk mengelola state global. Struktur utamanya memakai Scaffold dengan ListView agar konten dapat di-scroll ketika opsi pengaturan bertambah. Untuk konsistensi antarmuka, halaman ini menggunakan kembali dua komponen reusable: _buildHeader—header reaktif yang terhubung ke UserService untuk menampilkan nama pengguna—dan _buildBottomNavBar sebagai navigasi bawah standar dengan tab Settings (indeks 2) dalam keadaan aktif. Desain kartu tetap mengikuti gaya glassmorphism melalui helper widget _buildSettingsCard, sehingga visualnya seragam dengan halaman lain.

Kartu “Profil pengguna” tidak bersifat statis; kolom nama (“Fadhil”) dan email (“akbarfadhil11@gmail.com
”) bersifat reaktif. Di dalam widget _buildInfoField, ValueListenableBuilder “mendengarkan” UserService.userName dan UserService.userEmail, sehingga setiap perubahan pada profil segera tercermin di halaman ini dan tetap sinkron dengan header maupun sumber datanya. Tombol “Edit profile” menumpuk halaman EditProfilePage di atas SettingsPage menggunakan Navigator.pushNamed(context, '/edit_profile'), memberikan alur pengeditan yang sederhana namun jelas.

Kartu “Ukuran teks” adalah fitur manajemen state global yang paling penting. Penentuan tombol yang sedang aktif (misalnya “Sedang”) dilakukan secara reaktif lewat ValueListenableBuilder yang membaca nilai SettingsService.textScale. Saat pengguna mengetuk salah satu pilihan (“Kecil”, “Sedang”, “Besar”), tombol tersebut memanggil SettingsService.updateTextScale(...) untuk memperbarui state global. Rantai kerjanya: (1) aksi tombol memanggil updateTextScale, (2) SettingsService memperbarui ValueNotifier, (3) main.dart yang “mendengarkan” perubahan ini mendeteksi pembaruan, (4) MaterialApp dibangun ulang dan dibungkus dengan MediaQuery yang membawa textScaleFactor baru, dan (5) ukuran font pada seluruh halaman—Home, List, Detail, hingga Settings—berubah seketika tanpa perlu memuat ulang aplikasi. Dengan arsitektur ini, SettingsPage benar-benar berperan sebagai pusat komando yang menjaga konsistensi pengalaman dan state di seluruh aplikasi.


