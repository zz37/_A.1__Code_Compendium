# Teoría y práctica Docker
* Conceptos
Contenedor Docker.- Es el contenedor generado por una imagen docker, el cual contiene los paquetes y recursos para que se corra una aplicación en forma satisfactoria.
Imagen Docker.- Es un archivo de código de docker con instucciones para crear un contenedor con las especificaciones de código.

## Creación de imagen
* Existen imágenes ya hechas y oficiales en el DockerHub. Pero no todas las versiones están soportadas por lo que es posible crear mi propias imagen docker y tener los paquetes necesarios y realizar un contenedor. 
* Entre muchas otras más razones.
* `archivo Docker`.- Es un archivo con las instrucciones para construir la imagen del usuario.
* La creación de una imagen es secuencial, por lo que no es conmutativo. Compilar A luego B, es diferente de B luego A.

## Estructura de código de imagen
* Estructura de código de un archivo `Dockerfile`.
```                                          
  Flujo      Creación archivo "Dockerfile"
        |    +---------------------------+
        |    |   Especificación de imagen|
        |    |            base           |
        |    +---------------------------+
        |    +---------------------------+
        |    |   escribir comandos para  |
        |    |   instalar programas      |
        |    |   adicionales a la base   |
        |    +---------------------------+
        |    +---------------------------+
        |    |   especificar el comando  |
        |    |   a correr al inicio del  |
        |    |   contenedor              |
        v    +---------------------------+
```  

* Diagrama de construcción para una imagen
```  
+----------+    +------------+    +-------------+    +-----------+
|Dockerfile|--->|Dockerclient|--->|Docker server|--->|image ready|
+----------+    >------------+    +-------------+    +-----------+
```  

## Imagen base
* La imagen base contiene la arquitectura y sistema operativo con el kernel básico para iniciar esa imagen, es decir contiene una captura de los archivos del sistema ("File system snapshot"). 
* Contiene además programas simples preinstalados que son utiles.
* Por lo que el contenedor se puede describir de la forma del diagrama de abajo.
``` 
                                                      
             Contenedor                               
+---------------------------------------------+       
| +------------+                              |       
| |-update cmd | ->proceso corriendo          |       
| +------------+                              |       
|                                             |       
| +----------------------------------------+  |       
| |                Kernel                  |  |       
| +----------------------------------------+  |       
| +--------------------+                      |       
| | RAM, CPU, ETC.     |                      |       
| +--------------------+                      |       
| || car etas de la imagen                    |       
| || base                                     |       
| |+-------------                             |       
| || bin     etc        -> segmento reservado |       
| || dev     home       para el contenedor    |       
| |+---------------                           |       
| |                                           |       
| +-----------------                          |       
+---------------------------------------------+       
``` 

## Etiquetando una imagen Docker 
* Para etiquetar correr el comando `docker build -tag <docker_hub_id>/<nombre>:<versión> .`. 
* El punto especifica el directorio actual de trabajo.

## Copia de archivos de compilación
* Para copiar los archivos de compilación se usa la forma de
    * `COPY ./ ./`.
    * El primer ./ es ruta a la carpeta para copiar en su máquina en relación con el contexto de compilación.
    * El segundo ./ es coloque cosas de copia dentro del contenedor.
    * WORKDIR es para copiar el código que usa el `Dockerfile` dentro de una carpeta del usuario al contenedor. El comando se ejecuta al directorio relativo dentro del contenedor.
      * WORKDIR </usr/app>, eg. copia los códigos a la carpeta usr/app dentro del contenedor.
* Para sobrescribir la instrucción de copy es posible agregar instrucciones extras de COPY para sólo copiar los archivos que se modifican y minimizar el cache y reconstruir la imagen instalando todas las dependecias otra vez.

