FROM ruby:2.7.0-alpine

RUN bundle config --global frozen 1
WORKDIR /usr/src/app

RUN apk add --update-cache postgresql-dev zlib build-base tzdata nodejs yarn

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

ENV RAILS_ENV=production \
    POSTGRES_HOST='' \
    POSTGRES_PASSWORD='' \
    POSTGRES_USER='postgres' \
    POSTGRES_DB='' \
    SECRET_KEY_BASE='' \
    SENDGRID_API_KEY='' \
    SMTP_HOST='' \
    SMTP_FROM_EMAIL='' \
    SMTP_PASSWORD='' \
    SMTP_PORT='' \
    SMTP_USERNAME='' \
    SYSTEM_APP_NAME='' \
    SYSTEM_EMAIL='' \
    SYSTEM_HOST_NAME='' \
    SYSTEM_PASSWORD=''

COPY . ./

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]
