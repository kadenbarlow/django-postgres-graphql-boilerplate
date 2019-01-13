# Django - Postgres - GraphQL Boilerplate

I was looking for a boilerplate to run a GraphQL Django backend to use with a React or VueJS frontend and couldn't find one that fit my purposes so I wrote this one.
The boilerplate uses graphene-django for graphql support and a custom user app has been created and integrated with JWT for authentication. The boilerplate can be used with any database backend Django supports but for local development this boilerplate uses docker to run a postgres instance.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

- Python3.7
- This setup assumes that have you have docker installed. You can skip this by having postgres installed locally or make the needed changes to settings.py to use a different database.

### Installing

Below is a step by step series of examples that tell you how to get a development env running.

```
git clone --depth 1 <repository> <project_name>
cd <project_name>
git remote add origin <your_project_git_url>
git remote rm <repository>

# VirtualEnv not necessary but recommended
virtualenv ../<project_name>
source bin/activate

pip install -r requirements.txt
./run_postgres.sh
python manage.py migrate
python manage.py runserver
```

You should now see `Starting development server at http://127.0.0.1:800/`

## Running the tests

Example GraphQL tests have been added to the users app. To run those and future tests use the command below.

```
python manage.py test
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
