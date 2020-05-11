##  Parte 3


###  Parte 3: Gestión DRM con dash.js


- [x] Encriptación de un vídeo en, mínimo, tres calidades diferentes, y explicación del comando/herramienta utilizado para ello;

- [x] Segmentación de los vídeos y explicación de los comandos/herramientas utilizados, así como del documento MPD resultante;

- [x] Captura de pantalla del cliente para visualizar el comportamiento de MPEG-DASH con DRM;

- [x] Realizar una alteración de las claves especificadas en protData para visualizar lo que ocurre cuando no se tiene acceso a un vídeo encriptado. Será necesario recoger los mensajes de error ofrecidos por el navegador (Firefox) a través de su consola.

---


###  Encriptación de un vídeo en distintas calidades

[Script](/scripts/encrypt-drm.sh)

####  Pasos seguidos

```sh
./bin/mp4encrypt --method MPEG-CENC --key 1:87237D20A19F58A740C05684E699B4AA:random --property 1:KID:A16E402B9056E371F36D348AA62BB749 --global-option mpeg-cenc.eme-pssh:true ../videos/low_config_fragments.mp4 ../videos/Low_config_fragments_encrypted.mp4 

./bin/mp4encrypt --method MPEG-CENC --key 1:87237D20A19F58A740C05684E699B4AA:random --property 1:KID:A16E402B9056E371F36D348AA62BB749 --global-option mpeg-cenc.eme-pssh:true ../videos/medium_config_fragments.mp4 ../videos/Medium_config_fragments_encrypted.mp4 

./bin/mp4encrypt --method MPEG-CENC --key 1:87237D20A19F58A740C05684E699B4AA:random --property 1:KID:A16E402B9056E371F36D348AA62BB749 --global-option mpeg-cenc.eme-pssh:true ../videos/high_config_fragments.mp4 ../videos/High_config_fragments_encrypted.mp4
```

Estos son para encriptar los videos, lo que se encripta son los vídeos codificados en las 3 cualidades y despues se fragmentan como veíamos en la anterior parte.

```sh
./bin/mp4dash ../videos/Low_config_fragments_encrypted.mp4 -o Low_encrypted 

./bin/mp4dash ../videos/Medium_config_fragments_encrypted.mp4 -o Medium_encrypted 

./bin/mp4dash ../videos/High_config_fragments.mp4 -o High_encrypted
```

O directamente:

```sh
./bin/mp4dash ../videos/Low_config_fragments_encrypted.mp4 ../videos/Medium_config_fragments_encrypted.mp4 ../videos/High_config_fragments.mp4 --output-dir ../app/output2
```

###  Comportamiento MPEG-DASH con DRM

(Comportamiento DRM)

###  Alteración de las claves especificadas en protData

(Firefox captures)

