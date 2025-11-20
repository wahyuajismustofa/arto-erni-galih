@echo off
setlocal enabledelayedexpansion

set INPUT_DIR=.
set OUTPUT_DIR=webp_output

if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

for %%F in (%INPUT_DIR%\*.jpg %INPUT_DIR%\*.jpeg %INPUT_DIR%\*.png) do (
    set "filename=%%~nF"

    REM === Ganti spasi dengan "-" dan hapus karakter tidak diinginkan ===
    set "cleanname=!filename: =-!"
    set "cleanname=!cleanname:(=!"
    set "cleanname=!cleanname:)=!"

    echo 🔄 Mengonversi: %%~nxF → !cleanname!.webp
    magick "%%F" -auto-orient -quality 85 "%OUTPUT_DIR%\!cleanname!.webp"
)

echo.
echo ✅ Semua gambar telah dikonversi ke "%OUTPUT_DIR%" dengan orientasi benar!
pause
