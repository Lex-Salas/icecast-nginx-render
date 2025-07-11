FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y icecast2 && \
    apt clean

# Crear usuario sin privilegios
RUN useradd -m iceuser

# Copiar config
COPY icecast/icecast.xml /etc/icecast2/icecast.xml

# Cambiar permisos del archivo
RUN chown -R iceuser:iceuser /etc/icecast2

EXPOSE 8000

# Ejecutar como usuario no root
USER iceuser

CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]

