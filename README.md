# DjangoPeaksProject

The Django files (in `peaks_project/`) 

This README should:

1. Guide you through getting the Docker container up and running,
2. provide a little explanation as to how it's configured, and
3. provide some basic commands on how to work with it.


## 1. Build and run the container

1. Install Docker.

2. Download this repository.

3. On the command line, within this directory, do this to build the image and start the container:

        docker-compose build

4. If that's successful you can then start it up. This will start up the database and web server, and display the Django `runserver` logs:

        docker-compose up

5. Restore my dumped database on which i stored some peaks examples, default country whitelist (for ip restriction part), root access (username=root, password=meteoFrance)

        docker exec -i peaks_db psql -U mydatabaseuser -d mydatabase < dump_file.sql

6. Open http://127.0.0.1:8000 in your browser.



## 2. Ongoing work

Because logging into the Docker container and *then* running `./manage.py` is a bit of a pain, i have a shortcut script you can run from your own computer instead (not within the Docker container):

    ./scripts/manage.sh help

So, to create your Django project's superuser:

    ./scripts/manage.sh createsuperuser

### Run tests

We also have a script to show one way of running Django tests within the container:

    ./scripts/run-tests.sh

That will run the included shell script that, in turn, logs into the web container, and then runs Django's `./manage.py test` command within the pipenv virtual environment.

You could run a specific test by doing something like:

    ./scripts/run-tests.sh tests.myapp.test_urls.UrlsTestCase.test_home_url

### Accessing the database

To access the PostgreSQL database on the command line:

    docker exec -it peaks_db psql -U mydatabaseuser -d =mydatabase

If you want to dump the contents of your database to a file:

    docker exec -i peaks_db pg_dump -U mydatabaseuser -d mydatabase --data-only > dump_file.sql

(**Note:** that command and the following two use a `-i` option, instead of the `-it` options we've used previously.)

To import a plain text SQL file, like the one we made above:

    docker exec -i peaks_db psql -U mydatabaseuser -d mydatabase < your_dump_file.sql

Or if you have a dump in tar format, use `pg_restore` instead of `psql`:

    docker exec -i peaks_db pg_restore -U mydatabaseuser -d mydatabase < your_dump_file.tar

### Making changes to the container

If you change something in `docker-compose.yml` then you'll need to build
things again:

    docker-compose build

If you want to remove the containers and start again, then stop the containers, and:

    docker-compose rm
    docker-compose build

### Adding or updating python modules with pipenv

I *think* that the way to install new python modules, or update existing ones, is to do so within the Docker container. e.g. to install `django-debug-toolbar` as a development dependency:

    docker exec -it peaks_web sh
    pipenv install django-debug-toolbar --dev


## Get in touch

If you spot a mistake, or something that could be improved (of which there are probably many), then do let me know:

Sofiane Benchouk
sofiane.benchouk@gmail.com  