FROM ruby:2.5-alpine

RUN apk update && apk --update add \
 build-base \
 nodejs \
 postgresql-dev \
 tzdata \
 imagemagick

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
