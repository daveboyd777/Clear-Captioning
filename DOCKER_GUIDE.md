# Docker Development Guide for Clear-Captioning Flutter App

This project includes Docker configuration for consistent Flutter development across different environments.

## Prerequisites

- Docker Desktop installed and running
- VS Code with Dev Containers extension
- Git

## Getting Started

### Option 1: Using VS Code Dev Containers (Recommended)

1. Open this project in VS Code
2. Install the "Dev Containers" extension if not already installed
3. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac) and select "Dev Containers: Reopen in Container"
4. VS Code will build the container and open the project inside it
5. Once inside the container, initialize the Flutter project:
   ```bash
   chmod +x scripts/init-flutter.sh
   ./scripts/init-flutter.sh
   ```

### Option 2: Using Docker Compose

1. Build and start the container:
   ```bash
   docker-compose up -d
   ```

2. Access the container:
   ```bash
   docker-compose exec flutter-dev bash
   ```

3. Initialize the Flutter project:
   ```bash
   chmod +x scripts/init-flutter.sh
   ./scripts/init-flutter.sh
   ```

## Development Commands

### Inside the Container

```bash
# Create a new Flutter project (if not already done)
flutter create --org com.clearcaptioning --project-name clear_captioning .

# Get dependencies
flutter pub get

# Run on web (accessible at http://localhost:3000)
flutter run -d web-server --web-port 3000 --web-hostname 0.0.0.0

# Run tests
flutter test

# Check Flutter installation
flutter doctor

# Build for web
flutter build web

# Analyze code
flutter analyze
```

## Project Structure

After initialization, your project will have:

```
Clear-Captioning/
├── .devcontainer/
│   └── devcontainer.json          # VS Code dev container config
├── scripts/
│   └── init-flutter.sh            # Flutter initialization script
├── lib/
│   └── main.dart                  # Main Flutter app file
├── web/
│   └── index.html                 # Web entry point
├── test/
│   └── widget_test.dart           # Test files
├── pubspec.yaml                   # Flutter dependencies
├── Dockerfile                     # Docker image definition
├── docker-compose.yml             # Docker services configuration
└── README.md                      # This file
```

## Development Workflow

1. **Start Development**: Use VS Code Dev Containers or Docker Compose
2. **Edit Code**: Make changes to files in `lib/` directory
3. **Hot Reload**: Flutter supports hot reload for rapid development
4. **Test**: Run `flutter test` to ensure your changes work
5. **Build**: Use `flutter build web` for production builds

## Ports

- **3000**: Flutter web development server
- **8080**: Flutter debugging server
- **9999**: Observatory/DevTools

## Troubleshooting

### Common Issues

1. **Container won't start**: Ensure Docker Desktop is running
2. **Flutter doctor shows issues**: This is normal in a container environment
3. **Permission issues**: The container runs as user `flutter` to avoid permission problems
4. **Hot reload not working**: Ensure you're running with the correct flags for web development

### Useful Commands

```bash
# Restart the container
docker-compose restart flutter-dev

# View container logs
docker-compose logs flutter-dev

# Clean Flutter build
flutter clean && flutter pub get

# Update Flutter
flutter upgrade
```

## Next Steps

1. Initialize your Flutter project using the provided script
2. Start developing your real-time speech-to-text captioning features
3. Consider adding speech recognition packages like `speech_to_text`
4. Implement the reading mode UI as mentioned in your project description

For speech-to-text functionality, you might want to add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  speech_to_text: ^6.3.0
  permission_handler: ^10.4.3
```
