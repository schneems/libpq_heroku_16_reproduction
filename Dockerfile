FROM heroku/heroku:16-build
RUN rm /etc/apt/preferences.d/pgdg.pref
RUN apt-get update -y
RUN mkdir deb_dir && cd deb_dir && apt download libpq-dev && apt download libpq5
RUN cd deb_dir && dpkg -x libpq-dev_12.1-1.pgdg16.04+1_amd64.deb .
RUN cd deb_dir && dpkg -x libpq5_12.1-1.pgdg16.04+1_amd64.deb .
RUN gem install pg
RUN apt-get install patchelf -y

RUN patchelf --set-rpath "/tmp/usr/lib/x86_64-linux-gnu/:$(patchelf --print-rpath /var/lib/gems/2.3.0/extensions/x86_64-linux/2.3.0/pg-1.1.4/pg_ext.so)" /var/lib/gems/2.3.0/extensions/x86_64-linux/2.3.0/pg-1.1.4/pg_ext.so
ENV LD_LIBRARY_PATH="${PWD}/deb_dir/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"
COPY testcase.rb .
CMD ["ruby", "testcase.rb"]
