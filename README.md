# Fitness & Nutrition Tracker App

A complete Flutter-based mobile application that helps users manage their daily workouts, diet, water intake, and calorie tracking, all tailored to their personal fitness goals like weight loss or muscle gain.

## Features

- Goal-Based Workout Plans  
  Users can choose between goals (e.g., gain/lose weight), each containing plans targeting specific body muscles.

- Personalized Meal Plans  
  Each workout day is paired with meals created by a certified trainer, tailored to the exercises for the day.

- Water & Food Intake Tracking  
  Keep track of daily hydration and calories gained/lost.

- Calorie Statistics Dashboard  
  Visual representation of calories burned vs. consumed.

- Profile Management  
  Users can manage personal data and set rest days to align with their schedule.

## Tech Stack

### Frontend (Flutter)

- Localization — Multi-language support.
- GoRouter — Efficient route management.
- GitIt — Dependency injection with support for Singleton & Single Responsibility Principle (SRP).
- Provider/Bloc (if applicable) — State management.

### Backend (Laravel)

- RESTful API for all workout, diet, and user operations.
- Seeders for quick database population.
- Authentication, trainer access, and dynamic meal/workout generation.

## Getting Started

### Flutter (Frontend)

```bash
git clone https://github.com/lendalolo/fitlife-flutter-version.git
cd fitlife-flutter-version
flutter pub get
flutter run
git clone https://github.com/boshraKurdi/laravelFitlife.git
cd laravelFitlife
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan serve
