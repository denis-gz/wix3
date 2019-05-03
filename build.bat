@echo off

:: "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MSBuild.exe" /tv:15.0 /WarnAsMessage:MSB8051 /p:Configuration=Release /p:OFFICIAL_WIX_BUILD=C:\Work\wixtoolset\wix.snk /p:WixRoot=C:\Work\wixtoolset\ /v:minimal

set FrameworkVersion=
set FrameworkVersion32=

if "%1"=="debug" goto debug
if "%1"=="release" goto release
if "%1"=="clean" goto clean
echo Usage: %~n0 ^<debug^|release^|clean^>
echo.
echo Note: sometimes it is needed to run build command twice, due to broken dependencies.
exit /b 1

:debug
msbuild /p:WixRoot=C:\Work\wixtoolset\ /WarnAsMessage:MSB8051 /v:minimal
exit /B %ERRORLEVEL%

:release
msbuild /p:Configuration=Release /p:OFFICIAL_WIX_BUILD=C:\Work\wixtoolset\wix.snk /p:WixRoot=C:\Work\wixtoolset\ /WarnAsMessage:MSB8051 /v:minimal
exit /B %ERRORLEVEL%

:clean
msbuild /t:clean
exit /B %ERRORLEVEL%
