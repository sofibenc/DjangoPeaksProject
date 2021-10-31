# DjangoPeaksProject

This README should:

1. Guide you through getting the Docker container up and running,
2. Provide a little explanation as to how it's configured
3. Show API Documentation access
4. Show How to test API
5. Show Main web page
6. Provide some basic commands.


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


## 3. API Documentation (Swagger API)

The API documentation shows how to use REST api endpoints to:

	* create/read/update/delete a peak
	* retrieve a list of peaks in a given geographical bounding box

It is available in http://127.0.0.1:8000/docs/


## 4. Testing API

You can test api :


* Directly from API Documentation http://127.0.0.1:8000/docs/
* By using an API client : postman, insomnia etc.. (superuser username & password must be provided in basic auth)
* By using native Django REST framework:
   * http://127.0.0.1:8000/api/peaks/create
   * http://127.0.0.1:8000/api/peaks/read/{id}
   * http://127.0.0.1:8000/api/peaks/update{id}
   * http://127.0.0.1:8000/api/peaks/delete{id}
   * http://127.0.0.1:8000/api/peaks/listboundingbox?top={top}&left={left}&right={right}&bottom={bottom}
   * http://127.0.0.1:8000/api/peaks/api/peaks/listall


## 5. Main Web page
The main web page is available in: http://127.0.0.1:8000

It's a html/javascript page that displays all peaks on a graphic map, using [OpenStreetMap](https://www.openstreetmap.org/)


## 6. ip filtering

There is an ip filtering with a country whitelist settings available in admin interface : http://127.0.0.1:8000/admin/peaks_app/whitelistcountry/

If you want more countries, just add them in WhitelistCountry table

Rejected connections can by viewed in RejectedConnection table available in admin interface : http://127.0.0.1:8000/admin/peaks_app/rejectedconnection/

*Note: For demonstration purpose, i've applied the ip filtering in APIs & main web page only.*


## 7. Some basic commands

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

### Adding or updating python modules with pipenv

To install new python modules, or update existing ones, you have to do it within the Docker container. e.g. to install `django-debug-toolbar` as a development dependency:

    docker exec -it peaks_web sh
    pipenv install django-debug-toolbar --dev


## Get in touch

Let me know if you spot a mistake, or something that could be improved (of which there are probably many) :

Sofiane Benchouk
sofiane.benchouk@gmail.com  