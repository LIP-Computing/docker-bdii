[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)]

docker-bdii: CloudBDII service
==============================

The repository contains dockerfiles and docker-compose to deploy a
site-bdii with a resource cloud bdii for the EGI FedCloud information
system

Dependencies
------------
The host machine should have git, docker-engine and docker-compose installed

Setup
-----

After cloning this repository, change into it. All operations assume that
you are in this directory: `docker-bdii/`

The script build-images.sh build three docker images in the local host
that are used by the docker-compose.yml to run the BDII services

The operational deployment of the service can be accompilshed as follows:

* Build the docker images locally
```
./build-images.sh
```

After a successful build you should have the three docker images:

```
$ docker images
REPOSITORY                        TAG                 IMAGE ID            CREATED             SIZE
cloudbdii                         latest              474b4926d54c        22 hours ago        492 MB
sitebdii                          latest              fa501e836fa0        22 hours ago        408 MB
bdii                              latest              78cafb2cd510        22 hours ago        381 MB
...
```

* The directory site-conf has all files that the resource administrator
should modify.

* Run the docker-compose to start the services
```
docker-compose up -d
```

You can check the services with:
```
$ docker-compose ps
         Name                       Command               State           Ports          
----------------------------------------------------------------------------------------
dockerbdii_cloudbdii_1   /usr/local/bin/bdii-passwd ...   Up      2170/tcp               
dockerbdii_sitebdii_1    /usr/local/bin/bdii-passwd ...   Up      0.0.0.0:2170->2170/tcp 
```

And perform a ldap query to check the information being published
(note that you will need the openldap client installed):

```
$ ldapsearch -x -p 2170 -h 0.0.0.0 -b o=glue
```

Further information
-------------------

Further documentation can be found here:
* https://github.com/enolfc/fedcloudappliance
* https://wiki.egi.eu/wiki/MAN10 

License
-------

GNU GENERAL PUBLIC LICENSE Version 3

Author Information
------------------

Mario David: <mariojmdavid@gmail.com>

* LIP Lisbon: http://www.lip.pt
* Indigo DataCloud: https://www.indigo-datacloud.eu/
* EGI Engage: https://www.egi.eu/tag/egi-engage/

Acknowledgments
---------------

The sources are largely based from Enol Fernandez <enol.fernandez@egi.eu>
github repository: https://github.com/enolfc/fedcloudappliance 
