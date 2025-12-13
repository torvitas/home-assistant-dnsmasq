FROM ubuntu:22.04

ENV IPXE_SHA=de8a0821c7bc737e724fa3dfb6d89dc36f591d7a

RUN apt-get update && apt-get install -y \
        build-essential \
        gcc-aarch64-linux-gnu \
        gcc-x86-64-linux-gnu

WORKDIR /ipxe


# Download iPXE source code
ADD --unpack=true https://github.com/ipxe/ipxe/archive/$IPXE_SHA.tar.gz /ipxe
RUN mv ipxe-$IPXE_SHA/* .

COPY https.patch /ipxe/https.patch
RUN patch -p1 < https.patch

COPY boot.ipxe /ipxe/boot.ipxe

# Build iPXE for arm64
RUN make -j $(nproc --all) -C src \
        CROSS=aarch64-linux-gnu- \
        bin-arm64-efi/ipxe.efi \
        EMBED=../boot.ipxe \
        VERSION=iPXE-${IPXE_SHA}
