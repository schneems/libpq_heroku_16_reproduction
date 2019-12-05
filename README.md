## Libpq Heroku-16 Docker issue

Build it:

```
$ docker-compose up --build
```

## Issues

Currently getting this failure:

```
⛄ 2.6.5 🚀  ~/Documents/projects/tmp/libpq-problem (master)
$ docker-compose up --build
Building testcase
Step 1/7 : FROM heroku/heroku:16
 ---> 384e8f7634d5
Step 2/7 : RUN rm /etc/apt/preferences.d/pgdg.pref
 ---> Using cache
 ---> 6c18d6d17b55
Step 3/7 : RUN apt-get update -y
 ---> Using cache
 ---> a6c5363257f1
Step 4/7 : RUN apt-get upgrade -y
 ---> Using cache
 ---> 49098799960e
Step 5/7 : RUN gem install pg
 ---> Running in 9ed2d560e3da
Building native extensions.  This could take a while...
ERROR:  Error installing pg:
  ERROR: Failed to build gem native extension.

    current directory: /var/lib/gems/2.3.0/gems/pg-1.1.4/ext
/usr/bin/ruby2.3 -r ./siteconf20191205-7-7qz3o1.rb extconf.rb
mkmf.rb can't find header files for ruby at /usr/lib/ruby/include/ruby.h

extconf failed, exit code 1

Gem files will remain installed in /var/lib/gems/2.3.0/gems/pg-1.1.4 for inspection.
Results logged to /var/lib/gems/2.3.0/extensions/x86_64-linux/2.3.0/pg-1.1.4/gem_make.out
ERROR: Service 'testcase' failed to build: The command '/bin/sh -c gem install pg' returned a non-zero code: 1
```
