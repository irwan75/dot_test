## Jawaban Tes Pengetahuan

**Sudah Berapa Lama Anda Menggunakan Flutter ?** 

2 tahun


**Apa saja Library flutter yang sering atau biasa anda pakai ? Jelaskan kegunaannya bagi anda!**

* Getx : State Management
* Hive : untuk menyimpan data (NoSQL Database)
* Intl : untuk mengubah format time
* Location : untuk mendapatkan lokasi user secara real time
* Geolocator : untuk mendapatkan data informasi / mengconvert dari data latitude longitude menjadi informasi keterangan (kecamatan, kabupaten,dll)
* gmaps_flutter : untuk menampilkan maps dan menggunakan fitur2 yang tersedia seperti marker, camera_view, dll
* build_runner : untuk membuat file class model generate
* http : get data dari Internet/API (REST API)
* flutter_svg : untuk menconvert dari svg to Image pada flutter
* path_provider : untuk menghandle path-path sebuah file yang tersimpan secara lokal
* font_awesome_icon : menambah library icon
* firebase_crashlytics : nge-trace error code yang membuat app crash
* firebase_cloud_messaging : push notification
* firebase_remote_config : dijadikan sebagai value variable yang dynamis yang dapat diubah kapan saja
* firebase_storage : sebagai tempat penyimpanan file atau gambar
* firebase_core : inisialisasi setup koneksi flutter dengan firebase
* carousel_slider : Image Carousel Template
* flutter_swiper : Image Slider Template
* flutter_html : Konversi dari teks yang terdapat code HTML
* cache_network_image : Mengambil gambar dan menyimpannya menjadi cache
* flutter_staggered_grid_view : Template Grid View yang mempunyai ukuran berbeda-beda
* pusher_beams : push notification third-party
* charts_flutter : Package untuk menampilkan chart pada flutter
* image_picker : service atau fitur untuk mengambil gambar melalui galeri atau kamera
* qr_code_scanner : service atau fitur untuk mendapatkan data dari hasil scan QR Code
* sentry : Crash Report and Bug
* url_launcher : untuk mengintent dari aplikasi ke aplikasi lain seperti action dari apps yang akan membuka aplikasi lain
* esc_pos_utils and esc_pos_printer : package untuk menghubungkan printer Bluetooth thermal dengan apps dan juga dapat melakukan print


**Jelaskan penerapan clean code atau design pattern yang biasa anda gunakan dan manfaatnya untuk anda!**

Penerapan Clean Code yang saya gunakan adalah berbasis TDD (Test Driven Development) yang menempatkan semua function menjadi unit-unit terkecil dan dapat di unit-testing-kan serta menjadikannya sebuah object yang dapat dipanggil kapan saja dan dimana saja secara independent. Secara sederhananya adalah arsitektur yang mengacu terhadap konsep microservices. Pattern yang saya gunakan adalah GetX Pattern yang hamper mirip dengan MVC  


**Apakah tantangan terbesar yang pernah anda temui dalam mengerjakan aplikasi flutter dan bagaiamana anda menyelesaikannya dari sisi engineering ? misal dari sisi android dan iOS**

Tantangan terbesar dalam membuat mobile apps adalah, yaitu ketika menggunakan resource hardware pada device (kamera, speaker, gyroscope, GPS, dsb) yang package-nya masih belum ada. Dan salah satu penyelesaiannya adalah dengan mengkoneksikan Project Flutter dengan Native code yang tentu akan memakan waktu yang lama dalam development.


**Jelaskan Teknik-teknik apa saja yang dapat meningkatkan performance dan keamanan sebuah aplikasi flutter?**

* Sebisa mungkin untuk mengurangi penggunaan menampilkan gambar melalui internet
* Jika ada page yang gambar-nya diambil di Internet, maka skala prioritasnya adalah dahulukan terlebih dahulu pengambilan data lalu pengambilan gambar dari internet
* Sebisa mungkin buat class singleton agar instance class tidak membuat 2 instance atau lebih yang dapat berdampak banyak memakan memori
* Sebisa mungkin, semua key_credential pada apps disembunyikan di gradle atau semacamnya yang hanya akan diinject ketika app di build
* Menggunakan metode obfuscate untuk mengamankan semua key_data
* Menggunakan model fetch data background (opsi alternative), jika apps mendapat response yang lama dari sisi backend
* Menginisialisasikan limit Request Time Out jika berbasis Rest API Client
* Sebisa mungkin tidak terlalu banyak menggunakan package karena dapat berakibat besarnya ukuran file APK atau IPA
* Menggunakan build yang direkomendasikan flutter “flutter build apk –split-per-abi” untuk menangani seseorang dapat meng-expand dan melakukan reverse engineering pada apps untuk menghindari pihak-pihak yang ingin mendapatkan informasi list of API dan Key_credential
* Menggunakan state management yang sesuai untuk menghindari apps melakukan rendering satu page jika ada perubahan data  