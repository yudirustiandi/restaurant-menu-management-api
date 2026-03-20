# Restaurant Menu Management API

A RESTful API built with Ruby on Rails. Try the API via Postman. Download the Postman collection: [`api_collection.json`](./docs/restaurant_menu_management.postman_collection.json)

### Tech Stack
* Framework: Ruby on Rails (API mode)

* Language: Ruby

* Database: MySQL

* ORM: ActiveRecord

* Authentication: JWT (Json Web Token)

* Environment Management: dotenv-rails (.env)

### Setup
* Copy env.example to .env

* Setup environment in .env file


### Instalation (Local)
#### Install dependencies
```
bundle install
```

#### Setup Database
```
bin/rails db:create

bin/rails db:migrate

bin/rails db:seed
```

#### Run app
```
bin/rails server

or

bin/rails s
```

#### Run test
```
bin/rails test:integration
```


### Running in Docker
#### Make sure to create network first
```
sudo docker network create restaurant_menu_management_network
```

#### Running docker-compose.db.yml
```
sudo docker compose -f docker-compose.db.yml up -d --build
```

#### Running docker-compose.api.yml
```
sudo docker compose -f docker-compose.api.yml up -d --build
```

#### Access
* http://127.0.0.1:300 or http://0.0.0.0:3000

#### Run test
```
sudo docker exec -it restaurant-menu-management-api bin/rails test:integration
```

### Design Decisions
* **API mode only**. Rails initialized with --api

* **JWT Authentication**. Stateless, scalable, and frontend-friendly

* **Error Handling**. Global error handling using rescue_from in ApplicationController

* **Standard Response Format**. consistency and readability