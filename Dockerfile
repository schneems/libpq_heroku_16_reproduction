FROM heroku/heroku:16-build

RUN rm /etc/apt/preferences.d/pgdg.pref
RUN apt-get update -y

RUN mkdir deb_dir && cd deb_dir && apt download libpq-dev && apt download libpq5

RUN cd deb_dir && dpkg -x libpq-dev_12.1-1.pgdg16.04+1_amd64.deb .
RUN cd deb_dir && dpkg -x libpq5_12.1-1.pgdg16.04+1_amd64.deb .

ENV LD_LIBRARY_PATH="${PWD}/deb_dir/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"

RUN echo $LD_LIBRARY_PATH

RUN gem install pg

COPY testcase.rb .
CMD ["ruby", "testcase.rb"]