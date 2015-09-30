FROM ruby:2.2.3

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y nodejs
RUN apt-get install -y redis-tools
RUN apt-get install -y netcat

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Add Gemfile here, before the app files
# That way we can cache the bundle install step
ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

CMD ["./scripts/start_rails"]