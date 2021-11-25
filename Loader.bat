@ECHO off


SETLOCAL

SET "HOSTS_FILE=%WinDir%\System32\drivers\etc\hosts"

SET "TEMP_HOSTS_FILE=%TEMP%\%RANDOM%__hosts"

GOTO intro

:intro

    ECHO [96m _ __ ___   __ ___   _____ _ __ _   _   ___ ___[96m
	ECHO ^| '_ ` _ \ / _` \ \ / / _ \ '__^| ^| ^| ^| / __/ __^|
	ECHO ^| ^| ^| ^| ^| ^| (_^| ^|\ V /  __/ ^|  ^| ^|_^| ^|^| (_^| (__ 
	ECHO ^|_^| ^|_^| ^|_^|\__,_^| \_/ \___^|_^|   \__, (_)___\___^|
	ECHO                                  __/ ^|          
	ECHO                                 ^|___/           
    
    GOTO permissions
:options
    
    ECHO [96m^>^> [37mType one of the following:[0m
	ECHO [30m.[0m
    ECHO [[96m1[0m] [96mInstall (Install Mavery on this computer)[0m
    ECHO [[96m2[0m] [96mUnInstall (Remove Mavery from the computer)[0m
    ECHO [[96m3[0m] [96mExit (Close this application)[0m
    ECHO [30m.[0m
    SET /p choice=[96m^>^> [37mType the number representing an option:[96m

    if '%choice%'=='' (
        ECHO "%choice%" is not valid please try again
        GOTO options
    )
    if '%choice%'=='1' GOTO install
    if '%choice%'=='2' GOTO uninstall
    if '%choice%'=='3' EXIT

:permissions
   
    REG ADD HKLM /F>nul 2>&1
    if %ERRORLEVEL% == 0 (
        
        GOTO options
    ) else (
        
        ECHO [31m---------------------------------------------------------[31m
        ECHO NO ADMIN PERMISSIONS
        ECHO ---------------------------------------------------------
        ECHO You did not run this with Admin permissions please run 
        ECHO it again but with Admin permission. To do so right click
        ECHO [31mthis file and click "Run as administrator"[0m
        
        PAUSE
        EXIT
    )

:install
    
    FINDSTR /V "185.229.236.109 s.optifine.net" "%HOSTS_FILE%" > "%TEMP_HOSTS_FILE%"
    
    ECHO 185.229.236.109 s.optifine.net >> "%TEMP_HOSTS_FILE%"
    
    COPY /b/v/y "%TEMP_HOSTS_FILE%" "%HOSTS_FILE%"
    ECHO Install Complete
    
    PAUSE
    EXIT

:uninstall
    
    FINDSTR /V "185.229.236.109 s.optifine.net" "%HOSTS_FILE%" > "%TEMP_HOSTS_FILE%"
    
    COPY /b/v/y "%TEMP_HOSTS_FILE%" "%HOSTS_FILE%"
    ECHO UnInstall Complete
    
    PAUSE
    EXIT
