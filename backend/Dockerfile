FROM ruby:2.5.5

WORKDIR /usr/src/app

COPY Gemfile ./
RUN bundle install --without development test

COPY . .

CMD ["ruby", "app.rb"]