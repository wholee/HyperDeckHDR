FROM ghcr.io/steamdeckhomebrew/holo-base:latest AS builder

# Build dependencies
RUN pacman -Syy --noconfirm \
    alsa-lib base-devel bash binutils chrpath cmake dpkg fakeroot \
    flatbuffers freetds git gtk3 libayatana-appindicator \
    libfbclient libftdi libglvnd libjpeg-turbo libx11 \
    mariadb-libs mesa openssl pipewire pkgfile \
    postgresql-libs python qt6-base qt6-serialport \
    sdbus-cpp systemd-libs unzip wayland wget xz chrpath

WORKDIR /workspace/src

# HyperHDR with submodules
RUN git clone --recursive https://github.com/awawa-dev/HyperHDR.git hyperhdr

WORKDIR /workspace/src/hyperhdr
RUN mkdir build

# Build
WORKDIR /workspace/src/hyperhdr/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make -j$(nproc)

RUN mkdir -p /workspace/out \
    && cp -r bin /workspace/out/ \
    && cp -r ../resources /workspace/out/resources


FROM ghcr.io/steamdeckhomebrew/holo-base:latest

WORKDIR /backend

# Copy files
COPY --from=builder /workspace/out /workspace/out

COPY entrypoint.sh /backend/entrypoint.sh
RUN chmod +x /backend/entrypoint.sh

ENTRYPOINT [ "/backend/entrypoint.sh" ]