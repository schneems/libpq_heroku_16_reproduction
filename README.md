## Libpq Heroku-16 Docker issue

Build it:

```
$ docker-compose up --build
```

## Issues

Currently getting this failure:

```
Step 1/7 : FROM heroku/heroku:16
 ---> 01f44c9dc520
Step 2/7 : RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc -o /etc/apt/trusted.gpg.d/pgdg.asc
 ---> Using cache
 ---> a514da01dfa1
Step 3/7 : RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' > /etc/apt/sources.list.d/pgdg.list
 ---> Using cache
 ---> 6212b34be926
Step 4/7 : RUN apt-get update     && apt-get install -y --no-install-recommends libpq-dev     && rm -rf /var/lib/apt/lists/*
 ---> Running in 9581f4b0b049
Get:1 http://apt.postgresql.org/pub/repos/apt xenial-pgdg InRelease [56.4 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial InRelease [247 kB]
Get:3 http://apt.postgresql.org/pub/repos/apt buster-pgdg InRelease [46.2 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-security InRelease [109 kB]
Get:5 http://apt.postgresql.org/pub/repos/apt xenial-pgdg/main amd64 Packages [230 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [109 kB]
Get:7 http://archive.ubuntu.com/ubuntu xenial/main amd64 Packages [1558 kB]
Get:8 http://apt.postgresql.org/pub/repos/apt buster-pgdg/main amd64 Packages [254 kB]
Get:9 http://archive.ubuntu.com/ubuntu xenial/universe amd64 Packages [9827 kB]
Get:10 http://archive.ubuntu.com/ubuntu xenial-security/main amd64 Packages [1015 kB]
Get:11 http://archive.ubuntu.com/ubuntu xenial-security/universe amd64 Packages [594 kB]
Get:12 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages [1393 kB]
Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/universe amd64 Packages [998 kB]
Fetched 16.4 MB in 23s (695 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 libpq-dev : Depends: libpq5 (= 12.1-1.pgdg100+1) but 11.1-1.pgdg16.04+1 is to be installed
E: Unable to correct problems, you have held broken packages.
ERROR: Service 'testcase' failed to build: The command '/bin/sh -c apt-get update     && apt-get install -y --no-install-recommends libpq-dev     && rm -rf /var/lib/apt/lists/*' returned a non-zero code: 100
```
