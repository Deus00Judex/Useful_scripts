@echo off

set MAGICK_MEMORY_LIMIT=35GB
set MAGICK_MAP_LIMIT=35GB
set MAGICK_THREAD_LIMIT=20

for /r %%i in (*.png *.jpg *.jpeg *.gif *.bmp) do (
    magick convert "%%i" -define avif:lossless=true -quality 100 "%%~dpi\%%~ni.avif"
    if errorlevel 0 (
        del "%%i"
    ) else (
        echo Conversion failed for: "%%i"
    )
)
