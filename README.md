# aletha_health_task

A new Flutter project.

## Getting Started

Aletha Health Exercise App
Overview
Aletha Health’s mission is to improve physical wellbeing by offering simple, effective solutions to alleviate pain and tightness.
This Flutter mobile app provides a convenient way for users to stay fit by browsing exercises, viewing details, and timing workouts.

Features
Fetches exercises from a REST API.

Displays exercise name and duration on the home screen.

Detailed exercise page with description, duration, and difficulty.

Start button to launch a timer counting down the exercise duration.

Marks exercises as completed locally after finishing.

Built using Clean Architecture for maintainability.

Uses Bloc for state management.

Error handling with user-friendly UI feedback.

Responsive and clean UI.

(Optional) Progress tracker for continuous exercise days.

Architecture
Core Layer
Constants, network clients (Retrofit & Dio), and utilities.

Features/HomeScreen

Data: Models, data sources, repositories

Domain: Entities, repository interfaces, use cases

Presentation: Bloc/Cubit, UI pages, and widgets

Getting Started
Prerequisites
Flutter SDK (latest stable recommended)

Dart

Android Studio

Installation
Clone the repo


git clone [https://github.com/mummoorthi/aletha_exercise_app]
cd aletha_exercise_app
Install dependencies


flutter pub get
Generate code (Retrofit & JsonSerializable)


flutter pub run build_runner build --delete-conflicting-outputs
Run the app


flutter run
API Endpoint
Fetch exercises from:
GET https://68252ec20f0188d7e72c394f.mockapi.io/dev/workouts

State Management
This app uses Bloc pattern to handle loading, success, and error states during data fetch and UI interactions.

Folder Structure
lib/
├── core/
│    ├── constants/
│    ├── network/
│    └── utils/
├── features/
│    └── home_screen/
│         ├── data/
│         ├── domain/
│         └── presentation/
└── main.dart
Future Improvements
Add persistent storage for completed exercises (e.g., SharedPreferences or SQLite).

Implement progress tracker and streak count.

Enhance UI with custom animations and Figma-based design.

Add localization support.



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
