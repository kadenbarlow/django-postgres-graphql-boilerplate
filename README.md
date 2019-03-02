# Django - Postgres - GraphQL Boilerplate

I was looking for a boilerplate to run a GraphQL Django backend to use with a React or VueJS frontend and couldn't find one that fit my purposes so I wrote this one.
The boilerplate uses graphene-django for graphql support and a custom user app has been created and integrated with JWT for authentication. The boilerplate can be used with any database backend Django supports but this boilerplate uses postgres. Everything is set up using docker for easy setup and development.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

- docker (on mac install using `brew cask install docker`)

### Installing

Below is a step by step series of examples that tell you how to get a development env running.

```
git clone --depth 1 <repository> <project_name>
cd <project_name>
git remote add origin <your_project_git_url>
git remote rm <repository>

docker-compose up
```

You should now see `Starting development server at http://0.0.0.0:8000/`

## Running migrations

```
docker-compose run web python manage.py makemigrations
docker-compose run web python manage.py migrate
```

## Running the tests

Example GraphQL tests have been added to the users app. To run those and future tests use the command below.

```
docker-compose run web python manage.py test
```

## Built With

* [Django](https://www.djangoproject.com/) - Web Framework
* [PostgreSQL](https://www.postgresql.org/) - Database
* [Docker](https://www.docker.com/) - Container for postgres
* [graphene-django](https://github.com/graphql-python/graphene-django) - GraphQL Support

## Authors

* **Kaden Barlow**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
