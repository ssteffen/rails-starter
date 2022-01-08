# syntax=docker/dockerfile:1
FROM ruby:3.1
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /rails-starter
COPY . /rails-starter
RUN bundle install


# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]