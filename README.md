##  PARTE 1

###  Parte 1: Introducción a dash.js

-  [x] Implementación del cliente web ([app](https://github.com/andresmntr/STREAMING/tree/parte-1/app)) para la visualización del vídeo ofrecido por envivo a través del documneto MPD indicado previamente.

-  [x] Análisis y explicación del documento MPD (en la memoria)

-  [x] Captura de pantalla del cliente para visualizar el comportamiento de MPEG-DASH y su explicación.

___

###  Implementación del cliente web

Podemos obserbar el código fuente generado para la implementación de la parte cliente de la aplicación en la carpeta [app](https://github.com/andresmntr/STREAMING/tree/parte-1/app) (index.html e index css).

###  Análisis y explicación del documento MPD

Se proporciona un análisis y explicación del [documento MPD](https://dash.akamaized.net/envivio/EnvivioDash3/manifest.mpd) utilizado. Este documento ofrecido por ***envivo*** es el que nos proporciona el vídeo visualizado en esta parte de la práctica.

###  Comportamiento MPEG-DASH

En las siguientes capturas somos capaces de observar el comportamiento producido por MPEG-DASH para escenarios con distintas velocidades de descarga.

<p align="center">
  <img src="/img/No_BWlimitation.png" alt="Fast" width=720>
</p>

En esta primera figura el punto de vista del cliente desde el navegador Google Chrome con una buena velocidad de bajada. La imagen del video se ve a buena calidad y el video carga correcta correctamente durante toda la reproducción de manera estable y con la misma resolución.

<p align="center">
  <img src="/img/Regular3G_BWlimitation.png" alt="3G" width=720>
</p>

El navegador Firefox nos permite jugar con estas velocidades de bajada. Vemos en la parte inferior derecha de esta figura como limitamos la velocidad a *Regular 3G*. Al tener tal limitación el comportamiento que deberíamos apreciar es una reducción de la resolución. Sin embargo, es apenas apreciable.

<p align="center">
  <img src="/img/Good2G_BWlimitation.png" alt="2G-1" width=720>
</p>

Al establecer una velocidad aún menor, empezamos a notar un empeoramiento de la calidad de imagen reproducida. En este caso está claro que la resolución se ha reducido, se esta reproduciendo otro de los videos generados a una calidad menor.

<p align="center">
  <img src="/img/Good2G_BWlimitation_2.png" alt="2G-2" width=720>
</p>

Si seguímos observando se llega a reducir aún más la resolución.

<p align="center">
  <img src="/img/NoCSSheightLimitation.png" alt="CSS-height-variable" width=720>
</p>

Por último y para verlo más claro, quitamos la limitación de altura establecidos en el archivo [css](https://github.com/andresmntr/STREAMING/blob/parte-1/app/index.css). Observamos ahora de manera mucho más clara el cambio de resoluciones en función de las velocidades. Se aprecian 4 tamaños distintos siendo el más pequeño el expuesto en esta última figura.

En el siguiente diagrama vemos este efecto producido al bajar la velocidad de bajada y no tener una altura fijada en el css. Se expone secuencialmente de izquierda a derecha.

<br/>

<p align="center">
  <img src="/img/Resolutions.png" alt="CSS-height-variable" width=800>
</p>

<br/>

___

En la siguiente parte generaremos las distintas configuraciones a partir de un vídeo y sus respectivos archivos MPD.
