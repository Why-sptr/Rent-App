<div align="center">
  <img src="assets/images/logo_rentku.png" alt="RentKu Logo" width="200"/>
  
  # 🚗 RentKu - Car Rental App
  
  ### *Sewa Mobil Impianmu dengan Mudah*
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
  
  <p align="center">
    <img src="assets/images/Thumbnail 1.png" alt="App Preview 1" width="250"/>
    <img src="assets/images/Thumbnail 2.png" alt="App Preview 2" width="250"/>
  </p>
</div>

---

## 📖 Tentang Aplikasi

**RentKu** adalah aplikasi mobile car rental yang dibangun menggunakan Flutter. Aplikasi ini menyediakan platform untuk menyewa berbagai jenis mobil dengan mudah dan cepat, dilengkapi dengan fitur pencarian, filter brand, dan promo menarik.

### ✨ Fitur Utama

- 🏠 **Dashboard Interaktif** - Tampilan home dengan greeting personal dan notifikasi
- 🔍 **Pencarian & Filter** - Cari mobil berdasarkan nama atau filter berdasarkan brand
- 🚙 **Katalog Mobil** - Browse berbagai pilihan mobil dari brand ternama
- 🎯 **Info Detail Mobil** - Lihat lokasi, transmisi, dan harga rental per hari
- 🎁 **Promo Banner** - Dapatkan informasi promo dan diskon terbaru
- 👤 **Profile Management** - Kelola informasi akun dan pengaturan
- 🔐 **Autentikasi** - Login dengan validasi email dan password

### 🎨 Desain & UI/UX

- Modern gradient design dengan color scheme yang konsisten
- Responsive layout untuk berbagai ukuran layar
- Custom typography menggunakan Google Fonts (Poppins)
- Smooth navigation dengan bottom navigation bar
- Clean code dengan global styling configuration

---

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="assets/images/Thumbnail 1.png" width="200"/>
        <br />
        <b>Login Screen</b>
      </td>
      <td align="center">
        <img src="assets/images/Thumbnail 2.png" width="200"/>
        <br />
        <b>Dashboard</b>
      </td>
    </tr>
  </table>
</div>

---

## 🏗️ Struktur Proyek

```
lib/
├── config/
│   ├── app_colors.dart          # Global color palette & gradients
│   ├── app_constants.dart       # UI constants & spacing
│   └── app_text_styles.dart     # Typography styles
├── data/
│   └── dashboard_data.dart      # Static data untuk dashboard
├── models/
│   └── car_model.dart           # Data model untuk mobil
├── pages/
│   ├── login_page.dart          # Halaman login
│   ├── main_page.dart           # Main navigation container
│   ├── dashboard_page.dart      # Home/Dashboard
│   └── profile_page.dart        # User profile
├── widgets/
│   ├── brand_list.dart          # Widget list brand mobil
│   ├── car_card.dart            # Widget card mobil
│   ├── cars_list.dart           # Widget horizontal list mobil
│   └── promo_banner.dart        # Widget banner promo
└── main.dart                    # Entry point aplikasi
```

---

## 🚀 Getting Started

### Prerequisites

Pastikan Anda sudah menginstall:
- Flutter SDK (^3.9.2)
- Dart SDK (^3.9.2)
- Android Studio / VS Code
- Android Emulator / Physical Device

### Instalasi

1. **Clone repository**
   ```bash
   git clone https://github.com/Why-sptr/Rent-App.git
   cd rent_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run aplikasi**
   ```bash
   flutter run
   ```

### Build APK

```bash
# Debug APK
flutter build apk

# Release APK
flutter build apk --release
```

---

## 🛠️ Tech Stack

| Technology | Description |
|------------|-------------|
| **Flutter** | UI framework untuk build native apps |
| **Dart** | Programming language |
| **Google Fonts** | Custom typography (Poppins) |
| **Material Design** | Design system & components |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

---

## 🎯 Roadmap

- [x] Login & Authentication
- [x] Dashboard dengan brand & car list
- [x] Profile management
- [x] Promo banner
- [ ] Detail page mobil
- [ ] Booking & reservation system
- [ ] Payment integration
- [ ] History rental
- [ ] Push notifications
- [ ] Dark mode
- [ ] Multi-language support

---

## 👨‍💻 Developer

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="assets/images/avatar.jpg" width="100" style="border-radius: 50%"/>
        <br />
        <sub><b>Wahyu Saputra</b></sub>
        <br />
        <sub>Mobile Developer</sub>
      </td>
    </tr>
  </table>
</div>

---

## 📝 Brand Partners

<div align="center">
  <img src="assets/images/brand/Hyundai.png" width="80" style="margin: 10px"/>
  <img src="assets/images/brand/Toyota.png" width="80" style="margin: 10px"/>
  <img src="assets/images/brand/Honda.png" width="80" style="margin: 10px"/>
  <img src="assets/images/brand/BYD.png" width="80" style="margin: 10px"/>
  <img src="assets/images/brand/Mitsubishi.png" width="80" style="margin: 10px"/>
</div>

---

## 🙏 Acknowledgments

- Design inspiration from modern car rental apps
- Icons from Material Design & Cupertino Icons
- Fonts from Google Fonts

---

<div align="center">
  <p>Made by Wahyu Cahyo Saputra</p>
  <p>© 2025 RentKu. All rights reserved.</p>
</div>
