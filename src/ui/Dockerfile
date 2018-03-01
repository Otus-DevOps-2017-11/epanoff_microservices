FROM alpine:3.5
RUN apk add --no-cache ruby ruby-json && \
    apk add --no-cache --virtual build-dependencies ruby ruby-bundler ruby-dev build-base\
    && gem install bundler --no-ri --no-rdoc && rm -fr /usr/share/ri  && mkdir /app
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY Gemfile* "$APP_HOME/"
RUN bundle install && apk del build-dependencies
COPY . $APP_HOME
ENV POST_SERVICE_HOST=post \
    POST_SERVICE_PORT=5000 \
    COMMENT_SERVICE_HOST=comment \
    COMMENT_SERVICE_PORT=9292
CMD ["puma"]
