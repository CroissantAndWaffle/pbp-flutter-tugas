# Tugas Flutter
Rafa Maritza
2106651944
B

## Tugas 7

### <em>stateless widget</em> dan <em>stateful widget</em>
<em>stateless widget</em> merupakan widget yang tidak dapat diubah ketika suatu aplikasi sudah dibuat. Sedangkan <em>stateful widget</em> merupakan widget yang dapat diubah ketika aplikasi sudah dibuat. Jadi jika pada suatu aplikasi ada perubahan secara dinamis maka harus menggunakan <em>stateful widget</em>.

### widget yang dipakai
Widget yang saya pakai dalam membuat aplikasi counter_7 adalah widget text yang saya tempatkan pada padding dan row. Saya memakai floatingactionbutton untuk menampilkan button decrement dan increment. Saya juga memakai banyak stateless widget yang sudah ada saat aplikasi dibuat.

### fungsi dari setState()
setState() berfungsi untuk memberitahu framework bahwa suatu state telah diubah yang akan mempengaruhi tampilan UI. Contohnya pada aplikasi ini adalah value counter yang diubah memakai setState() dan ditampilkan pada UI.

### perbedaan antara const dengan final
final harus memiliki initializer dan ketika sudah diberi value maka tidak dapat diubah lagi. const berarti valuenya ditentukan saat compile dan benar-benar akan menjadi immutable atau tidak dapat diubah lagi.

### implementasi
Membuat fungsi decrement untuk mengimplementasikan logika sesuai pada tugas. Menggunakan conditional pada widget text untuk menentukan ganjil atau genapnya angka yang ditampilakan. Membuat widget floatingactionbutton decrement dan padding dan row untuk membuat posisi kedua button sesuai dengan tugas.

### referensi
- https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/
- https://api.flutter.dev/flutter/widgets/State/setState.html
- https://news.dartlang.org/2012/06/const-static-final-oh-my.html

## Tugas 8

### Navigator.push dan Navigator.pushReplacement
Dalam flutter Navigator.push dapat menambahkan route ke stack route yang dikelola oleh Navigator. sedangkan Navigator.pushReplacement akan mengganti route navigator saat ini dengan konteks yang diberikan dengan mendorong route yang diberikan dan kemudian membuangroute sebelumnya setelah route baru selesai ditampilkan.

### Widget
Widget yang saya gunakan pada tugas 8 ini adalah drawer untuk berpindah halaman yang diisi dengan ListTile. Saya memakai container yang saya isi dengan TextFormField dan DropdownButton untuk input. Dan saya memakai Card untuk menampilkan input.

### Event listener yang ada pada Flutter
Flutter memiliki banyak sekali event listener seperti onPressed, onPointerCancel, onPointerHover, onPointerMove, dll.

### Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Widget Navigator menampilkan layar sebagai tumpukan menggunakan animasi transisi yang benar untuk platform target. Untuk menavigasi ke layar baru, akses Navigator melalui BuildContext rute dan panggil metode imperatif seperti push() atau pop()

### Implementasi

### Referensi
- https://docs.flutter.dev/cookbook/navigation/navigation-basics
- https://api.flutter.dev/flutter/widgets/Navigator/pushReplacement.html
- https://api.flutter.dev/flutter/widgets/Listener-class.html
- 