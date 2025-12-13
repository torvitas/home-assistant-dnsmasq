#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

mkdir -p /etc/dnsmasq.d
echo $(bashio::config "config") >/etc/dnsmasq.d/pxe.conf

bashio::log.info "Starting dnsmasq..."

exec /usr/sbin/dnsmasq $(bashio::config "arguments")
