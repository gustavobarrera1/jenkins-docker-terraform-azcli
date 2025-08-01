# Ejecucion mediante docker compose
* Una vez clonado el repositorio, dentro de la carpeta de trabajo ejecutamos:

    <sub>docker compose -f docker-compose.yaml up -d</sub>

* Validar grupo Docker

    <sub>ls -l /var/run/docker.sock</sub>

* Crear grupo Docker y agregar usuario Jenkins al grupo Docker

    <sub>addgroup docker</sub>

    <sub>addgroup jenkins docker</sub>

    <sub>chgrp docker /var/run/docker.sock</sub>

    <sub>chmod 660 /var/run/docker.sock</sub>
