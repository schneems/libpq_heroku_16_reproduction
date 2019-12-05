## Libpq Heroku-16 Docker issue

Build it:

```
$ docker-compose up --build
```

## Output

```
Attaching to libpq-problem_db_1, libpq-problem_testcase_1
db_1        | The files belonging to this database system will be owned by user "postgres".
db_1        | This user must also own the server process.
db_1        |
db_1        | The database cluster will be initialized with locale "en_US.utf8".
db_1        | The default database encoding has accordingly been set to "UTF8".
db_1        | The default text search configuration will be set to "english".
db_1        |
db_1        | Data page checksums are disabled.
db_1        |
db_1        | fixing permissions on existing directory /var/lib/postgresql/data ... ok
db_1        | creating subdirectories ... ok
db_1        | selecting default max_connections ... 100
db_1        | selecting default shared_buffers ... 128MB
db_1        | selecting default timezone ... UTC
db_1        | selecting dynamic shared memory implementation ... posix
db_1        | creating configuration files ... ok
db_1        | running bootstrap script ... ok
db_1        | performing post-bootstrap initialization ... sh: locale: not found
db_1        | 2019-12-05 18:20:18.455 UTC [27] WARNING:  no usable system locales were found
testcase_1  | /var/lib/gems/2.3.0/gems/pg-1.1.4/lib/pg.rb:56:in `initialize': invalid integer value "15s" for connection option "connect_timeout" (PG::ConnectionBad)
testcase_1  |   from /var/lib/gems/2.3.0/gems/pg-1.1.4/lib/pg.rb:56:in `new'
testcase_1  |   from /var/lib/gems/2.3.0/gems/pg-1.1.4/lib/pg.rb:56:in `connect'
testcase_1  |   from testcase.rb:9:in `<main>'
db_1        | ok
libpq-problem_testcase_1 exited with code 1
```
