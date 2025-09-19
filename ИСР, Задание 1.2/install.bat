@echo off
chcp 65001 >nul
echo.

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ОШИБКА: Требуются права администратора!
    pause
    exit /b 1
)

:: Установка Chocolatey
where choco >nul 2>&1
if errorlevel 1 (
    echo Установка Chocolatey...
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    if errorlevel 1 (
        echo Ошибка установки Chocolatey!
        pause
        exit /b 1
    )
) else (
    echo Chocolatey уже установлен
)

echo.
echo Установка ПО...
choco install vscode -y  || echo Ошибка установки vscode
choco install docker-desktop -y  || echo Ошибка установки docker-desktop
choco install pycharm-community -y  || echo Ошибка установки pycharm-community
choco install git -y  || echo Ошибка установки git
choco install github-desktop -y  || echo Ошибка установки github-desktop
choco install python -y  || echo Ошибка установки python
choco install rust -y  || echo Ошибка установки rust
choco install 7zip -y  || echo Ошибка установки 7zip
choco install googlechrome -y  || echo Ошибка установки googlechrome
choco install firefox -y  || echo Ошибка установки firefox
choco install wsl2 -y  || echo Ошибка установки wsl2
choco install julia -y  || echo Ошибка установки julia
choco install maxima -y  || echo Ошибка установки maxima
choco install gimp -y  || echo Ошибка установки gimp
choco install miktex -y  || echo Ошибка установки miktex
choco install texstudio -y  || echo Ошибка установки texstudio
choco install anaconda3 -y  || echo Ошибка установки anaconda3
choco install sumatrapdf -y  || echo Ошибка установки sumatrapdf
choco install flameshot -y  || echo Ошибка установки flameshot

echo.
echo Установка расширений VSCode...
powershell -Command "code --install-extension ms-python.python" || echo Ошибка установки расширения Python
powershell -Command "code --install-extension rust-lang.rust-analyzer" || echo Ошибка установки расширения Rust
powershell -Command "code --install-extension julialang.language-julia" || echo Ошибка установки расширения Julia

echo.
echo Установка WSL...
wsl --install --no-distribution || echo Ошибка установки WSL
wsl --install -d Ubuntu-22.04 || echo Ошибка установки Ubuntu 22.04
wsl --install -d Ubuntu-24.04 || echo Ошибка установки Ubuntu 24.04

echo.
echo Установка завершена успешно!
echo.
pause