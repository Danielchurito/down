@echo off
Title Descarga de videos
color b
:inicio
cls
SET p=0
echo  ========================
echo  ========================
echo  ==      DESCARGA      ==
echo  == VIDEOS DE YOUTUBE  ==
echo  ========================
echo  ========================
echo.
echo 1. Para ver las opciones de video
echo 2. Para ver las opciones de audio
echo 3. Para salir
echo.

set /p p="selecione una opcion (1/3): "


if %p%==0 goto inicio
if %p%==1 goto v
if %p%==2 goto a
if %p%==3 goto fin

if %p% gtr 3 (
	cls
	echo numero no valido 
	pause
	goto inicio
)
if %p% lss 0 (
	cls
	echo numero no valido 
	pause
	goto inicio
)

:v
cls
set /p URLvideo="Ingrese URL (o escriba inicio para volver al menu): "
if /I "%URLvideo%"=="inicio" goto inicio
yt-dlp.exe "%URLvideo%" --js-runtime node -P media/videos"
color b
echo.
echo Descarga finalizada en carpeta 'media/videos' como MP3. Presione una tecla para continuar...
pause
goto v

:a
cls
set /p URLaudio="Ingrese URL (o escriba inicio para volver al menu): "
if /I "%URLaudio%"=="inicio" goto inicio

yt-dlp.exe "%URLaudio%" --js-runtime node --extract-audio --audio-format mp3 --ffmpeg-location "C:\Users\RYZEN\Documents\down\ffmpeg\bin" --audio-quality 0 -P "media/audio"
color b
echo.
echo Descarga finalizada en carpeta 'media/audio' como MP3. Presione una tecla para continuar...
pause
goto a

:fin
cls
echo Gracias por utilizar este script
timeout /t 2 > nul
exit
