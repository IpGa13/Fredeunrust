@echo off
cd /d C:\rust
steamcmd +force_install_dir C:\rust +login anonymous +app_update 258550 -validate +quit
set "URL=https://umod.org/games/rust/download?tag=public"
set "OUTPUT_FILE=C:\rust\oxide.zip"
curl -L %URL% -o %OUTPUT_FILE%
if %ERRORLEVEL% neq 0 (
    echo Download failed.
    exit /b %ERRORLEVEL%
)
powershell -Command "Expand-Archive -Path '%OUTPUT_FILE%' -DestinationPath 'C:\rust' -Force"
if %ERRORLEVEL% neq 0 (
    echo Extraction failed.
    exit /b %ERRORLEVEL%
)
del %OUTPUT_FILE%
echo Done.
pause
