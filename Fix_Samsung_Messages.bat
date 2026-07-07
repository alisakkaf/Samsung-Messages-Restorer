@echo off
:: Copyright (c) 2026 Ali Sakkaf. All rights reserved.
chcp 65001 >nul
title Samsung Messages Restorer - By Ali Sakkaf
mode con: cols=85 lines=32

:: Force enable VT100 / ANSI Escape Codes for smart dynamic coloring inside Windows Registry
reg add "HKCU\Console" /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

:: Define Smart Color Palette explicitly using standard escape characters
set "C_RESET=[0m"
set "C_WHITE=[1;37m"
set "C_CYAN=[1;36m"
set "C_YELLOW=[1;33m"
set "C_GREEN=[1;32m"
set "C_RED=[1;31m"
set "C_GRAY=[90m"

:MAIN_MENU
cls
call :DRAW_HEADER
echo   %C_CYAN%[1]%C_RESET% Read Device Info
echo   %C_CYAN%[2]%C_RESET% Fix Samsung Messages
echo   %C_CYAN%[3]%C_RESET% Exit
echo.
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
set "choice="
set /p choice="Choose an option [1-3]: "

if "%choice%"=="1" goto READ_INFO
if "%choice%"=="2" goto FIX_MESSAGES
if "%choice%"=="3" exit
goto MAIN_MENU

:DRAW_HEADER
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
echo %C_WHITE%   █████╗ ██╗     ██╗    ███████╗ █████╗ ██╗  ██╗██╗  ██╗ █████╗ ███████╗%C_RESET%
echo %C_WHITE%  ██╔══██╗██║     ██║    ██╔════╝██╔══██╗██║ ██╔╝██║ ██╔╝██╔══██╗██╔════╝%C_RESET%
echo %C_WHITE%  ███████║██║     ██║    ███████╗███████║█████╔╝ █████╔╝ ███████║█████╗  %C_RESET%
echo %C_WHITE%  ██╔══██╗██║     ██║    ╚════██║██╔══██╗██╔═██╗ ██╔═██╗ ██╔══██╗██╔══╝  %C_RESET%
echo %C_WHITE%  ██║  ██║███████╗██║    ███████║██║  ██║██║  ██╗██║  ██╗██║  ██║██║     %C_RESET%
echo %C_WHITE%  ╚═╝  ╚═╝╚══════╝╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     %C_RESET%
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
echo      %C_RED%[ Samsung Messages Fixer After July 6 Update ]%C_RESET%  %C_GRAY%-%C_RESET%  Developed By: %C_WHITE%Ali Sakkaf%C_RESET%
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
echo   %C_GRAY%Facebook:   https://www.facebook.com/AliSakkaf.Dev/%C_RESET%
echo   %C_GRAY%Github:     https://github.com/alisakkaf%C_RESET%
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
echo.
goto :eof

:CHECK_CONNECTION
echo %C_YELLOW%[+] Waiting for device connection (Timeout: 10s)...%C_RESET%
set "CONNECTED=0"
for /L %%g in (1,1,10) do (
    adb devices > adb_status.txt
    findstr /i "device$" adb_status.txt >nul
    if %errorlevel% equ 0 (
        set "CONNECTED=1"
        del adb_status.txt >nul 2>&1
        goto :eof
    )
    timeout /t 1 >nul
)
del adb_status.txt >nul 2>&1
goto :eof

:READ_INFO
cls
call :DRAW_HEADER
call :CHECK_CONNECTION

if "%CONNECTED%"=="0" (
    echo.
    echo %C_RED%[ERROR] Connection Timeout! No authorized ADB device found.%C_RESET%
    echo Please ensure USB Debugging is ON and cable is connected properly.
    goto END_ACTION
)

echo %C_GREEN%[+][DONE] Device Connected Successfully.%C_RESET%
echo.
echo %C_WHITE%[ Device Information ]%C_RESET%
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
for /f "tokens=*" %%i in ('adb shell getprop ro.product.model') do set "MODEL=%%i"
for /f "tokens=*" %%i in ('adb shell getprop ro.product.name') do set "NAME=%%i"
for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.release') do set "ANDROID_VER=%%i"
for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.security_patch') do set "SECURITY=%%i"

:: Smart multi-path checking for One UI Version
set "ONEUI_RAW="
set "ONEUI_VER="
for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.oneui') do set "ONEUI_RAW=%%i"
if "%ONEUI_RAW%"=="" if "%ONEUI_RAW%"=="unknown" (
    for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.sep') do set "ONEUI_RAW=%%i"
)

if not "%ONEUI_RAW%"=="" if not "%ONEUI_RAW%"=="unknown" (
    set "v_major=%ONEUI_RAW:~0,1%"
    set "v_minor=%ONEUI_RAW:~2,1%"
    if not "%v_major%"==" " if not "%v_minor%"==" " (
        set "ONEUI_VER=%v_major%.%v_minor%"
    )
)
if "%ONEUI_VER%"=="." set "ONEUI_VER="

