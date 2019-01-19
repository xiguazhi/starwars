from ruby:2.6.0-alpine3.7
ENV BUNDLER_VERSION 1.17.3
COPY . .
RUN apk update && apk upgrade && \
adduser -S ruby && \
gem install bundler && \
bundle install && \
rm -rf /var/cache/apk/* && \
bundle config --global silence_root_warning 1
USER ruby
RUN bundle install
USER root
CMD ["./starwars_project.rb"]