## Correr docker con mapeo de puerto
* Para correr docker con el mapeo del puerto del contenedor al puerto de la máquina local. 
  * `docker run -p 8080:8080 <image id/nombre>`.
  * El primer número seguido de `-p` es la ruta de tráfico entrante en máquina local. 
  * El segundo número seguido de `-p` es el puerto dentro del contenedor.
  * Es decir, el mapeo se hace de izquierda a derecha. De la maquína local(8080) -> al contenedor (8080).

## Programa dentro del contenedor
* Para correr el `shell` dentro del contenedor nodejs con la base de alpine.
* `docker run -it <image id> sh`--> corre el shell bash.
* `docker exec -it <image id> sh`--> corre el shell, sí el contenedor esta activo.

## Correr múltiples contenedores
* Para correr múltiples contenedores se utiliza Docker Compose, para correo contenedores al mismo tiempo.
* Para el Docker Compose se crea un archivo `docker-compose.yml`. Es un archivo tipo `.yml` con las instrucciones a seguir.
* Terminar contenedores-compose
  * Para acabar con los contenedores de docker-compose, ejecutar `docker-compose down`. Y cierra los contenedores y los remueve.
* Para compilar imagenes es con `docker-compose up --build`.


## Resetear el contenedor
* no -> "never attempt to restart this container if it crashes."
* always -> "if this container stops (any reason) always atttempt to restart".
* on-failure -> "only restart if the containr stops with error code".
* unless-stopped -> "always restart unless the users force it to it".

## Diagrama de desarrollo 
* Diagrama para un ambiente profesional de código.
```
  +-----------+            
  |development| <---|      
  +-----------+     |      
        |           |      
        v           |      
    +--------+      |      
    |testing |      |      
    +--------+      |      
        |           |      
        v           |      
   +----------+     |      
   |deployment|-----|      
   +----------+            
```

## Diagrama de Travis ci
```                                 
       +------------------------+   
     | |create/change features. |   
 dev | +------------------------+   
-----+  make changes on feature     
        branch.                     
       --------------------------   
                  |                 
                  v                 
              +-----------+         
              |push to git          
              |repo       |         
              +-----------+         
                   |                
           +----------------+       
           |create pull     |       
           |request to merge|       
           |with master     |       
           +----------------+       
                   |                
         +------------------------+ 
       | |code pushed to travis ci| 
   test| +------------------------+ 
  -----+         tests run          
         -------------------------- 
                    |               
                    v               
              +-----------+         
              |merge PR on|         
              |master     |         
              +-----------+         
                    |               
          +------------------------+
        | |code pushed to travis ci|
    prod| +------------------------+
   -----+         tests run         
          --------------------------
                deploy to aws       
             elastic beanstalk      
         -------------------------- 
```

## Archivos dev y prod
* El archivo Dockerfile con .dev -> para development.
* El archivo sin .dev -> es para producción.

# Docker volume
* El docker-compose también se puede usar con docker volumes para facilitar los comandos.
* Es para establecer un marcador de referencia que apunte el código de la máquina a el contenedor y se actualiza el código -> se actualiza el contenedor.
  * `docker run -p <local_port>:<cntr_port> -v <files_path_bookrmark_not_to_map> -v <wrk_dir_path>:<cntr_wrk_dir_path> <image_id>`
  * Ejemplo: 
    * Mapear a los puertos 3000 del contenedor -> local, poner un marcador (no copiar) el folder "node_modules", mapear el directorio de trabajo a la carpeta dentro del contenedor "/app" y la imagen.
    * `docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app <img id>`
* Con el docker volumes, los cambio en el código se ven reflejados directmente.

## Diagrama dkr volumes
```                                 
     Local folder                     Docker container  
    +-----------------+              +-----------------+
    |                 |              |                 |
    | frontend       ||Docker volumes| reference      ||
    |  /src          ||<-----------  |  /reference    ||
    |  /public       ||<-----------  |  /reference    ||
    |  /node_modules ||<-----------  |  /reference    ||
    |  --------------+|              |  --------------+|
    +-----------------+              +-----------------+
                                         
```
* Si hay código en el contenedor se sobre escribe con el de la máquina local.
