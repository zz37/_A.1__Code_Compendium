# Code_Compendium
* This is the code projects workshop anthology.
* Contents are subject to authorship. Contents can be used for recreational and hobby purposes. Based on the following license.
* Contents can be either in spanish or english.

## License
![Apache License, Version 2.0](https://img.shields.io/hexpm/l/plug?color=orange&label=License&style=flat-square)

# Index folder information
---

## Crypto Demo Pricing
* Cryptocurrency data demo. File Ethereum classic / USD price data demo.
* Prices retrieved from yahoo finance website, using the API. 
---

## Docker Projects
* Content related to docker code projects.
---

## Geant4_Ejemplos_ESP <Repository Name>

## Licencia
![Licencia Apache, versión 2.0](https://img.shields.io/hexpm/l/plug?color=yellow&label=License&style=flat-square)
    
## Acerca de <Sinopsis>
* Ejercicio de los ejemplos básicos de Geant4 con comentarios en español <Resumen>
* Estado del proyecto: ![Estado](https://img.shields.io/badge/Estado-Informacional-orange) <Status>


## Esquema de carpetas del repositorio
1. src(source) -> es la carpeta que contiene los archivos de las funciones del código fuente, *.cc / *.cpp.
2. include -> es la carpeta que contiene los archivos de encabezado del código fuente, *.hh.
3. build -> es la carpeta donde se contruye el ejecutable de la simulación de Geant4, con el código fuente(main).

## Esquema de archivos contenidos 
Cada ejemplo viene con una serie de archivos. 
* README; en .txt u otro formato; es el archivo donde viene la descripción de cada ejemplo y sus caraterísticas. Explicando, cada clase y su función y la funcionalidad básica de ejecución de la simulación.
* HISTORY; contiene la información cronológica de los autores y contribuyentes al desarrollo del ejemplo
* exampleB1.cc es el archivo main, de la simulación.
* La terminación *.mac son para los archivos macro, algunos son para la visualización(init_vis.mac) que se ejecutan en main, que a su vez llaman a otros archivos. 
* La terminación *.in, son los comandos de ejemplo a ingresar en la terminal de eventos dentro de la simulación de Geant4.  
* Los de terminación *.out es el resultado esperado de una corrida de simulación del ejemplo siguiendo los comandos base del ejemplo.
* Las corridas con comandos por defecto estan en run1.mac y run2.mac; dependiendo de cada ejemplo pueden variar y ser más archivos.


### Consideraciones
Deppendieno del ejemplo, el main puede invocar a varios archivos macro(*.mac), como ejemplo para la visualización(ui->user interface), como se muestra en el diagrama. El cual ui-> init_vis.mac ->  vis.mac o a otro vis2.mac. 

[comment]: <> (BLOQUE COMENTADO POR QUE NO JALO EN GITHUB)
[//]: # (<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>)
[//]: # (<script>mermaid.initialize({startOnLoad:true});</script>)
[//]: # (<div class="mermaid">)
[//]: # (graph LR;)
[//]: # (main.cc-->User_Interface;)
[//]: # (main.cc-->Run_Manager;)
[//]: # (Run_Manager-->Otros_procesos;)
[//]: # (User_Interface-->init_vis.mac;)
[//]: # (init_vis.mac-->vis.mac;)
[//]: # (init_vis.mac-->vis2.mac;)
[//]: # (</div>)  

### Requisitos
![Versión](https://img.shields.io/badge/C++11-Solutions-blue.svg?style=flat&logo=c%2B%2B) <Version>
---
## Material PDF Geant4 <Repository Name>
# Material-PDF-Geant4
Material de Documentación para GEANT4, PDF.

# Autores
* El material que se encuentra en el repositorio, es una recopilación de la documentación en formato PDF para Geant4.
* Los derechos de autor y propiedad intelectual es de las personas mismas.
* Este reopsitorio es sólo de forma educativa.
* No pretende la distribución ni reclamación de autoría.


## Métodos Numéricos expediente
* Contiene las metodologías de métodos numéricos y proyecto de rpc.
---

## Option Pricing Theory <Folder Name>
### About  <Synopsis>
* Theory notebook. <Abstract>
* Project status:  ![Status](https://img.shields.io/badge/Status-complete-green) <Status>

### Table of contents
1. Basic securities.
2. Call an Put options.
3. Brownian Motion Process. 
4. Stochastic Differential Equation.

### Requirements
* Wolfram Mathematica, V.12 or V.12+.
![Version](https://img.shields.io/static/v1?message=Wolfram_L.V12&style=plastic&logo=wolfram&labelColor=ffffff&color=de1709&logoWidth=40&logoColor=red&label=%20)<Version>

--- 
## Python Compendium Exercices
Repository for python involved technologies.

### Files
1. 3D-figures.ipynb. 3D figurs in python.
2. Pandas_REGEX_Análisis.ipynb. How to use regex to extract info from a csv table.
3. SQL**.ipynb. Shows how to use sqllite in a python jupyter notebook and the use of basic cursors of the IBM Db2 database.

### Requirements
* Python v.3 o v.3+. ![Version](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)  <Version>
---

## Contributing  <Reporting issues>
  <!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
Contribution is welcomed on component (or project if there is no component for that project).
To contribute to <project_name>, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

## License
![Apache License, Version 2.0](https://img.shields.io/hexpm/l/plug?color=orange&label=License&style=flat-square)
