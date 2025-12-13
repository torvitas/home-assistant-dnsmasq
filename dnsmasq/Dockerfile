ARG IPXE_IMAGE

FROM ubuntu:22.04 AS build

RUN apt-get update && apt-get install -y zip

WORKDIR /rpi-uefi

ADD https://github.com/pftf/RPi4/releases/download/v1.50/RPi4_UEFI_Firmware_v1.50.zip dist.zip
RUN unzip dist.zip && \
    rm dist.zip

FROM ${IPXE_IMAGE} as ipxe

FROM quay.io/poseidon/dnsmasq:v0.5.0 AS dnsmasq

FROM ghcr.io/hassio-addons/base:19.0.0
RUN apk --no-cache add dnsmasq curl
COPY --from=dnsmasq /var/lib/tftpboot/ /var/lib/tftpboot/
COPY --from=ipxe /ipxe/src/bin-arm64-efi/ipxe.efi /var/lib/tftpboot/snp.efi
COPY --from=build /rpi-uefi/ /var/lib/tftpboot/
COPY /data /
RUN chmod +x /run.sh
EXPOSE 53 67 69
CMD ["/run.sh"]
