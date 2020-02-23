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
git clone <repository> <project_name>
cd <project_name>
rm -rf .git
git init
git remote add origin <your_project_git_url>
git add .
git commit -m <message>
git push -u origin master

./scripts/start-container # starts a local terminal for local development
./scripts/migrate
./scripts/seed # if you want to seed the database from fixtures
./scripts/start-app
```

You should now see `Starting development server at http://0.0.0.0:8000/`

## Seed Database

Seed data can be kept in the fixtures directory. It can be stored as YAML or json, although I prefer YAML
Example file for users is included. It creates three users. One admin, admin@app.com, and two other test users. The following commands load and dump data.

```
# load all fixtures
./scripts/seed

# load a specific fixture
./scripts/manage loaddata ./fixtures/users/user.yaml

# dump an apps data in a fixture
./scripts/manage dumpdata users.user --format=yaml > ./fixtures/users/user.yaml
```

## Running the tests

Example GraphQL tests have been added to the users app. To run those and future tests use the command below.

```
./scripts/manage test
```

## Installing New Packages

Dependencies are installed with pipenv. To install a new package simply run the command below. That will install it in your current working container. The `./scripts/start-container` script will build the docker image from scratch so you don't have to worry about running `pipenv install` when you start the container.

```
pipenv install <package_name>
```

## Useful Apps and their Documentation

Some apps come pre-installed in this boilerplate. Here is a list of them and a link to their documentation. You may want to remove these if you don't want their functionality.

- [django-extentions](https://django-extensions.readthedocs.io/en/latest/installation_instructions.html) - Provides a bunch of useful commands for working in Django. For example, running `./scripts/manage shell_plus` will load a shell with all your models already loaded.
- [django-import-export](https://django-import-export.readthedocs.io/en/stable/) - Provides an import and export which can be useful in the admin tool.
- [django-simple-history](https://django-simple-history.readthedocs.io/en/latest/) - Provides a way to track changes to models. Useful for debugging and auditing which information has changed and by who. Simply add `history = HistoricalRecords()` on to one of your models. It also easily integrates with the admin tool.


## Built With

* [Django](https://www.djangoproject.com/) - Web Framework
* [PostgreSQL](https://www.postgresql.org/) - Database
* [Docker](https://www.docker.com/) - Container for postgres
* [graphene-django](https://github.com/graphql-python/graphene-django) - GraphQL Support

## Authors

* **Kaden Barlow**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
