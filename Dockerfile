FROM ruby:2.6.3-slim-buster

RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