echo   Device Model:       %C_YELLOW%%MODEL%%C_RESET%
echo   Device Name:        %C_YELLOW%%NAME%%C_RESET%
echo   Android Version:    %C_YELLOW%%ANDROID_VER%%C_RESET%
if not "%ONEUI_VER%"=="" echo   One UI Version:     %C_YELLOW%%ONEUI_VER%%C_RESET%
echo   Security Patch:     %C_YELLOW%%SECURITY%%C_RESET%
echo.
echo %C_WHITE%[ Samsung Messages Version Info ]%C_RESET%
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%

set "V_LINE_1=" & set "V_LINE_2="
for /f "tokens=2 delims==" %%i in ('adb shell "dumpsys package com.samsung.android.messaging | grep versionName"') do (for /f "tokens=*" %%a in ("%%i") do (if not defined V_LINE_1 (set "V_LINE_1=%%a") else (set "V_LINE_2=%%a")))

setlocal enabledelayedexpansion
if not "!V_LINE_1!"=="" (
    if not "!V_LINE_2!"=="" (
        :: Clean up potential carrige returns (\r) from android shell outputs
        set "V_LINE_1=!V_LINE_1: =!" & set "V_LINE_1=!V_LINE_1:	=!"
        set "V_LINE_2=!V_LINE_2: =!" & set "V_LINE_2=!V_LINE_2:	=!"
        set "FINAL_VERSION_DISPLAY=Update : !V_LINE_1! | Base : !V_LINE_2!"
    ) else (
        set "V_LINE_1=!V_LINE_1: =!" & set "V_LINE_1=!V_LINE_1:	=!"
        set "FINAL_VERSION_DISPLAY=!V_LINE_1!"
    )
)
if "!FINAL_VERSION_DISPLAY!"=="" (
    echo   %C_RED%[!] Samsung Messages is NOT installed or disabled on this device.%C_RESET%
) else (
    echo   Current Active Version: %C_GREEN%!FINAL_VERSION_DISPLAY!%C_RESET%
)
endlocal
:: --- END SMART VERSION CHECKING ---

echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
goto END_ACTION

:FIX_MESSAGES
cls
call :DRAW_HEADER
call :CHECK_CONNECTION

if "%CONNECTED%"=="0" (
    echo.
    echo %C_RED%[ERROR] Connection Timeout! No authorized ADB device found.%C_RESET%
    echo Please ensure USB Debugging is ON and cable is connected properly.
    goto END_ACTION
)

echo %C_GREEN%[+][DONE] Device Connected Successfully.%C_RESET%
echo.
echo %C_WHITE%[ Device Information ]%C_RESET%
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
for /f "tokens=*" %%i in ('adb shell getprop ro.product.model') do set "MODEL=%%i"
for /f "tokens=*" %%i in ('adb shell getprop ro.product.name') do set "NAME=%%i"
for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.release') do set "ANDROID_VER=%%i"
for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.security_patch') do set "SECURITY=%%i"

:: Smart multi-path checking for One UI Version
set "ONEUI_RAW="
set "ONEUI_VER="
for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.oneui') do set "ONEUI_RAW=%%i"
if "%ONEUI_RAW%"=="" if "%ONEUI_RAW%"=="unknown" (
    for /f "tokens=*" %%i in ('adb shell getprop ro.build.version.sep') do set "ONEUI_RAW=%%i"
)

if not "%ONEUI_RAW%"=="" if not "%ONEUI_RAW%"=="unknown" (
    set "v_major=%ONEUI_RAW:~0,1%"
    set "v_minor=%ONEUI_RAW:~2,1%"
    if not "%v_major%"==" " if not "%v_minor%"==" " (
        set "ONEUI_VER=%v_major%.%v_minor%"
    )
)
if "%ONEUI_VER%"=="." set "ONEUI_VER="

echo   Device Model:       %C_YELLOW%%MODEL%%C_RESET%
echo   Device Name:        %C_YELLOW%%NAME%%C_RESET%
echo   Android Version:    %C_YELLOW%%ANDROID_VER%%C_RESET%
if not "%ONEUI_VER%"=="" echo   One UI Version:     %C_YELLOW%%ONEUI_VER%%C_RESET%
echo   Security Patch:     %C_YELLOW%%SECURITY%%C_RESET%

if "%CONNECTED%"=="0" (
    echo.
    echo %C_RED%[ERROR] Connection Timeout! Cannot execute fix without a device connected.%C_RESET%
    goto END_ACTION
)

for /f "tokens=*" %%i in ('adb shell getprop ro.product.model') do set "RAW_MODEL=%%i"
set "CLEAN_MODEL=%RAW_MODEL: =_%"

:: --- START SMART VERSION CHECKING BEFORE FIX ---
set "V_LINE_1=" & set "V_LINE_2="
for /f "tokens=2 delims==" %%i in ('adb shell "dumpsys package com.samsung.android.messaging | grep versionName"') do (for /f "tokens=*" %%a in ("%%i") do (if not defined V_LINE_1 (set "V_LINE_1=%%a") else (set "V_LINE_2=%%a")))

