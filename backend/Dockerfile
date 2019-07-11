FROM ruby:2.5.5

WORKDIR /usr/src/app
ENV RACK_ENV=production

COPY Gemfile ./
RUN bundle install --without development test

COPY . .

CMD ["ruby", "app.rb"]