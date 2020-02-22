# Development Dockerfile
FROM python:3.8.1

# Create a locked "docker" user to run the app
RUN addgroup --gid 1000 docker \
 && adduser --uid 1000 --gid 1000 --disabled-password --gecos "Docker User" docker \
 && usermod -L docker

# Update/upgrade all packages and install some common dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    locales \
    postgresql-client \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

# Set locale to en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
ENV LANGUAGE   en_US.UTF-8
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
&& echo "en_US.UTF-8 UTF-8"  >> /etc/locale.gen  \
&& echo "LANG=en_US.UTF-8"    > /etc/locale.conf
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN pip install pipenv

RUN mkdir /app \
&& chown -R docker:docker /app

WORKDIR /app
USER docker

COPY --chown=docker:docker Pipfile /app/Pipfile
COPY --chown=docker:docker Pipfile.lock /app/Pipfile.lock

RUN pipenv install
# RUN pipenv install --deploy --ignore-pipfile in production

COPY --chown=docker:docker . /app

CMD ./scripts/start_app.sh
