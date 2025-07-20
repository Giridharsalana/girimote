# Dockerfile for Flutter + Fish shell in devcontainers
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# 🧰 Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    unzip \
    xz-utils \
    libglu1-mesa \
    fish \
    build-essential \
    openssh-client \
    ca-certificates \
    fonts-droid-fallback \
    nala \
    && apt-get clean

# 🐦 Install latest stable Flutter
ENV FLUTTER_HOME=/opt/flutter
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"

# ✅ Prevent tar errors from UID mismatch
ENV TAR_OPTIONS=--no-same-owner

# 📦 Flutter pre-cache and enable desktop/web support
RUN flutter precache && \
    flutter config --enable-web && \
    flutter config --enable-linux-desktop && \
    flutter config --enable-macos-desktop && \
    flutter config --enable-windows-desktop

# 🐟 Add Fish shell to valid shells
RUN echo /usr/bin/fish >> /etc/shells

# ✅ Set Fish shell for devcontainer user
# WARNING: chsh doesn't work in containers, so we'll use CMD
# and override via VS Code devcontainer.json
CMD ["/usr/bin/fish"]

# 📂 Workspace location
WORKDIR /workspaces/girimote
