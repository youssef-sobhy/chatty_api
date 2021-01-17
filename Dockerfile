FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev default-libmysqlclient-dev
RUN gem install bundler -v 2.1.4

WORKDIR /app

COPY ./Gemfile* ./
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle check || bundle install

COPY . .

ENTRYPOINT ["./chatty_api/entrypoints/docker-entrypoint.sh"]
