Claro, aquí tienes un README para el repositorio de este proyecto:

# Sistema de Gestión de Reservas de Coworking

Este repositorio contiene los scripts SQL para implementar un sistema de gestión de reservas de espacios de trabajo en un coworking. El sistema permite a los usuarios reservar espacios de trabajo para sesiones específicas, cancelar reservas y consultar la disponibilidad de espacios.

## Modelo de Datos

El modelo de datos consta de las siguientes entidades:

- **Sala**: Representa una sala física del coworking, con un número fijo de espacios de trabajo dispuestos en filas y columnas.
- **Espacio_Trabajo**: Representa un espacio de trabajo individual dentro de una sala, identificado de manera única.
- **Usuario**: Representa un usuario del sistema de coworking.
- **Sesion**: Representa una sesión de trabajo en el coworking, con una fecha y hora específica.
- **Reserva**: Representa una reserva de un espacio de trabajo por parte de un usuario en una sesión determinada.

Para más detalles sobre el modelo de datos y las relaciones entre las entidades, consulta el [diagrama de entidad-relación](link_al_diagrama_ER).

## Scripts SQL

En este repositorio, encontrarás los siguientes scripts SQL:

1. **create_database.sql**: Script para crear la base de datos y las tablas necesarias.
2. **populate_data.sql**: Script para poblar las tablas con datos de prueba (al menos 100 registros por entidad).
3. **reserve_space.sql**: Script para realizar una reserva de un espacio de trabajo por parte de un usuario en una sesión específica.
4. **cancel_reservation.sql**: Script para cancelar una reserva existente.
5. **view_available_spaces.sql**: Consulta para ver la lista de espacios de trabajo disponibles en una sala y sesión determinadas.
6. **view_occupied_spaces.sql**: Consulta para ver la lista de espacios de trabajo ocupados en una sala y sesión determinadas.
7. **view_sessions_by_occupancy.sql**: Consulta para ver las sesiones ordenadas por nivel de ocupación.
8. **view_sessions_by_availability.sql**: Consulta para ver las sesiones ordenadas por nivel de disponibilidad.
9. **view_user_spaces.sql**: Consulta para ver la lista de espacios de trabajo asignados a un usuario.
10. **view_session_spaces.sql**: Consulta para ver la lista de espacios de trabajo asignados a una sesión.

## Instalación

1. Crea una base de datos PostgreSQL en la nube o localmente.
2. Ejecuta el script `create_database.sql` para crear las tablas necesarias.
3. Ejecuta el script `populate_data.sql` para poblar las tablas con datos de prueba.
4. Utiliza los demás scripts según sea necesario para realizar operaciones en la base de datos.

## Datos de acceso a la base de datos

- Host: [Host de la base de datos]
- Puerto: [Puerto de la base de datos]
- Nombre de la base de datos: [Nombre de la base de datos]
- Usuario: [Usuario de la base de datos]
- Contraseña: [Contraseña de la base de datos]

## Contribución

Si deseas contribuir a este proyecto, por favor sigue los siguientes pasos:

1. Haz un fork de este repositorio.
2. Crea una nueva rama para tus cambios: `git checkout -b nueva-funcionalidad`.
3. Realiza tus cambios y commit: `git commit -m "Descripción de los cambios"`.
4. Envía tus cambios a tu repositorio remoto: `git push origin nueva-funcionalidad`.
5. Crea un nuevo Pull Request en este repositorio.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.