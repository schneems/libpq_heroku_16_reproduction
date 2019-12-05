FROM heroku/heroku:16

RUN rm /etc/apt/preferences.d/pgdg.pref
RUN apt-get update -y
RUN apt-get upgrade -y

RUN gem install pg

COPY testcase.rb .
CMD ["ruby", "testcase.rb"]