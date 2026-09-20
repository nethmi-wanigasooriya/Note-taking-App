# Flutter Note-Taking Web App (SQLite Web Persistence)

A feature-rich, responsive, and modern **Note-Taking Web Application** built using **Flutter Web** and **SQLite (`sqflite_common_ffi_web`)**. This project demonstrates full CRUD functionality, category filtering, persistent browser storage via IndexedDB/WASM, and a modern Material 3 dark-themed user interface.

---

## Features

- **Full CRUD Support**: Create, Read, Update, and Delete notes seamlessly.
- **Dynamic Categorization**: Organize notes into categories (`Work`, `Personal`, `Study`, `General`) with custom visual indicators and badges.
- **Category Filtering**: Filter notes instantly using interactive `ChoiceChip` widgets.
- **Web SQLite Persistence**: Uses WASM and Web Workers to store notes directly in the browser's IndexedDB.
- **Modern Material 3 UI**: Includes custom color-coded category borders, rounded cards, clean form dialogs, and dynamic empty states.
- **Responsive Layout**: Designed to work smoothly across both Web/Desktop browsers and Mobile Web views.

---

## Tech Stack & Packages

- **Framework**: [Flutter](https://flutter.dev/) (Web)
- **Database**: 
  - `sqflite` (Core SQLite implementation)
  - `sqflite_common_ffi_web` (SQLite support for Browser runtime using Web Workers & WASM)
- **Utilities**: `path` (Database path joining)

---


## Getting Started

flutter --version

---

## Clone the Repository

git clone [https://github.com/nethmi-wanigasooriya/Note-taking-App.git](https://github.com/nethmi-wanigasooriya/Note-taking-App.git)
cd Note-taking-App

---

## Install Dependencies

flutter pub get

---

## Verify Web Workers / WASM Setup

Ensure that your web/ folder contains the required WASM and Worker helper scripts provided by sqflite_common_ffi_web:

sqflite_sw.js
sqlite3.wasm

---

## Run the Application

flutter run -d chrome

---

## Troubleshooting & Storage Cleansing

flutter clean
flutter pub get
flutter run -d chrome

---

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page if you want to contribute.

---


## Project Structure

```text
lib/
├── note.dart        # Note data model with JSON/Map serializers
├── db_helper.dart   # SQLite initialization, Web Worker config, & CRUD queries
└── main.dart        # Main UI, Category Filters, Dialogs, and State Management

