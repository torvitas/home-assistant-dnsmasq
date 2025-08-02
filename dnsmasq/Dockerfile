FROM quay.io/poseidon/dnsmasq:v0.5.0 AS dnsmasq

FROM ghcr.io/hassio-addons/base:18.0.3
RUN apk --no-cache add dnsmasq curl
COPY --from=dnsmasq /var/lib/tftpboot /var/lib/tftpboot
COPY /data /
RUN chmod +x /run.sh
EXPOSE 53 67 69
CMD ["/run.sh"]