setlocal enabledelayedexpansion
if not "!V_LINE_1!"=="" (
    if not "!V_LINE_2!"=="" (
        :: Clean up potential carrige returns (\r) from android shell outputs
        set "V_LINE_1=!V_LINE_1: =!" & set "V_LINE_1=!V_LINE_1:	=!"
        set "V_LINE_2=!V_LINE_2: =!" & set "V_LINE_2=!V_LINE_2:	=!"
        set "FINAL_VERSION_DISPLAY=Update : !V_LINE_1! | Base : !V_LINE_2!"
    ) else (
        set "V_LINE_1=!V_LINE_1: =!" & set "V_LINE_1=!V_LINE_1:	=!"
        set "FINAL_VERSION_DISPLAY=!V_LINE_1!"
    )
)
if "!FINAL_VERSION_DISPLAY!"=="" (
    echo   %C_RED%[!] Samsung Messages is NOT installed or disabled on this device.%C_RESET%
) else (
    echo   Current Active Version: %C_GREEN%!FINAL_VERSION_DISPLAY!%C_RESET%
)
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%

echo %C_YELLOW%[+] Getting Package installation...%C_RESET%
set "APK_PATH="
for /f "tokens=2 delims=:" %%i in ('adb shell pm path com.samsung.android.messaging') do set "APK_PATH=%%i"

:: Clean hidden carriage returns (\r) and trailing spaces from APK path
if not "%APK_PATH%"=="" for /f "tokens=*" %%a in ("%APK_PATH%") do set "APK_PATH=%%a"
set "APK_PATH=%APK_PATH: =%"

if not "%APK_PATH%"=="" (
    set "BACKUP_DIR=Backup_%CLEAN_MODEL%_v_%CLEAN_VER%"
    :: Strip any remaining system spaces or illegal tokens from folder name
    setlocal enabledelayedexpansion
    set "BACKUP_DIR=!BACKUP_DIR: =_!"
    
    echo %C_YELLOW%[+] Creating backup APK Data : !BACKUP_DIR!...%C_RESET%
    if not exist "!BACKUP_DIR!" mkdir "!BACKUP_DIR!" >nul 2>&1
    
    adb pull "!APK_PATH!" "!BACKUP_DIR!\SamsungMessages.apk" >nul 2>&1
    endlocal
) else (
    echo %C_RED%[!] Warning: Could not locate remote APK path. Skipping backup...%C_RESET%
)

echo %C_YELLOW%[+] Applying system-level package rollback directives...%C_RESET%
adb shell pm disable-user --user 0 com.google.android.apps.messaging >nul 2>&1

adb shell cmd package uninstall-system-updates com.samsung.android.messaging > rollback_status.txt 2>&1
findstr /i "Success" rollback_status.txt >nul

if %errorlevel% neq 0 (
    echo %C_RED%[!] Standard system-update uninstall unsupported. Trying fallback purge...%C_RESET%
    adb shell pm uninstall --user 0 com.samsung.android.messaging >nul 2>&1
    adb shell pm install-existing --user 0 com.samsung.android.messaging >nul 2>&1
)
del rollback_status.txt >nul 2>&1

echo %C_YELLOW%[+] Grant full system permission...%C_RESET%
adb shell pm grant com.samsung.android.messaging android.permission.READ_SMS >nul 2>&1
adb shell pm grant com.samsung.android.messaging android.permission.SEND_SMS >nul 2>&1
adb shell pm grant com.samsung.android.messaging android.permission.RECEIVE_SMS >nul 2>&1
adb shell pm grant com.samsung.android.messaging android.permission.READ_CONTACTS >nul 2>&1
adb shell pm grant com.samsung.android.messaging android.permission.WRITE_CONTACTS >nul 2>&1
adb shell pm grant com.samsung.android.messaging android.permission.READ_PHONE_STATE >nul 2>&1
adb shell pm grant com.samsung.android.messaging android.permission.CAMERA >nul 2>&1
adb shell pm grant com.samsung.android.messaging android.permission.RECORD_AUDIO >nul 2>&1

echo.
echo %C_WHITE%[ OPERATION RESULTS ]%C_RESET%
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
echo   %C_GREEN%[+] Restriction Update Layer Extracted Successfully.%C_RESET%
echo   %C_GREEN%[+] Google Messages App Safely Blocked.%C_RESET%
echo   %C_GREEN%[+] System Permissions Successfully Forced.%C_RESET%
echo.
echo   [-] Previous High Version:    %C_RED%%V_LINE_1%%C_RESET%
echo   [+] Current Restored Version: %C_GREEN%%V_LINE_2%%C_RESET%
echo.
echo   * Notice: If prompted on device, set Samsung Messages as the default client.
echo %C_CYAN%-----------------------------------------------------------------------------------%C_RESET%
endlocal
goto END_ACTION

:END_ACTION
echo.
echo Operation Finished. Press [Enter] to return to Main Menu...
pause >nul
goto MAIN_MENU