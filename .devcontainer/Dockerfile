# Dockerfile for Flutter development with fish shell
FROM mcr.microsoft.com/devcontainers/base:ubuntu

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


# Install latest stable Flutter SDK
ENV FLUTTER_HOME=/opt/flutter
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME && \
    $FLUTTER_HOME/bin/flutter --version
ENV PATH="$FLUTTER_HOME/bin:$PATH"

# Set fish as default shell
RUN chsh -s /usr/bin/fish devcontainer || true

# Pre-cache Flutter dependencies
RUN flutter precache

# Enable web and desktop support
RUN flutter config --enable-web && flutter config --enable-linux-desktop && flutter config --enable-macos-desktop && flutter config --enable-windows-desktop

# Set working directory
WORKDIR /workspaces/girimote

# Set fish as default shell for all users
RUN echo "/usr/bin/fish" | tee -a /etc/shells && chsh -s /usr/bin/fish

CMD ["fish"]
