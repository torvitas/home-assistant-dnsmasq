#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

bashio::log.info "Starting dnsmasq..."

exec /usr/sbin/dnsmasq $(bashio::config "arguments")
