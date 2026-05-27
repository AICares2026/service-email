# Copyright The OpenTelemetry Authors
# SPDX-License-Identifier: Apache-2.0


FROM docker.io/library/ruby:3.4.8-alpine3.22 AS builder

COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock

RUN apk update && \
    apk add make gcc musl-dev gcompat && \
    bundle install

FROM docker.io/library/ruby:3.4.8-alpine3.22

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

WORKDIR /email_server

COPY ./views/ views/

COPY ./.ruby-version .ruby-version
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock
COPY ./email_server.rb email_server.rb

EXPOSE ${EMAIL_PORT}
ENTRYPOINT ["bundle", "exec", "ruby", "email_server.rb"]
