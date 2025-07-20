# 🐧 Start from Gitpod's base image
FROM gitpod/workspace-full

# 🧑‍🔧 Switch to root to install system packages
USER root

# 🧰 Install required packages
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
    libgtk-3-dev \
    mesa-utils \
    libgl1-mesa-dev \
    gnupg2 \
    apt-transport-https \
    openjdk-17-jdk \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 🧭 Add Chrome repo and install Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 🐟 Add Fish shell to valid shells
RUN echo /usr/bin/fish >> /etc/shells

# 👤 Switch back to gitpod user
USER gitpod

# 🐦 Install Flutter under gitpod's home directory
ENV FLUTTER_HOME=/home/gitpod/flutter
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME

# 🛣 Add Flutter and Java to PATH
RUN rm -rf /home/gitpod/.sdkman/candidates/java
ENV PATH="${FLUTTER_HOME}/bin:/usr/lib/jvm/java-17-openjdk-amd64/bin:${PATH}"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# ✅ Prevent tar permission issues
ENV TAR_OPTIONS=--no-same-owner

# 🚀 Setup Flutter toolchain
RUN flutter precache && \
    flutter config --enable-web && \
    flutter config --enable-linux-desktop && \
    flutter config --enable-windows-desktop

# 🔧 Android SDK setup
ENV ANDROID_HOME=/home/gitpod/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator

RUN mkdir -p $ANDROID_HOME/cmdline-tools && \
    curl -Lo sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip sdk.zip -d $ANDROID_HOME/cmdline-tools && \
    mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest && \
    rm sdk.zip && \
    yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# ✅ Accept Flutter doctor licenses
RUN yes | flutter doctor --android-licenses

# 📂 Set workspace directory
WORKDIR /workspaces/girimote

# 🐚 Set default shell to Fish
CMD ["/usr/bin/fish"]
