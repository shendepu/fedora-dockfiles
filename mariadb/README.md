# Fedora Dockerfile for mariadb

## Create docker image for mariadb with root password configured

Based on https://github.com/fedora-cloud/Fedora-Dockerfiles/tree/master/mariadb

Change root password of mysql in **mysql.conf** file

	MYSQL_ROOT_PASSWORD=Root_Passowrd

Perform the build 

	sudo docker build -t <yourname>/fedora:mariadb .

Check the image out

	sudo docker images

Run it:

	sudo docker run -d -p 3306:3306 <yourname>/fedora:mariadb


## Create a new image on top of mariadb image for mysql database

Clone the testdb folder and change the configurations

Example: 

Go to **testdb** folder

	cd testdb

Change configuration in **mysql_db.conf**

	# Configure mysql root password here 
	MYSQL_ROOT_PASSWORD=Root_Passowrd


	# DB configuration
	DB_NAME=testdb
	DB_CHARACTER_SET=utf8
	DB_COLLATE_RULE=utf8_bin

	# DB local user configuration
	DB_LOCAL_USER=testdb
	DB_LOCAL_PASSWORD=testdb

	# DB remote user configuration
	DB_REMOTE_USER=testdb
	DB_REMOTE_PASSWORD=testdb
	DB_REMOTE_ALLOWED_HOST=%

Perform the build 

	sudo docker build -t <yourname>/fedora:mariadb_testdb .

Check the image out

	sudo docker images

Run it:

	sudo docker run -d -p 3306:3306 <yourname>/fedora:mariadb_testdb


