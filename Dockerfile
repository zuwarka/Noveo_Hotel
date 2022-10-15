#!/bin/sh

# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /work/Noveo_Hotel
COPY Gemfile* .
RUN bundle install
COPY . .
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]