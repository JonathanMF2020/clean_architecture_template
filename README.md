# Template de Clean Architecture

Este es un proyecto con el principal objetivo de tener un template de los principios **SOLID**, utilizando **clean architecture** con el control de estados de **Bloc**

## Reglas de uso
Existen 2 capas principales las cuales son **core** y **features**

- features: Son los fragmentos de codigo para funcionalidades determinadas que nos permiten tener un mejor acercamiento
- core: Son elementos que podemos reutilizar dentro de la aplicación como constantes, colores y/o códigos reutilizables

También adicional usamos varios paquetes que nos apoyan a generar código pre-compilado tales como **json_serealizable**, esto nos ayuda a que los modelos tengan las conversiones a json y viceversa de manera más efectiva generando un compilado, por otro lado igualmente contamos con **retrofit**, esta librería nos ayuda a generar un compilado de los servicios que definimos además de ayudarnos a tener un poco más de estabilidad en el código, nos permite estandarizar el código de la manera más común que se usa en android
## Estructura del proyecto
El proyecto se divide en varias carpetas, a continuación mostrare el ejemplo:
```
Nombre de la feature
│
└─Data
│   └─── Data sources
│   └─── Models
│   └─── Repository
└─Domain
│   └─── Entities
│   └─── Repository
│   └─── UseCases
└─Presentation
│   └─── Bloc
│   └─── Pages
│   └─── Widgets
```
En esta tabla tenemos el para que sirve cada capa

| Categoria padre | Nombre de la categoria | Uso  | 
|--|--| -- | 
| Data|Data sources| Aqui se ponen todas las fuentes de información como APIS, Base de datos locales y/o archivos que necesitemos consumir dentro del aplicativo | 
| Data|Models| Se manejan todos los modelos de la aplicacion en este caso tiene generados por retrofit | 
| Data|Repository| Contiene la implementación de los metodos definidos en la parte de Domain, en este lugar se hacen los consumos de los datasources para llamar la API o obtener datos de las bases de datos locales | 
| Domain|Entities| Se maneja toda la definicion de entidades que contienen los modelos | 
| Domain|Repository| Se almacenan las interfaces de los repositorios que se implementan en data | 
| Domain|UseCases| Aqui se maneja toda la logica de negocio de la aplicacion | 
| Presentation|Bloc| Se encapsula toda la informacion de los blocs, como estados, eventos y el propio manejador del bloc| 
| Presentation|Pages| Se colocan las páginas arrancadoras permitiendo agregar los providers de los blocs y llamados a los widgets|
| Presentation|Widgets| Es toda la vista con algun modelo o informacion inyectada para permitir manipularla|  

Lo recomandable para comenzar a generar una feature es en el siguiente orden
1. Entities
2. Models
3. Datasources
4. Repository(Domain)
5. Repository(Data)
6. Usecases
7. Bloc
8. Pages
9. Widgets

Con esto aseguramos que sea mas faci implementar este patron 

## Estandares de codificacion
A continuación haremos saber los estandares de codificacion utilizados en el proyecto

- Todo codígo que deba ser reutilizado se almacena en core
- Las constantes debe ir dentro de core > constantes
- Continuara
# Comandos utilizados
> flutter pub run build_runner build