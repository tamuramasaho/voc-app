FROM ruby:2.5.1
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /voc-app

ADD Gemfile /voc-app/Gemfile
ADD Gemfile.lock /voc-app/Gemfile.lock

RUN gem uninstall -i /usr/local/lib/ruby/gems/2.5.0 bundler
RUN gem install bundler -v '2.1.4'
RUN bundle install

ADD . /voc-app