Berikut adalah file README.md yang lengkap dan siap untuk Anda salin ke repositori GitHub:

# AutoSSL

AutoSSL adalah script untuk menginstal sertifikat SSL otomatis di VPS menggunakan Let's Encrypt untuk server yang menjalankan OpenLiteSpeed. Script ini dirancang untuk memudahkan pengguna dalam mengonfigurasi SSL tanpa perlu mengonfigurasi manual.

## Cara Penggunaan di AlmaLinux 8

Ikuti langkah-langkah berikut untuk menginstal SSL di VPS Anda yang menjalankan OpenLiteSpeed di AlmaLinux 8:

### Langkah 1: Stop Layanan OpenLiteSpeed

Sebelum memulai, pastikan untuk menghentikan layanan OpenLiteSpeed dengan perintah berikut:

```bash
service lsws stop

Langkah 2: Unduh Script

Unduh script almalinux.sh dari repositori GitHub:

wget https://raw.githubusercontent.com/serverutama/autossl/refs/heads/main/almalinux.sh

Langkah 3: Berikan Izin Eksekusi pada Script

Setelah mengunduh, berikan izin eksekusi pada script:

chmod +x almalinux.sh

Langkah 4: Jalankan Script

Sekarang, jalankan script untuk menginstal sertifikat SSL:

./almalinux.sh

Langkah 5: Masukkan Domain dan Email

Script akan meminta Anda untuk memasukkan domain dan email. Pastikan domain yang Anda masukkan sudah diarahkan ke server VPS Anda.

Masukkan domain Anda:
promo.jasahoster.com
Masukkan email Anda (untuk pemulihan dan pemberitahuan):
info@galih.us

Langkah 6: Proses Instalasi SSL

Setelah memasukkan domain dan email, script akan menghubungi Let’s Encrypt untuk mendapatkan sertifikat SSL. Jika sertifikat berhasil diambil, script akan mengonfigurasi OpenLiteSpeed untuk menggunakan SSL dan melakukan restart.

Contoh Output

Saving debug log to /var/log/letsencrypt/letsencrypt.log
Certificate not yet due for renewal

SSL untuk domain promo.jasahoster.com berhasil diinstal dan OpenLiteSpeed telah di-restart.

Catatan
	•	Pastikan domain Anda sudah mengarah ke server Anda sebelum menjalankan script.
	•	Script ini menginstal certbot dan mengonfigurasi OpenLiteSpeed untuk menggunakan sertifikat SSL yang diterbitkan oleh Let’s Encrypt.
	•	Sertifikat SSL akan diperbarui otomatis oleh certbot setiap 60 hari.

Kontribusi

Jika Anda ingin berkontribusi pada proyek ini, silakan buat pull request atau buka issue jika ada masalah yang ditemukan.

Lisensi

Proyek ini dilisensikan di bawah lisensi MIT - lihat file LICENSE untuk detail lebih lanjut.

### Penjelasan:

- **Instalasi dan Penggunaan**: Langkah-langkah jelas tentang cara menggunakan script di AlmaLinux 8.
- **Contoh Output**: Menampilkan hasil yang diharapkan setelah menjalankan script.
- **Kontribusi dan Lisensi**: Memberikan informasi mengenai kontribusi dan lisensi proyek.

Salin dan tempelkan file ini ke repositori GitHub Anda. Semoga bermanfaat!
