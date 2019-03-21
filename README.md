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

docker-compose up
```

You should now see `Starting development server at http://0.0.0.0:8000/`

## Running migrations

```
docker-compose run web python manage.py makemigrations && python manage.py migrate
# OR you could just
docker-compose restart
```

## Running the tests

Example GraphQL tests have been added to the users app. To run those and future tests use the command below.

```
docker-compose run web python manage.py test
```

## Installing New Packages

This zsh function shows the process and makes it really easy.
```
alias dc='docker-compose'
dc-pip-install() {
  package_name=$1
  requirements_file=$2
  if [[ -z $requirements_file ]]
  then
  requirements_file='./requirements.txt'
  fi

  echo "$package_name" >> $requirements_file
  dc down
  dc build
  dc up
  dc run web pip freeze >> $requirements_file
}
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
