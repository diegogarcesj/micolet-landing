# Micolet coding challenge

## Versiones

Se usó ruby 3.2.1, que se puede instalar con rvm o rbenv según preferencia, y rails 7.0.4.

## Dependencias y base de datos

Para instalar las gemas y los paquetes npm requeridos por el proyecto, ejecutar:

```
bundle install
yarn install
```

Para preparar la base de datos (se usó sqlite3), ejecutar:

```
rails db:create
rails db:migrate
```

## Ejecución

Para ejecutar el proyecto se debe correr:

```
bin/dev     
```

Es posible que muestre un error si la gema forecast no está instalada. Para instalarla, ejecutar lo siguiente antes y volver a correr la aplicación:

```
gem install forecast
```

Luego, abrir el navegador en la siguiente URL:

http://localhost:3000


## Correos con mailcatcher dockerizado

Puesto que ya no es posible enviar correos desde Gmail y no tengo otro servidor smtp, estos se pueden visualizar usando Mailcatcher. Para ello, es necesario levantar el servicio dockerizado en docker-compose.yml, con:

```
docker compose up -d
```

Y abrir el navegador en:

http://localhost:1080


## .env
No lo incluí en el .gitignore a propósito, y por lo tanto está en el repositorio, para facilitar la revisión.


## Test con Rspec
Se pueden ejecutar algunos test que escribí ejecutando:

```
rspec
```
