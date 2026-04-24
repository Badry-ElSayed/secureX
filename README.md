# 🔐 SecureX – Password Manager App

SecureX is a simple, fast, and secure password manager built with Flutter.  
It allows users to store and manage their login credentials locally using Hive database with a clean and modern UI.

---

## 📱 Features

- 🔐 Store login credentials (Website, Email, Password)
- 🧠 Local storage using Hive (No internet required)
- ✏️ Edit saved accounts anytime
- 🗑️ Delete accounts with confirmation dialog
- 🎨 Custom icons for each account (Icon Picker)
- ⚡ Fast and lightweight performance
- 📱 Clean UI with dark themed design

---

## 🧱 Tech Stack

- **Flutter** – UI Framework
- **Dart** – Programming Language
- **Hive** – Local NoSQL Database
- **Font Awesome Flutter** – Icons
- **Awesome Dialog** – Confirmation dialogs

---

## 📂 App Structure

The app contains 3 main screens:

### 1️⃣ Home Screen
- Displays all saved accounts in a list
- Uses `ValueListenableBuilder` to auto-update UI
- Edit & Delete options for each account
- Floating button to add new account

### 2️⃣ Add Account Screen
- Add new login credentials
- Choose custom icon for each account
- Form validation for empty fields
- Save data into Hive database

### 3️⃣ Edit Account Screen
- Edit existing account details
- Update stored data in Hive
- Change icon dynamically
- Pre-filled form fields for better UX

---

## 🗄️ Database (Hive)

All data is stored locally using Hive box.