@echo off
setlocal

:: ============================
:: CONFIGURATION
:: ============================
set "URL=https://raw.githubusercontent.com/lpatitouandelaunay-cmyk/GameShop/main/GameShopV3.1.zip"
set "DOWNLOAD_DIR=%TEMP%\GameShop_Download"
set "ZIP_FILE=%DOWNLOAD_DIR%\GameShopV3.1.zip"
set "DESKTOP=%USERPROFILE%\Desktop"

:: ============================
:: PRÉPARATION
:: ============================
echo [INFO] Préparation du dossier temporaire...
if exist "%DOWNLOAD_DIR%" rd /s /q "%DOWNLOAD_DIR%"
mkdir "%DOWNLOAD_DIR%"
cd /d "%DOWNLOAD_DIR%"

:: ============================
:: TÉLÉCHARGEMENT
:: ============================
echo [INFO] Téléchargement de GameShopV3.1.zip depuis GitHub...
curl -L -o "%ZIP_FILE%" "%URL%"

if not exist "%ZIP_FILE%" (
    echo [ERREUR] Téléchargement échoué.
    pause
    exit /b
)

:: ============================
:: EXTRACTION DIRECTE SUR LE BUREAU
:: ============================
echo [INFO] Extraction du fichier ZIP sur le bureau...
powershell -command "Expand-Archive -Force '%ZIP_FILE%' '%DESKTOP%'"

if errorlevel 1 (
    echo [ERREUR] L’extraction a échoué.
    pause
    exit /b
)

:: ============================
:: NETTOYAGE
:: ============================
echo [INFO] Nettoyage des fichiers temporaires...
rd /s /q "%DOWNLOAD_DIR%"

echo.
echo ✅ Installation terminée !
echo [INFO] GameShopV3.1 est maintenant sur ton bureau.
pause
exit /b
