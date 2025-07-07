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
```text
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
```
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
---
## Screenshots
<table>
  <tr>
    <td valign="top" width="50%">
      <img src="https://github.com/user-attachments/assets/22c93110-04b0-4d46-b048-cbd8b623c895" width="100%"/><br/>
      <img src="https://github.com/user-attachments/assets/e565fe7d-9cc6-44f5-be6a-a2a439135ea5" width="100%"/><br/>
      <img src="https://github.com/user-attachments/assets/c4225f81-94b5-4821-95d8-abcdbbee1a0e" width="100%"/><br/>
      <img src="https://github.com/user-attachments/assets/3bac0370-421b-4ac9-9250-d844dfbfa2ee" width="100%"/><br/>
      <img src="https://github.com/user-attachments/assets/ffb884f8-95a7-4688-817d-dee970d393d7" width="100%"/>
    </td>
    <td valign="top" width="50%">
      <img src="https://github.com/user-attachments/assets/1c608811-b5b1-4f87-ba7a-0809b84553f2" width="100%"/><br/>
      <img src="https://github.com/user-attachments/assets/04b425ab-677d-4e2b-ac37-e1246680e9bb" width="100%"/><br/>
      <img src="https://github.com/user-attachments/assets/5c5e83d7-753e-4950-8bd9-8f450cde18d5" width="100%"/><br/>
      <img src="https://github.com/user-attachments/assets/5f455a96-f5d4-47e4-9736-0ae8afc30e19" width="100%"/>
    </td>
  </tr>
</table>
