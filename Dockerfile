FROM elixir:1.8

RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new 1.4.3 \
  && apt-get update \
  && apt-get install -y postgresql-client \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash \
  && apt-get install -y apt-utils \
  && apt-get install -y nodejs \
  && apt-get install -y build-essential \
  && apt-get install -y inotify-tools \
  && mix local.rebar --force

RUN mkdir /app
COPY . /app
WORKDIR /app

# node needed for live reload
RUN cd assets && npm install

ENTRYPOINT ["bash", "/app/entrypoint.sh"]