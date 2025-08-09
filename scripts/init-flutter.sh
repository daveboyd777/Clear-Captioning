#!/bin/bash

# Initialize Flutter project script
echo "🚀 Initializing Flutter project for Clear-Captioning..."

# Check if this is already a Flutter project
if [ ! -f "pubspec.yaml" ]; then
    echo "📱 Creating new Flutter project..."
    flutter create --org com.clearcaptioning --project-name clear_captioning .
    
    echo "✅ Flutter project created successfully!"
else
    echo "📱 Flutter project already exists, getting dependencies..."
    flutter pub get
fi

# Run Flutter doctor to check setup
echo "🔍 Running Flutter doctor..."
flutter doctor

# Check for web support
echo "🌐 Enabling web support..."
flutter config --enable-web

echo "🎉 Setup complete! You can now:"
echo "  - Run 'flutter run -d web-server --web-port 3000' for web development"
echo "  - Run 'flutter run' for mobile development (if emulator is available)"
echo "  - Run 'flutter test' to run tests"
echo ""
echo "📝 The app will be available at http://localhost:3000 when running on web"
