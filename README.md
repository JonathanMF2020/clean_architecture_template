
# Template de Clean Architecture(Ultima modificación: 27/11/2024)

Este es un proyecto con el principal objetivo de tener un template de los principios **SOLID**, utilizando **clean architecture** con el control de estados de **Bloc**

## ¿Que es clean architecture?
**Clean Architecture** (o "Arquitectura Limpia") es un estilo de diseño de software que organiza tu aplicación en capas, separando claramente su lógica principal del resto de los detalles técnicos. La idea principal es que el **núcleo de tu aplicación** (lo que realmente hace y cómo funciona) esté protegido y sea independiente de factores externos como bases de datos, frameworks o la interfaz de usuario
## ¿Que es Solid?
**SOLID** es un conjunto de 5 principios que ayudan a escribir código **limpio, organizado y fácil de mantener**. Cada letra representa un principio, y juntos aseguran que el código sea más flexible, reutilizable y menos propenso a errores.

### **S: Single Responsibility Principle (Responsabilidad Única)**

**Cada clase o módulo debe tener un único propósito.**

👉 Imagina que tienes un robot cocinero. ¿Dejarías que también haga la limpieza? No, porque su trabajo es **solo cocinar**. Si el robot limpia y algo falla, no sabrías si el problema fue de la cocina o de la limpieza.  
En el código, cada clase debe hacer **solo una cosa**.

### **O: Open/Closed Principle (Abierto/Cerrado)**

**El código debe estar abierto para extenderse, pero cerrado para modificaciones.**

👉 Piensa en una lámpara que puedes mejorar cambiando el foco (LED, inteligente, de colores) sin tener que abrirla y modificar su base.  
En el código, puedes añadir nuevas funcionalidades sin romper las ya existentes, usando herencia, interfaces o clases adicionales.
### **L: Liskov Substitution Principle (Sustitución de Liskov)**

**Si tienes una clase hija, debería poder reemplazar a la clase padre sin romper nada.**

👉 Si tienes un perro como mascota y decides cambiarlo por un gato, ambos deberían poder hacer lo básico: jugar, comer y dormir. Si el gato de repente no puede comer, ¡hay un problema!  
En el código, las clases hijas deben comportarse como las clases padres, respetando las mismas reglas.

### **I: Interface Segregation Principle (Segregación de Interfaces)**

**No obligues a una clase a implementar cosas que no necesita.**

👉 Si tienes un control remoto para un ventilador, no le pongas botones para cambiar canales de TV. ¡El ventilador no necesita eso!  
En el código, divide las interfaces grandes en varias más pequeñas para que cada clase implemente **solo lo que realmente usa**.

### **D: Dependency Inversion Principle (Inversión de Dependencias)**

**No dependas de cosas concretas, sino de abstracciones.**

👉 Si compras un cargador para tu teléfono, ¿no sería genial que funcione también con otros dispositivos? Eso es posible porque los cargadores usan **puertos estándar** (como USB), no diseños exclusivos.  
En el código, haz que las clases dependan de interfaces o abstracciones, no de implementaciones específicas, para facilitar los cambios.
## ¿Que es BLOC?
**BLoC** significa **"Business Logic Component"**, y es un **patrón de arquitectura** que te ayuda a separar la lógica de negocio (qué hace tu aplicación) de la interfaz (cómo se ve).

👉 Piensa en un **mesero en un restaurante**.  
El mesero recibe las órdenes de los clientes (eventos), las lleva a la cocina (lógica), y regresa con los platos listos (estados). **El cliente solo se preocupa por comer**, no por lo que pasa en la cocina.

## ¿Como funciona BLOC?
BLoC usa tres ingredientes clave:

1.  **Eventos**: Son las acciones que tú (usuario) realizas, como tocar un botón o escribir algo.
2.  **Lógica**: Aquí se decide qué hacer con esos eventos (por ejemplo, procesar un dato o llamar a una API).
3.  **Estados**: Es la respuesta que regresa la lógica, como “cargando”, “éxito” o “error”.

👉 Es como una conversación:

-   Tú: “Quiero ver las películas más populares” (evento).
-   La cocina (BLoC): Busca en su base de datos o en la API.
-   El mesero (estado): Te dice “Cargando...” y luego te trae la lista de películas.

## ¿Que aportan estos 3 juntos?

#### **a. Organización y separación clara de responsabilidades**

-   **Clean Architecture** te ayuda a separar tu app en capas como:
    
    -   **Dominio**: Contiene las reglas del negocio (Use Cases).
    -   **Datos**: Maneja las APIs, bases de datos, etc.
    -   **Presentación**: Cómo interactúa el usuario con la app (UI).
-   **BLoC** encaja perfecto en la capa de presentación. Aquí, conecta la lógica de eventos (inputs) con los estados (outputs) para que la interfaz reaccione a cambios.
    
