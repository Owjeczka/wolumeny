# Obraz bazowy
FROM alpine

# Autor
LABEL author="Klaudia Jedzura"

# Folder roboczy
WORKDIR /usr/src/app

# Podłączenie wolumenu
VOLUME [ "/logi" ]

# Kopiowanie skryptu na obraz
COPY pluto.sh pluto.sh

# Wywołanie skryptu przy starcie kontenera
ENTRYPOINT [ "./pluto.sh" ]