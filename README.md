# Flutter Bloc State Management - Practice Project

A comprehensive Flutter project demonstrating **Bloc & Cubit state management** 
patterns used in real-world production applications.

---

##  Features Implemented

### Cubit Examples
| Feature | Description |
|---|---|
| Counter | Increment, Decrement, Reset |
| Display Text | User input displayed on screen |
| Addition | Two number inputs with result |

### Bloc Examples (Events & States)
| Feature | Description |
|---|---|
| Signup Flow | Form → Loading → Navigation to next screen |
| Todo List | Add & Delete todos with list management |
| Fetch Users | Real API call with Loading/Success/Error states |
| Pull to Refresh | Refresh API data with RefreshIndicator |

---

##  Concepts Covered

- Cubit vs Bloc difference
- Events, States, Bloc separation
- BlocProvider, BlocBuilder, BlocListener, BlocConsumer
- MultiBlocProvider for multiple blocs on one screen
- BlocProvider.value for passing Bloc across screens
- Real REST API integration with http package
- JSON parsing with model classes
- Error handling (network errors, server errors)
- Navigation from Bloc listener
- Auto-generated IDs with DateTime

---

## Tech Stack

- **Flutter** — Cross-platform mobile framework
- **flutter_bloc** ^8.1.3 — Bloc state management
- **http** ^1.1.0 — REST API calls
- **equatable** ^2.0.5 — State comparison

---

## 📂 Project Structure

```
lib/
├── counter/
│   ├── cubit/counter_cubit.dart
│   └── view/counter_page.dart
├── display_text/
│   ├── cubit/display_text_cubit.dart
│   └── view/display_text_page.dart
├── addition/
│   ├── cubit/addition_cubit.dart
│   └── view/addition_page.dart
├── signup/
│   ├── bloc/
│   │   ├── sign_up_bloc.dart
│   │   ├── sign_up_event.dart
│   │   └── sign_up_state.dart
│   └── view/signup_page.dart
├── to_do/
│   ├── bloc/
│   │   ├── to_do_bloc.dart
│   │   ├── to_do_event.dart
│   │   └── to_do_state.dart
│   ├── model/todo_model.dart
│   └── view/todo_page.dart
└── api_example/
    ├── bloc/
    │   ├── users_bloc.dart
    │   ├── users_event.dart
    │   └── users_state.dart
    ├── model/users_model.dart
    └── view/user_page.dart
```

---

## Getting Started

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/flutter-bloc-practice.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

##  API Used

[JSONPlaceholder](https://jsonplaceholder.typicode.com/) — Free fake REST API for testing.

---

##  Author

**Ashwini Khodake**  
Flutter Developer | 4+ Years Experience  
[LinkedIn](https://www.linkedin.com/in/ashwini-khodake-0b19ab185/)

---

##  Why This Project?

This project was built to **strengthen and demonstrate** practical knowledge of 
Flutter Bloc state management  covering patterns used in real enterprise 
applications like HR management systems.
