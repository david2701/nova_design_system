<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Nova Design System

A comprehensive Flutter design system that provides a consistent, accessible, and customizable UI component library for building beautiful applications.

## Overview

Nova Design System was created to provide developers with a robust, flexible, and easy-to-use component library that follows Material Design principles while offering additional customization options. It aims to streamline the development process by providing pre-built, well-tested components that maintain consistency across applications.

## Features

### Core Components
- **Basic Components**: Buttons, Avatars, Badges, Chips, Dividers, FABs, Icon Buttons, Progress Indicators, Sliders, Switches, and Tooltips
- **Form Components**: Text Fields, Checkboxes, Date Pickers, Dropdowns, File Pickers, Multiline Inputs, OTP Inputs, Password Fields, Radio Buttons, and Search Bars
- **Layout Components**: Containers, Gaps, Padding, Responsive Builders, Responsive Grids, Stacks, and Wraps
- **Navigation Components**: App Bars, Bottom Navigation Bars, Breadcrumbs, Navigation Drawers, Navigation Rails, Pagination, Segmented Buttons, Tab Bars, and Tab Views
- **Overlay Components**: Alert Dialogs, Bottom Sheets, and Snackbars

### Advanced Features
- **Animations**: Advanced animations, animated containers, list animations, hero animations, and page transitions
- **Responsive Design**: Built-in support for responsive layouts with customizable breakpoints
- **Theme Support**: Comprehensive theming system with light and dark mode support
- **Accessibility**: WCAG 2.1 compliant components with proper semantics and ARIA attributes

### Utilities
- **Connectivity Checker**: Monitor network connectivity status
- **App Version Checker**: Check for app updates and version information
- **Error Handler**: Centralized error handling and reporting
- **Local Storage**: Persistent storage utilities
- **Navigation Helpers**: Simplified navigation methods
- **Localization Helpers**: Internationalization support
- **Image Compression**: Image optimization utilities

## Getting Started

Add Nova Design System to your `pubspec.yaml`:

```yaml
dependencies:
  nova_design_system: ^1.0.0
```

Import the package in your Dart code:

```dart
import 'package:nova_design_system/nova_design_system.dart';
```

## Usage

### Basic Component Example

```dart
NovaButton(
  onPressed: () {},
  variant: NovaButtonVariant.primary,
  size: NovaButtonSize.medium,
  child: const Text('Click Me'),
)
```

### Form Component Example

```dart
NovaTextField(
  label: 'Username',
  hint: 'Enter your username',
  prefixIcon: Icons.person,
  onChanged: (value) {
    // Handle input changes
  },
)
```

### Layout Component Example

```dart
NovaResponsiveGrid(
  columns: 12,
  children: [
    NovaContainer(
      width: 6,
      child: Text('Left Column'),
    ),
    NovaContainer(
      width: 6,
      child: Text('Right Column'),
    ),
  ],
)
```

## Documentation

For detailed documentation, visit our [documentation site](https://docs.novadesignsystem.com) or check the `/docs` directory in this repository.

### Key Documentation Sections
- Component API Reference
- Theming Guide
- Responsive Design Guide
- Animation Guide
- Utility Functions Guide
- Best Practices
- Migration Guide

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- [GitHub Issues](https://github.com/david2701/nova_design_system/issues)
