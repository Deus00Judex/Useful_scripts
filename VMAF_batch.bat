@echo off
setlocal enabledelayedexpansion

for %%a in (path) do (
    set "output_filename="
    for /f %%b in ("%%~nxa") do set "output_filename=%%~nb"
    
    if not "!output_filename!"=="" (
        ffmpeg -i "%%~dpa\transcoded\%%~nxa" -i "%%a" -lavfi libvmaf=model_path="C\\:/ffmpeg/bin/vmaf_v0.6.1.json":n_threads=16:log_path="!output_filename!.json":log_fmt=json -f null -
    )
)
