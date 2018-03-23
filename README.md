[![Build Status](https://travis-ci.com/hmiacatracha/TFG.svg?token=9HkAeJE9p5Tzyz4kH65E&branch=master)](https://travis-ci.com/hmiacatracha/TFG)

[![Code Coverage](https://img.shields.io/codecov/c/github/pvorb/property-providers/develop.svg)](https://codecov.io/github/pvorb/property-providers?branch=develop)


# Aplicación para la gestión de una empresa de recogida de residuos - TRABAJO FIN DE GRADO (TFG) 

## Objetivos
El objetivo de este proyecto es desarrollar una aplicación para la gestión de una empresa de recogida de residuos. El sistema debe permitir: -Gestionar los recursos de la empresa, como puede ser los empleados, los camiones de recogida y los contenedores de residuos. -Gestionar las rutas de recogida. -Generar y visualizar alertas. -Visualizar el histórico de rutas y estadísticas.
## Descripcion
e desarrollará una aplicación web para la gestión de una empresa de recogida de residuos pensada para una ciudad en la que cada tipo de residuo, como pueden ser el orgánico, el inorgánico, el papel, el plástico o el vidrio, se deposita en contenedores diferentes, específicos para ese tipo de residuo. Cada contenedor tendrá una ubicación y unos sensores de volumen, temperatura y volumen. La empresa dispondrá de diferentes tipos de camiones, sirviendo cada tipo de camión para recoger uno o varios tipos de residuos. Además, cada camión tendrá una capacidad máxima para cada tipo de residuo que puede recoger. Los camiones tendrán asignados conductores, y recolectores (empleados encargados de recoger los contenedores). Nuestro sistema considerará rutas estáticas, que tendrán asignados los contenedores que deben recogerse en ellas, además de los camiones necesarios para realizarlas. Las rutas podrán estar activas o inactivas. El sistema contará con varios tipos de usuarios: administradores, conductores y recolectores. El usuario administrador será el encargado de dar de alta y gestionar los diferentes tipos de recursos del sistema, como pueden ser los demás usuarios, los camiones, los contenedores o los sensores, y las rutas de recogida. El usuario administrador será también el responsable de configurar las rutas diarias. Para cada ruta activa podrá configuirar, por ejemplo, los conductores, recolectores y camiones asignados. Los trabajadores (conductores o recolectores) podrán modificar ciertos datos de su perfil. Cada trabajador podrá acceder a la ruta que tenga asignada en el día actual y también a su historial de rutas realizadas. Los trabajadores asignados a una ruta tendrán que especificar a través de la aplicación la hora de comienzo y de finalización de la ruta (estos datos los guardaremos para calcular la duración total de la ruta). La aplicación mostrará a los trabajadores asignados a cada ruta el volumen actual de los contenedores de esa ruta, junto con una sugerencia sobre si debe o no recogerse, aunque finalmente será el trabajador quien decida si se recoge o no (y dejará constancia a través de la aplicación). La aplicación permitirá ver, a los usuarios administradores, el historial de las rutas, donde se podrán ver datos como los conductores y recolectores asignados, duración de la ruta, contenedores asignados y qué contenedores se recogieron finalmente. Podrá además realizar búsquedas avanzadas de trabajadores por documento de identificación, nombre, apellidos y/o teléfonos, camiones por modelo y/o tipo y buscar rutas por fecha. El sistema también generará y mostrará alertas a los administradores. Estas alertas podrán ser, por ejemplo: que se ha asignado un trabajador a más de una ruta diaria, que hay habido un cambio brusco de volumen en uno o varios contenedores de una ruta planificada y aún no iniciada, etc. Tanto trabajadores como usuarios anónimos podrán acceder al apartado de estadísticas donde se podrán ver y comparar estadísticas de reciclado por tipo de residuo reciclable en diferentes periodos temporales.

## ENTORNO DE DESARROLLO
La aplicación se desarrollará en un entorno de desarrollo integrado (IDE). Base de datos relacional. Las tecnologías empleadas serán Java SE y Java EE, Hibernate, Spring, Junit y Mysql.

## IMPLEMENTACION
### LÓGICA DEL NEGOCIO


### VISTA


### PRUEBAS
