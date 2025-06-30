# user_list_app - Flutter User Management App

This is a beautiful Flutter app made as part of the **SeekHelpers assignment**. It allows users to:

✅ View users from an API  
✅ Search and sort the user list  
✅ Add new users with validations  
✅ See full details in a modern, card-based UI  

All this is built with a clean UI, proper state management using Provider, and Flutter best practices.

---

##  Features

- 🔄 **Fetch Users** from REST API  
- 🔍 **Search** users by name  
- 📧 **Sort** users by name or email  
- ➕ **Add New User** (with unique email & phone validation)
- 👁️ **User Detail View** with custom icons and clean layout
- 📱 **Responsive Design** for mobile & web

---

## 📸 Screenshots

> Add your screenshots inside a folder named `screenshots/` in the project root and GitHub will render them.

###  Home Page
![image](https://github.com/user-attachments/assets/d9355bea-08fe-4e3d-ac62-04f9cb63658d)

### search by name 
![image](https://github.com/user-attachments/assets/f2be2421-8422-4643-abf8-2306166ade50)

### sort by email or name 
![image](https://github.com/user-attachments/assets/c767c2dd-b180-4859-81a0-39e4c30cecc4)

### Add User ui 
![image](https://github.com/user-attachments/assets/971a3458-f1b7-4a45-9f52-13e6b03f0ea0)

![image](https://github.com/user-attachments/assets/c748d607-9c49-4764-a9f1-c2843ccaca61)

### User Detail View

![image](https://github.com/user-attachments/assets/89e62811-c663-479c-9e4d-58ef75300154)

### user list 
![image](https://github.com/user-attachments/assets/0b8563f7-9d19-489d-9c20-6448bfabcf00)
![image](https://github.com/user-attachments/assets/6df82be3-1918-4a7d-b49d-8626424e6aee)


### if  user allread present with email or phone number 

![image](https://github.com/user-attachments/assets/d2487efe-c379-4a5b-9edd-c6f1297819ee)

---

## 📂 Project Structure



lib/
├── models/ # User model class
├── screens/ # UI pages (Home, AddUser, Detail)
├── providers/ # State management (UserProvider)
├── services/ # API calls (using http)
├── assets/icons/ # PNG icons used in UI
└── main.dart # App entry point




---

## 🛠️ How to Run This Project

Follow these steps to run the app locally:

### 1. 📦 Clone the Repository

```bash
git clone https://github.com/kanha292/SeekHelpers_assignment.git
cd SeekHelpers_assignment


2. 🔧 Install Dependencies

flutter pub get
3. 🚀 Run the App

flutter run
Make sure Flutter is installed and added to PATH
Supports both Android devices and Web browsers

⚠️ Notes
🧠 Email & Phone number must be unique

🌐 API used: JSONPlaceholder

✅ App tested on Android emulator, real device & Chrome
