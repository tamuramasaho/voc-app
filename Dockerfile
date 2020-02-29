FROM ruby:2.5.1
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /voc-app

ADD Gemfile /voc-app/Gemfile
ADD Gemfile.lock /voc-app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /voc-app