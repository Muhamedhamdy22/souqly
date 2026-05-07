# 🛒 Souqly

A modern supermarket delivery app built with Flutter — browse fresh groceries, get daily deals, and order your essentials delivered straight to your door.

---

## 📱 Features

- 🔐 **Authentication** — Sign up, login, and session management
- 📍 **Delivery Location** — Detects and displays the user's delivery city (e.g. Cairo, Egypt)
- 🏠 **Home Screen** — Promotional banners (New Arrivals, Free Delivery), categories grid, and featured products
- 🗂️ **Categories** — Browse by category: Meat, Seafood, Frozen Food, Snacks, Confectionery and more
- 🔍 **Search** — Search bar with filter support to quickly find any product
- 📦 **Product Details** — Product image, name, price in EGP, star rating, and quick add-to-cart
- 🛒 **Cart** — Add, remove, and update quantities before checkout
- 📋 **Orders** — Track current and past orders
- 👤 **Profile** — Manage your account, address, and preferences
- 🔔 **Notifications** — Bell icon for alerts and promotional offers
- 💫 **Splash Screen** — Smooth app launch experience

---

## 🏗️ Project Structure

```
lib/
├── core/                  # Shared utilities, constants, themes, services
└── features/
    ├── Auth/              # Login & registration
    ├── home/              # Home feed, banners & featured products
    ├── categories/        # Meat, Seafood, Frozen Food, Snacks, etc.
    ├── search/            # Search functionality
    ├── products/          # Product listings
    ├── product_details/   # Single product view
    ├── cart/              # Shopping cart
    ├── orders/            # Order management
    ├── profile/           # User profile
    ├── main_layout/       # Bottom nav & app shell
    └── splach/            # Splash screen
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.0.0`
- Dart `>=3.0.0`
- Android Studio / VS Code
- Android Emulator or iOS Simulator (or a physical device)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/souqly.git

# 2. Navigate to the project directory
cd souqly

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

---

## 🧰 Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| Architecture | Feature-based Clean Architecture |
| DI | `di.dart` / `di.config.dart` (injectable) |
| State Management | *(add your state management here e.g. BLoC / Riverpod)* |
| Navigation | *(add your router e.g. GoRouter / AutoRoute)* |

---

## 📂 Assets

Static assets (images, fonts, icons) are located in the `assets/` directory and registered in `pubspec.yaml`.

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

> Built with ❤️ using Flutter<img width="378" height="789" alt="image" src="https://github.com/user-attachments/assets/3f71209f-ff95-4e76-b755-deb11f5a6fb9" /><img width="376" height="792" alt="image" src="https://github.com/user-attachments/assets/af8d4eb6-c5bb-4e0d-9192-3a73bc2321e0" /><img width="384" height="781" alt="image" src="https://github.com/user-attachments/assets/cc0f71ae-6eae-4f46-8498-9c0f6cb83d17" />
<img width="377" height="778" alt="image" src="https://github.com/user-attachments/assets/dac02316-909c-444f-b886-328190f0dd7b" />

<img width="380" height="782" alt="image" src="https://github.com/user-attachments/assets/81094046-7855-453b-804a-b36bb62a0406" />
<img width="384" height="779" alt="image" src="https://github.com/user-attachments/assets/b69190f6-4602-44a0-b535-201853826f04" />

