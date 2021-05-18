## Creación servicio de mapas  MVT Secciones Censales de Andalucía (2000 - 2020)

 **Obtención de datos de origen Secciones Cencales**

Las secciones censales de España para cada 1 de Enero desde el año 2000 se encuentran disponibles en la web del Instituto Nacional de Estadística para su descarga.  

El Instituto de Estadística y Cartografía de Andalucía también permite el acceso a esta información, pero solo para el ámbito territorial de Andalucía. El IECA publica un servicio Web Map Service y  un servicio Web Feature Service a traves de los cuales podemos visualizar o descargar los fenómenos.

Ya que es necesario descargar las secciones para cada año para posteriormente procesarlas se hará uso del servicio Web Feature Service realizando la petición GetFeature  para cada año.

Como el servicio MVT a generar  sera en EPSG:3857 (Google Mercator) y el formato necesario es geojson realizaremos la petición GetFeature con los parámetros  *srsname=EPSG:3857* y *application/json*

La petición http para una única capa sería:

http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2000_01&outputFormat=application/json&srsname=EPSG:3857

Como se van a realizar 21 peticiones, una para cada año. Se puede crear un pequeño script de linux que mediante el comando wget realice la petición y guarde los datos en un fichero geojson.

    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2000_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2000_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2001_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2001_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2002_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2002_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2003_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2003_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2004_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2004_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2005_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2005_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2006_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2006_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2007_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2007_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2008_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2008_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2009_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2009_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2010_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2010_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2011_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2011_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2012_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2012_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2013_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2013_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2014_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2014_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2015_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2015_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2016_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2016_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2017_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2017_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2018_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2018_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2019_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2019_01.geojson
    wget "http://factorylab01.ieca.junta-andalucia.es/geoserver-ieca/secciones_censales/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=secciones_censales:secciones_censales_2020_01&outputFormat=application/json&srsname=EPSG:3857" -O secciones_censales_2020_01.geojson

Una vez ejecutado el script si revisamos el directorio donde se ejecuto veremos que tendremos los 21 ficheros geojson, uno para cada sección censal. 


    36 Megabytes secciones_censales_2000_01.geojson
    36 Megabytes secciones_censales_2001_01.geojson
    36 Megabytes secciones_censales_2002_01.geojson
    36 Megabytes secciones_censales_2003_01.geojson
    36 Megabytes secciones_censales_2004_01.geojson
    36 Megabytes secciones_censales_2005_01.geojson
    36 Megabytes secciones_censales_2006_01.geojson
    36 Megabytes secciones_censales_2007_01.geojson
    37 Megabytes secciones_censales_2008_01.geojson
    37 Megabytes secciones_censales_2009_01.geojson
    37 Megabytes secciones_censales_2010_01.geojson
    36 Megabytes secciones_censales_2011_01.geojson
    36 Megabytes secciones_censales_2012_01.geojson
    36 Megabytes secciones_censales_2013_01.geojson
    36 Megabytes secciones_censales_2014_01.geojson
    36 Megabytes secciones_censales_2015_01.geojson
    36 Megabytes secciones_censales_2016_01.geojson
    37 Megabytes secciones_censales_2017_01.geojson
    37 Megabytes secciones_censales_2018_01.geojson
    37 Megabytes secciones_censales_2019_01.geojson
    37 Megabytes secciones_censales_2020_01.geojson



**Generación de Tiles**

Una vez descargados los ficheros en formato Geojson el siguiente paso es la generación de los tiles para cada nivel de zoom. 
Aunque es factible generar los tiles en formato Geojson, al tratarse de ficheros de texto plano el almacenamiento sería un gran problema. 

El formato Protocolbuffer Binary Format (PBF) es el mas recomendable en estos casos de generación de servicios de vector tiles ya que al ser archivos binarios el tamaño es mucho menor.

En el caso que nos ocupa generaremos los tiles en formato PBF y los almacenaremos en una base de datos mbtiles.

