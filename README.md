# Flutter Clean Architecture Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.19.0-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3.0-blue.svg)](https://dart.dev)

A production-ready Flutter project template implementing Clean Architecture principles, designed for building scalable and maintainable applications.

## 📋 Table of Contents
- [Features](#-features)
- [Architecture](#-architecture)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Dependencies](#-dependencies)
- [State Management](#-state-management)
- [Testing](#-testing)
- [Contributing](#-contributing)
- [License](#-license)

## ✨ Features

### Core Features
- **Clean Architecture Implementation**
  - Clear separation of concerns
  - Domain-driven design
  - Dependency inversion principle
  - Testable architecture

### State Management
- **Bloc Pattern**
  - Predictable state management
  - Easy to test
  - Clear separation of business logic

### UI Components
- **Custom Widgets**
  - Reusable form components
  - Custom list views
  - Responsive layouts
  - Material Design 3 support

### Services
- **API Integration**
  - RESTful API support
  - GraphQL ready
  - Error handling
  - Request interceptors

### Utilities
- **Dependency Injection**
  - GetIt implementation
  - Service locator pattern
  - Easy mocking for testing

### Internationalization
- **Multi-language Support**
  - Easy language switching
  - RTL support
  - Localization utilities

### Theming
- **Dynamic Theme Support**
  - Light/Dark mode
  - Custom theme creation
  - Theme switching

## 🏗 Architecture

The project follows Clean Architecture principles with three main layers:

### Presentation Layer
- UI Components
- Bloc/State Management
- Pages/Screens
- Widgets

### Domain Layer
- Entities
- Use Cases
- Repository Interfaces
- Value Objects

### Data Layer
- Repository Implementations
- Data Sources
- Models
- Network Services

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.19.0 or higher)
- Dart SDK (3.3.0 or higher)
- Android Studio / VS Code
- Git

### Installation
1. Clone the repository:
```bash
git clone https://github.com/arminmehraeen/flutter-clean-architecture.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── error/
│   ├── network/
│   ├── theme/
│   └── utils/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/
```

## 📦 Dependencies

Key dependencies used in this project:

- **State Management**: `flutter_bloc`
- **Dependency Injection**: `get_it`
- **Network**: `dio`
- **Local Storage**: `shared_preferences`
- **Code Generation**: `json_serializable`
- **Testing**: `mockito`, `flutter_test`

## 🧪 Testing

The project includes comprehensive testing setup:

- Unit Tests
- Widget Tests
- Integration Tests
- Mocking utilities

Run tests using:
```bash
flutter test
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support, please open an issue in the GitHub repository or contact the maintainers.

---

Made with ❤️ by the Flutter Clean Architecture Team
