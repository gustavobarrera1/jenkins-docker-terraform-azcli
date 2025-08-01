# Usa la imagen base de Jenkins
FROM jenkins/jenkins:lts-jdk11

# Instala sudo y otras herramientas necesarias
USER root
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    lsb-release \
    gnupg \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Configura Docker CE
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    containerd.io \
    && rm -rf /var/lib/apt/lists/*

# Instala Terraform
# La versión 1.9.0 es la última al momento de escribir esto, puedes cambiarla.
ENV TERRAFORM_VERSION="1.9.0"
RUN curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /usr/local/bin/
RUN rm /tmp/terraform.zip

# Instala Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Añade el usuario jenkins al grupo docker

# Vuelve al usuario jenkins para el resto de la ejecución