Este proceso de generación de tiles en formato PBF y su almacenamiento en mbtiles se puede realizar en un único paso mediante la herramienta de linea de comandos de mapbox [tippecanoe](https://github.com/mapbox/tippecanoe). El repositorio git del tippecanoe posee una documentación muy detallada y describe tanto su instalación en linux como la ejecución de los comandos para la generación de los tiles.
el comando a ejecutar para generar los tiles para las secciones_censales del año 2000 sería.

    tippecanoe -zg -o secciones_censales_2000_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2000_01.geojson

Como tenemos que procesar  21 capas, una para cada año. Se puede crear un pequeño script de linux que ejecute el comando de manera automática.

    tippecanoe -zg -o secciones_censales_2000_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2000_01.geojson
    tippecanoe -zg -o secciones_censales_2001_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2001_01.geojson
    tippecanoe -zg -o secciones_censales_2002_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2002_01.geojson
    tippecanoe -zg -o secciones_censales_2003_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2003_01.geojson
    tippecanoe -zg -o secciones_censales_2004_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2004_01.geojson
    tippecanoe -zg -o secciones_censales_2005_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2005_01.geojson
    tippecanoe -zg -o secciones_censales_2006_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2006_01.geojson
    tippecanoe -zg -o secciones_censales_2007_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2007_01.geojson
    tippecanoe -zg -o secciones_censales_2008_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2008_01.geojson
    tippecanoe -zg -o secciones_censales_2009_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2009_01.geojson
    tippecanoe -zg -o secciones_censales_2010_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2010_01.geojson
    tippecanoe -zg -o secciones_censales_2011_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2011_01.geojson
    tippecanoe -zg -o secciones_censales_2012_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2012_01.geojson
    tippecanoe -zg -o secciones_censales_2013_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2013_01.geojson
    tippecanoe -zg -o secciones_censales_2014_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2014_01.geojson
    tippecanoe -zg -o secciones_censales_2015_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2015_01.geojson
    tippecanoe -zg -o secciones_censales_2016_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2016_01.geojson
    tippecanoe -zg -o secciones_censales_2017_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2017_01.geojson
    tippecanoe -zg -o secciones_censales_2018_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2018_01.geojson
    tippecanoe -zg -o secciones_censales_2019_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2019_01.geojson
    tippecanoe -zg -o secciones_censales_2020_01.mbtiles --drop-densest-as-needed -s EPSG:3857 --force secciones_censales_2020_01.geojson


El resultado de estos comando será la creación de un archivo mbtiles para cada sección censal en el que se almacenarán cada uno de los tiles correspondiente a cada fila, columna y nivel de zoom

    2,6 Megabytes secciones_censales_2000_01.mbtiles
    2,6 Megabytes secciones_censales_2001_01.mbtiles
    2,6 Megabytes secciones_censales_2002_01.mbtiles
    2,6 Megabytes secciones_censales_2003_01.mbtiles
    2,6 Megabytes secciones_censales_2004_01.mbtiles
    2,6 Megabytes secciones_censales_2005_01.mbtiles
    2,6 Megabytes secciones_censales_2006_01.mbtiles
    2,6 Megabytes secciones_censales_2007_01.mbtiles
    2,6 Megabytes secciones_censales_2008_01.mbtiles
    2,7 Megabytes secciones_censales_2009_01.mbtiles
    2,7 Megabytes secciones_censales_2010_01.mbtiles
    4,2 Megabytes secciones_censales_2011_01.mbtiles
    4,2 Megabytes secciones_censales_2012_01.mbtiles
    4,2 Megabytes secciones_censales_2013_01.mbtiles
    2,7 Megabytes secciones_censales_2014_01.mbtiles
    4,3 Megabytes secciones_censales_2015_01.mbtiles
    4,3 Megabytes secciones_censales_2016_01.mbtiles
    4,3 Megabytes secciones_censales_2017_01.mbtiles
    4,3 Megabytes secciones_censales_2018_01.mbtiles
    4,3 Megabytes secciones_censales_2019_01.mbtiles
    4,3 Megabytes secciones_censales_2020_01.mbtiles

 
Si comparamos el tamaño del archivo Geojson y el tamaño del archivo mbtiles se aprecia como el uso del formato PBF y su almacenamiento en mbtiles consige una gran optimización en cuanto al almacenamiento.

**Publicación de Servicio Vector Tile**

Para la publicación de los mbtiles de las secciones censales como servicio Vector Tile se hará uso del servidor [Tileserver-gl](https://github.com/maptiler/tileserver-gl) debido a que permite tanto la generación de servicios vector tiles ,la publicación de servicios con estilos de mapbox o incluso la publicación de servicios raster en formato WMS o WMTS.

En la página del proyecto existe una documentación muy detallada la cual se puede seguir para la intalación y configuración de tileserver-gl. En este caso se hará uso de la imagen docker que proporcionan, ya que cumple con nuestras necesidades básicas y no será necesario la instalación en local de librerías específicas.

La ejecución del contenedor de tileserver-gl crearemos un script de shell que nos permirá tener almacenados ciertos parámetros de configuración. El uso de este script nos permitirá por tanto no tener que escribir los parámetros cada vez que querramos ejecutar tileserver-gl.

El contenido del script sería el siguiente.

    docker run --rm -it --name tilserver-gl -v $(pwd)/data:/data -p 8080:8080 maptiler/tileserver-gl --no-cors --public_url http://localhost:8080 --verbose

los parámetro para la ejecución  del contenedor son los siguientes:

 - ***run:*** comando de docker para iniciar arrancar contenedor.
 - ***--rm:*** borrado del contenedor en caso de que exista.
 - ***-it:*** ejecución interactiva del contenedor
 - ***-name:*** nombre asignado al contenedor
 - ***-v:*** mapeo de asignación de volumen en el contenedor. el directorio data/ dentro del contenedor se mapeará al directorio data del host. El directorio data del host debe ser un directorio existente dentro del árbol de directorios desde donde se ejecuta el script de inicio del docker de tileserver-gl.
 - ***-p:*** mapeao de puertos entre contenedor y host.
 - ***-no-cors:*** habilitación de cors.
 - ***--public_url:*** url pública para los servicios vector tiles.
 - ***--verbose:*** activación del modo verbose para mostrar información de la ejecución.

Dentro del directorio donde se encuentre el script de ejecución del docker de tileserver-gl deberemos crear los siguiente estructura de directorios.

    /data/fonts/
    /data/sprites/
    /data/styles/
   
Por ultimo será necesario crear un archivo de configuración config.json para que al iniciar el docker de tileserver este lea la localización de los mbtiles generados y los publique.

El contenido del archivo config.json básicamente contendrá la configuración básica de tileserver-gl y la definición de los mbtiles a publicar. Cada archivo mbtiles generará un layer o capa en el servidor tileserver-gl que podrá ser consumido de manera independiente como vector tile:

  
```json
{
  "options": {
    "paths": {
      "root": "",
      "fonts": "fonts",
      "sprites": "sprites",
      "styles": "styles",
      "mbtiles": ""
    },
    "domains": [
      "localhost:8080",
      "127.0.0.1:8080"
    ],
    "formatQuality": {
      "jpeg": 80,
      "webp": 90
    },
    "maxScaleFactor": 3,
    "maxSize": 2048,
    "pbfAlias": "pbf",
    "serveAllFonts": false,
    "serveAllStyles": false,
    "serveStaticMaps": true,
    "tileMargin": 0
  },
  "styles": {},
  "data": {
    "secciones_censales_2000": {
      "mbtiles": "secciones_censales_2000_01.mbtiles"
    },
    "secciones_censales_2001": {
      "mbtiles": "secciones_censales_2001_01.mbtiles"
    },
    "secciones_censales_2002": {
      "mbtiles": "secciones_censales_2002_01.mbtiles"
    },
    "secciones_censales_2003": {
      "mbtiles": "secciones_censales_2003_01.mbtiles"
    },
    "secciones_censales_2004": {
      "mbtiles": "secciones_censales_2004_01.mbtiles"
    },
    "secciones_censales_2005": {
      "mbtiles": "secciones_censales_2005_01.mbtiles"
    },
    "secciones_censales_2006": {
      "mbtiles": "secciones_censales_2006_01.mbtiles"
    },
    "secciones_censales_2007": {
      "mbtiles": "secciones_censales_2007_01.mbtiles"
    },
    "secciones_censales_2008": {
      "mbtiles": "secciones_censales_2008_01.mbtiles"
    },
    "secciones_censales_2009": {
      "mbtiles": "secciones_censales_2009_01.mbtiles"
    },
    "secciones_censales_2010": {
      "mbtiles": "secciones_censales_2010_01.mbtiles"
    },
    "secciones_censales_2011": {
      "mbtiles": "secciones_censales_2011_01.mbtiles"
    },
    "secciones_censales_2012": {
      "mbtiles": "secciones_censales_2012_01.mbtiles"
    },
    "secciones_censales_2013": {
      "mbtiles": "secciones_censales_2013_01.mbtiles"
    },
    "secciones_censales_2014": {
      "mbtiles": "secciones_censales_2014_01.mbtiles"
    },
    "secciones_censales_2015": {
      "mbtiles": "secciones_censales_2015_01.mbtiles"
    },
    "secciones_censales_2016": {
      "mbtiles": "secciones_censales_2016_01.mbtiles"
    },
    "secciones_censales_2017": {
      "mbtiles": "secciones_censales_2017_01.mbtiles"
    },
    "secciones_censales_2018": {
      "mbtiles": "secciones_censales_2018_01.mbtiles"
    },
    "secciones_censales_2019": {
      "mbtiles": "secciones_censales_2019_01.mbtiles"
    },
    "secciones_censales_2020": {
      "mbtiles": "secciones_censales_2020_01.mbtiles"
    }
  }
}
```

Por último y antes de ejecutar el script de inicio del  docker de tileserver-gl copiaremos nuestros archivos mbtiles al directorio data/ creado con anterioridad.
