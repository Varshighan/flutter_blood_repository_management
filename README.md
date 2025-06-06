# 🩸 Blood Bank Management Platform

## 📖 Description

The **Blood Bank Management Platform** is a cross-platform mobile application developed for hospitals to efficiently manage their blood repository. It simplifies the process of maintaining inventory levels, monitoring donations, and requesting specific blood types from other facilities.

Hospitals can:
- Track and manage current blood stock levels
- Request blood units based on urgency and availability
- Approve or decline inter-hospital blood requests
- Log blood donations by donors or events

This system addresses the challenges of manual record-keeping, reduces wastage, and ensures quicker availability of blood in emergencies.

---

## 🚀 Features

- 🧾 **Inventory Management:** Track available units of different blood types.
- 🆘 **Blood Requests:** Submit and view requests between hospitals.
- 👥 **Donor Logging:** Register blood donations by individuals or drives.
- 📅 **Donation History:** View history of donations and requests.
- 🏥 **Multi-Hospital Coordination:** Seamless blood transfer between hospitals.

---

## 🛠️ Tech Stack

- **Frontend:** Flutter
- **Backend:** Flask (Python)
- **Database:** SQLite

---

## 📂 Project Structure

blood_bank_app/
│
├── lib/ # Main Flutter application code
│ └── main.dart # Entry point for the app
│
├── backend/
│ └── app.py # Flask API server
│ └── database.db # SQLite database file
│
├── pubspec.yaml # Flutter dependencies
├── README.md # Project documentation
└── ...

### 🧱 Prerequisites

Ensure you have the following installed:

- Flutter SDK: [Installation Guide](https://docs.flutter.dev/get-started/install)
- Android Studio or VS Code (with Flutter plugin)
- Python 3.7+ with Flask installed

To install Flask:

```bash
pip install flask
```

▶️ Running the Backend (Flask + SQLite)
Navigate to the backend/ folder in your terminal.

Start the Flask server:

```bash
python app.py
```


📱 Running the Flutter App
Open the project folder in VS Code or Android Studio.

Navigate to the lib/ directory.

Run the app:
```bash
flutter pub get
flutter run
```
