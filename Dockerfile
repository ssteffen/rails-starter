FROM ruby:3.1.0-alpine

ENV BUNDLER_VERSION=2.3.4

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      bash \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      yarn

RUN gem install bundler -v 2.0.2

WORKDIR /rails-starter

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

# COPY package.json yarn.lock ./

# RUN yarn install --check-files

COPY . ./

# ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]