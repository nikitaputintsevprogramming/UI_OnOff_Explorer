@echo off
echo Остановка процесса explorer...
taskkill /F /IM explorer.exe

@REM if %ERRORLEVEL% NEQ 0 (
@REM     echo Ошибка при остановке explorer.
@REM     echo Перезапуск процесса explorer...
@REM     start explorer.exe
@REM     echo Готово!
@REM     pause
@REM     exit /b %ERRORLEVEL%
@REM )

@REM echo Запуск BakeWithConfig...
@REM start "" "%~dp0BakeWithConfig\Bake-dedoslavl.exe"

@REM if %ERRORLEVEL% NEQ 0 (
@REM     echo Ошибка при запуске BakeWithConfig.
@REM     echo Перезапуск процесса explorer...
@REM     start explorer.exe
@REM     echo Готово!
@REM     pause
@REM     exit /b %ERRORLEVEL%
@REM )

@REM echo BakeWithConfig запущен успешно.

@REM echo Готово!
@REM pause
