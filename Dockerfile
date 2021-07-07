FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install

ENV LANG C.UTF-8
ENV APP_HOME /app_home

RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD sidekiq.gemspec sidekiq.gemspec
ADD lib/sidekiq/version.rb lib/sidekiq/version.rb

RUN gem update --system && bundle install

CMD [ "bash" ]
