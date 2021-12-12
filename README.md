# 2.

Zbudowanie opracowango obrazu i nazwanie go lab4docker: ```docker build . -t lab4docker```

# 3.

Utworzenie wolumenu o nazwie LocalVol: ```docker volume create LocalVol```

# 4. 

Uruchomienie kontenera o nazwie alpine4 na bazie zbudowanego obrazu lab4docker z podłączonym do niego wolumenem LocalVol w miejsce katalogu /logi w systemie plików kontenera oraz z ograniczeniem ilości wykorzystywanej pamięci RAM do 512MB: ```docker run -it --name alpine4 --memory=512m --mount source=LocalVol,target=/logi lab4docker```

# 5.

a. Sprawdzenie czy skrypt pluto.sh generuje wymagane dane i umieszcza je w pliku info.log na wolumenie, który znajduje lokalnie - utworzenie kontenera pomocniczego z podmontowanym wyżej wymienionym wolumenem: ```docker run -it --name test --mount source=LocalVol,target=/logi alpine```, następnie wywołać na nim polecenia ```ls -al logi``` oraz ```cat logi/info.log```

b. Sprawdzenie czy kontener alpine4 ma ograniczoną ilość pamięci RAM: ```docker stats --no-stream --format {{.MemUsage}} alpine4```. 

# 6.

Aby skorzystać z narzędzia cAdvisor w celu uzyskania informacji o kontenerze należy wykorzystać polecenie
```docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:latest```, wejść przez przeglądarkę na ```localhost:8080```, przejść do ```Docker Containers``` i wybrać kontener alpine4