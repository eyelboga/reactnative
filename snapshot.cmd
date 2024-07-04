REM create a zip file (with timestamp and snapshot description in filename) containing project files 
REM @echo off
setlocal

REM Request description for snapshot
set /p desc=""

REM Do not append description to filename if not given any
IF NOT "%desc%"=="" (
set "descappend=.%desc%"
) ELSE (
set "descappend="
)

REM Get current timestamp for filename
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "datetime=%%I"
set "timestamp=C:\Projects\myreactnativeproject.%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%.%datetime:~8,2%%datetime:~10,2%%descappend%"

REM Set the path to 7zip executable
set "zip=C:\Program Files\7-Zip\7z.exe"

REM Set the directory you want to archive
set "source=C:\Projects\myreactnativeproject"

REM Set the archive name with timestamp
set "archive=%timestamp%.zip"

REM Add file(s) in root directory
"%zip%" a -tzip "%archive%" "%source%\App.tsx"

REM Add folder(s)
"%zip%" a -tzip "%archive%" "%source%\core"
"%zip%" a -tzip "%archive%" "%source%\screens"

REM Pause
