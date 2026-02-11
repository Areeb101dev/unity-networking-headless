FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# Basic runtime deps Unity server typically needs
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    libglib2.0-0 \
    libstdc++6 \
    libgcc-s1 \
    zlib1g \
    libcurl4 \
    libssl3 \
    libicu70 \
    libatomic1 \
    && rm -rf /var/lib/apt/lists/*

# Copy your already-built server into the image
COPY server_build/ /app/

RUN chmod +x /app/*.x86_64 || true

EXPOSE 7777/tcp

# IMPORTANT: replace with your actual executable name
CMD ["/bin/bash","-lc","exec /app/MyGameServer.x86_64 -batchmode -nographics"]
