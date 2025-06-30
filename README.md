![image](https://github.com/user-attachments/assets/77a271ef-a67d-46bb-a741-1d7be213377b)![image](https://github.com/user-attachments/assets/f536d61a-0321-4cee-b02d-043b288ec8f6)# user_list_app - Flutter User Management App

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
![image](https://github.com/user-attachments/assets/ce2f3912-b82f-4f02-a38a-dbaca591b1ca)

### User Details 
![image](https://github.com/user-attachments/assets/c078dfcb-61f5-481f-a96c-ded795f1852d)

### Add new User page 

![image](https://github.com/user-attachments/assets/f3f08a3c-42b3-4ccb-ac17-9d3c191544c9)

![image](https://github.com/user-attachments/assets/be9a2ad8-2b33-4f77-8cf8-bbc5fafb2e56)

### Successfully User added
![image](https://github.com/user-attachments/assets/e727c130-0a9f-4140-bd5d-4b331b0f5f89)


### search by name 
![image](https://github.com/user-attachments/assets/af5e0c40-0ba5-4612-a0fa-231a985d8f4a)

### sort by email or name 
![image](https://github.com/user-attachments/assets/b46e81eb-382c-496c-9345-0b749f51e30e)



### if  user allread present with email or phone number 

![image](https://github.com/user-attachments/assets/5640cceb-1a65-4486-a4c1-0144daa9eb91)

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