-   **SOLID** garantiza que todo esté modular y que cada capa o clase tenga **una única responsabilidad**. Si algo cambia, solo afectará lo que debería, y no toda la app.

#### **b. Escalabilidad y mantenibilidad**

-   Una app pequeña tal vez no necesite Clean Architecture ni SOLID, pero conforme crece, las cosas pueden volverse un desastre si no hay una estructura bien pensada.
-   Al usar **BLoC** junto con estas prácticas, puedes **agregar nuevas funciones** sin miedo a romper lo que ya funciona.

**Ejemplo:** Si quieres agregar una nueva funcionalidad (como "películas recomendadas"):

1.  Solo creas un nuevo caso de uso (en la capa de dominio).
2.  Ajustas tu repositorio (capa de datos) para obtener las recomendaciones.
3.  Y finalmente, usas un nuevo evento y estado en tu BLoC.  
    El resto del código queda intacto.
#### **c. Testeabilidad**

-   **Clean Architecture** y **SOLID** aíslan cada capa, haciendo que sea fácil probar la lógica de negocio sin preocuparte por detalles de la interfaz.
-   **BLoC** facilita probar que los eventos generen los estados correctos, lo que asegura que tu app funcione como debe.#### **c. Testeabilidad**

-   **Clean Architecture** y **SOLID** aíslan cada capa, haciendo que sea fácil probar la lógica de negocio sin preocuparte por detalles de la interfaz.
-   **BLoC** facilita probar que los eventos generen los estados correctos, lo que asegura que tu app funcione como debe.
## Introducción a la plantilla
Existen 2 capas principales las cuales son **core** y **features**

- features: Son los fragmentos de código para funcionalidades determinadas que nos permiten tener un mejor acercamiento
- core: Son elementos que podemos reutilizar dentro de la aplicación como constantes, colores y/o códigos reutilizables

También adicional usamos varios paquetes que nos apoyan a generar código pre-compilado tales como **json_serealizable**, esto nos ayuda a que los modelos tengan las conversiones a json y viceversa de manera más efectiva generando un compilado, por otro lado igualmente contamos con **retrofit**, esta librería nos ayuda a generar un compilado de los servicios que definimos además de ayudarnos a tener un poco más de estabilidad en el código, nos permite estandarizar el código de la manera más común que se usa en Android
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

## Librerias utilizadas
A continuación un listado de librerias consumidas dentro del template
| Nombre| Versión | Descripcion de uso  | 
|--|--| -- | 
| cupertino_icons|1.0.2| Iconos dentro de las vistas | 
| flutter_bloc|8.1.3| Manejo de estados dentro de la aplicación | 
| auto_route|7.8.4| Manejo de rutas de navegación dentro de la aplicación | 
| retrofit|4.0.3| Facilitación de consumo de servicios | 
| dio|5.3.3| Consumo de servicios | 
| equatable|2.0.5| Validacion de clases | 
| get_it|7.6.4| Inyeccion de dependencias| 
| cached_network_image|3.3.0| Manejo de imagenes en cache|
| ionicons|0.2.2|Iconos en presentación de iOS|  
| json_annotation|4.8.0|Convierte modelos a metodos json (toJson y fromJson)|  
| flutter_secure_storage|9.2.2|Almacenamiento local de la aplicación|  


## Estandares de codificacion
A continuación, haremos saber los estándares de codificación utilizados en el proyecto


-  Utilizar lowerUpperCase al definir variables ejemplo: :heavy_check_mark: *moviesRequest* :x: *MoviesRequest*
- Los archivos deben definirse siempre en minuscula y guion bajo en caso de contener un espacio ejemplo: :heavy_check_mark: *auth_repository_impl* :x: *AuthRepositoryImpl*
- Las clases deben definirse con la primera letra siempre en mayuscula :heavy_check_mark: *AuthRepositoryImpl* :x: *auth_repository_impl* 
- Las constantes debe ir dentro de core > constantes
- Todo codígo que deba ser reutilizado se almacena en core
- El main que contiene el multiblocprovider solo debe contener blocs que de arranque se ejecuten
- El idioma de programación preferiblemente debe ser en ingles
- Cada feature debe contener su módulo de test para asegurar la funcionalidad del mismo
- En caso de incluir un header, debe hacerse mediante al interceptor
- En caso de requerir encapsular variables, es necesario hacerlo mediante **dtos**
- Siempre que algun elemento se itere en la presentacion debe generarse un widget mandandolo a llamar para mantener mayor control
- Todos los widgets sin excepcion deben heredar la key para mejorar el perfomance
# Comandos utilizados
> flutter pub run build_runner build // Este compila todo el contenido
> flutter test
