# Calculator App

A modern, elegant calculator app built with Flutter. This calculator features a clean design with light and dark themes.

## Features

- Basic arithmetic operations (+, -, ×, ÷)
- Percentage calculations
- Clean and modern UI
- Light and dark theme support
- Responsive layout
- Smooth animations
- Clear and delete functionality

## Design

The calculator features a modern design with:

- Gradient backgrounds
- Custom-styled buttons
- Dynamic color themes
- Responsive text sizing
- Clean typography using Poppins font

## Theme Support

The app includes two beautiful themes:

### Light Theme

- Clean white background
- Blue accent colors
- High contrast for better readability
- Soft shadows and elegant button designs

### Dark Theme

- Dark background
- Blue accent highlights
- Comfortable contrast for low-light usage
- Modern button styling

## Getting Started

1. Ensure you have Flutter installed on your machine
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5  # State management
  cupertino_icons: ^1.0.2
```

## File Structure

```
lib/
├── constants/
│   └── numbers_inputs.dart
├── controllers/
│   └── calculator_controller.dart
├── views/
│   └── calculator_view.dart
├── widgets/
│   ├── delete_button.dart
│   ├── equal_button.dart
│   ├── mince_button.dart
│   ├── numbers.dart
│   ├── plus_button.dart
│   ├── signs_button.dart
│   └── zero_button.dart
└── main.dart
```

## Contributing

Feel free to contribute to this project by submitting issues or pull requests.
