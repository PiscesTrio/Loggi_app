# Loggi App

Loggi App is the cross-platform Flutter frontend for the logistics management system. It consumes the Loggi Server REST API to provide mobile and desktop access to warehouse management, distribution tracking, fleet operations, and analytics.

> **Personal Graduation Project (2023) — Frontend**
>
> Backend repository: https://github.com/PiscesTrio/Loggi_server

## Tech Stack

- **Flutter SDK** (>=2.19.3)
- **GetX** — state management, dependency injection, and routing
- **GetStorage** — lightweight local persistence for auth tokens
- **Dio** + **flutter_nb_net** — typed HTTP client with custom decoder
- **AMap Flutter Map** — map integration (Gaode Maps)
- **Charts** — fl_chart, graphic, flutter_echarts

## Features

- **Authentication**: Login with password or email verification, token persistence via `GetStorage`.
- **Home Shell**: Four-tab layout — Base Management, Transport Management, Charts & Analytics, and System Settings.
- **Warehouse Management**: Warehouse list, inventory lookup, and product catalog.
- **Distribution Workflow**: Distribution list, apply for distribution, and real-time status tracking.
- **Fleet Management**: Driver list and vehicle list.
- **Analytics**: Data visualization with multiple chart types.
- **Map View**: AMap integration for location-based logistics tracking.
- **Audit Logs**: Login logs and operation logs.
- **Settings**: System settings and admin utilities.

## Getting Started

### Prerequisites

- Flutter SDK installed and on `PATH`
- Android Studio / Xcode (for mobile emulators) or a physical device
- A running instance of [Loggi Server](https://github.com/your-org/loggi-server) (default: `http://localhost:8088/api`)

### Configuration

Update the backend base URL in both:

- `lib/main.dart`
- `lib/app/data/network/options.dart`

Change `http://YOUR_API_HOST:8088/api` to your actual server address.

### Install Dependencies

```bash
flutter pub get
```

### Run

```bash
flutter run
```

### Analyze & Lint

```bash
flutter analyze
```

### Tests

```bash
flutter test
```

### Build APK

```bash
flutter build apk
```

## Project Structure

```
lib/
├── main.dart                      # Entry point: init GetStorage + NetOptions
├── my_app.dart                    # GetMaterialApp with route guards
├── app/
│   ├── data/
│   │   ├── models/               # Data models extending BaseNetModel
│   │   └── network/            # API options, decoder, and interceptor setup
│   ├── modules/                # Feature modules (binding + controller + view)
│   │   ├── home/               # Four-tab shell with nested navigators
│   │   ├── login/
│   │   ├── base_mangement_page/
│   │   ├── warehouse_list_page/
│   │   ├── WarehouseInventory/
│   │   ├── distribution_list/
│   │   ├── distribution_apply/
│   │   ├── distribution_status/
│   │   ├── transport_management_page/
│   │   ├── driver_list/
│   │   ├── vehicle_list/
│   │   ├── chart/
│   │   ├── map/
│   │   ├── operate_log/
│   │   ├── login_log/
│   │   └── system_setting/
│   ├── routes/
│   │   ├── app_pages.dart      # GetPage route definitions
│   │   └── app_routes.dart     # Route name constants
│   └── utils/
│       └── TokenStorage.dart   # Token read/write helper
└── assets/
    ├── images/                 # UI assets
    ├── map_icons/              # Map marker icons
    └── fonts/                  # Nunito & Open Sans
```

## Navigation Notes

- Named routes are defined in `app/routes/app_pages.dart`.
- The home screen uses `IndexedStack` to switch between four tabs.
- Two tabs (Transport and Settings) contain nested `Navigator` widgets using `Get.nestedKey(...)` to preserve independent navigation stacks.
- The app gates the initial route based on token presence: logged-in users land on `Home`, others on `Login`.

## Localization

Supported locales: Chinese (`zh_CH`) and English (`en_US`).

## Adding a New Module

1. Create a new folder under `app/modules/<feature>/`.
2. Add `bindings/`, `controllers/`, and `views/`.
3. Optionally add an `index.dart` barrel export.
4. Register the `GetPage` route in `app/routes/app_pages.dart`.
5. Add the route constant to `app/routes/app_routes.dart` if needed.

## License

This project is part of the Loggi logistics management system.
