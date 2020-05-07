##  Parte 2


###  Parte 2: Generación de videos para streaming y visualización de métricas

- [x] Codificación de un vídeo en, mínimo, tres calidades diferentes

- [x] Preparación de los vídeos para su presentación DASH: explicación de los comandos/herramientas utilizados y explicación del documento MPD resultante;

- [x] Captura de pantalla del inspector del cliente (pestaña de Red) para visualizar el comportamiento de MPEG-DASH y explicación de la captura con relación al fichero MPD;

- [x] Captura de pantalla de los mensajes ofrecidos por el servidor y explicación general de dichos mensajes.


---


###  Codificación de un vídeo en distintas calidades

[Script](/scripts/generate-streaming-videos.sh) para la generación de las configuraciones.

####  Pasos seguidos


El primer paso a seguir es la instalación de la ultima versión de x264. Para ello, comprobamos que no la tengamos ya instalada mediante uno de las ordenes mostradas a continuación.

```sh
$ x264 --version
```
o
```sh
$ brew info x264
```

En la [respuesta](#x264-version) podemos ver que tenemos instalado ya el paquete x264.

<p id="x264-version" align="center">
  <img src="/img/version_x264.png" alt="" width=720>
</p>

Luego, nos aseguramos de que tenemos la última versión de este paquete con ```brew upgrade x264```.

<p id="x264-version" align="center">
  <img src="/img/upgrade_x264.png" alt="" width=720>
</p>

Una vez realizado este primer paso, procedemos a generar los archivos de configuración a distintas resoluciónes. Para ello, ejecutamos el comando proporcionado en el enunciado de la práctica.

```sh
x264 --output low_config.264 --fps 24 --preset slow --bitrate 100 --vbv-maxrate 4800 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=160,height=90" video_original.mp4
```

Nos encontramos con el siguiente error.

<p id="x264-version" align="center">
  <img src="/img/upgrade_x264.png" alt="" width=720>
</p>

Comprobando que los comandos introducidos son correctos para nuestro sistema operativo con el comando 
```--help``` y vemos que entre los filtros proporcionados para nuestro sistema operativo no se encuentra resize. 

<p id="x264-version"  align="center">
  <img src="/img/upgrade_x264.png"  alt=""  width=720>
</p>

Después de clonar el repositorio y compilarlo con las herramientas de xcode, seguimos con el error visto anteriormente. Tras probar una serie de soluciónes, como por ejemplo inhabilitar *Avisynth support* (```--disable-avs```), preferimos probar con otro sistema operativo. Dada la falta de recursos de memoria, para no crear una maquina virtual, utilizamos los laboratorios de la universidad, con un sistema operativo *Ubuntu*.

<p id="x264-version"  align="center">
  <img src="/img/irac-lab-uni.png"  alt=""  width=720>
</p>

Pero no tiene el paquete x264 instalado y tampoco podemos instalarlo al no constar de los permisos necesarios. Aprovechamos esto para introducir una mejora. Vamos a utilizar una *Raspberry Pi* a la que accederemos de forma remota para generar los vídeos deseados (a distintas calidades).

Tras configurar la *RaspberryPi* accedemos a esta utilizando *Microsoft Remote Desktop* por comodidad aunque más adelante utilizaremos el protocolo ssh para probar el script de automatización. Y procedemos a instalar x264 con:
```
$ sudo apt-get install x264
```

Una vez instalado necesitaremos el vídeo para generar a partir de este los archivos que queremos (utilizaremos las ordenes para copiar archivos a y de nuestra raspi varias veces durante la práctica).
```
$ ssh-keygen -t rsa
$ ssh-copy-id [RASPIUSER]@[RASPISERVER]
```
Y después,
```
$ scp -i ~/.ssh/id_rsa ./video_original [RASPIUSER]@[RASPISERVER]:/home/USER/Documents/IRAC-P3/
```
Para copiar el video en nuestra raspi, y
```
$ scp -i ~/.ssh/id_rsa [RASPIUSER]@[RASPISERVER]:~/Documents/IRAC-P3/ ~/Desktop/MUIT/1/1.2/IRAC/myP3/videos/
```
Donde [RASPIUSER]=pi y [RASPISERVER]=[*"dirección ip del servidor de nuestra raspi"*].

Comprobamos que el x264 funciona correctamente. 

<p id="x264-version"  align="center">
  <img src="/img/x264_raspi.png"  alt=""  width=720>
</p>
Para el resto de configuraciones los comandos utilizados han sido los siguientes:

```sh
$ x264 --output low_config.264 --fps 24 --preset slow --bitrate 100 --vbv-maxrate 4800 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=160,height=90" video_original.mp4
$ x264 --output medium_config.264 --fps 24 --preset slow --bitrate 600 --vbv-maxrate 4800 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=640,height=360" video_original.mp4
$ x264 --output high_config.264 --fps 24 --preset slow --bitrate 2400 --vbv-maxrate 4800 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=1280,height=720" video_original.mp4
```

Una vez generadas las distintas configuraciones y copiadas en nuestro directorio de trabajo procedemos a codificarlas en MPEG (en futuro se considerará crear estos en la raspi también para automatizar todo el proceso a través de la misma como parte de la mejora, aunque no parece ser muy eficiente por la lentitud al ejecutar estos procesos).

###  Generación de vídeos en codificación MPEG

[Script](/scripts/generate-video-configs.sh) para

Usamos la herramienta mp4box mencionada en el enunciado. Para instalarlo en mac debemos instalar *gpac*.

```sh
brew install gpac
```
<p id="x264-version"  align="center">
  <img src="/img/gpac_instalation.png"  alt=""  width=720>
</p>

```sh
$ MP4Box -add ./264configs/low_config.264 -fps 24 low_config.mp4
$ MP4Box -add ./264configs/medium_config.264 -fps 24 medium_config.mp4
$ MP4Box -add ./264configs/high_config.264 -fps 24 high_config.mp4
```

<p id="x264-version"  align="center">
  <img src="/img/irac.gif"  alt=""  width=720>
</p>

El resultado ahora son tres archivos mp4 correspondientes a los videos codificados en mpeg.4 a distintas calidades. En el siguiente apartado preparamos los vídeos para DASH y generamos el fichero MPD.


###  Preparación de vídeos para DASH

Al intentar instalar bento4 se producen conflictos con el paquete gpac utilizado para mp4box. 

<p id="x264-version"  align="center">
  <img src="/img/bento4_error.png"  alt=""  width=720>
</p>

Para no sobreescribir ni desactivar ningún paquete utilizamos los [scripts de python](/bento4/utils) proporcionados por [bento4](https://www.bento4.com/).

Para poder correr el script de python mp4-dash.py necesitamos seguir los pasos mencionados en los comentarios del mismo.

```py
# NOTE: this script needs Bento4 command line binaries to run
# You must place the 'mp4info' 'mp4dump', 'mp4encrypt', 'mp4fragment', and 'mp4split' binaries
# in a directory named 'bin/<platform>' at the same level as where
# this script is.
# <platform> depends on the platform you're running on:
# Mac OSX   --> platform = macosx
# Linux x86 --> platform = linux-x86
# Linux x64 --> platform = linux-x86_64
# Windows   --> platform = win32
```

Para ello debemos descargar los [binaries](http://zebulon.bok.net/Bento4/binaries/Bento4-SDK-1-6-0-634.universal-apple-macosx.zip) para mac de su [web oficial](https://www.bento4.com/downloads/).

Una vez realizado procedemos a fragmentar los vídeos con las siguientes ordenes en el terminal desde el directorio [bento4](/bento4).

```sh
./bin/mp4fragment ../videos/low_config.mp4 ../videos/low_config_fragments.mp4
./bin/mp4fragment ../videos/medium_config.mp4 ../videos/medium_config_fragments.mp4
./bin/mp4fragment ../videos/high_config.mp4 ../videos/high_config_fragments.mp4
```
Ahora tenemos dos opciones o ejecutar las ordenes con python ejecutando el script de python [mp4-dash.py](/bento4/utils/mp4-dash.py) o ejecutando el archivo binario [mp4dash](/bin/mp4dash). En cualquier caso utilizará el script de python ([mp4-dash.py](/bento4/utils/mp4-dash.py)).

```sh
./bin/mp4dash ../videos/low_config_fragments.mp4 --output-dir ../videos/low_fragments
./bin/mp4dash ../videos/medium_config_fragments.mp4 --output-dir ../videos/medium_fragments
./bin/mp4dash ../videos/high_config_fragments.mp4 --output-dir ../videos/high_fragments
```
O directamente:

```sh
./bin/mp4dash ../videos/low_config_fragments.mp4 ../videos/medium_config_fragments.mp4 ../videos/high_config_fragments.mp4 --output-dir ../app/output
```

Que al no especificar un nombre de directorio establecerá el nombre de cada uno como 1 2 y 3 respectivamente (dentro de output.)


###  Comportamiento MPEG-DASH

El comportamiento esperado es el mismo que veíamos en la anterior parte de la práctica. Esta vez con el vídeo que hemos generado nosotros.


###  Mensajes ofrecidos por el servidor y explicación general de dichos mensajes

<p id="x264-version"  align="center">
  <img src="/img/cliente-parte-2.gif"  alt=""  width=720>
</p>

Y si reducimos la calidad de internet pbservamos como cambia de configuración.

<p id="x264-version"  align="center">
  <img src="/img/irac-parte2-slow.png"  alt=""  width=720>
</p>
