# Flutter Docker Development Environment
FROM ubuntu:22.04

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Set up environment variables
ENV FLUTTER_VERSION=3.19.6
ENV FLUTTER_ROOT=/opt/flutter
ENV PATH=$FLUTTER_ROOT/bin:$PATH
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=$ANDROID_HOME
ENV PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-17-jdk \
    wget \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    libstdc++-12-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_ROOT
RUN flutter doctor

# Create a non-root user for development
RUN useradd -m -s /bin/bash flutter
RUN chown -R flutter:flutter $FLUTTER_ROOT

# Set the working directory
WORKDIR /app

# Switch to the flutter user
USER flutter

# Pre-download Dart dependencies (this will be cached)
RUN flutter doctor
RUN flutter precache

# Expose common Flutter ports
EXPOSE 3000 8080 9999

# Default command
CMD ["bash"]
