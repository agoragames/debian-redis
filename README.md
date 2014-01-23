debian-redis
============

Repository for our custom build of redis

Setup
=====
	$ vagrant up
	$ vagrant ssh
	$ cd redis

Building
========
	$ ./build

Releasing
=========
	$ ./release

Testing
=======
	$ sudo dpkg -i redis-*deb   # may fail for missing dependencies
	$ sudo apt-get -fy install    # fixes missing dependencies and finishes install
