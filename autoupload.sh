#!/bin/bash

# Fungsi untuk menampilkan logo ASCII
show_logo() {
    echo """
 █████╗ ██╗   ██╗████████╗ ██████╗    ██╗   ██╗██████╗ ██╗      ██████╗  █████╗ ██████╗ 
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗   ██║   ██║██╔══██╗██║     ██╔═══██╗██╔══██╗██╔══██╗
███████║██║   ██║   ██║   ██║   ██║   ██║   ██║██████╔╝██║     ██║   ██║███████║██║  ██║
██╔══██║██║   ██║   ██║   ██║   ██║   ██║   ██║██╔═══╝ ██║     ██║   ██║██╔══██║██║  ██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝▄█╗╚██████╔╝██║     ███████╗╚██████╔╝██║  ██║██████╔╝
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝ ╚═════╝ ╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ 
                                                    
 By Hexon/Gabutc (H).                                
"""
}

# Fungsi untuk mengatur delay dengan animasi loading
delay_with_loading() {
    duration=$1
    echo -n "Proses..."
    for ((i=0; i<$duration; i++)); do
        echo -n "."
        sleep 1
    done
    echo ""
}

# Menampilkan logo ASCII
show_logo

# Meminta nama pengguna
echo "Masukkan nama akun Github kamu sepuh:"
read user_name

# Konfirmasi nama pengguna
echo "Nama kamu: $user_name. Konfirmasi? (y/n)"
read confirm
while [ "$confirm" != "y" ]; do
    echo "Masukkan akun Github nama kamu sepuh:"
    read user_name
    echo "Nama kamu: $user_name. Konfirmasi? (y/n)"
    read confirm
done

# Mengatur git config untuk nama pengguna
git config --global user.name "$user_name"

# Meminta email pengguna
echo "Masukkan email akun Github kamu sepuh:"
read user_email

# Konfirmasi email pengguna
echo "Email kamu: $user_email. Konfirmasi? (y/n)"
read confirm
while [ "$confirm" != "y" ]; do
    echo "Masukkan email akun Github kamu sepuh:"
    read user_email
    echo "Email kamu: $user_email. Konfirmasi? (y/n)"
    read confirm
done

# Mengatur git config untuk email pengguna
git config --global user.email "$user_email"

# Meminta path untuk inisialisasi git
echo "contoh 1;(/storage/emulated/0/nama_direktori)"
echo "contoh 2; (/sdcard/nama_direktori)"
echo "Masukkan direktori penyimpanan proyek kamu:"
read project_path

# Delay 2 detik
delay_with_loading 2

# Menambahkan path ke safe.directory
git config --global --add safe.directory "$project_path"

# Masuk ke direktori proyek
cd "$project_path"

# Inisialisasi git
git init

# Menambahkan semua file ke staging area
git add .

# Meminta pesan commit
echo "Masukkan pesan commit Anda:"
read commit_message

# Membuat commit
git commit -m "$commit_message"

# Meminta URL repository
echo "Masukkan URL repository kamu:"
read repo_url

# Konfirmasi URL repository
echo "URL repo kamu: $repo_url. Konfirmasi? (y/n)"
read confirm
while [ "$confirm" != "y" ]; do
    echo "Masukkan URL repository kamu:"
    read repo_url
    echo "URL repo kamu: $repo_url. Konfirmasi? (y/n)"
    read confirm
done

# Menambahkan remote origin
git remote add origin "$repo_url"

# Push ke branch master
git push -u origin master

echo "Proses git selesai."
