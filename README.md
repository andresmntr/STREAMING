#  STREAMING


Proyecto de la **Práctica 3** de la asignatura de **Integración de Redes, Aplicaciones y Contenidos**: ***DASH*** . Consiste en crear un servicio streaming y familiriacizarse con las distintas técnicas de mejora de calidad percibida por el usuario y de gestión de derechos digitales (DRM). Este repositorio consta de 5 ramas, una para cada parte de la práctica y la rama final que contendrá el resultado final.

<div align="center">

| **Autores** |
|-------------|
| Pablo Lostao Fernández |
| Andrés Montero Ranc |
| Juan Lluva Llord |
| Martín Collado Pérez |

</div>


##  Para desplegar la app final

  

```sh
$ git clone https://github.com/andresmntr/STREAMING

$ cd STREAMING

$ git checkout final

$ cd app

$ python -m http.server 8080
```

##  Ramas del repositorio

###  parte-1
* Implementación de un cliente web básica para visualización de un video streaming ofrecido por envivo utilizando dash.
* Explicación y capturas de pantalla en README.md
  
###  parte-2
* Scripts para automatización la generación de las configuraciones de vídeo y otro para la preparación de los vídeos para DASH, segmentación de cada vídeo, y generación de los ficheros MPD con la ayuda de las herramientas: X264, MP4Box y Bento4.
* Implementación de la visualización de métricas en la parte cliente (bitrate, buffer size, etc.).
  
###  parte-3
* Scripts para la fragmentación cada una de las configuraciones generadas anteriormente, encriptado de los fragmentos mediante el método MPEG-CENC, 
* Se añade en la parte cliente el código necesario para procesar la gestión de derechos digitales.

###  parte-4
* Implementación de la visualización de métricas mediante gráficos
* Scripts con nuevos métodos de la encriptación para la gestion de DRM (widevine y PlayReady).
* API REST para la gestión dinámica de claves de acceso contenido en DRM.

###  final
* Contiene el resultado final del proyecto (merge de todas las ramas).

---
  
##  Tareas del proyecto

###  Parte 1: Introducción a dash.js

  

-  [x] Implementación del cliente web ([app](https://github.com/andresmntr/STREAMING/tree/parte-1/app)) para la visualización del vídeo ofrecido por envivo a través del documneto MPD indicado previamente.

-  [x] Análisis y explicación del documento MPD (en la memoria).

-  [x] Capturas de pantalla del cliente para visualizar el comportamiento de MPEG-DASH y su explicación.

  

###  Parte 2: Generación de videos para streaming y visualización de métricas

  

- [x] Codificación de un vídeo en, mínimo, tres calidades diferentes

- [x] Preparación de los vídeos para su presentación DASH: explicación de los comandos/herramientas utilizados y explicación del documento MPD resultante;

- [x] Captura de pantalla del inspector del cliente (pestaña de Red) para visualizar el comportamiento de MPEG-DASH y explicación de la captura con relación al fichero MPD;

- [x] Captura de pantalla de los mensajes ofrecidos por el servidor y explicación general de dichos mensajes.

  

###  Parte 3: Gestión DRM con dash.js

  

- [x] Encriptación de un vídeo en, mínimo, tres calidades diferentes, y explicación del comando/herramienta utilizado para ello;

- [x] Segmentación de los vídeos y explicación de los comandos/herramientas utilizados, así como del documento MPD resultante;

- [x] Captura de pantalla del cliente para visualizar el comportamiento de MPEG-DASH con DRM;

- [x] Realizar una alteración de las claves especificadas en protData para visualizar lo que ocurre cuando no se tiene acceso a un vídeo encriptado. Será necesario recoger los mensajes de error ofrecidos por el navegador (Firefox) a través de su consola.

  

###  Parte 4: DRM avanzado (opcional)

  

- [x] Visualización de las métricas mediante gráficos;

- [ ] Utilización de otro modelo o método de encriptación para la gestión de DRM (widevine, PlayReady, etc.);

- [x] Gestión dinámica de las claves de acceso a contenido DRM mediante la implementación de una API REST;

- [x] Cualquier otra mejora diferente que el grupo de trabajo estime oportuna y sea aprobada por el equipo docente (se deberá consultar con el equipo docente ANTES de proceder a su realización). --> Raspi and shellscripts.

---
<center>

| **Autores** |
|-------------|
| Pablo Lostao Fernández |
| Andrés Montero Ranc |
| Juan Lluva Llord |
| Martín Collado Pérez |

</center>
