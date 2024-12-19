#!/bin/bash

# Update dan install dependencies
dnf update -y
dnf install -y epel-release
dnf install -y certbot

# Menentukan domain dan email
echo "Masukkan domain Anda:"
read DOMAIN
echo "Masukkan email Anda (untuk pemulihan dan pemberitahuan):"
read EMAIL

# Mengambil SSL dari Let's Encrypt
certbot certonly --standalone -d $DOMAIN -m $EMAIL --agree-tos --non-interactive

# Menyalin sertifikat ke OpenLiteSpeed
OPENLITESPEED_DIR="/usr/local/lsws"
SSL_DIR="/etc/letsencrypt/live/$DOMAIN"

# Pastikan direktori ssl ada
mkdir -p $OPENLITESPEED_DIR/ssl

cp $SSL_DIR/fullchain.pem $OPENLITESPEED_DIR/ssl/$DOMAIN.crt
cp $SSL_DIR/privkey.pem $OPENLITESPEED_DIR/ssl/$DOMAIN.key

# Memberikan hak akses yang benar
chown nobody:nobody $OPENLITESPEED_DIR/ssl/$DOMAIN.crt
chown nobody:nobody $OPENLITESPEED_DIR/ssl/$DOMAIN.key
chmod 600 $OPENLITESPEED_DIR/ssl/$DOMAIN.key

# Mengonfigurasi OpenLiteSpeed untuk menggunakan SSL
LSWS_CONF="$OPENLITESPEED_DIR/conf/httpd_config.conf"
sed -i "s|#EnableSSL 0|EnableSSL 1|g" $LSWS_CONF
sed -i "s|#SSLCertificateFile|SSLCertificateFile|g" $LSWS_CONF
sed -i "s|#SSLCertificateKeyFile|SSLCertificateKeyFile|g" $LSWS_CONF

# Restart OpenLiteSpeed untuk menerapkan perubahan
systemctl restart lsws

echo "SSL untuk domain $DOMAIN berhasil diinstal dan OpenLiteSpeed telah di-restart."
