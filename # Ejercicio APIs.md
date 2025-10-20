# Ejercicio APIs

## 1. Extraer información de las alumnas:

- Usa este endpoint: "https://beta.adalab.es/curso-intensivo-fullstack-recursos/apis/alumnos-v1/alumnos.json" para hacer la llamada a la API.

**Nota:** no requiere api_key ni registro, se puede llamar directamente.

- Extrae de los resultados:
    - Número de expediente
    - Nombre
    - Apellido

- Convierte los datos extraidos en un Dataframe de pandas

## 2. Objetos cercanos a la tierra:

- Usa esta API: https://api.nasa.gov/
    - Requiere api_key

- Utiliza este endpoint: Asteroids - NeoWs -> mira bien la documentación!!

- Extrae los ids de los objetos cercanos a la Tierra de uno de los días (el que tú quieras) y crea una lista con ellos.

- BUsca si en ese mismo endpoint hay alguna manera de obtener la información de cada objeto por su id. Haz la llamada para cada id de la lista y almacena en un diccionario el id, nombre y si es peligroso de cada objeto.