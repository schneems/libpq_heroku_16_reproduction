## Libpq Heroku-16 Docker issue

Build it:

```
$ docker-compose up --build
```

## Output

```
$ docker-compose up --build --force-recreate
Building testcase
Step 1/11 : FROM heroku/heroku:16-build
 ---> 0e163454f649
Step 2/11 : RUN rm /etc/apt/preferences.d/pgdg.pref
 ---> Using cache
 ---> afe66f0d1ce2
Step 3/11 : RUN apt-get update -y
 ---> Using cache
 ---> f0db66f1f15a
Step 4/11 : RUN mkdir deb_dir && cd deb_dir && apt download libpq-dev && apt download libpq5
 ---> Using cache
 ---> 5ffabe2387d4
Step 5/11 : RUN cd deb_dir && dpkg -x libpq-dev_12.1-1.pgdg16.04+1_amd64.deb .
 ---> Using cache
 ---> e9dc49506054
Step 6/11 : RUN cd deb_dir && dpkg -x libpq5_12.1-1.pgdg16.04+1_amd64.deb .
 ---> Using cache
 ---> e0b3ff13d6ed
Step 7/11 : ENV LD_LIBRARY_PATH="${PWD}/deb_dir/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
 ---> Using cache
 ---> a95e88218f71
Step 8/11 : RUN echo $LD_LIBRARY_PATH
 ---> Using cache
 ---> be97dd8db894
Step 9/11 : RUN gem install pg
 ---> Using cache
 ---> adaf931b8ab5
Step 10/11 : COPY testcase.rb .
 ---> 99aa09e2aef5
Step 11/11 : CMD ["ruby", "testcase.rb"]
 ---> Running in 1ca307214f99
Removing intermediate container 1ca307214f99
 ---> 4a44f7a9901a
Successfully built 4a44f7a9901a
Successfully tagged libpq-problem_testcase:latest
Recreating libpq-problem_db_1 ... done
Recreating libpq-problem_testcase_1 ... done
Attaching to libpq-problem_db_1, libpq-problem_testcase_1
db_1        | 2019-12-05 20:50:07.661 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1        | 2019-12-05 20:50:07.661 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1        | 2019-12-05 20:50:07.664 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1        | 2019-12-05 20:50:07.683 UTC [18] LOG:  database system was interrupted; last known up at 2019-12-05 20:49:35 UTC
db_1        | 2019-12-05 20:50:07.847 UTC [18] LOG:  database system was not properly shut down; automatic recovery in progress
db_1        | 2019-12-05 20:50:07.850 UTC [18] LOG:  redo starts at 0/165B008
db_1        | 2019-12-05 20:50:07.850 UTC [18] LOG:  invalid record length at 0/165B040: wanted 24, got 0
db_1        | 2019-12-05 20:50:07.850 UTC [18] LOG:  redo done at 0/165B008
db_1        | 2019-12-05 20:50:07.857 UTC [1] LOG:  database system is ready to accept connections
testcase_1  | 🙀🙀🙀 PG can load which means libpg5.12.1 is not used
libpq-problem_testcase_1 exited with code 0
```